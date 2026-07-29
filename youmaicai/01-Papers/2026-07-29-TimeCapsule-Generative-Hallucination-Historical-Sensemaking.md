# TimeCapsule: Generative Hallucination as a Method for Historical Sensemaking

## 元信息
| 标题 | TimeCapsule: Generative Hallucination as a Method for Historical Sensemaking |
|------|-----|
| 作者 | Hayk Grigorian, Hamed Yaghoobian |
| 链接 | [原文](https://arxiv.org/abs/2607.24750) |
| arXiv | arXiv:2607.24750 |
| 会议 | C&C '26 (Creativity and Cognition) |
| 代码 | - |

## 核心贡献
1. 提出 **TimeCapsule**：首个在时间上与当代知识隔离的 LLM，通过仅在 Victorian 文本（1800-1875）上训练，实现"结构性不知道未来"的状态
2. 1.2B 参数 LLaMA-style 因果模型，在 held-out Victorian prose 上比 GPT-2 基线降低 45.4% perplexity
3. 提出"生成性幻觉作为历史诠释探针"的新范式——模型对未来的结构性无知可以转化为 19 世纪本体论的理解工具
4. 人文学者研究中，约 40% 的真实 Victorian 片段被误判为机器生成

## 模型架构
- **模型规模**: 1.2B 参数
- **架构**: LLaMA-style causal language model
- **训练数据**: Victorian texts (1800-1875)，仅此时间段
- **核心思想**: 训练数据的时间隔离 = 模型"不知道"未来 → 不知道的东西变成"hallucination" = 对过去的诠释探针

## 关键发现
### 定量评估
- TimeCapsule 在 Victorian prose perplexity 上比 GPT-2 基线降低 **45.4%**
- 更大的当代因果模型 raw perplexity 更低，但缺乏时间隔离

### 定性评估
- 模型展示"计算性意义建构"：为不熟悉现代概念生成历史合理类比
  - 例：将 computer 描述为 "hypertrophied lung"（过度发育的肺）
- 人文学者实验揭示"真实性危机"：40% 真实 Victorian 片段被误分类为机器生成

## 核心洞察
> "Structural ignorance of the future transforms hallucinations into interpretive probes of nineteenth-century ontologies"

结构性地不知道未来 → 幻觉变成 19 世纪本体论的理解探针

## 局限性
- 模型规模仅 1.2B，无法与当代大模型能力对比
- 评估依赖 Victorian 文本数据集的有限性
- 人文学者样本量小（仅 2 人）

## 关键词
#LLM #temporal-isolation #historical-NLP #generative-hallucination #Victorian #causal-LM
