# 每日流体渲染研究笔记 - 2026-08-25

## 搜索时间范围
最近24小时内 (2026-08-24 ~ 2026-08-25)

## 搜索关键词
fluid rendering, water rendering, smoke rendering, fire simulation, ocean rendering, particle system, volume rendering

---

## 📄 论文 1: WildFireGS - 物理火灾模拟

### 基本信息
| 属性 | 内容 |
|------|------|
| **标题** | WildFireGS: Physics-Based Wildfire Simulation in Large-Scale Semantics-Enriched Gaussian Splatting Forest Scenes |
| **arXiv ID** | [2608.11100](https://arxiv.org/abs/2608.11100) |
| **分类** | cs.GR (Graphics) |
| **提交日期** | 2026-08-11 |
| **作者** | Michael Weinmann et al. |
| **DOI** | 10.48550/arXiv.2608.11100 |

### 核心创新点

#### 1. 核心问题
传统物理火灾模拟受限于合成环境，无法直接应用于基于真实航拍图像重建的现实世界森林场景。

#### 2. 技术方案
- **WildFireGS** 框架：将物理火灾模拟直接运行在 **3D Gaussian Splatting (3DGS)** 森林重建场景上
- 为 Gaussian 原语增加 **语义和材质属性**，编码植被类型和燃料特性
- 引入 **基于粒子的燃烧模型**，原生运行于 Gaussian 表示
- 模拟点燃、热传递、燃烧和火焰传播

#### 3. 关键技术
- **粒子燃烧模型**：直接在 Gaussian 表示上操作，无需转换为网格或体素网格
- **降雨冷却机制**：通过能量汇过程模拟降雨对火焰的抑制效果
- **火灾蔓延验证**：植被密度、风速、地形坡度与火蔓延的物理一致性

#### 4. 评估
- 合成场景和真实航拍森林捕获
- 火灾隔离实验 (firebreak experiments)
- 生物量损失估计

### 技术分类
- **类型**: 粒子渲染 / 火焰效果
- **方法**: 基于物理的火灾模拟 + 3D Gaussian Splatting
- **应用**: 野火数字孪生

### URL 链接
- arXiv: https://arxiv.org/abs/2608.11100
- PDF: https://arxiv.org/pdf/2608.11100

### 标签
#fire-simulation #gaussian-splatting #particle-system #wildfire #physics-based

---

## 📄 论文 2: Mixwell - SIGGRAPH 2026 Best Paper

### 基本信息
| 属性 | 内容 |
|------|------|
| **标题** | Mixwell: Sharp 2D Fluid Brushes for Progressive Physics-Based Mixing |
| **会议** | SIGGRAPH 2026 (Best Paper Award) |
| **发布** | ACM Transactions on Graphics 45(4), July 2026 |
| **DOI** | 10.1145/3811312 |
| **作者** | Doug L. James, Ethan James (Stanford University) |
| **Session** | Phased & Viscous Fluids |

### 核心创新点

#### 1. 核心问题
传统流体混合方法依赖全局求解器、网格或中间纹理重采样，导致数值耗散和分辨率依赖。

#### 2. 技术方案
- **Mixwell**: 一系列锋利的 2D 流体画笔
- **GPU 加速解析方法**：渐进式、分辨率无关的基于物理的混合
- 源自**柱面刷毛周围的理想势流**
- 包含**尖瓣的 Kelvinlet 风格正则化速度画笔**，简洁捕捉柱面-流体相互作用

#### 3. 核心技术
- **Maxwell 1869 漂流公式**：开发 GPU 友好的粒子漂流评估策略
- **无限和有限笔触**的漂流评估
- **圆柱反向漂流函数 (RDFs)**：编码刷毛插入、运动和移除的位移场
- SDF 风格组合：RDFs 可自然组合，在着色器中链接

#### 4. 实现
- 实时 GLSL 和 HLSL 实现
- Houdini 生产集成 (OpenCL, OSL)
- 渐进式、任意分辨率混合和渲染
- 极少的数值耗散

### 技术分类
- **类型**: 粒子渲染 / 流体混合
- **方法**: 势流 + Kelvinlet 正则化速度场 + GPU 加速
- **应用**: 数字艺术创作、实时流体交互

### URL 链接
- 项目主页: https://dougjam.github.io/mixwell-2026/
- ACM DL: https://dl.acm.org/doi/10.1145/3811312
- YouTube: https://www.youtube.com/watch?v=2dAXpTJAdZ4

### 标签
#fluid-brush #kelvinlet #potential-flow #GPU-accelerated #progressive-rendering #SIGGRAPH2026

---

## 📄 论文 3: Drawing with Water Waves

### 基本信息
| 属性 | 内容 |
|------|------|
| **标题** | Drawing with water waves |
| **arXiv ID** | [2607.13691](https://arxiv.org/abs/2607.13691) |
| **分类** | physics.flu-dyn (Fluid Dynamics) |
| **提交日期** | 2026-07-15 |
| **作者** | Taiga Kanehira et al. |

### 核心创新点
- 使用**瞬态多向聚焦波**在水面上绘制任意 2D 曲线和 3D 体积形状
- 集成 **Bézier 曲线参数化**、等弧长采样和**迭代振幅校正 (IAC) 算法**
- 使用 **SPH (Smoothed Particle Hydrodynamics)** 验证方法
- 物理实验：FloWave 圆形波池

### 技术分类
- **类型**: 流体模拟
- **方法**: SPH + 聚焦波生成
- **应用**: 海洋工程

### URL 链接
- arXiv: https://arxiv.org/abs/2607.13691
- PDF: https://arxiv.org/pdf/2607.13691

### 标签
#water-waves #SPH #wave-generation #ocean-engineering

---

## 📄 论文 4: 4D Topology Optimization of Moving Rigid Bodies in Fluid Flows

### 基本信息
| 属性 | 内容 |
|------|------|
| **标题** | 4D Topology optimization of moving rigid bodies in fluid flows |
| **arXiv ID** | [2608.01071](https://arxiv.org/abs/2608.01071) |
| **分类** | physics.flu-dyn (Fluid Dynamics) |
| **提交日期** | 2026-08-02 |
| **作者** | Yuta Tanabe et al. |

### 核心创新点
- **4D 拓扑优化**：同时优化刚体的形态和运动
- **格子动力学方案** (Lattice Kinetic Scheme)：格子 Boltzmann 方法的扩展
- 使用**伴随变量法**推导形状和运动灵敏度
- 形状和运动同步更新

### 技术分类
- **类型**: 流体模拟
- **方法**: 拓扑优化 + 格子 Boltzmann
- **应用**: 流固耦合优化

### URL 链接
- arXiv: https://arxiv.org/abs/2608.01071

### 标签
#topology-optimization #fluid-structure-interaction #lattice-Boltzmann

---

## 📊 今日搜索总结

### 论文发现统计
| 来源 | 数量 |
|------|------|
| arXiv cs.GR | 1 (WildFireGS) |
| SIGGRAPH 2026 | 1 (Mixwell Best Paper) |
| arXiv physics.flu-dyn | 2 (Drawing with water waves, 4D Topology) |

### 重点论文推荐

| 优先级 | 论文 | 推荐理由 |
|--------|------|----------|
| ⭐⭐⭐⭐⭐ | **Mixwell** | SIGGRAPH 2026 Best Paper，GPU 加速的实时流体混合画笔，突破分辨率限制 |
| ⭐⭐⭐⭐ | **WildFireGS** | 3DGS + 物理火灾模拟，直接在真实场景重建上运行燃烧模型 |

### 领域趋势
1. **Gaussian Splatting + 物理模拟**：WildFireGS 展示了 3DGS 在流体/火灾模拟中的潜力
2. **实时流体艺术工具**：Mixwell 的画笔范式为数字创作提供新思路
3. **物理与学习的结合**：语义增强的表示成为新方向

---

*笔记生成时间: 2026-08-25 14:08 UTC*
