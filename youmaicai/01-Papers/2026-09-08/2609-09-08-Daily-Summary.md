# 2026-09-08 LLM/NLP 论文日报

## 概览
日期：2026-09-08
搜索范围：arXiv cs.AI, cs.CL, cs.LG, cs.NE（最近 24 小时）
关键词：LLM, transformer, attention, GPT, BERT, NLP, fine-tuning, RLHF, instruction tuning, multimodal, reasoning

## 收录论文 (10 篇)

### 1. WearableQA (arXiv:2609.05405)
**A Benchmark for Health Reasoning over Real-World Wearable Data**
- 可穿戴设备健康推理基准，4,084 题，200 用户，500 天数据
- 双轴问题分类：数据推理 vs 健康推理，单信号 vs 跨信号推理
- 评估 14 个 LLM，性能 19.6%-72.9%

### 2. KOPA-Bench (arXiv:2609.05395) ⭐ EMNLP 2026
**Multi-Step Tool-Calling over Korean Open Public APIs**
- 韩国公共 API 多步工具调用基准（145 任务）
- EDGE 方法：基于实时执行的动态图数据合成
- 9B GRPO 微调模型匹配未微调 27B 模型

### 3. RegionFed (arXiv:2609.05403)
**Federated Learning for Personalized Query Understanding**
- 梯度级个性化联邦学习，解决 Transformer 参数级方法崩溃问题
- T5/RoBERTa/CNN 零代码改动部署，92.27% 准确率

### 4. Trade-Up Recommendation (arXiv:2609.05363)
**Reasoning Distillation + Product-Type Test-Time Training**
- 两级框架：LLM 推理蒸馏到 15.5M 学生模型 + PT-TTT 领域适配
- AUC 0.924→0.941，推理速度快 5,000 倍

### 5. LLM Explanations (arXiv:2609.05385)
**Necessary or Sufficient? Evaluating LLM Explanations**
- 测试 LLM 解释的必要性和充分性
- 引用前三不总是最强影响因素（57.6% 未引用因素得分更高）

### 6. Memory Portability (arXiv:2609.05339)
**Does Your Agent's Memory Survive a Model Upgrade?**
- 模型升级后记忆可移植性研究
- KG-fixed 最可靠（准确率变化仅 +0.0004），NOTES 最脆弱（-13.28% 或 +9.91%）

### 7. CUA-Universe (arXiv:2609.05374)
**Scalable Hybrid GUI+CLI Agent Environment**
- 混合 GUI+CLI 代理环境，16 个应用
- 9B 模型：Score +39.3 pts，步骤 -37%，token -60%

### 8. Verbatim Retrieval (arXiv:2609.05381)
**Digit-Level Retrieval in Frontier LLM Molecular Benchmarks**
- 发现前沿模型在分子基准上广泛存在逐字检索
- 推理级别影响检索行为（高推理级别多触发 89%）

### 9. Verifier-Guided Reasoning (arXiv:2609.05221)
**Gold-Anchored QLoRA + Symbolic Routing + Group-Relative RLVR**
- 可解释推理框架：QLoRA 微调 + 符号验证器 + RLVR
- P3 推理深度从 50.68% 提升到 72.20%

### 10. LexFlip (arXiv:2609.05296)
**Dissociation Diagnostic for Legal Meaning Preservation**
- 373 个最小扰动测试法律语义保留指标
- 发现现有指标对语义变化不敏感，BERTScore 仅 0.022-0.039

## 趋势观察
- **Agent Memory**: 模型升级后记忆可移植性成为新关注点
- **Tool Calling**: 多步工具调用和混合 GUI+CLI 协调是 Agent 能力前沿
- **Reasoning**: 符号验证器 + RLVR 组合成为可解释推理新范式
- **Federated Learning**: 梯度级个性化解决 Transformer 崩溃问题

## 同步信息
- 笔记目录：~/knowledge-vault/youmaicai/01-Papers/2026-09-08/
- Git 同步：2026-09-08 14:07 UTC
