# Jais 2: Arabic-Centric Open Large Language Models

## 元信息
| 标题 | Jais 2: A Family of Arabic-Centric Open Large Language Models |
|------|-----|
| 作者 | Mohamed Anwar, Abed Alhakim Freihat 等（55位作者，MBZUAI/Cerebras/Inception） |
| 链接 | [原文](https://arxiv.org/abs/2608.13580) |
| arXiv | arXiv:2608.13580 |
| 领域 | cs.CL, cs.AI |

## 核心贡献
1. **最大规模开源阿拉伯语Centric LLM**：70B 参数，从头训练
2. **竞争性 8B 参数变体**：评估中开源模型中表现领先
3. **自定义阿拉伯语Centric 词表**：高效训练和推理
4. **优化架构和训练配方**：显著更小的 token 预算达到强阿拉伯语性能

## 模型规格
| 模型 | 参数 | 特点 |
|------|------|------|
| Jais 2 70B | 70B | 最大开源阿拉伯语Centric LLM |
| Jais 2 8B | 8B | 竞争性开源变体 |

## 性能表现
- OALL2 和 AraGen 基准：评估中开源模型领先
- 阿拉伯文化基准表现强：诗歌、宗教、烹饪、梦解释
- 一般任务：翻译、摘要
- 相比同等模型，显著更小 token 预算达到同等性能
- 商用许可，HuggingFace 发布
- Cerebras 硬件上达 2000 tokens/s

## 技术亮点
- 自定义阿拉伯语Centric 词表 → 高效训练推理
- 优化架构 → 高度计算效率训练
- 显著小于竞争模型的 token 预算

## 局限性
- 主要针对阿拉伯语，英语性能虽竞争性但非最优
- 依赖 Cerebras 硬件达到最高速度

## URL
- HuggingFace: (模型发布页)
- Chat app: Web, iOS, Android
