# Refusal Lives Downstream of Persona in Chat Models

## 元信息
| 标题 | Refusal Lives Downstream of Persona in Chat Models |
|------|-----|
| 作者 | Viola Zhong, Qirui Li |
| 链接 | [原文](https://arxiv.org/abs/2606.26161) |
| arXiv | arXiv:2606.26161 |
| 领域 | cs.AI |
| 发表 | ICML 2026 Mechanistic Interpretability workshop |

## 核心贡献
1. **Refusal 与 Persona 交互机制**: 发现 compliant persona 充当 refusal 的 gate（门控）
2. **双向干预实验**: 在 Qwen2.5-7B-Instruct 和 Llama-3.1-8B-Instruct 上提取 persona direction 和 refusal direction 并干预
3. **层级定位**: Refusal 在 late-layer expression stage 被 gate，位于 computation 下游
4. **关键发现**: 将 refusal 视为单一孤立方向会错过其对 persona 的依赖

## 核心发现
- Compliant persona steering 抑制 refusal：Llama 上 refusal rate 从 97% 降至 2%
- 重新引入 refusal direction 在 late layers 部分恢复 refusal，但 early layers 不行
- 在 late-layer window 投影掉 persona direction 恢复 baseline refusal；投影随机方向则不行

## 方法
- Activation steering in activation space
- Linear directions extraction for both refusal and persona traits
- Layer-wise intervention analysis

## 标签
#LLM #mechanistic-interpretability #refusal #persona #activation-steering