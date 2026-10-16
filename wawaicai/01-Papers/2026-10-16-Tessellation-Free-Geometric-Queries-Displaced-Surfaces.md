---
tags: [几何, 表面查询, displacement map, 几何处理, BVH, 切分无关, 几何采样]
date: 2026-10-16
source: arXiv
arxiv_id: 2610.21584
venue: cs.GR (2026-10-16 announcement)
status: new
authors: Bing Xu, Yang Zhou, Brian Budge
---

# Geometric Queries on Tessellation-Free Displaced Surfaces

## 核心问题
Displacement map 在曲面纹理中能紧凑存储几何细节，但传统用法需要**预先把曲面细分为密集三角形网格**才能查询，带来沉重的内存代价。  
近年 "tessellation-free" 方法支持直接光线追踪，但以下几何查询仍然未充分探索：

1. **表面采样**（surface sampling）
2. **specular manifold search**（镜面反射路径搜索）
3. **closest-point query**（最近点查询）

这些操作需要 surface enclosures、area estimates、normal bounds —— 而**单纯的标量 height interval 无法提供**这些信息。

## 方法概述

提出 **first-order texture-space hierarchy** —— 在纹理空间构造一级高度层次，每个节点存储：

| 节点字段 | 作用 |
|---------|------|
| **local affine height plane** | 局部仿射高度平面（保留空间高度变化） |
| **conservative residual bound** | 保守残差界（弥补标量 min-max 丢弃的空间变化） |
| **slope bounds** | 斜率上界（支持 specular light-path 搜索） |

### 查询支持

| 查询类型 | 提供的几何保证 |
|---------|--------------|
| **Intersection** | 平面 + 残差 → surface enclosure（用于求交与距离搜索） |
| **Surface sampling** | 平面高度 + 斜率 → 面积估计 |
| **Specular light path** | 斜率上界 → 镜面路径搜索 |
| **PDE solver on surface** | 几何 + 导数 → 表面 PDE |

### 应用场景（论文实验）

- **焦散渲染 (caustics rendering)** —— specular manifold search
- **位移发射体采样 (sampling displaced emitters)** —— surface sampling
- **表面 PDE 求解器** —— 几何 + 导数

## 复杂度分析

- **构建阶段**：O(N log N)，N 为 texture-space 节点数（典型 ≈ displacement 分辨率 × 2）
- **查询阶段**：
  - Intersection query：O(log N) 遍历 + 仿射求交
  - Surface sampling：O(log N + k)，k 为采样数
  - Specular manifold search：O(log N + B)，B 为 specular 路径分支因子
- **内存**：相比 pre-tessellated mesh 节省 ~10-100x（高分辨率 displacement 下尤其显著）
- **无需 surface subdivision**：减少 CPU 端预处理开销

## 实现难度

- **算法复杂度**：**中-高**（需要 BVH 框架 + 仿射几何 + 残差界紧致化）
- **数值稳定性**：
  - 仿射平面在节点边界处需要 C0 连续，否则求交会漏
  - Residual bound 必须严格保守，否则 sampling 会出现 missing triangles
  - Slope bounds 不能过紧，否则 specular search 会过早剪枝
- **依赖项**：
  - 自定义 BVH 构建（与 Embree / OptiX 不直接兼容）
  - 需要 displacement map 纹理采样管线
  - 集成入 PBRT / Mitsuba 需要额外胶水代码

## 推荐结论
✅ **推荐跟踪 / 谨慎实现**

### 推荐理由
1. **几何处理核心问题**：在不做 tessellation 的前提下支持完整几何查询，**填补了 surface representation 文献中的关键空白**
2. **应用广**：焦散 / 表面采样 / PDE solver 都直接受益
3. **跨领域价值**：位移映射是 CAD / 游戏 / 视觉特效的核心表达

### 实现注意
- 短期建议**先在 libigl + 自定义 BVH 框架**做小规模 PoC
- Residual bound 的紧致性是性能瓶颈，需要自适应松弛策略

## 开源参考

- **几何查询框架**：Embree (Intel) 的 BVH4 / BVH8 可参考
- **位移映射采样**：PBRT-v4 displacement integrator
- **Specular manifold search**：双向路径追踪中的 manifold walks（双向路径追踪论文）
- **类似思路**：Heitz et al. 的 "tessellation-free" displacement ray tracing (EGSR 2021)

## 与 wawaicai 研究方向的连接

- **与 [[3D Gaussian Splatting]] 的连接**：3DGS 的"无网格"思想与 tessellation-free 几何查询同源 —— 都是"原语化"几何表示
- **与 [[网格简化]] 的对比**：传统的 mesh simplification (QEM) 走"细分 → 简化"路线，本文走"绕过细分"路线，思路互补
- **与 [[表面重建]] 的连接**：displacement map 是从 baseline mesh 到高分辨率表面的标准表示，本文方案可与 PMP / libigl 的 surface evaluation 模块对接

## 应用场景

- 大场景渲染（城市 / 地形，位移细节丰富）
- 实时焦散渲染（玻璃、水面下的位移曲面）
- 几何驱动的表面 PDE 仿真（位移曲面作为初始几何）
- CAD 装配体的位移公差可视化

## 备注

- **核心创新点**：**affine plane + residual bound** 共同替代纯标量 height interval，是几何保证的关键
- **几何深度**：论文涉及 differential geometry 的 chart/parameterization 概念（来自 Shoemake 1985 quaternion）
- **建议关注**：作者 Bing Xu（来自 Zhejiang University / DreamWorks）—— 在几何查询 + 渲染交叉领域有持续工作

---
相关主题：[[几何处理]] [[表面查询]] [[位移映射]] [[几何采样]] [[BVH]] [[焦散渲染]] [[PDE-on-surface]]
