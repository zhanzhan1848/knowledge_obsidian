---
type: paper
created: 2026-11-11
updated: 2026-11-11
tags: [paper, rendering, 3dgs, mesh-based, topology, neural-rendering, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2611.06974
arxiv_id: 2611.06974
---

# T²-Splat: Adaptive Topology Mesh Splatting with Texture Residuals

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | T²-Splat: Adaptive Topology Mesh Splatting with Texture Residuals |
| **作者** | Zhihao Tang, Youjia Zhang, Mingbo Zhao, Wei Yang |
| **发表** | arXiv cs.CV / cs.GR, 2026-11-04（预印本） |
| **链接** | [原文](https://arxiv.org/abs/2611.06974) |
| **项目页** | [https://t2-splat.github.io/](https://t2-splat.github.io/) |
| **代码** | 项目页提供 |

---

## 核心贡献

> triangle-based splatting 需要**过度的网格细分**来保留外观细节。T²-Splat 把**拓扑自适应**与**外观精化**彻底解耦。

1. **Safe RDT 初始化**：用 Safe Restricted Delaunay Triangulation 建立初始网格连通性。
2. **动态拓扑演化 (DTE)**：通过**边坍缩 (edge collapse)** 与**顶点分裂 (vertex split)** 动态调整三角形分配。
3. **逐面残差 Mip-纹理**：在固定网格上用**尺度自适应过滤**的 per-face Mip-textures 精化外观。
4. **可控复杂度**：面数预算可低至原始面数的 **10%**。

---

## 技术方案

### 核心思想

传统 triangle-based splatting：每个三角形贴一张纹理（或若干高斯），细节靠**加面数**换。于是：

$$\text{mesh complexity} \uparrow \quad \Rightarrow \quad \text{appearance fidelity} \uparrow \quad \text{（但很浪费）}$$

T²-Splat 的解耦：
- **拓扑**（多少面、面怎么摆）由 DTE 演化负责
- **外观**（每个面内部长什么样）由残差 Mip-纹理负责

于是可以在**很少的面**上承载**很高的外观质量**。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Safe RDT** | Safe Restricted Delaunay Triangulation，初始网格连通性，保证三角形质量 |
| **边坍缩** | 减少面数 |
| **顶点分裂** | 增加局部细节 |
| **动态拓扑演化 (DTE)** | 上述两者的演化循环 |
| **逐面残差 Mip-纹理** | 每个面的"残差"层纹理 |
| **尺度自适应过滤** | 按尺度自适应选择 mip 级别，避免走样 |
| **面数预算控制** | 可调至 10% |

### 公式

```math
// 拓扑演化的两种算子
// 边坍缩
E = {(v_a, v_b) : 坍缩后仍满足 Delaunay/质量约束}
apply_edge_collapse(mesh, E)

// 顶点分裂
V = {v : 局部误差超阈值且分裂后质量仍合格}
apply_vertex_split(mesh, V)

// 逐面残差 Mip-纹理（语义形式）
residual[f] = mipTexture(faceTex[f], scaleAdaptiveFilter(f))
color = baseColor[f] + residual[f].sample(uv, lod)
```

---

## 代码片段

```python
# 动态拓扑演化 + 残差纹理（语义伪代码）
def dte_step(mesh, residual_errors):
    # 1) 边坍缩：局部误差低的面可以合并
    for e in mesh.candidate_edges():
        if residual_errors[mesh.edge_faces(e)].max() < THRESHOLD and quality_ok(e):
            mesh.collapse_edge(e)

    # 2) 顶点分裂：局部误差高的区域需要更多细节
    for v in mesh.vertices():
        if residual_errors[mesh.vertex_faces(v)].max() > THRESHOLD and quality_ok_split(v):
            mesh.split_vertex(v)

    # 3) 更新逐面残差 Mip-纹理（尺度自适应过滤）
    for f in mesh.faces():
        residual[f] = build_mip_texture(f.tex, filter=scale_adaptive(f))
```

---

## 实验结论

- **数据集**: **Mip-NeRF 360**、**Tanks & Temples**、**DTU**
- **基线**: **MeshSplatting**（同族最直接基线）
- **结果**:
  - **Mip-NeRF 360 上 PSNR 比 MeshSplatting 提升 0.71 dB**
  - 在 Mip-NeRF 360 / Tanks&Temples / DTU 上取得有竞争力的结果，且**网格更紧凑**
  - **压缩实验**：面数复杂度灵活可控，支持低至原始面数 **10%** 的面预算
  - 三数据集上均保持竞争力

---

## 局限性

- 逐面残差 Mip-纹理会带来显存/存储开销（论文主打的是面数压缩，二者需权衡）
- 拓扑演化涉及网格质量约束（Safe RDT、无退化三角形），算子实现有相当工程复杂度
- 预印本，未见同行评审

---

## 相关工作

- [[2026-11-05_P-MGS-Perception-Over-Geometry-Gaussian-Allocation]]
- [[2026-09-13_MeshSplatBench-Triangle-Based-Neural-Rendering-Benchmark]]
- [[2026-08-07-ESVR-Sparse-Volume-Rendering]]
- 概念：[[3D高斯泼溅]], [[三角形网格光栅化]], [[网格简化]], [[纹理残差]]

---

## 实现建议

- **实现难度**: 中-高（需要健壮的网格拓扑演化 + 逐面残差纹理管理）
- **预期性能**: Mip-NeRF 360 +0.71 dB over MeshSplatting；面数可压到 10%
- **适用场景**: 需要**紧凑网格 + 可编辑性 + 照片级质量**并存的场景（游戏资产、数字孪生）
- **与团队的关系**: 与 [[2026-11-05_P-MGS]] 属同一子方向的不同解法——**P-MGS 改"高斯怎么分"，T²-Splat 改"网格怎么长 + 外观怎么存"**。建议 @墨鱼丸 二选一或组合
- **优先级**: 中
