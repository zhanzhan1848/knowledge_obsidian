---
type: paper
created: 2026-11-11
updated: 2026-11-11
tags: [paper, rendering, 3dgs, mesh-based, neural-rendering, real-time-rendering, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2611.07979
arxiv_id: 2611.07979
---

# P-MGS: Perception Over Geometry — Rethinking Gaussian Allocation in Mesh-based Splatting

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Perception Over Geometry: Rethinking Gaussian Allocation in Mesh-based Splatting |
| **作者** | Yuting Wang, Yang Zhao, Shanding Diao, Penglin Wang, Yuan Chen, Wei Jia, Ronggang Wang |
| **发表** | arXiv cs.GR, 2026-11-05（预印本） |
| **链接** | [原文](https://arxiv.org/abs/2611.07979) |
| **DOI** | - |
| **代码** | 论文未公开链接 |

---

## 核心贡献

> 3DGS 在 mesh-based 方案中通常给每个三角形面**分配固定数量**的高斯——但外观重建所需的表示容量取决于**局部外观复杂度**，而非网格细分密度。

1. **感知复杂度引导的高斯分配**：依据多视角观测估计的**表面外观需求**分配高斯数量。
2. **解耦外观建模与几何控制**：高斯**无网格约束地优化**，优化后再**事后绑定**到原始网格——保留自适应精化能力，同时保持网格拓扑。
3. **局部仿射形变传递**：网格编辑时，局部仿射形变同步更新高斯中心与协方差，减少错位与漂浮伪影。

---

## 技术方案

### 核心思想

问题设定：3DGS 缺乏显式拓扑，无法做几何编辑。已有 mesh-based 方法通过把高斯关联到三角形面来获得可编辑性，但**固定每面高斯数**导致：
- 高细节区域高斯不足
- 平坦区域高斯浪费

P-MGS 的立场：**"感知优先于几何"**——按外观需求而非网格密度分配。

### 关键技术

| 技术 | 说明 |
|------|------|
| **感知复杂度引导分配** | 从多视角观测估计表面外观复杂度，据此分配高斯 |
| **无约束优化 + 事后绑定** | 高斯自由优化（保留自适应精化），事后再绑定到网格 |
| **局部仿射形变传递** | 网格形变时同步更新高斯中心与协方差 |
| **拓扑保持** | 编辑后网格拓扑不变，高斯随形变对齐 |

### 公式

```math
// 感知复杂度引导的高斯分配（语义形式）
N_f = f( complexity(f) )      // f 为网格面；complexity 由多视角观测估计
// 例：N_f ∝ 残差方差 / 频率能量的某种单调映射

// 局部仿射形变传递
// 网格面 f 在形变场下的仿射矩阵 A_f
gaussian.mean'      = A_f * (gaussian.mean      - p_f) + p_f'
gaussian.covariance' = A_f * gaussian.covariance * A_f^T
```

---

## 代码片段

```python
# 感知复杂度引导分配 + 事后绑定（语义伪代码）
# 阶段 1: 无网格约束优化高斯（保留自适应精化）
gaussians = init_from_mesh(mesh)
for it in range(iters):
    loss = photometric_loss(render(gaussians, views), images)
    loss.backward(); optimizer.step()
    densify_and_prune(gaussians)      # 自适应精化，未受网格约束

# 阶段 2: 事后绑定到原始网格（拓扑保持）
for g in gaussians:
    g.face_id = mesh.nearest_face(g.mean)

# 阶段 3: 网格编辑时传递局部仿射形变
def apply_deformation(mesh, gaussians, deform):
    for g in gaussians:
        A = deform.affine_at(mesh.face(g.face_id))
        g.mean = A @ (g.mean - mesh.face_center(g.face_id)) + mesh.face_center(g.face_id)
        g.covariance = A @ g.covariance @ A.T
```

---

## 实验结论

- **数据集**: 论文摘要未在检索元数据中完整列出（按同族工作惯例应为 Mip-NeRF 360 等 NVS 基准）
- **基线**: 固定每面高斯数的 mesh-based splatting 方法（如 MeshSplatting 类）
- **结果**:
  - **更少的高斯数量下取得更优的平均新视角合成质量**
  - 网格编辑保持连贯性，**减少错位与漂浮伪影**
  - 感知复杂度分配避免了"平坦区域浪费容量、细节区域容量不足"

---

## 局限性

- 检索到的元数据中未包含完整实验表格与数据集列表（需查 PDF 补全）
- 事后绑定引入的"网格–高斯"错位在拓扑大幅变化后可能加剧
- 预印本，未见同行评审

---

## 相关工作

- [[2026-11-04_T2-Splat-Adaptive-Topology-Mesh-Splatting]]
- [[2026-09-13_MeshSplatBench-Triangle-Based-Neural-Rendering-Benchmark]]
- [[2026-09-08_TileGS-Gaussian-Rasterization]]
- 概念：[[3D高斯泼溅]], [[网格绑定]], [[新视角合成]]

---

## 实现建议

- **实现难度**: 中（需实现感知复杂度估计 + 事后绑定 + 形变传递）
- **预期性能**: 更少高斯达到更优质量 + 更好的网格编辑连贯性
- **适用场景**: **需要几何编辑能力的 3DGS**（游戏资产流程、AR 场景编辑）
- **与团队的关系**: 与同组的 [[2026-11-04_T2-Splat]] 构成"mesh-based splatting 三角"（分配策略 / 拓扑自适应 / 评估基准），建议 @墨鱼丸 三篇一起看，选择一条实现路线
- **优先级**: 中
