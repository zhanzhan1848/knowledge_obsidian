# 每日论文摘要 — 2026-04-21

## 📋 概览
- **日期**：2026-04-21
- **搜索范围**：arXiv (cs.AI, cs.CL, cs.NE, cs.LG)
- **论文数量**：9 篇
- **Agent**：油麦菜 🥬

---

## 📄 论文列表

### 1. MICE: Multimodal Claim Extraction for Fact-Checking
- **arXiv**: 2604.16311v1
- **作者**: Joycelyn Teo et al.
- **类别**: cs.CL, cs.AI
- **关键词**: multimodal, fact-checking, claim extraction, LLM, social media
- **摘要**: 提出首个社交媒体多模态 claim 提取基准 + MICE intent-aware 框架

### 2. BASIS: Balanced Activation Sketching with Invariant Scalars
- **arXiv**: 2604.16324v1
- **作者**: Vladimer Khasia
- **类别**: cs.LG
- **关键词**: backpropagation, activation memory, GPT training, gradient sketching
- **摘要**: 解耦激活内存与 batch/sequence 维度的反向传播算法，激活内存降至 O(L·RN)

### 3. Annotation Entropy Predicts LoRA Fine-Tuning Dynamics
- **arXiv**: 2604.16332v1
- **作者**: Brady Steele
- **类别**: cs.LG, cs.CL
- **关键词**: LoRA, fine-tuning, annotation entropy, learning dynamics, NLI
- **摘要**: 发现 LoRA 在 contested examples 上存在"反学习"现象，annotation entropy 可预测 AULC

### 4. Rubric-Based GRM for Reinforced Fine-Tuning SWE Agents
- **arXiv**: 2604.16335v1
- **作者**: Jiawei Huang et al.
- **类别**: cs.LG, cs.AI, cs.SE
- **关键词**: LLM Agent, SWE, reinforcement fine-tuning, reward model, RLHF, code generation
- **摘要**: Rubric-based GRM 提供比 binary reward 更丰富的学习信号用于 SWE agent RFT

### 5. SaFeR-Steer: Multi-Turn MLLM Safety Alignment
- **arXiv**: 2604.16358v1
- **作者**: Haolong Hu et al.
- **类别**: cs.LG, cs.CL
- **关键词**: multimodal LLM, safety alignment, multi-turn, RLHF, GRPO, Qwen2.5-VL
- **摘要**: 多轮 MLLM 安全对齐框架，数据集 STEER + TCSR 失败传播机制

### 6. RCT: Reciprocal Co-Training LLM + Random Forest via RL
- **arXiv**: 2604.16378v1
- **作者**: Yunshuo Tian et al.
- **类别**: cs.CL, cs.LG
- **关键词**: LLM, Random Forest, reinforcement learning, co-training, tabular data, medical
- **摘要**: LLM 与 RF 通过强化学习双向适配的框架

### 7. Data Mixing for LLM Pretraining: A Survey
- **arXiv**: 2604.16380v1
- **作者**: Zhuo Chen et al.
- **类别**: cs.CL, cs.LG
- **关键词**: data mixing, pretraining, LLM, training data, domain weighting, survey
- **摘要**: 首个 LLM 预训练数据混合系统综述，分类体系：static/dynamic × rule-based/learning-based

### 8. LiFT: Longitudinal Instruction Fine-Tuning
- **arXiv**: 2604.16382v1
- **作者**: Iqra Ali et al.
- **类别**: cs.CL
- **关键词**: instruction fine-tuning, longitudinal NLP, temporal reasoning, in-context learning, curriculum learning
- **摘要**: 时间线指令微调框架，融合 curriculum + few-shot + temporal conditioning

### 9. Brain-CLIPLM: EEG-to-Text via Semantic Compression
- **arXiv**: 2604.16370v1
- **作者**: Xiaoli Yang et al.
- **类别**: cs.CL, cs.AI, cs.CV
- **关键词**: EEG, brain-computer interface, semantic decoding, LLM, chain-of-thought, multimodal
- **摘要**: 语义压缩假说 + Brain-CLIPLM 两阶段 EEG-to-text 框架，Top-5 准确率 67.55%

---

## 🔍 主题分布

| 主题 | 论文数 | 论文 |
|------|--------|------|
| Fine-tuning / LoRA | 3 | Annotation Entropy, Rubric-Based GRM, LiFT |
| Multimodal | 3 | MICE, SaFeR-Steer, Brain-CLIPLM |
| RL / Alignment | 2 | SaFeR-Steer, Rubric-Based GRM |
| Training Efficiency | 1 | BASIS |
| Data/Pretraining | 1 | Data Mixing Survey |
| LLM + Classical ML | 1 | RCT |
| Survey/Review | 1 | Data Mixing Survey |

---

*🥬 油麦菜 — LLM/NLP 知识提炼 | 2026-04-21*