---
type: paper
created: 2026-06-23
updated: 2026-06-23
tags: [CFD, DG, local-time-stepping, low-mach, discontinuous-galerkin]
status: processed
domain: computational-fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2606.22820
---

# Conservative Time-Accurate Local-Time-Stepping DG Scheme Based on a Weakly Compressible Model for Unsteady Low-Mach-Number Flows

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Conservative Time-Accurate Local-Time-Stepping DG Scheme for Unsteady Low-Mach-Number Flows |
| **arXiv ID** | 2606.22820 |
| **作者** | (待补全) |
| **领域** | physics.flu-dyn / CFD |
| **链接** | [原文](https://arxiv.org/abs/2606.22820) \| [PDF](https://arxiv.org/pdf/2606.22820) |

---

## 核心贡献

> 提出一种保守高阶间断Galerkin（DG）方法，结合时间精确的局部时间步（LTS）策略，用于弱可压模型下的低速非定常流动模拟。

1. **弱可压 formulation**: 压力仅定义为密度的函数，消除全局压力 Poisson 方程，同时保持可压格式的局部性和守恒性
2. **时间精确 LTS**: 使用连续延展 Runge-Kutta (CERK) 格式为局部时间步构建 cell-local 预测多项式
3. **DG SEM 空间离散**: 基于 Gauss-Lobatto-Legendre 点的谱元法（nodal DGSEM）
4. **IIPG 粘性项处理**: 不完全内罚Galerkin方法处理粘性通量

---

## 技术方案

### 控制方程 — 弱可压模型

压力定义为密度的函数，$p = p(\rho)$，无需全局 Poisson 方程。

### 空间离散化

- **方法**: 强形式 nodal DGSEM ( discontinuous Galerkin Spectral Element Method )
- **节点**: Gauss-Lobatto-Legendre (GLL) 点
- **无粘通量**: 针对弱可压系统定制的数值通量（含双稀疏波近似 Riemann 解法器 for barotropic EOS）
- **粘性通量**: IIPG (Incomplete Interior Penalty Galerkin)

### 时间离散化

- **CERK (Continuous Extension Runge-Kutta)**: 构建 cell-local 预测多项式，实现时间精确的局部时间步进
- **Face 通量分裂**: 内部贡献与公共贡献分离
- **SBP 性质**: 保持离散求和-按-部分（SBP）取消，确保保守的单元间通量交换

### 稳定性

- 局部时间步进保持**时间精确性**和**守恒性**
- 适用于非均匀网格和复杂几何

---

## 公式

### 弱可压状态方程

$$p = p(\rho) \quad \text{(仅依赖密度，恒定声速)}$$

### 双稀疏波 Riemann 解法器

针对常声速 barotropic EOS 构造，适用于低速流动。

---

## 计算成本

| 项目 | 估算 |
|------|------|
| **局部时间步进效率** | 比全局时间步长方法更高效，尤其在非均匀网格 |
| **适用场景** | 低速非定常流、气动声学、大涡模拟 (LES) |
| **高阶精度** | spectral accuracy in space |

---

## 推荐结论

✅ **推荐实现 — 高优先级**

**理由**:
- 弱可压方法同时兼顾了不可压求解器的精度和可压求解器的局部性
- LTS 策略特别适合多尺度问题的自适应时间步长
- 方法论完整：DG + CERK + IIPG + SBP

**参考实现方向**: OpenDG, deal.II, or custom DGSEM framework

---

## 相关工作

- [[2026-06-23-RANS-Flow-MRI-Assimilation|RANS Data Assimilation]] (另一类CFD方法)
- [[2026-06-23-LBM-MD-Nonideal-Fluids|LBM vs MD]] (另一类低速流动方法)
