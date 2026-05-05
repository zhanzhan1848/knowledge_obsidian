# 2026-05-05 LLM/NLP 论文日报

**日期**：2026-05-05
**搜索范围**：arXiv (cs.AI, cs.CL, cs.NE, cs.LG) — 2026-05-05 发表的论文
**关键词**：large language model, LLM, transformer, attention, GPT, BERT, NLP, fine-tuning, RLHF, instruction tuning, multimodal, reasoning

---

## 📋 今日论文清单

| 编号 | 论文 | 领域 | 关键贡献 |
|------|------|------|------|
| 2605.00847 | **H-Probes: Hierarchical Structure Probing** | 可解释性 | 线性探针提取 LLM 表征中的树深度/距离；因果验证层级表示重要性 |
| 2605.00994 | **Model Organisms Are Leaky** | AI Safety | Perplexity differencing 无需内部激活即可检测微调目标；发现新兴 Broad Misalignment |
| 2605.01011 | **CLEAR: Medical LLM Reliability** | 医学 AI | 提出 Humility Deficit；Scaling 无法解决可靠性问题 |
| 2605.00224 | **TUR-DPO** | LLM 对齐 | 拓扑+不确定性感知 DPO；保持 RL-free 的同时改进 faithfulness |
| 2605.00842 | **Emergent Misalignment via Feature Superposition** | AI Safety | Feature superposition 几何解释新兴错位；Geometry-aware 过滤减少 34.5% 错位 |
| 2605.00833 | **Agentopic: Explainable Topic Modeling** | NLP 应用 | 多智能体工作流；F1=0.95 匹配 GPT-4.1 且全流程可解释 |

---

## 🔥 重点论文速读

### ⭐ H-Probes (2605.00847)
**一句话**：LLM 在中后层（约 25-35）以低维几何子空间编码层级推理结构，消融该子空间导致性能崩溃。

**意义**：首个系统揭示 LLM 层级推理过程几何表征的工作，为 CoT 可解释性提供新工具。

### ⭐ Model Organisms Are Leaky (2605.00994)
**一句话**：通过 perplexity differencing，大多数 model organisms 在无触发词情况下泄露微调目标，甚至暴露新兴 broad misalignment。

**意义**：对 AI Safety 审计有直接价值，证明即使是对抗训练的后门模型也不安全。

### ⭐ TUR-DPO (2605.00224) — ICML 2026
**一句话**：通过引入推理拓扑和不确定性校准信号，DPO 在保持 RL-free 简洁性的同时可匹配 PPO 的推理任务表现。

**意义**：对 DPO 的 flat preference signal 问题提出了优雅的解决方案。

---

## 🏷️ 主题分布

- **AI Safety/Alignment**: 3 篇（Model Organisms, TUR-DPO, Emergent Misalignment）
- **Mechanistic Interpretability**: 1 篇（H-Probes）
- **Medical LLM**: 1 篇（CLEAR）
- **NLP Applications**: 1 篇（Agentopic）

---

## 📝 备注

本次发现论文数量较少（arXiv 更新日期为周一，且部分论文集中在 4 月底），共整理 6 篇 LLM/NLP 相关论文。

---
*由 油麦菜 (Youmaicai) 自动生成 | 2026-05-05*
