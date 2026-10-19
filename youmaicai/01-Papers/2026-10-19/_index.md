---
title: "Daily Papers Index - 2026-10-19"
date: 2026-10-19
type: index
tags: [daily-index, LLM, NLP, arxiv]
status: complete
---

# 🥬 每日论文索引 - 2026-10-19

## 概览

- **抓取时间**: 2026-10-19 14:17 UTC
- **抓取来源**: arXiv RSS (cs.CL, cs.AI, cs.LG, cs.NE)
- **论文数量**: 23 篇
- **搜索范围**: 最近 24 小时内发表/收录

## 主题分布

### 🧠 LLM 架构与效率
1. [[frozen-vocab]] - **Embeddings Are Overpriced?** 冻结 16MB 词表的 Ternary LM（46MB 全文件）
2. [[moe-prefill]] - **MoE Prefill Expert Reduction** 推理优化
3. [[hydrallm]] - **HydraLLM** 自适应宽度切片的弹性 VLM
4. [[led-diffusion-lm]] - **LED** 改进 Masked Diffusion LM 的 Lookahead Editing

### 🎯 训练与对齐
5. [[optimizer-switching]] - **跨训练阶段切换 Optimizer 的暂时性成本**
6. [[rank-ft-noise]] - **微调更新的秩度量需要噪声基线**
7. [[misalignment-self-distill]] - **递归自蒸馏可导致渐进性 misalignment**
8. [[merge-alignment]] - **对齐前后合并控制 diversity-quality 权衡**
9. [[cf-invariance]] - **向反事实不变性对齐 LMs**

### 🤔 推理与 CoT
11. [[reasoning-control]] - **推理模型控制自己的 Chain-of-Thought**
12. [[reasoning-vs-reading]] - **多思考还是多阅读？推理的 Token 预算理论**
13. [[explain-chess-go]] - **用自然语言解释国际象棋与围棋**
14. [[trace-distill]] - **学生条件化的 Trace 构造用于推理蒸馏**
15. [[gen-value-classifier]] - **Generative Value Classifier**

### 🌐 多模态
16. [[multimodal-hallucination]] - **ImageEval 2026 多模态幻觉检测**
17. [[federated-bytes]] - **FederatedBytes** Tokenizer-free 多模态联邦学习

### 📚 低资源语言与基准
18. [[pearl-chat]] - **Pearl-Chat** 从零构建卢干达语 LM
19. [[hebrew-re]] - **HeRE** 希伯来语关系抽取基准

### 🧬 跨学科
20. [[brain-alignment]] - **对话中 LLM 的脑对齐**
21. [[llm-eeg-context]] - **LLM 深层暴露 EEG 中的篇章级语境**

### 🎭 行为与涌现
22. [[behavioral-couplings]] - **语言模型中的行为耦合**
23. [[in-context-unsupported]] - **越界指令的 In-Context Learning**

### 📰 应用
10. [[alpha-bet]] - **AlphaBet** 强化学习 LLM 事件预测代理

## 关键词命中统计

- **LLM / Language Model**: 18 篇
- **Transformer / Attention**: 6 篇
- **Multimodal**: 3 篇
- **Reasoning**: 5 篇
- **Fine-tuning / RLHF / Alignment**: 5 篇
- **Low-resource / Multilingual**: 3 篇
- **Inference / Efficiency**: 5 篇

## 抓取统计

| RSS 源 | 论文总数 | 筛选后 |
|--------|---------|--------|
| cs.CL | ~70 | 12 |
| cs.LG | ~391 | 9 |
| cs.NE | ~9 | 0（今天无 NLP 相关）|
| cs.AI | 0 | 0（周末未发布）|

## 下一步

- [ ] 对最相关的 5 篇进行深度分析
- [ ] 实验结果验证与对比
- [ ] 与已有知识库笔记建立 [[wikilink]]
- [ ] 输出技术调研报告（如需）

---

**抓取**: 油麦菜 (Youmaicai) 🥬 | 2026-10-19
**Git 同步**: 待执行 ~/knowledge-vault/.scripts/git-sync.sh