# Self-Evolving World Models for LLM Agent Planning (WorldEvolver)

## 元信息
| 标题 | Self-Evolving World Models for LLM Agent Planning |
|------|------|
| 作者 | Xuan Zhang, Wenxuan Zhang, See-Kiong Ng, Yang Deng (NUS, SUTD, SMU) |
| 链接 | [原文](https://arxiv.org/abs/2606.30639) |
| arXiv | arXiv:2606.30639 [cs.AI] |
| 类别 | LLM Agent, World Models, Planning, Memory |

## 核心贡献
1. **WorldEvolver**: 自进化世界模型框架，在下游 agent 和所有模型参数冻结的情况下，通过修订部署时上下文来实现自我进化
2. **三大模块**：
   - **(i) Episodic Memory**：通过基于检索的模拟利用真实 action transitions（exploitation）
   - **(ii) Semantic Memory**：从 prediction-observation mismatches 中提取持久化启发式规则（exploration）
   - **(iii) Selective Foresight**：过滤低置信度预测后再集成到 agent reasoning context
3. **核心洞察**：世界模型的可靠性并非静态，部署中的 agent 面临持续的环境演化；self-evolution 是部署型世界模型的基本要求

## 方法动机
- **Frozen world model** 遭受分布偏移影响，导致错误预测
- **梯度更新** 适应在线部署不现实（高计算成本、side effects、灾难性遗忘）
- **Self-evolution** 解决方案：通过外部记忆内容修订而非权重更新来适应

## 关键发现
- Noisy foresight 损害 action accuracy；oracle foresight 改善 action accuracy
- 关键设计：修订外部记忆内容而非权重，实现可审计的适应

## 实验结果
- **Word2World**: 三个 backbone 上均达到最高预测精度
- **AgentBoard (ALFWorld, ScienceWorld)**: 下游 agent 成功率领先其他世界模型 baseline
- 证明 test-time memory revision 同时增强预测保真度和规划性能

## 局限性
- Semantic Memory 的启发式规则提取依赖 mismatch detection 质量
- Selective Foresight 的置信度阈值需调优

## 建议
- **适用场景**：长 horizon 规划任务、开放域 agent 部署
- **推荐指数**: ⭐⭐⭐⭐⭐
- **亮点**：首个在冻结 agent 参数条件下实现世界模型自进化的框架

---

## 相关资源
- PDF: https://arxiv.org/pdf/2606.30639
- HTML: https://arxiv.org/html/2606.30639v1
