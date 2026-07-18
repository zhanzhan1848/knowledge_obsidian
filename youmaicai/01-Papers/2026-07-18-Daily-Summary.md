# 🥬 每日论文摘要 - 2026-07-18

**搜索范围**: arXiv cs.CL, cs.AI (2026-07-17 新提交)
**关键词**: LLM, transformer, attention, GPT, BERT, NLP, fine-tuning, RLHF, instruction tuning, multimodal, reasoning

---

## 📄 收录论文 (5 篇)

### 1. Partition, Prompt, Aggregate: Statistical Self-Consistency in Language Models
- **arXiv**: 2607.15277 | cs.CL
- **关键词**: LLM 评估, 推理自洽性, 概率一致性
- **亮点**: 提出统计自一致性作为无参考的 LLM 评估维度；发现"宏 fallacy"——细粒度聚合估计优于直接群体估计
- **文件**: `2026-07-18-Statistical-Self-Consistency-Language-Models.md`

### 2. Mask-Aware Policy Gradients for Diffusion Language Models
- **arXiv**: 2607.15200 | cs.CL | ⭐ COLM 2026 接收
- **关键词**: RL for LLM, Diffusion LM, Masked Diffusion, Policy Gradient
- **亮点**: 将 MDLM 生成建模为两阶段 MDP，策略梯度分解为 token 项 + unmasking 项；在 GSM8K/MATH500/HumanEval/MBPP 达到 SOTA
- **文件**: `2026-07-18-Mask-Aware-Policy-Gradients-Diffusion-Language-Models.md`

### 3. T2MLR: Transformer with Temporal Middle-Layer Recurrence
- **arXiv**: 2607.15178 | cs.CL/cs.AI
- **关键词**: Transformer 架构, Latent Reasoning, 中间层循环, 数学推理
- **亮点**: 在中间层建立 temporal recurrence pathway；20% 中间层循环超越全层循环；retrofitting 1.7B 模型即可提升 MATH500 从 12.8 到 18.0
- **文件**: `2026-07-18-T2MLR-Temporal-Middle-Layer-Recurrence.md`

### 4. In-Place Tokenizer Expansion for Pre-trained LLMs
- **arXiv**: 2607.15232 | cs.CL/cs.LG
- **关键词**: Tokenizer, 多语言 LLM, 端侧模型, BPE 扩展
- **亮点**: 原地升级预训练模型 tokenizer；印度/越南/泰语编码效率提升 2.4-4.0×；per-character 解码加速 2.2-3.7×
- **文件**: `2026-07-18-In-Place-Tokenizer-Expansion-LLMs.md`

### 5. SEED: Self-Evolving On-Policy Distillation for Agentic RL
- **arXiv**: 2607.14777 | cs.CL
- **关键词**: LLM Agent, Agentic RL, Hindsight Skills, On-Policy Distillation
- **亮点**: 将轨迹级结果转化为密集的 token 级监督信号；策略同时进化决策和技能分析；泛化到 unseen 场景
- **文件**: `2026-07-18-SEED-Self-Evolving-On-Policy-Distillation-Agentic-RL.md`

---

## 🔬 技术主题分布

| 主题 | 论文数 |
|------|--------|
| LLM 推理/评估 | 1, 2, 3 |
| Transformer 架构 | 3 |
| RL / Alignment | 2, 5 |
| 多语言/Tokenizer | 4 |
| Agentic AI | 5 |

---

## 📝 今日洞察

1. **LLM 推理评估新维度**：统计自一致性揭示了当前 LLM 在知识聚合上的系统性缺陷——模型"知道"但不会"传播"
2. **Diffusion LM + RL**：Mask-Aware PG 将 RL 成功扩展到 Diffusion LM，unmasking 顺序本身包含优化信号
3. **Transformer 架构演进**：T2MLR 在中间层而非 embedding 层建立 recurrence，以更低开销实现更好的 latent reasoning
4. **端侧多语言 LLM**：Tokenizer expansion 提供了一条无需重新预训练的实用路径

---
*🤖 自动化录入 | OpenClaw youmaicai agent*
