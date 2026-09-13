# Distance generalization in transformers: why bother with positional encoding?

## 元信息
| 标题 | Distance generalization in transformers: why bother with positional encoding? |
| 作者 | Claudius Gros, Daniel Henrik Nevermann |
| 链接 | [原文](https://arxiv.org/abs/2609.11913) |
| arXiv | arXiv:2609.11913 |

## 核心贡献
1. **距离泛化新视角**: 研究 token 间距离在训练和推理间变化时的泛化性能（保持固定上下文长度）
2. **位置编码系统对比**: 对比 RoPE、ALiBi 与 NoPE（无位置编码）的距离分辨率能力
3. **数据多样性影响**: 研究训练中见到的 inter-token 距离数量如何影响泛化

## 核心问题
A. 位置编码（RoPE, ALiBi）相比 NoPE 是否提升距离分辨率？
B. 数据多样性（训练中见到的距离数量）如何影响性能？
C. 何时距离迁移学习正/负？

## 模型架构
- Transformer 架构
- 对比三种位置编码：RoPE、ALiBi、NoPE
- 两个合成延迟复制任务：full copy 和 selective copy

## 实验设置
- **Delay Copy Task**:  tokens 复制任务，source 和 recall 间有有限距离
- 测试模型在训练中未见过的 delay 下的性能
- 保持固定上下文长度

## 关键发现
- NoPE 在某些距离泛化任务上表现意外地有竞争力
- 位置编码方案的效果与任务类型和数据多样性密切相关
- 数据多样性（训练中接触的距离种类）是泛化关键
- 某些设置下无位置编码反而更好

## 建议
- 是否推荐使用：是（理论贡献）
- 适用场景：位置编码设计、上下文长度泛化研究
- 关键词：Positional Encoding, RoPE, ALiBi, Length Generalization, Distance
