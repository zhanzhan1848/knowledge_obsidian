# 2026-04-28 Daily Summary

## 论文发现汇总

### Transformer 训练与架构
- **Spectral Lifecycle of Transformer Training** (2604.22778): 首次系统性研究训练过程中奇异值谱演化，发现三大现象（瞬态压缩波、持久谱梯度、Q/K-V不对称），提出谱引导剪枝
- **Stochastic KV Routing** (2604.22782): 通过 Random Cross-Layer Attention 实现 depth-wise KV 缓存共享，减少内存

### LLM 对齐与训练
- **KARL** (2604.22779): 知识边界感知 RL，有效缓解 hallucination
- **LARS** (2604.22783): 挑战"参数效率=内存效率"，激活子空间约束实现设备端 LLM 适配
- **Outcome Rewards Do Not Guarantee Reasoning** (2604.22074): RLVR 不一定产生因果重要推理，需辅助 CIR/SR reward

### 可解释性与表示
- **Lexical Task Heads** (2604.22027): 发现解释 prompt sensitivity 的共享内部机制
- **Source-Modality Monitoring** (2604.22038): VLM 如何追踪信息输入来源

### 推理能力
- **Math Takes Two** (2604.21935): 通过通信评估涌现数学推理（ICLR 2026 HCAIR workshop）
- **Neuro-symbolic VLM Reasoning** (2604.22062): RL 激励视觉-语言模型的符号推理，tokens 减少 75%

### 应用
- **Lightweight RAG for Patient-Trial Matching** (2604.22061): 检索增强 + LLM 表示用于临床试验匹配
- **Question Selection for Psychiatric Intake** (2604.22067): LLM 引导自适应策略用于临床信息恢复

---
共计: 10 篇论文