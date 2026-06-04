# POLARIS: Guiding Small Models to Write Long Stories

## 元信息
| 标题 | POLARIS: Guiding Small Models to Write Long Stories |
|------|------|
| 作者 | Rishanth Rajendhran, Jenna Russell, Mohit Iyyer, John Frederick Wieting |
| 链接 | [原文](https://arxiv.org/abs/2606.04095) |
| arXiv | arXiv:2606.04095 |
| 代码 | - |
| 领域 | cs.CL, cs.AI |
| 发表 | 2026-06-02 |

## 核心贡献
1. 提出 POLARIS（Policy Optimization with LLM-as-a-judge rewards and Anchored-Reference Injection for Storywriting），一种低计算量的 GRPO 训练方法
2. 使用前沿 LLM judge + 结构化 Story Quality rubric 作为在线奖励信号
3. 提出 Human-Reference Injection (HRI)：在每个 GRPO group 中引入教师强制的人工写作故事作为高奖励锚点
4. 在 Qwen3.5-9B 上训练，仅需 ~1.4K prompt-story pairs 和 4 张 A100 GPU
5. POLARIS-9B 在 3 倍训练长度的提示上仍保持质量——大多数开源模型会在超长写作上显著退化

## 模型架构 / 训练方法

### 核心方法
- **GRPO (Group Relative Policy Optimization)**：Group-relative 优势估计 + 全词汇表 self-distillation KL loss
- **LLM-as-a-judge reward**：使用前沿 LLM（如 GPT-4o）作为 judge，提供结构化 Story Quality rubric 评分
- **Human-Reference Injection (HRI)**：在每个 GRPO group 中注入教师强制的人类写作故事作为高奖励锚点，防止模型探索空间坍塌

### 训练配置
- Base model: Qwen3.5-9B
- Dataset: ~1.4K prompt-story pairs from 100 short-story anthologies
- Compute: 4 × A100 80GB
- 训练长度上限: 4k words

## 实验结果

### 关键结果
- POLARIS-9B 在 5 个 benchmarks 上与更大规模开源模型性能相当，且更好地遵循长度指令
- 盲测人类评估：POLARIS-9B 优于 base Qwen3.5-9B，与 Qwen3.5-27B 持平
- **长度泛化**：即便仅训练在 4k words 以内，模型在 12k words 提示上仍保持质量（大多数模型会退化）

### 核心洞察
> Length generalization is a meaningful stress test for creative-writing models and a useful lens for distinguishing otherwise close models.

## 局限性
- 仅在英文短篇故事上训练，跨语言/跨体裁泛化性待验证
- 依赖前沿 LLM judge，成本较高
- HRI 需要人工写作参考，对规模化构成瓶颈

## 相关标签
#LLM #fine-tuning #GRPO #creative-writing #length-generalization #RLHF #storytelling