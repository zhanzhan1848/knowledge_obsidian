# Entity Tracking Emerges in Sub-Billion Parameter Language Models and Exceeds Human Performance

## 元信息
| 标题 | Entity tracking emerges in sub-billion parameter language models and exceeds human performance in naturalistic narratives |
|---|---|
| 作者 | Karolina Drożdż, Micha Heilbron |
| 链接 | [原文](https://arxiv.org/abs/2608.18083) |
| arXiv | arXiv:2608.18083 |
| 代码 | 待发布 |

## 核心贡献
1. 首次在**自然语言叙事**而非人工任务上评估实体追踪，与人类被试（N=48）直接对比
2. 发现**4.1亿参数**的语言模型即可达到人类水平实体追踪，远低于此前认为的代码专用多 billion 参数模型门槛
3. 实体追踪随模型规模提升而提升，当代模型已大幅超越人类表现

## 核心发现

### 人类被试实验
- 实体追踪退化与**叙事复杂度**（而非叙事长度）正相关
- 复杂度是决定因素，而非文本长度本身

### LLM 实验
- 410M 参数模型已具备人类级实体追踪能力
- 随规模增大，性能持续提升
- 当代模型（推测为 GPT-4 级别）大幅超越人类

## 关键洞察
- 实体追踪作为语言理解的核心组件，所需的模型规模比之前研究所需小得多
- 这意味着实体追踪能力是 LLM 的"涌现"能力之一，且门槛远低于预期

## 评估方法
- 使用自然叙事材料（多层复杂度）替代传统人工构造的实体追踪任务
- 人类被试与语言模型在相同材料上对比

---
*关键词：实体追踪，语言模型，规模，Transformer，BERT，自然语言理解*
*领域：cs.CL*
