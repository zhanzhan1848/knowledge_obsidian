# 🥬 CSRP: Chain-of-Thought Reasoning for Chinese Text Correction via RL

## 基本信息
- **标题:** CSRP: Chain-of-Thought Reasoning for Chinese Text Correction via Reinforcement Learning with Efficiency-Aware Rewards
- **作者:** Wei Tian, Yuhao Zhou, Man Lan
- **链接:** [arXiv:2606.00020](https://arxiv.org/abs/2606.00020)
- **arXiv:** arXiv:2606.00020
- **分类:** cs.CL, cs.AI
- **发表:** **ACL 2026 Main Conference**

## 核心创新点

CSRP 是一个三阶段框架，通过 RL 逐步构建中文语法错误纠正能力：

1. **Continual Pre-training (CPT)** — 59M 平衡样本，内化领域知识
2. **Chain-of-Thought SFT** — 显式错误推理，诊断透明度
3. **Group Relative Policy Optimization (GRPO)** — 新型 Efficiency-Aware Reward，显式惩罚不必要编辑

## 问题背景

- 通用模型缺乏细微语法区分的专业语言先验
- SFT + MLE 优化 precision-focused metrics 失败，导致系统性过度纠正

## 实验结果

**NACGEC benchmark:**
- **F₀.₅: 50.99** (SOTA)
- **Precision: 57.17** (显著超越之前最佳)
- 有效缓解 MLE 模型的过度纠正偏差

**CSCD 拼写纠正:**
- **F1: 59.61** (超越 GPT-4 5.20 points)

## 消融分析

- **RL 对齐阶段**: 相对 SFT baseline 提升 8%
- **Efficiency-Aware Reward**: 对过度纠正的惩罚有效
- RL 增益与大规模 CPT 正交

## 代码

https://github.com/TW-NLP/ChineseErrorCorrector

## 建议
- **推荐程度:** ⭐⭐⭐⭐⭐
- **适用场景:** 中文 NLP、语法纠错、RL for NLG
- **已发表顶会:** ACL 2026

---
*2026-06-02 收录自 arXiv cs.CL，ACL 2026 录用*