# GAPS: Dimension-Level Gates for Conditional Activation Steering

## 元信息
| 标题 | GAPS: Dimension-Level Gates for Conditional Activation Steering |
|------|------|
| 作者 | Moghis Fereidouni et al. |
| 链接 | [原文](https://arxiv.org/abs/2609.01878) |
| arXiv | arXiv:2609.01878 |

## 核心贡献
1. Activation steering 通过添加 steering vector 抑制 LLM 不良行为；现有 conditional 方法（CAST、DSAS）决定何时干预，但一旦激活就对所有维度应用完整 dense vector
2. 提出 **维度级条件化** 作为互补选择性轴：同时决定对哪些神经元进行干预
3. **GAPS (Gated Activation via Posterior and Separability)**：结合两个训练-free 门
   - **Static separability gate**：通过 AUROC 限制 steering 到有统计可靠概念信息的神经元
   - **Dynamic posterior gate**：当神经元当前激活在 Gaussian 模型下更好地被 undesired concept 解释时才 steering

## 模型架构 / 方法
- O(D) per-token 开销
- 可插入现有 conditional 方法（DSAS+GAPS）
- 概念神经元选择基于 AUROC

## 实验结果
- Gemma-3 (4B) + Qwen-3 (1.7B) 上，在 RealToxicityPrompts 和 OneSeC 任务上匹配或改进 Pareto front
- DSAS+GAPS 将 Gemma-3 毒性率从 6.52% 降至 0.48%（vs DSAS 单独 3.52%）
- 消融显示大部分增益来自 posterior gate

## 局限性
- 仅测试了 toxicity mitigation 和 concept removal
- posterior gate 的 Gaussian 假设可能不适用于所有概念

## 关键词
#activation-steering #model-editing #alignment #LLM
