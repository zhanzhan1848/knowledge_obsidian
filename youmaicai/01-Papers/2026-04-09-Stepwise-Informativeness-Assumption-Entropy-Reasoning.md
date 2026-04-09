# The Stepwise Informativeness Assumption: Why Entropy Dynamics and Reasoning Correlated in LLMs

## 元信息
| 标题 | The Stepwise Informativeness Assumption: Why are Entropy Dynamics and Reasoning Correlated in LLMs? |
|------|------|
| 作者 | Mar Gonzàlez I Català, Haitz Sáez de Ocáriz Borde, George D. Montañez, Pietro Liò |
| 链接 | [原文](https://arxiv.org/abs/2604.06192) |
| arXiv | arXiv:2604.06192v1 |
| 领域 | cs.CL, cs.AI, cs.IT, cs.LG |

## 核心贡献
1. 提出 **Stepwise Informativeness Assumption (SIA)**，解释为何自回归模型的内部熵动态与外部正确性如此稳健相关
2. SIA 核心直觉：当模型通过 answer-informative prefixes 积累关于真答案的信息时，推理才是正确的
3. 证明 SIA 从最大似然优化（人类推理轨迹）自然涌现，并被标准微调和强化学习 pipeline 强化
4. 推导出连接条件答案熵动态与正确性的可观察签名

## 核心公式 / 框架

### SIA 定义
推理前缀在期望意义上随生成进展积累答案相关信息：
- reasoning prefixes accumulate answer-relevant information in expectation as generation progresses

### 可观察签名
SIA 预测正确推理轨迹表现出特征性条件答案熵模式：
- Correct traces show characteristic conditional answer entropy patterns
- 训练诱导 SIA

## 实验验证
- **基准**：GSM8K, ARC, SVAMP
- **模型**：Gemma-2, LLaMA-3.2, Qwen-2.5, DeepSeek, Olmo variants
- 验证了训练诱导 SIA，且正确轨迹表现出特征性条件答案熵模式

## 理论意义
- 为什么 entropy-based signals（如 LLM 日志概率、注意力模式中的熵）可以作为 reasoning 质量的代理指标
- 为何 LLM 内部表征的变化与最终输出正确性存在相关性

## 局限性
- 论文未提供详细实验超参数
- 理论框架的完整形式化证明在 appendix 中

## 建议
- **是否推荐阅读**：是
- **适用场景**：LLM 可解释性、推理机制研究、置信度评估
