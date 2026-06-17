# Quartic Lyapunov Functions for Global Fluid Stability

## 论文信息
- **arXiv**: [2606.18232](https://arxiv.org/abs/2606.18232)
- **日期**: 2026-06-16
- **作者**: David Darrow
- **领域**: Fluid Dynamics (physics.flu-dyn)

## 摘要 (Abstract)
流体系统"全局稳定"指所有初始条件最终收敛到相同状态。自 Reynolds (1895) 和 Orr (1907) 以来，证明全局稳定性的标准方法是能量法，使用波动能作为 Lyapunov 函数。然而，当存在瞬态能量增长时，能量法失效，常导致过度严格的稳定性判据。

最近提出了基于多项式优化构造非二次 Lyapunov 函数的方法 (Goulart & Chernyshev 2012; Fuentes et al. 2022)，但该方法技术性强、计算成本高且难以物理解释。

本文进展：
1. 利用剪切流对称性通过复变量表示大幅简化问题规模
2. 改进关键不等式，用简单解析方法替代昂贵计算步骤
3. 证明二维平面 Couette 流动和 Poiseuille 流动在更高雷诺数下全局稳定

## 核心创新点
- **新 Lyapunov 函数类**: 三参数四次多项式族（最简非二次 Lyapunov 函数）
- **方法改进**: 利用对称性减少问题规模，解析替代数值计算
- **稳定性验证**: 突破能量法的局限性

## 数值方法
- **Lyapunov 函数构造**: 多项式优化
- **流型**: 二维平行剪切流
- **验证案例**: 平面 Couette 流动、平面 Poiseuille 流动

## 关键词
- 全局稳定性
- Lyapunov 函数
- 能量方法
- 剪切流
- Reynolds 数

## 理论意义
本文为超越能量法的全局流体稳定性分析理论奠定基础，为未来数值研究提供结构性见解。

## URL
https://arxiv.org/abs/2606.18232
