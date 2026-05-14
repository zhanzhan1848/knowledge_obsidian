# Effects of Thermal Boundary Conditions on Natural Convection in Non-Newtonian Power-Law Fluids

- **arXiv**: [2605.13633](https://arxiv.org/abs/2605.13633)
- **Authors**: Patricia Weisensee（推断）
- **Date**: 2026-05-13
- **Subjects**: physics.flu-dyn, cs.CE, physics.comp-ph
- **URL**: https://arxiv.org/pdf/2605.13633

## 核心创新点

1. **几何构型**: 方腔和同心圆柱环隙
2. **非牛顿流体**: 幂律模型（剪切变稀/剪切变稠）
3. **求解器**: Gridap.jl 有限元框架
4. **热边界条件**: 均匀/非均匀（正弦）加热

## 控制方程

- 不可压缩幂律模型（power-law model）
- Boussinesq 近似
- 稳态 2D 方程

## 关键结果

### 流变学影响

| 流体类型 | 流动特性 | 传热特性 |
|----------|----------|----------|
| 剪切变稀 | 增强浮力驱动循环 | 增强（热梯度更陡） |
| 牛顿流体 | 中等 | 中等 |
| 剪切变稠 | 抑制对流 | 导热主导 |

### 边界条件影响

- **均匀加热**: 产生更强且分布更广的对流结构
- **非均匀正弦加热**: 热强迫局域化，总熵产始终较低

## 熵产分析

- **剪切变稀流体**: 粘性耗散主导不可逆性
- **剪切变稠流体**: 热传导不可逆性主导

## 实践意义

- 通过适当的热边界设计和流体流变性，可控制传热并最小化热力学损失

## 标签

#非牛顿流 #幂律流体 #自然对流 #热边界 #熵产 #Gridap.jl