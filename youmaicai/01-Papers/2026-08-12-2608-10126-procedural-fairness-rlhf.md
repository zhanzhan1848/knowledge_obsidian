# Procedural Fairness Failures in RLHF from Preference Averaging

## 元信息
| 标题 | Procedural Fairness Failures in RLHF from Preference Averaging |
|------|------|
| 作者 | M P V S Gopinadh 等 |
| 链接 | [原文](https://arxiv.org/abs/2608.10126) |
| arXiv | arXiv:2608.10126 |
| 发表 | ICLR 2026 Workshop (AFAA) |
| 标签 | RLHF, Alignment, Fairness |

## 核心贡献
1. **问题定义**: 标准 RLHF 通过 preference averaging 将异质偏好聚合为单一奖励模型，假设偏好同质——当偏好异质时导致程序公平性失败
2. **机制分析**: 多数偏好群体主导奖励学习，少数群体偏好被系统性低估
3. **解决方案**: Preference-Aware RLHF (PA-RLHF)，在奖励学习阶段分离不同偏好模式的优化

## 核心问题
- **Preference Averaging 的缺陷**: 将异质偏好简单平均，多数群体主导
- **结果**: 少数群体在 reward model 中代表性不足 → 后续 alignment 偏差

## PA-RLHF 方法
- 分离优化不同偏好模式的 reward learning
- 在 reward modeling 阶段保留不同偏好信号

## 实验结果
| 指标 | 标准 RLHF | PA-RLHF |
|------|----------|---------|
| 整体对齐准确率 | 46.9% | **67.9%** |
| 最佳/最差群体公平性差距 | 15.9 pp | **9.6 pp** |

## 核心洞察
> 程序公平性失败可源于奖励学习中的结构性设计选择，甚至在受控、无噪声的环境中也会发生

## 对 LLM/Agent 系统的影响
- 有偏的奖励模型会在顺序决策中累积不公平
- 对多用户、多场景的 LLM 系统影响尤为显著

## 建议
- **是否推荐使用**: 是
- **适用场景**: 需要处理多群体偏好的对齐系统
- **相关方向**: 偏好异质性、fairness in alignment、multi-objective RLHF
