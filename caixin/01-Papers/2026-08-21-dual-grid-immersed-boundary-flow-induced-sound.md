# Fully Parallel Dual-Grid Immersed-Boundary Framework for Flow-Induced Sound from Complex Moving and Deforming Bodies

**arXiv:** [2608.18323v1](https://arxiv.org/abs/2608.18323v1)  
**Published:** 2026-08-18  
**Category:** physics.flu-dyn  
**Tags:** #aeroacoustics #immersed-boundary #Navier-Stokes #acoustic-perturbation #dual-grid #fish-locomotion

## 核心创新点

- **全并行双网格混合框架**：耦合不可压 NS 解算器和声学扰动方程 (APE) 解算器
- 网格**非 conforming Cartesian grids**：独立生成、互不约束
- 尖锋界面 ghost-cell 浸没边界法 + RBF 重构
- 流场网格仅包围物体和尾迹，声学网格独立延伸到远场

## 控制方程

- **近场**：不可压 Navier-Stokes
- **远场**：声学扰动方程 (Acoustic Perturbation Equation, APE)
- 耦合：通过 one-way 预计算并行插值算子传递声源

## 验证案例

1. 高斯脉冲传播
2. 刚圆柱脉冲散射
3. 圆柱绕流纯音发声
4. 行波波动辐射

## 应用场景

- 鳗鱼和 Jack 鱼游动
- 四鳗鱼群
- 魔鬼鱼 (manta ray)
- 海豹

## 关键能力

- 捕捉与形态相关的声学特征
- 干涉驱动的远场指向性变化
- 大边界变形和多个相互作用游动体
- **无需流场网格跨越声学远场**

## 关键词
#aeroacoustics #immersed-boundary #Navier-Stokes #dual-grid #flow-induced-sound #fish-locomotion
