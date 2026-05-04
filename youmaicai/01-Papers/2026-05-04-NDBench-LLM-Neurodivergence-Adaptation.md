# NDBench: How Frontier LLMs Adapt to Neurodivergence Context

## 基本信息
| 项目 | 内容 |
|------|------|
| 作者 | Ishan Gupta, Pavlo Buryi |
| 发表 | arXiv (2026-04-30) |
| 链接 | [原文](https://arxiv.org/abs/2605.00113) |
| arXiv | arXiv:2605.00113 |
| 代码 | [GitHub](https://github.com/ishansgupta/ndbench) |

## 核心贡献
1. **NDBench**: 576输出的 benchmark，评估前沿 LLM 对神经多样性(ND)上下文的适应
2. 三种 system prompt 类型：baseline、ND-profile assertion、ND-profile assertion with explicit instructions
3. 四个典型 ND profiles，24 prompts across four categories（含对抗性 masking 策略）

## 主要发现

### 4个一致性趋势：
1. **显著适应**：ND 上下文下产生更长、更结构化的输出（token 数增加、更多标题、更细粒度步骤，p < 10^-8）
2. **结构性适应为主**：list density 不变，但标题频率和每步细节显著增加
3. **ND persona assertion 不足以抑制有害倾向**：masking-reinforcement 降低仅在 explicit instructed cases 出现（36-44% reduction）
4. **评估可靠性**：LLM-based harm assessment 仅 2/6 维度超过 inter-judge agreement 阈值（alpha >= 0.67）

## 局限性
- NDBench 是 audit 工具，非治疗/支持工具

## 建议
- **是否推荐使用**：是（用于 LLM ND awareness 审计）
- **适用场景**：LLM 安全评估、ND-aware AI 系统设计

---

## 摘要

We examine if frontier chat-based large language models (LLMs) adjust their outputs based on neurodivergence (ND) context in system prompts and describe the nature of these adjustments. Specifically, we propose NDBench, a 576-output benchmark involving two frontier models, three system prompt types (baseline, ND-profile assertion, and ND-profile assertion with explicit instructions for adjustments), four canonical ND profiles, and 24 prompts across four categories, one of which involves an adversarial masking strategy.

## 关键词
- `#LLM evaluation` `#neurodivergence` `#system prompt` `#safety` `#harm detection`