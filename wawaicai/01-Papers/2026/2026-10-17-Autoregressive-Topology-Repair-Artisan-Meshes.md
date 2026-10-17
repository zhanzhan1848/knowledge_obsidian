---
type: paper
created: 2026-10-17
updated: 2026-10-17
tags: [paper, mesh-repair, topology, autoregressive, mesh-generation, geometry-processing]
status: processed
domain: geometry-processing
agent: wawaicai
source: https://arxiv.org/abs/2610.14113
---

# Autoregressive Topology Repair for Generated Artisan Meshes

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Autoregressive Topology Repair for Generated Artisan Meshes |
| **作者** | (arXiv 2610.14113) — submitted Tue, 13 Oct 2026 |
| **发表** | arXiv cs.GR, 2026-10-13 |
| **链接** | [原文](https://arxiv.org/abs/2610.14113) |
| **DOI** | 10.48550/arXiv.2610.14113 |
| **代码** | (论文未在摘要中给出，待补充) |

---

## 核心贡献

> 提出了一个**原地修复**生成网格拓扑错误的自回归网络，将 mesh 修复建模为**删除 + 添加**两阶段的 face-level 编辑序列，避免重新生成整个网格。

1. **Face-level prefix-LM 修复网络**：双向读取网格，自回归输出 edit 序列（删除 → 添加）
2. **新颖的 deletion head**：自回归选择要删除的面（hole / stray / duplicated face）
3. **新颖的 addition head**：选择顶点构成新面，必要时插入新顶点
4. **效率优势**：以 draft 作为 prefix，仅生成 edits，比完整自回归生成器解码步数少得多

---

## 技术方案

### 核心思想

把"draft mesh → artist-quality mesh"的任务视为**条件序列生成**：
- 输入：已生成的 draft mesh（含拓扑缺陷）
- 输出：一个编辑动作序列，依次为 (delete face_1, delete face_2, ..., add face_a, add face_b, ...)
- 修复后保留 draft 的 vertex 位置与大致 layout，仅修正拓扑

### 关键技术

| 技术 | 说明 |
|------|------|
| Prefix-LM 编码器 | 双向读 draft，autoregressive 生成 edit 序列 |
| Deletion head | 自回归挑选要删除的面 |
| Addition head | 选顶点构成新面；必要时插入新顶点 |
| Edit-only decoding | 不重生成未触碰的面；保留 draft 的几何 layout |

### 算法复杂度

- 训练：与 prefix-LM 标准复杂度一致，O(N²·d) 自注意力（N=face token 数，d=hidden）
- 推理：编辑序列长度 L << 完整序列长度，所以 decode steps 显著减少
- **空间复杂度**: O(N·d)

### 数据与训练

- 数据：scripted defects + 两个 mesh generator 的 held-out drafts
- 评估指标：quad-equivalent face F1、非流形修复比例、保持率

---

## 公式

```math
\mathcal{L} = \mathcal{L}_{\text{del}} + \mathcal{L}_{\text{add}} = -\log p(\text{faces to delete} \mid \text{draft}) - \log p(\text{faces to add} \mid \text{draft}, \text{deleted})
```

---

## 实验结论

- **数据集**: scripted defects；两个 mesh generator 的 held-out drafts
- **基线**: 已有 mesh repair 工具（CAD-style repair, pymeshfix 等）
- **结果**: 提升 quad-equivalent face F1；移除 non-manifold 结构；保留 draft 的几何 layout

---

## 局限性

- 依赖 draft 的"大致 layout"——若 draft 拓扑与艺术家偏好差太远，prefix-LM 仍受限于已有 face 集合
- 添加新顶点时质量受限于 addition head 的拓扑推理能力
- 未明确给出数值稳定性分析（梯度爆炸 / 顺序敏感性）

---

## 相关工作

- [[相关论文]]: 面序列生成 mesh generator（MeshGPT、MeshXL 系列）
- 相关概念：[[mesh-repair]]、[[topology-correction]]、[[quad-meshing]]

---

## 实现建议

- **实现难度**: 高（需要自回归训练 + 大规模 mesh-token 数据 + face-level 监督）
- **预期性能**: 推理阶段比完整自回归生成快（更短 decode 序列）
- **适用场景**:
  - 作为生成式 CAD 流水线（如 Artisan / MeshCarve 等）的**后处理修复模块**
  - 替代或补充传统 mesh repair 工具（pymeshfix / MeshInspector / CGAL Polygon Mesh Repair）
  - 与 [[SIGGRAPH2026-Strips-as-Tokens-UV-Segmentation]] 一类 mesh-token 工作可串联成管线
- **可借鉴**:
  - deletion/addition 两阶段解耦思路可移植到传统几何算法——例如先用 QEM/顶点消除做减法，再按边界规则做局部 remesh 填充
  - "edit-only decoding" 思路对 CAD 增量编辑场景特别有价值
- **推荐度**: ✅ 推荐关注（强烈推荐集成到生成式 CAD 后处理）
