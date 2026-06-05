# EDIT: Evidence-Diagnosed Intervention Training for Rule-Faithful LLM Grading

## 基本信息
| 标题 | 值 |
|------|-----|
| 链接 | [原文](https://arxiv.org/abs/2606.06350) |
| arXiv | arXiv:2606.06350 |
| 领域 | LLM 微调 / RLHF / 教育 AI |

## 核心贡献

1. **EDIT 两阶段框架**: 针对 rubric grading（评分准则应用）场景训练 LLM grader，包含内部模型信号诊断和 belief-guided reward shaping。

2. **EDIT-SFT**: 
   - 用 posterior belief over final mark + input-grounding scores 定位问题推理步骤
   - 仅修订这些局部步骤（atomic edit under locality constraint）
   - 用 rubric checklist 提供 privileged context

3. **EDIT-RL**:
   - Belief-guided reward shaping
   - 惩罚大的有害 belief drift
   - 允许小的良性探索

## 核心问题

现有 credit-assignment 方法（GRPO 等）的问题：
- 只看最终 reward，无法定位哪一步出错
- 不控制 decision trajectory 中的 belief 演化
- 不适合 rule-application reasoning（需要外部 grounding）

## EDIT 的创新

- **外部 grounding**: 诊断信号衡量步骤是否依赖 student answer、rubric、preceding steps
- **Belief 演化控制**: 惩罚中间过程中远离 gold mark 的 drift

## 局限性

- 针对评分场景设计，泛化到其他 rule-application 任务待验证
- 需要 rubric checklist 作为输入

## 关键词
`fine-tuning` `RLHF` `LLM grading` `reasoning` `belief-guided reward shaping`
