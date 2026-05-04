# LOCA: Minimal, Local, Causal Explanations for Jailbreak Success in Large Language Models

## 基本信息
| 项目 | 内容 |
|------|------|
| 作者 | Shubham Kumar, Narendra Ahuja |
| 发表 | arXiv (2026-04-30) |
| 链接 | [原文](https://arxiv.org/abs/2605.00123) |
| arXiv | arXiv:2605.00123 |
| 代码 | 即将发布 |

## 核心贡献

### 问题
- Prior work 全局解释所有 jailbreak 攻击（试图 reduce/strengthen harmfulness）
- 不同 jailbreak 策略可能通过不同中间概念成功
- 同一策略对不同有害请求类别可能效果不同

### 方法：LOCA (Local, CAusal explanations)
- 识别最小的可解释中间表征变化集合
- 这些变化在因果上诱导模型拒绝原本成功的 jailbreak 请求
- 评估：Gemma 和 Llama chat models 的 harmful original-jailbreak pairs

### 关键结果
- LOCA 平均 **6 个可解释变化**即可成功诱导拒绝
- Prior work 即使 20 个变化也经常无法诱导拒绝

## 局限性
- 代码即将发布

## 建议
- **是否推荐使用**：是（用于 LLM safety 可解释性研究）
- **适用场景**：LLM 安全、jailbreak 防御、可解释 AI

---

## 摘要

Safety trained large language models (LLMs) can often be induced to answer harmful requests through jailbreak prompts. Because we lack a robust understanding of why LLMs are susceptible to jailbreaks, future frontier models operating more autonomously in higher-stakes settings may similarly be vulnerable to such attacks. Prior work has studied jailbreak success by examining the model's intermediate representations, identifying directions in this space that causally encode concepts like harmfulness and refusal. Then, they globally explain all jailbreak attacks as attempting to reduce or strengthen these concepts (e.g., reduce harmfulness). However, different jailbreak strategies may succeed by strengthening or suppressing different intermediate concepts, and the same jailbreak strategy may not work for different harmful request categories (e.g., violence vs. cyberattack); thus, we seek to give a local explanation -- i.e., why did this specific jailbreak succeed?

## 关键词
- `#LLM safety` `#jailbreak` `#mechanistic interpretability` `#causal explanation`