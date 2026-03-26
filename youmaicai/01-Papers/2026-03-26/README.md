# 2026-03-26 LLM/NLP 论文摘要

## 概览
- **日期**: 2026-03-26
- **来源**: arXiv (cs.CL, cs.AI, cs.LG, cs.NE)
- **论文数量**: 7 篇精选
- **主题**: 扩散语言模型、LLM 安全、长上下文、RAG、评估、多模态、医疗 AI

## 精选论文

### 1. 扩散语言模型
- [[2603.23507-Beyond-Masks-DID|Beyond Masks: Efficient, Flexible Diffusion Language Models via Deletion-Insertion Processes]]
  - **创新**: Deletion-Insertion Diffusion (DID) 替代 mask/unmask 范式
  - **亮点**: 原生支持变长序列，消除无效 token 计算开销
  - **标签**: #diffusion-model #language-model

### 2. LLM 安全
- [[2603.23509-Internal-Safety-Collapse|Internal Safety Collapse in Frontier Large Language Models]]
  - **创新**: 识别 Internal Safety Collapse (ISC) 失效模式
  - **亮点**: 前沿 LLM 在 ISC-Bench 上失败率 95%+
  - **标签**: #llm-safety #alignment #jailbreak

### 3. 长上下文
- [[2603.23516-MSA-Memory-Sparse-Attention|MSA: Memory Sparse Attention for Efficient End-to-End Memory Model Scaling to 100M Tokens]]
  - **创新**: 100M token 长上下文，线性复杂度
  - **亮点**: 16K→100M tokens 性能下降 <9%
  - **标签**: #long-context #sparse-attention #100M-tokens

### 4. RAG 系统
- [[2603.23512-S-Path-RAG|S-Path-RAG: Semantic-Aware Shortest-Path Retrieval Augmented Generation]]
  - **创新**: 语义感知最短路径 RAG + Neural-Socratic Dialogue
  - **亮点**: WWW 2026，多跳 KGQA 提升
  - **标签**: #rag #knowledge-graph #multi-hop-qa

### 5. LLM 评估
- [[2603.23514-DepthCharge|DepthCharge: A Domain-Agnostic Framework for Measuring Depth-Dependent Knowledge in LLMs]]
  - **创新**: 自适应探测测量知识深度，引入 EVD 指标
  - **亮点**: 领域无关，EVD 3.45-7.55
  - **标签**: #llm-evaluation #knowledge-depth

### 6. 多模态 LLM
- [[2603.23510-Visuospatial-Perspective-Taking|Visuospatial Perspective Taking in Multimodal Language Models]]
  - **创新**: 首次系统评估 MLMs 的视觉空间视角采择能力
  - **亮点**: Level 2 VPT 缺陷发现
  - **标签**: #multimodal-llm #perspective-taking #social-ai

### 7. 医疗 AI
- [[2603.23515-Medical-Coding-LLM|Training a Large Language Model for Medical Coding Using Privacy-Preserving Synthetic Clinical Data]]
  - **创新**: 合成数据微调 Llama 3-70B，隐私保护
  - **亮点**: F1 从 0.18 提升到 >0.70
  - **标签**: #medical-coding #fine-tuning #synthetic-data

## 其他值得关注的论文

### RAG 与文档智能
- **arXiv:2603.23508** - Fast and Faithful: Real-Time Verification for Long-Document RAG Systems
- **arXiv:2603.23511** - DISCO: Document Intelligence Suite for Comparative Evaluation

### 医疗 AI
- **arXiv:2603.23506** - Leveraging Computerized Adaptive Testing for LLM Medical Benchmarking
- **arXiv:2603.23513** - Berta: Open-source AI-enabled Clinical Documentation
- **arXiv:2603.23519** - MedMT-Bench: Medical Multi-Turn Conversation Benchmark
- **arXiv:23520** - Med-Shicheng: Physicians' Medical Expertise Framework

### 推理与聚类
- **arXiv:2603.23518** - Cluster-R1: Large Reasoning Models as Clustering Agents

### 评估与基准
- **arXiv:2603.23522** - Qworld: Question-Specific Evaluation Criteria for LLMs
- **arXiv:2603.23523** - Real-3DQA: 3D Spatial Relationship Understanding Benchmark

### 提示工程
- **arXiv:2603.23525** - Prompt Compression in Production: Pre-Registered RCT
- **arXiv:2603.23527** - Compression Method Matters: Benchmark-Dependent Output Dynamics
- **arXiv:2603.23528** - The Compression Paradox: Provider-Dependent Energy Effects

### 低资源语言
- **arXiv:2603.23521** - Chitrakshara: Multilingual Multimodal Dataset for Indian Languages
- **arXiv:2603.23529** - Konkani LLM: Multi-Script Instruction Tuning

### 可解释性
- **arXiv:2603.23524** - Concept Explorer: Navigating the Concept Space of Language Models

### 记忆与认知
- **arXiv:2603.23530** - Prospective Memory Failures in Large Language Models

## 关键趋势

1. **扩散模型创新**: 从 mask/unmask 到 deletion/insertion 的范式转变
2. **安全挑战升级**: ISC 揭示前沿 LLM 的新型安全漏洞
3. **长上下文突破**: 100M token 级别的端到端记忆模型
4. **RAG 演进**: 语义感知 + 图对话的混合架构
5. **评估深化**: 知识深度、视角采择、3D 理解等新维度
6. **医疗 AI 成熟**: 合成数据 + 隐私保护的实用路径
7. **提示压缩复杂性**: 输出 token 和能源影响的重新审视

---

*Created: 2026-03-26 by youmaicai*
