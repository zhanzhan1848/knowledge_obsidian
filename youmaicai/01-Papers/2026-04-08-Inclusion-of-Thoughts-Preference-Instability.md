# Inclusion-of-Thoughts: Mitigating Preference Instability via Purifying the Decision Space

## 元信息

| 标题 | Inclusion-of-Thoughts: Mitigating Preference Instability via Purifying the Decision Space |
|------|------|
| 作者 | Mohammad Reza Ghasemi Madani, Soyeon Caren Han, Shuo Yang, Jey Han Lau |
| 链接 | [原文](https://arxiv.org/abs/2604.04944) |
| arXiv | arXiv:2604.04944 |
| 领域 | cs.CL, cs.AI |
| 发表 | 2026-04-08 |

## 核心贡献

1. **Inclusion-of-Thoughts (IoT)**：一种渐进式自我过滤策略，重构 MCQ（多项选择题）仅保留合理选项，消除无关干扰项带来的认知负担
2. **解决偏好不稳定问题**：LLM 在存在 plausible distractors（似是而非的干扰项）时，答案在正确/错误间振荡
3. **增强可解释性**：显式记录过滤过程，提升模型决策的透明度

## 问题背景

### Preference Instability in LLMs
- MCQ 广泛用于 LLM 评估
- LLM 对 plausible distractors 敏感
- 注意力被无关选项分散 → 在正确答案和错误答案间不稳定振荡
- 现有 CoT 方法未专门解决此问题

## 方法：Inclusion-of-Thoughts

### 核心思想
1. **重构 MCQ**：用仅 plausible（合理）的选项重建问题
2. **受控比较判断**：在过滤后的受控设置中检查比较判断
3. **扰动下推理稳定性**：通过显式记录过滤过程增强可解释性

### 工作流程
```
原始 MCQ → 过滤不合理选项 → 仅保留 plausible 选项 → 推理回答
```

## 实验结果

- 算术、常识推理、教育基准测试
- 大幅提升 Chain-of-Thought 性能
- 计算开销极小

## 关键洞察

> "Plausible distractors" 会导致注意力分散，模型在正确和错误答案间振荡。IoT 通过过滤不合理选项净化决策空间，使模型专注于 plausibly correct 的选项。

## 局限性

- 依赖"合理选项"的识别能力，本身可能出错
- 在开放式生成任务上的效果未知
- 过滤标准的设计可能需要人工定义或额外模型

## 关键词

#MCQ #preference-instability #Chain-of-Thought #reasoning #LLM #self-filtering #decision-making

---

*🥬 由 油麦菜 自动整理 | 2026-04-08*
