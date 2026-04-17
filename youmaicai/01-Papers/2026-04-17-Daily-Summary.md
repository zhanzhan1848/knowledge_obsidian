# 📋 每日论文摘要 - 2026-04-17

**搜索范围**: arXiv (cs.AI, cs.CL, cs.NE, cs.LG)  
**关键词**: large language model, LLM, transformer, attention, GPT, BERT, NLP, fine-tuning, RLHF, instruction tuning, multimodal, reasoning

---

## 🥬 今日新增论文笔记 (6篇)

### ⭐ 重点推荐（高优先级）

| 论文 | arXiv | 类别 | 关键词 |
|------|-------|------|--------|
| **Reward Hacking in the Era of Large Models** | 2604.13602 | 综述/对齐 | RLHF, alignment, PCH |
| **TESSY: Fine-Tune Reasoning Model** | 2604.14164 | 微调 | reasoning model, SFT, data synthesis |
| **GFT: Group Fine-Tuning** | 2604.14258 | 微调 | post-training, SFT, RLHF pipeline |
| **MixAtlas: Multimodal Data Mixture** | 2604.14198 | 多模态 | multimodal training, data optimization |

### 🔎 其他相关（中等优先级）

| 论文 | arXiv | 类别 | 关键词 |
|------|-------|------|--------|
| Compressed-Sensing-Guided LLM Reduction | 2604.14156 | 推理优化 | sparsity, dynamic inference, compression |
| MemGround: Long-Term Memory Evaluation | 2604.14158 | 评估 | memory, benchmark, LLM evaluation |
| HUOZIIME: On-Device LLM IME | 2604.14159 | 应用 | on-device, personalization, mobile |

---

## 💡 今日关键洞察

### 1. Alignment 与 Reward Hacking
Reward Hacking 综述（PCH 框架）揭示了 RLHF/RLAIF 的系统性漏洞，提醒我们在追求模型对齐时必须关注 proxy objectives 与真实意图之间的压缩鸿沟。

### 2. Reasoning Model 微调新范式
TESSY 发现风格差异（stylistic divergence）是 reasoning model SFT 失败的主因，Teacher-Student 交替生成是有效解决方案。

### 3. Post-training 统一框架
GFT 将 SFT 解释为 policy gradient 特例，为 SFT → RL 的无缝衔接提供了理论基础。

### 4. Multimodal 训练数据工程
MixAtlas 表明 multimodal midtraining 的数据配比优化是一个被低估的问题，小模型搜索 → 大模型迁移的范式值得借鉴。

---

## 📊 统计
- 搜索关键词命中论文数：~15 篇
- 创建笔记数：6 篇
- 高优先级：4 篇
- 分类覆盖：alignment, fine-tuning, multimodal, inference, evaluation, application

---

*🥬 油麦菜 · 2026-04-17*
