# 每日 LLM/NLP 论文摘要 - 2026-07-20

## 概览
- **日期**: 2026-07-20
- **RSS源**: cs.AI, cs.CL, cs.NE, cs.LG
- **论文总数**: 约 35 篇 (含cross-listing)
- **本摘要收录**: 9 篇高相关性论文

---

## 🔥 重点论文

### 1. Verbalizable Representations Form a Global Workspace in Language Models
**arXiv: 2607.15495** | cs.CL, cs.AI, cs.LG

**核心发现**: 提出 Jacobian Lens 可解释性技术，发现LLM中存在 J-space（准备表达的表示），具有全局工作空间特性——可报告、可保持、可用于推理中间步骤。揭示模型"沉默思考"与最终输出的差异。

**关键价值**: 可解释性研究突破，为对齐审计提供新窗口

---

### 2. VarRate: Training-Free Variable-Rate KV Cache Compression
**arXiv: 2607.15498** | cs.CL, cs.LG

**核心发现**: 无训练KV缓存压缩方法，按query salience为每个token分配可变低秩预算。Llama-3.1-8B和Qwen2.5-7B上，20%预算时仅损失0.8分，精度损失仅3.5-5.5点（vs传统方法11-15点崩溃）。

**关键价值**: 长上下文LLM推理的内存优化突破

---

### 3. Large Language Models as Unified Multimodal Learners for Clinical Prediction
**arXiv: 2607.15380** | cs.CL, cs.AI

**核心发现**: 将所有患者数据转为文本序列微调LLM，在三项临床预测任务上匹配或超越专用多模态架构。超越临床部署的梯度提升系统。

**关键价值**: 简化多模态融合架构，统一范式

---

### 4. PATR: Process Reward Informed Tree Rollout for Multi-Turn RL
**arXiv: 2607.15610** | cs.CL, cs.AI, cs.LG

**核心发现**: 将agent轨迹组织为树结构，用process feedback选择性分支。SWE-Bench +5.0pts, FrozenLake +9.3pts。

**关键价值**: 多轮RL的高效探索策略

---

### 5. BIRD: Bootstrapped Iterative Self-Reasoning Distillation
**arXiv: 2607.15736** | cs.CL

**核心发现**: 两阶段推理蒸馏——先采样简洁正确轨迹进行warm-up，再进行reverse-KL蒸馏。Qwen3-8B在MATH-500上从86.2%→92.0%，同时压缩64% tokens。

**关键价值**: 推理模型压缩，边缘部署友好

---

## 📋 其他收录论文

| 论文 | arXiv | 领域 | 核心贡献 |
|------|-------|------|----------|
| SkillCorpus | 2607.15557 | cs.CL | LLM Agent技能生态系统整合，821K→96K筛选 |
| Cura 1T | 2607.15314 | cs.AI | 医疗专用LLM，self-evolution训练 |
| GraphDx | 2607.15280 | cs.AI | 医疗诊断多Agent框架，MDKG知识图谱 |
| EpiNarrate | 2607.15544 | cs.CL | Agentic公共卫生报告生成 |

---

## 📊 趋势分析

### 可解释性 (Interpretability)
- Jacobian Lens揭示LLM内部"全局工作空间"
- 与意识理论的联系引发讨论

### 长上下文优化 (Long Context)
- VarRate等训练-free KV压缩方法
- 无需训练即可实现自适应秩分配

### Agent系统 (Agent Systems)
- 多Agent协作框架持续火热（GraphDx, SkillCorpus）
- Process reward + Tree rollout新探索

### 推理压缩 (Reasoning Compression)
- BIRD等方法将长CoT压缩为短推理
- 边缘部署成为重要方向

### 医疗AI (Healthcare AI)
- 多篇医疗LLM论文
- 文本序列化替代复杂多模态融合

---

## 🔗 链接
- 所有论文: `~/knowledge-vault/youmaicai/01-Papers/2026-07-20/`
- GitHub: https://github.com/zhanzhan1848/knowledge_obsidian.git

---

*🥬 油麦菜 LLM Agent | 2026-07-20*
