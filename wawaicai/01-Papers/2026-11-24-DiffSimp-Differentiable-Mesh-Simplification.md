---
type: paper
created: 2026-11-24
updated: 2026-11-24
tags: [paper, 网格处理, 网格简化, QEM, 可微几何, 低多边形建模, 逆向渲染]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2611.31018
---

# DiffSimp: Differentiable Mesh Simplification for Gradient-Based Low-Poly Modeling

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | DiffSimp: Differentiable Mesh Simplification for Gradient-Based Low-Poly Modeling |
| **作者** | Seonghun Oh |
| **发表** | arXiv cs.GR (preprint, 2026-11-24 new) |
| **链接** | [原文](https://arxiv.org/abs/2611.31018) |
| **DOI** | — |
| **代码** | 未公开（作者页未给出仓库） |

---

## 核心贡献

> 把 QEM 网格简化做成可微层，让上游几何优化能直接优化"简化后的"网格，取代事后的简化后处理。

1. **可微简化层（training-free）**：基于 QEM 并行边塌缩（parallel edge collapse）构建，无需训练，可作为 drop-in 层插入现有几何优化管线。
2. **固定塌缩历史下的局部可微塌缩映射**：把简化形式化为固定 collapse history 下的*局部可微* collapse map，从而在不放松离散塌缩决策（discrete collapse decisions）的前提下传播梯度。
3. **因子化反向传播**：利用可微顶点二次型（differentiable vertex quadrics）与二次型归约森林（quadric reduction forests）实现高效梯度传播。

---

## 技术方案

### 核心思想

现有的可微网格提取（如 DMTet、Nvdiffrast 的 soft rasterize）只处理"顶点→三角形"的离散化，而**简化（decimation）通常是后处理**：先用 QEM 把 10 万面简化到 500 面，再走优化流程。这带来两个问题：

- 简化引入的几何误差落在优化目标之外，梯度看不到它；
- 顶点预算越紧，误差越大，而优化器无法补偿。

DiffSimp 的做法是：**先做一次确定性的并行 QEM 塌缩，锁定这次塌缩序列（collapse history），然后把这个序列视为一个固定的可微算子**。塌缩决策（哪条边塌缩）保持离散不动（不回退到 soft/continuous relaxation），但每个顶点位置的更新变成可微函数，于是梯度可以穿过整个简化过程回传到上游生成器。

### 关键技术

| 技术 | 说明 |
|------|------|
| **QEM 并行边塌缩** | 基于二次型误差度量（Quadric Error Metrics）选择塌缩目标；并行版本保证同一批次内无冲突边 |
| **固定 collapse history** | 塌缩序列在优化开始前确定并缓存，迭代过程中不重新计算 → 避免离散决策不可微、保证梯度图稳定 |
| **可微顶点二次型** | 顶点位置参与二次型构造，使二次型本身对顶点可微，从而边塌缩后的新顶点位置可微 |
| **二次型归约森林（quadric reduction forests）** | 沿塌缩树把二次型增量式归约到根，避免每次重算全局二次型 → 梯度传播 O(n log n) 量级 |
| **因子化反向传播** | 将反向过程拆成"塌缩边贡献"与"顶点二次型贡献"两部分相乘/相加，避免显式构造稠密 Jacobian |
| **局部可微性** | 只在塌缩邻域内建立局部微分关系，跨邻域的远距离顶点不建立耦合 → 显存与时间可控 |

### 梯度流示意

$$
\frac{\partial \mathcal{L}}{\partial V_{\text{orig}}}
=
\frac{\partial \mathcal{L}}{\partial V_{\text{final}}}
\cdot
\frac{\partial V_{\text{final}}}{\partial V_{\text{simplified}}}
\cdot
\frac{\partial V_{\text{simplified}}}{\partial V_{\text{orig}}}
$$

- 第三项（simplified → orig）由 QEM 二次型构造给出，可微；
- 第二项（final → simplified）是塌缩映射的局部线性化（把被塌缩顶点位置作为被塌缩边端点的线性组合）；
- 第一项为下游渲染/重建损失对最终顶点集的梯度。

---

## 代码片段

```python
# 概念性伪代码：固定塌缩历史 + 可微塌缩
import torch

class DiffSimplify(torch.nn.Module):
    def __init__(self, V, F, target_ratio=0.05):
        super().__init__()
        self.V0 = V.detach().clone()          # (n,3) 可训练
        self.F = F
        # 一次性确定 collapse history（离散，不参与梯度）
        self.history = qem_parallel_collapse(V.detach(), F, target_ratio)
        # 二次型归约森林：每个塌缩记录其归约的 quadric 增量
        self.forest = build_quadric_reduction_forest(V.detach(), F, self.history)

    def forward(self):
        V = self.V0
        for step in self.history:
            # 1) 用可微二次型更新顶点位置
            V = qem_update_positions(V, self.forest[step])
            # 2) 执行离散的索引重映射（不可微，但无梯度需求）
            V, F = apply_collapse_topology(V, F, step)
        return V, F

    def backward(self, grad_out):
        # 因子化反向：穿过 quadric 更新 + 穿过 collapse 映射的局部线性化
        return factorized_backward(grad_out, self.forest, self.history)
```

---

## 实验结论

- **数据集/任务**：低多边形网格重建（low-poly mesh reconstruction）、逆向渲染（inverse rendering）
- **基线**：先优化再事后简化（post-processing simplification）的基线；无简化（unsimplified）基线
- **结果**：
  - 保真度优于事后简化基线；
  - 梯度传播带来的额外收益**在更紧的顶点预算下更大**（这正是简化误差本应由优化补偿的场景）；
  - 端到端运行时为未简化基线的 **1.00–1.25×**（即简化开销被摊薄到 25% 以内）。

---

## 局限性

- 塌缩历史在优化前固定，无法适应优化过程中形状的剧烈变化（对应"锁定离散决策"的代价）；
- QEM 的固有缺陷被继承：对特征边与尖锐边的处理依赖二阶差分权重，人工调参敏感；
- 论文未给出开源代码，落地需自行实现可微 quadric 与归约森林。

---

## 相关工作

- [[Mesh-Simplification]] · [[Quadric-Error-Metrics]] · [[Differentiable-Rendering]]
- [[Low-Poly-Modeling]] · [[Inverse-Rendering]]
- [[DMTet]] · [[nvdiffrast]]

---

## 实现建议

- **实现难度**：高（可微 QEM + 二次型归约树 + 因子化反向，需要扎实的光线/梯度基础）
- **预期性能**：前向 QEM 并行塌缩本身是 O(n log n)；可微反向同量级，端到端约为不简化基线的 1.0–1.25×
- **适用场景**：低多边形资产生成、3D 资产生成管线、可微渲染 + 网格提取的联合优化
- **落地建议**：先在 libigl 的 QEM（`igl::simplify`）上做固定塌缩历史的复刻，验证"锁定历史 + 局部可微"是否真的能带来增益，再考虑自己写 quadric 归约森林

## 开源参考

- libigl: `igl::simplify`（QEM 塌缩，可用于生成固定 collapse history）
- libigl: `igl::massmatrix`、`igl::quadric` 相关工具
- CGAL: `CGAL::Polygon_mesh_processing::simplify`（可作为交叉验证的塌缩实现）
