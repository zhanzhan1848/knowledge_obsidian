---
type: paper
created: 2026-11-24
updated: 2026-11-24
tags: [paper, 网格重建, 点云, Ball-Pivoting, 流式重建, 水下测绘, 孔洞检测]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2607.11627
---

# IBPA: Real-time Free-form Manifold Mesh Reconstruction via Incremental Ball Pivoting with Integrated Hole Detection

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | IBPA: Real-time Free-form Manifold Mesh Reconstruction via Incremental Ball Pivoting with Integrated Hole Detection |
| **作者** | Mauhing Yip, Mohit Singh, Kostas Alexis, Christian Schellewald, Annette Stahl |
| **发表** | arXiv cs.GR / cs.RO (v3 更新, 2026-11-24 cross-listed batch) |
| **链接** | [原文](https://arxiv.org/abs/2607.11627) |
| **DOI** | — |
| **代码** | [github.com/Mauhing/Incremental-BPA](https://github.com/Mauhing/Incremental-BPA) |

---

## 核心贡献

> 把经典 Ball Pivoting Algorithm 改造成增量、实时、自由形状的流式点云重建，并集成孔洞检测。

1. **增量式 BPA（IBPA）**：在流式到达的点云上增量构造**可定向（orientable）流形网格**，不假设点云重叠度或空间分布。
2. **突破 DTM/高度场表达力限制**：传统数字地形模型（DTM）每个 (x,y) 只允许一个高程值，无法表达悬垂与垂直结构；IBPA 支持复杂拓扑且**无需先验结构假设**。
3. **集成孔洞检测机制**：实时识别并高亮不完整的网格区域（水下测绘场景的关键需求——事后才发现覆盖不足已无法补救）。

---

## 技术方案

### 核心思想

**Ball Pivoting Algorithm (BPA)** 的原始思路（Bernardini et al. 1999）：在每个采样点放置一个半径为 r 的空球；球在空球内自由滚动，落过三个及以上样本点时形成一个 Delaunay 三角面片。多个半径（ball radius）保证覆盖不同采样密度。

IBPA 的改动在于把 BPA 从"批处理、一次性"改成"增量、流式、实时"：

| 原始 BPA | IBPA |
|---------|------|
| 需要完整点云后离线运行 | 点云边到边到达即处理 |
| 固定全局半径序列 | 随点云增长动态调整半径 |
| 隐含均匀采样假设 | 不假设重叠度或空间分布 |
| 拓扑固定 | 增量构造 + 在线更新 |

**孔洞检测**：当某处球无法找到足够的支撑点形成三角化时，该区域即为未覆盖区（hole）。IBPA 通过监测这些"球滚动失败/半失败"区域来显式标记孔洞，从而让操作员在**采集过程中**（而非事后）实时看到覆盖缺口。

### 关键技术

| 技术 | 说明 |
|------|------|
| **增量 BPA** | 新点到达时只对受影响的局部区域重新执行球滚动，避免全局重算 → 实时性 |
| **可定向流形保证** | 通过维护局部方向一致性（face orientation propagation）保证输出流形与可定向性 |
| **动态半径策略** | 根据局部点密度自适应选择球半径，避免固定半径在新区域漏覆盖 |
| **孔洞检测** | 基于三角化失败区域与边界边的检测，输出不完整区域 |
| **无先验拓扑假设** | 不像 DTM 那样假设高度场，因此可表达悬垂/竖直壁面 |

---

## 代码片段

```python
# 概念性伪代码：增量 BPA
class IncrementalBPA:
    def __init__(self, radius_fn):
        self.P = []            # 累积点
        self.F = []            # 三角面
        self.orient = []       # 面朝向
        self.holes = set()     # 孔洞标记

    def add_point(self, p):
        self.P.append(p)
        # 只在 p 的邻域内执行球滚动
        for r in self.radius_fn(local_density(p)):
            ball = Ball(center=p, radius=r)
            while ball.roll():
                tri = ball.candidate_triangle()
                if tri is None:
                    # 支撑点不足 → 记为未覆盖区
                    self.holes.add(ball.current_region)
                    break
                if self.is_manifold_consistent(tri):
                    self.F.append(tri)
                    self.propagate_orientation(tri)
```

---

## 实验结论

- **场景**：ROV / AUV 水下测深数据采集（bathymetric data）
- **对比基线**：传统 DTM 等增量式地形重建方法
- **结果**：
  - 支持更复杂的表面拓扑（悬垂、垂直结构），无需先验结构假设；
  - 实时增量可视化覆盖范围，支持采集期间的知情决策；
  - 孔洞检测能实时标出覆盖不完整区域

---

## 局限性

- BPA 家族固有依赖**法向估计**（球滚动需定向），无向点云的法向精度直接决定重建质量；
- 对噪声/离群点敏感——水下传感器噪声是实际部署中的主要难点；
- 动态半径策略的细节（论文未完全展开）影响孔洞误报率；
- 面向水下测深，通用 CAD/扫描场景的验证不够充分。

---

## 相关工作

- [[Ball-Pivoting-Algorithm]] · [[Point-Cloud-Reconstruction]] · [[Surface-Reconstruction]]
- [[Mesh-Repair]] · [[Hole-Detection]] · [[Digital-Terrain-Model]]
- [[Poisson-Reconstruction]] · [[Screened-Poisson]] · [[Delaunay-Triangulation]]

---

## 实现建议

- **实现难度**：中（BPA 本体是经典算法，增量化与孔洞检测需要工程设计）
- **预期性能**：单点增量摊销 O(1) 摊还（实测受局部邻域大小支配），流式实时可行
- **适用场景**：水下/野外测绘的实时覆盖率可视化、扫描预览、LiDAR 车载实时建图
- **落地建议**：代码已开源（`github.com/Mauhing/Incremental-BPA`），建议直接评估；与 libigl 的 `igl::ball_pivoting` 做精度交叉验证

## 开源参考

- libigl: `igl::ball_pivoting`（原始 BPA 批处理实现）
- libigl: `igl::orient_triangles`（朝向一致性）
- CGAL: `CGAL::Polygon_mesh_processing::orient_polygon_mesh`
- Point Cloud Library (PCL): `pcl::BallPivoting`（带法向估计的 BPA 实现）
