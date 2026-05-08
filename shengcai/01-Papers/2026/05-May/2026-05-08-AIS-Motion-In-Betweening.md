---
tags: [动画, 插值, 深度学习, 2026, SIGGRAPH]
date: [[2026-05-08]]
status: 待读
---

# Adaptive Interpolation-Synthesis for Motion In-Betweening on Keyframe-Based Animation

## 元信息

| 标题 | Adaptive Interpolation-Synthesis for Motion In-Betweening on Keyframe-Based Animation |
|------|----------------------------------------------------------------------------------------|
| 作者 | Anton Rael et al. |
| 链接 | [arXiv](https://arxiv.org/abs/2605.02742) |
| 发表 | SIGGRAPH 2026 Conference Papers |
| 日期 | 2026-05-04 |
| DOI | https://doi.org/10.1145/3799902.3811157 |

## 核心贡献

1. **Adaptive Interpolation-Synthesis (AIS) 层**：动态平衡学习插值和直接姿态合成
2. **基于领域的输入关键姿态调度**：反映生产数据分布，提高风格一致性
3. **3.5 倍加速**：集成到 Autodesk Maya，使动画师完成中间帧任务速度提升 3.5 倍

## 技术方案

### 问题
- 动作中间帧制作是 3D 动画中最耗费艺术精力的阶段
- 表达性和节奏感在此阶段定义，需要高水平创意控制
- 现有深度学习方法与专业动画工作流程存在偏差

### 方法
- AIS 层反映动画师的创作过程
- 支持生产环境中的关键帧动画约束

## 实验结论

- 在生产数据上达到最先进性能
- 集成到 Maya 后显著提升效率

## 推荐度

⭐⭐⭐⭐☆

动画领域的重要工作，对角色动画和渲染中的动态捕捉/生成有参考价值。

---
**原始链接**：[arXiv 2605.02742](https://arxiv.org/abs/2605.02742)