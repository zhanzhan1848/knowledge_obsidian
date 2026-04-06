---
title: "Wave-appropriate reconstruction of compressible flows"
authors:
  - Amareshwara Sainadh Chamarthi
date: 2026-04-03
arXiv: 2604.02757
subjects:
  - physics.flu-dyn
keywords:
  - compressible flow
  - CFD
  - reconstruction
  - acoustic dissipation
  - entropy wave
  - WENO
url: https://arxiv.org/abs/2604.02757
---

# 🥬 Wave-Appropriate Reconstruction for Compressible Flows

## 核心创新点
1. **自适应 acoustic upwind 参数** $\eta_a$ 优化（从固定 1.0 降至最小稳定值）
2. **Rank-1 entropy wave correction** 消除接触间断检测器需求
3. 跨声速湍流到高超声速激波流的通用性验证

## 数值方法

### Wave-Appropriate Framework
- 将重构分解为**特征波族**
- 非声波集中化 → 最小耗散
- 声波保留 upwind bias

### 优化策略
- **Bounded scalar minimization**
- 稳定性约束：supersonic viscous TGV
- 准确性目标：subsonic inviscid TGV
- 约 25 次评估收敛

### Rank-1 Entropy Correction
- 仅依赖 **Ducros sensor**
- **Limiter-agnostic**（可直接用于 WENO 等其他格式）
- 壁时间减少 29-41%

## 关键结果
| 流动类型 | 性能提升 |
|---------|---------|
| 亚声速湍流 | 29-41% 壁时间减少 |
| 高超声速 | 参数自动调整 |
| 激波-接触间断 | 无需显式检测器 |

## 关联知识
[[Compressible Flow]], [[CFD]], [[Finite Volume]], [[WENO]], [[Acoustic Waves]]

## 评估
- **计算成本**：低（优化框架无需大幅改动）
- **创新程度**：⭐⭐⭐⭐（实用性强，理论清晰）
- **工程价值**：⭐⭐⭐⭐⭐（直接提升 CFD 效率）
