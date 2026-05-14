# C-3PO: Cross-Lingual Cultural Consistent Preference Optimisation

## 元信息
| 标题 | Mitigating Cross-Lingual Cultural Inconsistencies in LLMs via Consensus-Driven Preference Optimisation |
|------|-----|
| 作者 | Lucas Resck, Isabelle Augenstein, Anna Korhonen |
| 链接 | [原文](https://arxiv.org/abs/2605.12515) |
| arXiv | arXiv:2605.12515 |
| 类别 | cs.CL |

## 核心贡献
1. **问题定义**：多语言大模型（MLLMs）在切换提示语言时表现出文化不一致行为。当用户身份被明确定义时，语言切换会覆盖系统人设（如固定英国人设在英语下输出莎士比亚，西班牙语下输出塞万提斯）
2. **评估指标**：提出 Singleton Fleiss's κ_S，对幻觉具有数学鲁棒性
3. **解决方案**：C-3PO（Cross-lingual Cultural Consistent Preference Optimisation），一种共识驱动的对齐框架，较未对齐模型提升最高 0.10 个绝对点
4. **发现**：低资源语言（如印尼语、波斯语）受不一致性影响更大；早期解码层表征将输出个性化到提示语言刻板文化

## 模型架构
- 多语言 LLM（MLLMs）
- 层间可解释性分析：early-decoding intermediate layer representations

## 核心方法
- **C-3PO**：共识驱动偏好优化，通过跨语言文化一致性对齐
- **κ_S**：对幻觉具有数学鲁棒性的文化一致性度量

## 实验结果
- κ_S 提升最高 0.10 绝对点
- 优于强提示和表征 steering 基线
- 低资源语言受不一致性影响更大

## 局限性
- 主要关注文化一致性，未讨论对其他类型不一致性的泛化

## 来源
🥬 LLM/NLP | 2026-05-14 | cs.CL