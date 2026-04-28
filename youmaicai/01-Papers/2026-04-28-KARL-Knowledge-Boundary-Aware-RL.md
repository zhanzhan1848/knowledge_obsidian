# KARL: Mitigating Hallucinations in LLMs via Knowledge-Boundary-Aware Reinforcement Learning

## 元信息
| 标题 | ... |
|------|-----|
| 作者 | Cheng Gao, Cheng Huang, Kangyang Luo, Ziqing Qiao, Shuzheng Si, Huimin Chen, Chaojun Xiao, Maosong Sun |
| 链接 | [原文](https://arxiv.org/abs/2604.22779) |
| arXiv | arXiv:2604.22779 |
| 领域 | LLM对齐 / Hallucination Mitigation / RL |

## 核心贡献
1. 提出 KARL 框架，动态对齐 LLM 的 abstention 行为与知识边界
2. 提出 **Knowledge-Boundary-Aware Reward**：利用组内响应统计进行在线知识边界估计
3. 提出 **Two-Stage RL Training Strategy**：先探索知识边界绕过"abstention trap"，再将边界外错误答案转化为 abstention

## 核心创新

### Knowledge-Boundary-Aware Reward
- 现有 RL 方法使用静态奖励机制，无法感知模型知识边界，导致过度谨慎
- KARL 通过组内响应统计在线估计知识边界，动态奖励正确答案或引导性 abstention

### Two-Stage RL Training Strategy
- **Stage 1**: 探索知识边界，绕过"abstention trap"（模型因过度谨慎而性能下降）
- **Stage 2**: 将知识边界外的错误答案转化为 abstention，同时不牺牲准确率

## 实验结果
- 在多个基准测试上验证
- 在分布内和分布外场景均有效抑制 hallucination 同时保持高准确率
- 实现更优的 accuracy-hallucination 权衡

## 局限性
- 依赖于在线知识边界估计，可能在某些领域不准确

## URL
https://arxiv.org/abs/2604.22779