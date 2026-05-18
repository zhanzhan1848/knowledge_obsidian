# Fair Outputs, Biased Internals: Latent Bias in LLMs for High-Stakes Decisions

## 元信息
| 标题 | Fair outputs, Biased Internals: Causal Potency and Asymmetry of Latent Bias in LLMs for High-Stakes Decisions |
|------|------|
| 作者 | Jagdish Tripathy, Marcus Buckmann |
| 链接 | [原文](https://arxiv.org/abs/2605.15217) |
| arXiv | arXiv:2605.15217 |
| 发表 | cs.AI / cs.CY / cs.LG |

## 核心贡献
1. **关键发现**：指令微调语言模型在高分险决策中表现出行为公平性，但内部表征中保留了有偏关联。
2. **因果效力**：通过激活 steering 和跨层干预，证明被抑制的信息具有决策相关性——在关键层重新注入时几乎完全反转决策。
3. **非对称性**：steering 干预沿一个人口统计方向影响决策，对相反方向影响极小。
4. **暴露性**：对抗性 prompt 工程和参数高效微调可利用这种隐藏偏见。

## 研究场景
**抵押贷款承销**：使用仅在种族相关姓名不同的匹配申请

## 关键发现

### 输出层面
- 模型在输出层面**无偏见**
- 行为审计显示公平结果

### 内部层面
- 跨模型层**保留并放大**人口统计表征
- 表征分析揭示隐藏的歧视性关联

### 因果效力
- 激活 steering 可**近乎完全反转决策**
- 抑制信息是决策相关的

### 非对称性
- steering 干预沿一个方向影响决策
- 对反方向影响极小

## 方法
1. **激活 steering**：跨层干预重新注入抑制信息
2. **跨层干预**：novel cross-layer interventions
3. **行为审计 + 表征分析**：dual-layer testing framework

## 关键洞察
1. 行为审计不足以保证公平性：公平输出可能掩盖可利用的内部偏见
2. 高风险决策需要 dual-layer testing framework
3. AI 治理需要输出评估与表征分析相结合

## 标签
#bias #fairness #alignment #LLM #high-stakes #interpretability #activation-steering