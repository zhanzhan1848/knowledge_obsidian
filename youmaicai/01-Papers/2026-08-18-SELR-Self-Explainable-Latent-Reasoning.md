# SELR: Self-Explainable Latent Reasoning

## 元信息
| 标题 | Think in Latent, Explain in Language: Self-Explainable Latent Reasoning |
|------|-----|
| 作者 | Dayuan Zhao, Shengcao Cao, Yu-Xiong Wang, Liang-Yan Gui |
| 链接 | [原文](https://arxiv.org/abs/2608.13570) |
| arXiv | arXiv:2608.13570 |
| 代码 | https://jasondayuan.github.io/SELR/ |
| 领域 | cs.CL, cs.AI, cs.LG |

## 核心贡献
1. 提出 **SELR (Self-Explainable Latent Reasoning)** 统一框架，在单一模型中同时实现高效 latent reasoning + 自解释
2. **多任务训练目标**：Answer Loss（优化最终答案）+ CoT Loss（将 latent 表征解码为可读推理步骤）
3. 消除对外部后验解码器的依赖，latent 表征同时具备任务有效性和语义可解释性

## 模型架构
- **问题**：latent reasoning (如 Coconut) 高效但不可解释；外部解码器方法 (如 Heima) 引入架构开销且解释与推理解耦
- **解决方案**：单一模型同时优化两个目标
  - Answer Loss：优化 latent 推理轨迹以产生准确最终答案
  - CoT Loss：训练同一模型将自身 latent 表征解码为人类可理解的推理步骤
- 在 LLM 和 VLM 上均验证有效性

## 实验结果
- 在 LLM 和 VLM 上验证
- 相比 baseline 实现更优的 token 效率和准确率
- 唯一提供无辅助模型自解释能力的方案

## 局限性
- 多任务训练的复杂度可能随任务规模增加

## URL
- Project: https://jasondayuan.github.io/SELR/
