# Complementary, Not Cumulative: Interaction Effects in Physics-Informed Neural Networks for Navier-Stokes Vortex Shedding

**arXiv:** [2608.19632v1](https://arxiv.org/abs/2608.19632v1)  
**Published:** 2026-08-20  
**Category:** physics.flu-dyn  
**Tags:** #PINNs #Navier-Stokes #vortex-shedding #deep-learning #CFD

## 核心创新点

- 系统研究 PINN 训练技巧的**组合效应**（而非单独评估）
- **关键发现**：单独使用几乎所有技巧都不如 baseline；但 SIREN 周期激活 + 因果加权组合可达到 **4.1% 平均相对 L2 误差**（vs OpenFOAM 参考解）
- 更多技巧组合反而导致灾难性性能下降
- **非线性交互**：技巧之间存在非线性叠加效应，更复杂的训练配方未必更好

## 控制方程

- **非稳态圆柱尾迹**：DFG/Schafer-Turek benchmark
- 2D 不可压缩 Navier-Stokes
- 漩涡脱落现象 (Kármán vortex street)

## 数值方法

- **基准解**：OpenFOAM 高保真 CFD
- **PINN 框架**：物理信息神经网络，直接嵌入 N-S 方程到训练损失
- **验证指标**：速度和压力场的平均相对 L2 误差

## 关键发现

| 单独技巧 | 效果 |
|----------|------|
| SIREN 激活 | 无显著改善 |
| 因果加权 | 无显著改善 |
| 其他技巧 | 无显著改善 |
| **SIREN + 因果加权** | **4.1% 误差，突破性进展** |

## 结论

- PINN 技巧研究应关注**组合效果**而非单独评估
- 过度工程化的训练配方是有害的
- 为 PINN 实际应用提供了可复现的配置方案

## 关键词
#PINNs #vortex-shedding #SIREN #causal-weighting #neural-networks #cylinder-wake
