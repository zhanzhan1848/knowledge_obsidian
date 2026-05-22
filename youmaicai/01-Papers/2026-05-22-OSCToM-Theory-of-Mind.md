# OSCToM: RL-Guided Adversarial Generation for High-Order Theory of Mind

## 元信息
| 标题 | OSCToM: RL-Guided Adversarial Generation for High-Order Theory of Mind |
|------|------|
| 作者 | Sharmin Sultana Srishty, Kazi Mahathir Rahman, Malaika Parizat Sakkhi, Samia Shahid Prianna, Shaikhul Islam Sinat |
| 链接 | [原文](https://arxiv.org/abs/2605.20423) |
| arXiv | arXiv:2605.20423 |
| 代码 | [GitHub](https://github.com/sharminsrishty/osct) |

## 核心贡献
1. **OSCToM 框架**: 提出 Observer-Self Conflict Theory of Mind，建模 LLM ToM 任务中的嵌套信念冲突
2. **观察者-自我冲突**: 当观察者对另一智能体的看法与自身信念状态冲突时，需要递归多层推理
3. **RL + DSL + 代理模型**: 结合强化学习、领域特定语言和组合代理模型生成观察者-自我冲突
4. **OSCToM-8B**: 在测试系统中取得最佳整体结果

## 实验结果
- **FANToM 基准**: 76% 准确率 (ExploreToM 报告 0.2%)
- **Hi-ToM, BigToM**: 保持竞争力
- **数据合成效率**: 6 倍提升
- 表明针对性训练数据可帮助小模型处理高级认知推理

## 局限性
- 主要在合成数据集上验证
- 递归信念推理复杂度可能限制实际部署

## 关键词
#LLM #TheoryOfMind #ReinforcementLearning #CognitiveReasoning #SocialIntelligence