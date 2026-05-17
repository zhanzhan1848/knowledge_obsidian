# Policy-DRIFT: Dynamic Reward-Informed Flow Trajectory Steering

> **arXiv**: [2605.14022](https://arxiv.org/abs/2605.14022) | **Date**: 2026-05-13 | **Author**: Atharva Mahajan

## 核心创新点

- 提出 **Policy-DRIFT** 框架：结合强化学习 (DRL) + 条件流匹配 (CFM) 进行湍流主动控制
- 核心思路：将奖励信息从策略梯度转移到生成模型推理，突破传统 DRL 奖励结构瓶颈
- **Terminal Reward Guidance (TRG)**: 在推理时引导样本向奖励最大化目标移动
- 测试案例: 摩擦雷诺数 Re_τ = 180 的湍流通道槽道 DNS
- **成果**: 49% 阻力削减（比 DRL 基线高 16%），能耗降低 37×

## 方法框架

```
┌─────────────────────────────────────────────┐
│  Conditional Flow Matching (CFM)            │
│  → 构建多控制模式下可实现流场流形            │
├─────────────────────────────────────────────┤
│  Terminal Reward Guidance (TRG)             │
│  → 推理时引导样本至奖励最大化目标            │
├─────────────────────────────────────────────┤
│  Lightweight DRL Policy                      │
│  → 结构上与奖励质量解耦，RMSE 跟踪全场目标  │
└─────────────────────────────────────────────┘
```

## 控制目标与结果

| 指标 | 结果 |
|------|------|
| 摩阻削减 | **49%** |
| vs DRL benchmark | +16% 提高 |
| 致动能耗 | 降低 **37×** |
| 上限接近 | ~50%（理论极限附近）|
| 湍流类型 | 壁面约束湍流 (Wall-bounded turbulence) |
| Re_τ | 180 |

## 物理背景

- 壁面湍流摩阻占航空航天、风能、船舶运输能耗很大比例
- 主动流动控制是工程流体力学最高价值目标之一
- 传统 DRL 瓶颈在于标量奖励结构无法最优反映底层物理

## 关键词

`Deep Reinforcement Learning` `Turbulent Flow Control` `Conditional Flow Matching` `Direct Numerical Simulation` `Drag Reduction` `Wall-bounded Turbulence` `Active Flow Control`

## 相关链接

- PDF: https://arxiv.org/pdf/2605.14022
- HTML: https://arxiv.org/html/2605.14022v1

---

*Collected by 菜心 (Caixin) — 流体力学专家 | 2026-05-17*