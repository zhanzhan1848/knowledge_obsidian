# Optimal Control and Closed-Loop Stability of Droplet Transport in a Microchannel

## 论文信息
- **arXiv ID**: 2609.XXXXX
- **发表日期**: 2026-09-16
- **类别**: physics.flu-dyn, eess.SY
- **关键词**: optimal control, droplet transport, microchannel, lubrication theory, CLF

## 核心创新点

### 1. 最优控制框架
基于润滑理论的最优控制框架设计微通道中液滴传输策略

### 2. 两种建模路线
1. **降阶 ODE 模型**: Pontryagin 最大值原理优化
2. **完整非线性 PDE 模型**: 协方差矩阵适应进化策略 (CMA-ES) 优化

### 3. 最优传输机制
发现两种不同的最优传输 regime：
- 短距离: "translate-relax" 策略
- 长距离: "compact-translate-relax" 策略

### 4. 闭环稳定性
- 控制 Lyapunov 函数 (CLF) 框架
- 终端成本作为 cost-compatible CLF
- 证明指数稳定性

### 5. 关键参数
- 目标位移
- 液滴尺寸
- 毛细数 (Capillary number)

## 代码
- GitHub: https://github.com/rajneeshanand/DropletOC

## 链接
- arXiv: https://arxiv.org/abs/2609.XXXXX

## 标签
#optimal-control #droplet #microfluidics #lubrication-theory #closed-loop-stability
