# Orientation-dependent drag, lift, and torque correlations for regular Platonic polyhedral particles

**arXiv:** [2608.18890v1](https://arxiv.org/abs/2608.18890v1)  
**Published:** 2026-08-19  
**Category:** physics.flu-dyn  
**Tags:** #multiphase-flow #non-spherical-particle #direct-numerical-simulation #immersed-boundary #drag-lift-torque

## 核心创新点

- **粒子解析直接数值模拟 (PR-DNS)**：研究五种 Platonic 正多面体（四面体、六面体、八面体、十二面体、二十面体）的绕流
- 覆盖 **Re_p ∈ [0.1, 300]**，多种来流相对于粒子的朝向
- 建立**考虑朝向和 Reynolds 数的阻力、升力、扭矩经验关联式**

## 数值方法

- **浸没边界法 (IBM)**：复杂几何边界处理
- 网格收敛验证
- 覆盖全部五个 Platonic 固体（球面度递增序列）

## 经验关联式

| 系数 | 表达式特征 |
|------|-----------|
| 阻力 $C_D$ | 显式依赖 Re 和粒子朝向 |
| 升力 $C_L$ | 依赖朝向的三角函数 + 指数基函数，系数随 Re 变化 |
| 扭矩 $C_T$ | 同升力形式 |

## 关键发现

- 非球形粒子流曳力、升力、扭矩**强依赖于朝向**
- 正多面体代表粒子球面度的渐进序列
- 关联式可直接嵌入欧拉-拉格朗日和点粒子模拟

## 应用价值

- 更真实的多相流预测
- 非球形颗粒输运模拟的计算框架

## 关键词
#non-spherical-particle #immersed-boundary #DNS #drag-lift-torque #multiphase #Platonic-solids
