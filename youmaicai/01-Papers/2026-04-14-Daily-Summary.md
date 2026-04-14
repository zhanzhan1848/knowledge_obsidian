# 📅 2026-04-14 每日论文总结

**🥬 油麦菜 | LLM/NLP 论文日搜**

## 📋 今日摘要

今日在 arXiv (cs.AI, cs.CL, cs.LG, cs.NE) 上共发现 **4 篇** 高度相关新论文：

---

### 1. SECL: Self-Calibrating Language Models via Test-Time Discriminative Distillation
📄 **arXiv:2604.09624** | cs.CL, cs.LG

**核心创新**：首个将 Test-Time Training (TTT) 应用于 LLM 置信度校准，利用生成-判别差距作为无标签自监督信号。

**关键结果**：ECE 降低 56-78%，仅需训练 6-26% 问题流，成本低于基准。

🔗 [笔记](./2026-04-14-SECL-Self-Calibrating-Language-Models.md)

---

### 2. HumorGen: Cognitive Synergy for Humor Generation in LLMs via Persona-Based Distillation
📄 **arXiv:2604.09629** | cs.CL

**核心创新**：提出 Cognitive Synergy Framework，通过6种认知人格的混合思维（MoT）架构生成多样化幽默数据。

**关键发现**：认知驱动数据策管 > 对齐算法 + 模型规模。7B 模型达到 SOTA，可比肩专有模型。

🔗 [笔记](./2026-04-14-HumorGen-Cognitive-Synergy-Humor-Generation.md)

---

### 3. Deliberative Alignment is Deep, but Uncertainty Remains
📄 **arXiv:2604.09665** | cs.LG, cs.AI

**核心创新**：揭示 Deliberative Alignment 的对齐鸿沟，发现基础模型的不安全行为残留，并提出 BoN Sampling 方法归属不安全行为。

**关键结果**：ASR 降低 DAN 28.2%, WildJailbreak 31.3%, StrongREJECT 35.4%。

🔗 [笔记](./2026-04-14-Deliberative-Alignment-Safety-Uncertainty.md)

---

### 4. Cross-Lingual Hateful Language Detection with Web-Scale Data + LLM Ensemble
📄 **arXiv:2604.09625** | cs.CL

**核心创新**：结合大规模无标注文本（OWS）和 LLM 集成合成标注提升多语言仇恨言论检测。

**关键结果**：BERT 继续预训练平均 +3% F1；Llama3.2-1B 从合成标注获 +11% F1。

🔗 [笔记](./2026-04-14-Cross-Lingual-Hateful-Language-Detection.md)

---

## 🔍 今日洞察

1. **校准研究方向**：生成-判别差距是无标签校准的天然信号源，TTT 范式在此场景潜力巨大
2. **创意生成新思路**：认知人格引导的 MoT 架构为创意任务（幽默、故事）提供了除对齐优化外的新路径
3. **安全对齐深水区**：即使深层对齐方法（Deliberative），基础模型的不安全行为仍可残留，需要后处理归属
4. **小模型利用**：Web-scale 无标注文本 + LLM 合成标注对小模型和低资源语言的价值远大于大模型

---

*自动生成于 2026-04-14 14:17 UTC | youmaicai-daily-paper-search*
