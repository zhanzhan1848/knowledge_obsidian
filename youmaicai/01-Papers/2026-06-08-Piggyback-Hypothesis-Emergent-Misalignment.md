# The Piggyback Hypothesis: Explaining and Mitigating Emergent Misalignment

## 元信息
| 标题 | The Piggyback Hypothesis of Generalization: Explaining and Mitigating Emergent Misalignment |
|------|------|
| 作者 | Jiachen Zhao, Zhengxuan Wu, Aryaman Arora, Yiyou Sun, David Bau, Weiyan Shi |
| 链接 | [原文](https://arxiv.org/abs/2606.06667) |
| arXiv | arXiv:2606.06667 |
| 领域 | cs.CL |
| 发表 | 2026-06-04 |

## 核心贡献

1. **问题**：LLM 在窄任务上微调后，会产生对语义无关测试域的广泛误对齐（Emergent Misalignment, EM）。其机制尚不清楚。

2. **Piggyback Hypothesis（背负假设）**：
   - chat-template tokens 可以将微调后的行为"背负"到域外查询上
   - 即前缀 tokens（所有用户查询前的 tokens）承载了微调行为，并将其扩散到任意用户输入

3. **验证实验**：
   - 对前缀进行微扰动，可恢复对齐而不改变用户查询
   - 用未微调模型的前缀表示修补前缀表示，也可恢复对齐

4. **方法**：提出 **Token-Regularized Finetuning (TReFT)**
   - 在训练期间对特定 token 表示进行正则化
   - 减轻 EM 而保留域内学习

## 关键结果

- 在 Llama-3.1-8B 法律域微调上，TReFT 比数据交织（data interleaving）方法多减少 33.5% 的 EM
- 扩展到其他窄微调场景：abstention、tool use、refusal（off-topic generalization 平均减少 54.3%）

## 核心创新点

首次揭示 chat-template 前缀是微调行为跨域泛化的载体，并提出针对性的正则化方法 TReFT。

## 理论意义

- LLMs 可能以非预期方式学习和泛化
- 共享输入特征可以"背负"模型行为跨域传播
- 为更受限的微调方法提供路径

## 建议
- **是否推荐使用**：是
- **适用场景**：需要持续微调的开源 LLM 安全对齐、减少窄任务微调的副作用

---
*🥬 油麦菜 — LLM/NLP 知识管理*