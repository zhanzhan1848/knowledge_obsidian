# 流体渲染论文收集 - 2026年3月24日

## 📅 搜索日期
- 日期：2026-03-24
- 搜索范围：arXiv cs.GR, SIGGRAPH/SIGGRAPH Asia
- 关键词：fluid rendering, water rendering, smoke rendering, fire simulation, ocean rendering, particle system, volume rendering

---

## 📚 今日发现论文

### 1. Adaptive GPU Kinetic Solver for Fluid-Granular Flows

**论文信息**
- arXiv ID: [2603.14982](https://arxiv.org/abs/2603.14982)
- 提交日期：2026年3月16日
- 作者：Xingqiao Li 等
- 分类：Graphics (cs.GR)

**核心内容**

#### 摘要
模拟流体-颗粒流动对于理解自然灾害、工业过程以及计算机图形学中视觉逼真的现象至关重要。由于连续流体和离散颗粒介质之间的强非线性耦合，这些系统难以模拟。

#### 技术创新
- **统一框架**：耦合 LBM（格子玻尔兹曼方法）和 MPM（物质点法）
  - LBM 用于流体模拟
  - MPM 用于颗粒材料（沙、雪等）
- **自适应块结构**：基于实体几何结构的自适应多级 HOME-LBM 求解器
  - 高效内存使用
  - 多个网格分辨率下的计算性能
- **GPU 加速**：GPU 算法动态维护多级块
- **双向耦合**：所有 MPM 粒子位于最精细流体节点内

#### 应用场景
- 雪崩 (Snow avalanches)
- 沙尘暴 (Sandstorms)
- 沙迁移 (Sand migration)

#### 性能表现
- 高物理保真度
- 高计算效率
- 支持大规模现象

**技术要点**
```
方法组合：
- LBM (Lattice Boltzmann Method) → 流体
- MPM (Material Point Method) → 颗粒

关键特性：
- 自适应多分辨率网格
- GPU 并行计算
- 一致的矩重缩放定律
```

**渲染相关性**
- ⭐⭐⭐⭐⭐ 高度相关
- 涉及流体表面渲染
- 颗粒系统可视化
- 大规模场景渲染

---

### 2. GPU-Accelerated FLIP Fluid Simulation Based on Spatial Hashing Index

**论文信息**
- 发表期刊：MDPI
- 发表日期：2026年1月21日
- 关键词：FLIP, GPU, Spatial Hashing

**核心内容**

#### 技术要点
- **FLIP 方法**：流体隐式粒子方法，广泛用于流体模拟
  - 计算效率高
  - 低耗散性
- **空间哈希索引**：优化邻居搜索
- **线程块级协作**：GPU 并行优化

**渲染相关性**
- ⭐⭐⭐⭐ 相关
- 粒子流体渲染
- GPU 优化技术

---

### 3. Storm HydroFX 1.0

**项目信息**
- 发布日期：2026年1月
- 类型：GPU-based FLIP 流体模拟器
- 来源：[CG Channel](https://www.cgchannel.com/2026/01/storm-hydrofx-1-0-is-a-gpu-based-standalone-flip-fluid-simulator/)

**核心内容**

#### 特性
- 独立的 GPU FLIP 流体模拟器
- 无节点界面（简化版）
- 专注于液体模拟
- 基于 Storm VFX 工具

**渲染相关性**
- ⭐⭐⭐⭐ 相关
- 实时液体渲染
- 工业级工具

---

### 4. WebGPU Fluid Simulations

**项目信息**
- 发布日期：2025年2月
- 来源：[Codrops](https://tympanus.net/codrops/2025/02/26/webgpu-fluid-simulations-high-performance-real-time-rendering/)

**核心内容**

#### 技术实现
- **WebGPU API**：利用现代 GPU 能力
- **快速邻居搜索**：GPU 上的固定半径最近邻算法
- **实时性能**：约 30,000 粒子（iGPU）
- **方法**：SPH（光滑粒子流体动力学）

**关键算法**
```
邻居搜索优化：
- FAST FIXED-RADIUS NEAREST NEIGHBORS
- GPU 并行实现
- 相比暴力方法显著提升性能
```

**渲染相关性**
- ⭐⭐⭐⭐ 相关
- Web 平台流体渲染
- 实时性能优化

---

## 📊 arXiv cs.GR 最近提交列表

### 2026年3月24日 (12篇)
| 编号 | arXiv ID | 分类 |
|------|----------|------|
| 1 | 2603.22055 | cs.GR |
| 2 | 2603.21002 | cs.GR |
| 3-12 | 2603.22283-2603.20284 | cs.CV 交叉 |

### 2026年3月23日 (3篇)
| 编号 | arXiv ID | 主题 |
|------|----------|------|
| 13 | 2603.19240 | Beltrami 系数与几何映射 |
| 14 | 2603.19753 | cs.CV 交叉 |
| 15 | 2603.19500 | cs.AI 交叉 |

---

## 🔍 分析总结

### 今日重点论文
1. **Adaptive GPU Kinetic Solver** - 流体-颗粒耦合模拟，高度相关

### 技术趋势
- GPU 加速仍是主流
- 混合方法（LBM+MPM）成为趋势
- 自适应网格技术提升效率
- WebGPU 开启 Web 平台流体模拟

### 渲染方法分类
| 类型 | 论文/项目 | 推荐度 |
|------|-----------|--------|
| 粒子流体 | FLIP, SPH | ✅ |
| 体积渲染 | LBM | ✅ |
| 混合方法 | LBM+MPM | ✅ |

---

## 📌 后续行动
- [ ] 深入研究 LBM+MPM 耦合渲染
- [ ] 调研 WebGPU 流体渲染实现
- [ ] 关注 Storm HydroFX 工具更新
- [ ] 传递给 @墨鱼丸 进行算法实现评估

---

## 🔗 相关链接
- [arXiv cs.GR Recent](https://arxiv.org/list/cs.GR/recent)
- [NVIDIA GPU Gems](https://developer.nvidia.com/gpugems)
- [MIT GVDB Fluid](https://people.csail.mit.edu/kuiwu/gvdb_sim.html)

---

*生成时间：2026-03-24 14:24 UTC*
*Agent：豆苗 (Doumiao) 🌱*
