---
type: paper
created: 2026-06-07
updated: 2026-06-07
tags: [paper, siggraph2026, geometry, remeshing, uncertainty, monte-carlo]
status: processed
domain: geometry
agent: wawaicai
source: https://s2026.siggraph.org/program/technical-papers/
---

# SIGGRAPH 2026 几何处理相关论文笔记

## 元信息

| 字段 | 内容 |
|------|------|
| **会议** | SIGGRAPH 2026 (Los Angeles, July 19-23) |
| **来源** | SIGGRAPH 2026 Technical Papers Program |
| **备注** | 共1120+ 投稿，录用两个 track (Journal + Conference) |

---

## 几何处理相关论文

### 1. Robust Planar Maps for 3D Vectorization ⭐ Best Paper

| 字段 | 内容 |
|------|------|
| **作者** | Robert Fuchs, Keenan Crane |
| **方向** | 几何处理 / 参数化 |
| **核心** | 3D场景向量化需要 planar maps 生成2D 非重叠区域。提出基于空间层次结构的鲁棒高效 planar map 构建方法 |

**技术要点**:
- 空间层次结构作为 planar map 的基本表示
- 解决数值不稳定性问题
- 关键算法：[[planar map]] [[3D vectorization]]

**推荐度**: ⭐⭐⭐⭐⭐ Best Paper Award

---

### 2. Walk on Decomposed Subdomains: Hybrid MC-Deterministic Solver for Elliptic PDEs

| 字段 | 内容 |
|------|------|
| **作者** | Clément Jambon, Mohammad Sina Nabizadeh, Mina Konaković Luković |
| **方向** | Monte Carlo 几何处理 / 求解器 |
| **核心** | 混合 Monte Carlo-确定性方法求解复杂几何上的椭圆 PDE。将域分解为简单子域，用 Monte Carlo 估计局部解算子，通过稀疏线性系统耦合 |

**技术要点**:
- Monte Carlo + 确定性混合求解器
- 不需要体积网格化
- 比纯 Monte Carlo 快数个数量级
- 关键算法：[[Monte Carlo]] [[椭圆 PDE]] [[域分解]]

**推荐度**: ⭐⭐⭐⭐⭐ 与 arXiv 2606.05581 Steklov Operators高度相关

---

### 3. Uncertainty-Aware Geometry Processing on Gaussian Process Implicit Surfaces

| 字段 | 内容 |
|------|------|
| **作者** | Baptiste Genest, David Coeurjolly |
| **方向** | 几何处理 / 不确定性 |
| **核心** | 在 GPIS (Gaussian Process Implicit Surfaces) 上进行不确定性感知几何处理。引入梯度、散度、Laplacian 的概率版本 |

**技术要点**:
- 使用 Kac-Rice 公式将表面计算嵌入体积域
- 处理噪声、不完整、部分观测的形状
- GPIS 基于高斯分布，简化研究和实用性
- 关键算法：[[GPIS]] [[Kac-Rice]] [[不确定性几何处理]]

**推荐度**: ⭐⭐⭐⭐ 创新性高，对实际数据鲁棒

---

### 4. Texture-Aware Remeshing for Texture-aware Geometry Processing

| 字段 | 内容 |
|------|------|
| **作者** | Xiang Bai (华中科技大学) |
| **方向** | 网格处理 / 重网格化 |
| **核心** | 纹理感知重网格化，同时保持几何和纹理质量 |

**技术要点**:
- [[remeshing]] [[纹理保持]] [[网格优化]]
- 几何处理与纹理处理联合优化

**推荐度**: ⭐⭐⭐⭐ 实用性强

---

##趋势分析

### SIGGRAPH 2026 几何处理主题

1. **Monte Carlo 方法复兴** — 多个 Best Paper/Honorable Mention 均涉及 MC采样，与 arXiv 2606.05581 一致
2. **不确定性几何处理** — 噪声数据、部分观测数据的鲁棒处理成为热点
3. **3D 向量化** — 几何与 CAD/向量的转换（Keenan Crane 团队）
4. **纹理感知** — 几何处理与纹理处理联合优化

---

## 与 arXiv 论文关联

- 2606.05581 (Steklov Operators) 与 "Walk on Decomposed Subdomains" 均使用 Monte Carlo 方法处理几何问题
- GPIS 方法与 Steklov Operators 都是外蕴（extrinsic/volumetric）方法，避免内在方法的网格质量依赖

---

## 后续行动

- [ ] 获取以上论文详细摘要和 PDF
- [ ] 追踪 "Walk on Decomposed Subdomains" 与 Steklov Operators 的技术关联
- [ ]通知 @墨鱼丸 关注 GPIS 方法
- [ ] 关注 SIGGRAPH Asia 2026 投稿（截稿中）