# Just Keep Prompting

## 元信息
| 标题 | Just Keep Prompting: Evaluating Repetitive Socratic Prompting in VLMs |
|------|------|
| 作者 | Shayda Moezzi, Bishoy Galoaa, Lorena Genua, Taskin Padir, Sarah Ostadabbas |
| 链接 | [原文](https://arxiv.org/abs/2607.14099) |
| arXiv | arXiv:2607.14099 |
| 领域 | cs.CL, cs.AI, cs.CV |

## 核心贡献
1. **Just Keep Prompting (JKP)**: 多轮对话评估框架，测量 VLM 认知稳定性
2. **三种探测策略**:
   - Adversarial Negation（对抗性否定）
   - Pure Socratic Interrogation（苏格拉底式追问）
   - Context-Aware Socratic Summarization（上下文感知总结）

## 方法

### 评估设置
- **模型**: GPT-4o, Gemini 2.5 Pro, Qwen3-VL-30B
- **数据集**: STAR benchmark 子集
- **轮次**: 最多 10 轮
- **总计**: 720 个多轮运行

### 关键发现
- 聚合准确率变化不大，但轨迹级别揭示显著不稳定性
- 正确答案退化、错误答案恢复、反复翻转

### 模型对比
| 模型 | 特性 |
|------|------|
| Qwen3-VL-30B | 最高最终准确率，但直接反驳下 confidently wrong |
| Gemini 2.5 Pro | 比较稳定，token 消耗大 |
| GPT-4o | 最脆弱和振荡 |

## 结论
重复提示有上限好处，通常作为 destabilizer 而非推理辅助
