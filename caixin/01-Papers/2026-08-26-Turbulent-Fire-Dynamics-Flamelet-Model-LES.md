---
type: paper
created: 2026-08-26
updated: 2026-08-26
tags: [turbulent-combustion, flamelet-model, LES, fire-plume, combustion-instability, Sandia, physics.flu-dyn]
status: new
agent: caixin
---

# Assessment of Turbulent Fire Dynamics and Combustion Instabilities Using a Flamelet Model

## 论文信息

| 字段 | 内容 |
|------|------|
| **arXiv** | [2608.24323](https://arxiv.org/abs/2608.24323) |
| **类别** | physics.flu-dyn |
| **作者** | Yunxiao Yan, Fabian Brännström, Christian Hasse, Xu Wen |
| **发表日期** | 2026-08-25 |
| **DOI** | 10.48550/arXiv.2608.24323 |
| **页数** | 15 pages, 11 figures |

## 核心贡献

对 Sandia 一米甲烷火羽流进行大涡模拟（LES），研究燃烧不稳定性的形成机制。系统评估了 Flamelet/Progress Variable（FPV）方法在湍流火焰模拟中的表现，并与 Eddy Dissipation Model（EDM）以及实验数据进行对比。

## 基准实验

**Sandia 一米甲烷火羽流**：湍流燃烧建模的标准基准。

## 关键发现

### 模型对比
| 模型 | 差分扩散 | 表现 |
|------|----------|------|
| FPV | 有 | 最优（近火焰根部区域） |
| EDM | - | 基本捕捉主流特征 |
| FPV | 无 | 改善但不显著 |

### 燃烧不稳定机制
- 火焰根部附近的**细胞状流动结构（cellular flow structures）**
- 通过**涡度方程预算分析**揭示形成机制
- 明确不稳定类型（剪切层不稳定性 + 热浮力耦合）

### FPV 模型优势
- 有限速率化学效应 → 预测近场燃烧结构
- 差分扩散 → 改善自由基速度预测
- 辐射模型和网格分辨率影响显著

## 数值方法

### 大涡模拟（LES）
- 过滤后的 N-S 方程
- 亚格子湍流模型（Smagorinsky 或类似）

### 燃烧模型
1. **Flamelet/Progress Variable (FPV)**
   - 假定火焰面薄（flamelet assumption）
   - 用进度变量 $c$ 描述燃烧进度
   - 需要层流火焰数据库

2. **Eddy Dissipation Model (EDM)**
   - 湍流控制（eddy dissipation 概念）
   - 无详细化学动力学

### 关键物理建模
- **有限速率化学**：Arrhenius 型反应
- **差分扩散**：不同组分的扩散系数差异
- **辐射传热**：光学厚/薄假设

## 涡度方程分析

细胞状结构的形成通过涡度方程预算分析：

$$\frac{D\omega}{Dt} = \underbrace{-(\omega \cdot \nabla)\mathbf{u}}_{\text{vortex stretching}} + \underbrace{\nabla \cdot \mathbf{u}}_{\text{expansion}} + \underbrace{\nu\nabla^2\omega}_{\text{viscous diffusion}} + \underbrace{\frac{1}{\rho^2}\nabla\rho \times \nabla p}_{\text{baroclinic}}$$

浮力项和应变率项的相互作用主导不稳定性的形成。

## 计算成本

- LES 网格：需捕捉湍流火焰结构，O(10⁷~10⁸)
- 化学动力学：详细 C1-C16 机理（OpenSMOKE++）
- 辐射模型：增加计算复杂度

## 工程应用

- 大尺度火灾模拟（建筑防火、森林火灾）
- 燃气轮机燃烧室设计
- 推进系统燃烧室

## 可行性分析

🥢 可行性分析：湍流火焰 LES

## 控制方程
- 过滤后 N-S（LES）
- 过滤后组分输运方程 + 能量方程
- 辐射传递方程（RTE）

## 数值方法
- 离散化：有限体积（低阶有界格式）
- 燃烧：FPV look-up table 或 EDM
- 求解器：压力-速度耦合（SIMPLE/PISO）

## 计算成本
- 网格：O(10⁷~10⁸)，强烈网格依赖
- 时间步长：CFL < 0.3（LES 稳定性要求）
- 并行性：大规模并行（1000+ 核）

## 推荐结论
✅ 推荐实现（LES 湍流燃烧方向）
