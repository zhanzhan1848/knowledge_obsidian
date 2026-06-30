# Daily Summary — 2026-06-30

## 搜索概况
- **日期**: 2026-06-30
- **搜索范围**: arXiv cs.AI, cs.CL, cs.LG, cs.NE (最近24小时)
- **关键词**: large language model, LLM, transformer, attention, GPT, BERT, NLP, fine-tuning, RLHF, instruction tuning, prompt engineering, multimodal, reasoning
- **发现论文**: 8 篇高质量相关论文

## 论文清单

| # | arXiv ID | 标题 | 类别 | 推荐度 |
|---|----------|------|------|--------|
| 1 | 2606.30616 | Scaling the Horizon, Not the Parameters: 35B Agent | LLM Agent, SFT | ⭐⭐⭐⭐⭐ |
| 2 | 2606.30639 | Self-Evolving World Models for LLM Agent Planning | LLM Agent, World Models | ⭐⭐⭐⭐⭐ |
| 3 | 2606.30627 | Conservative Offline Training Amplifies Reward Hacking | DPO, RLHF | ⭐⭐⭐⭐⭐ |
| 4 | 2606.30578 | Uncertainty-Aware Generation and Decision-Making | LLM Decision-Making | ⭐⭐⭐⭐ |
| 5 | 2606.30518 | RAPS-DA: Regime-Aware Peer Specialization for RAG | RAG, Fine-tuning | ⭐⭐⭐⭐ |
| 6 | 2606.30562 | FlashMorph: Hybrid Attention Models | Attention Efficiency | ⭐⭐⭐⭐ |
| 7 | 2606.30609 | C²R: Cross-Sample Consistency for SAEs | LLM Interpretability | ⭐⭐⭐⭐ |
| 8 | 2606.30571 | Attractor States in Multi-Turn LLM Conversations | LLM Interaction | ⭐⭐⭐ |

## 亮点发现

### 1. Agent 训练新范式
**Agents-A1 (2606.30616)** 通过三阶段训练（Full-domain SFT → Domain Teachers → OPD）证明：35B MoE 模型通过扩展 horizon 可达到 1T 参数模型的性能，为资源受限场景提供了新路径。

### 2. DPO 保守性悖论
**2606.30627** 揭示：高β DPO → 低熵策略 → 高 ensemble disagreement → 更快被 reward model exploit。实践启示：**calibrated conservatism** 而非 maximal conservatism。

### 3. RAG 知识冲突解决
**RAPS-DA (2606.30518)** 首次提出 regime-aware 训练，通过 Grounding/Arbitration/Resistance 三类 peer specialists 解决异构知识冲突问题。

### 4. 世界模型自进化
**WorldEvolver (2606.30639)** 通过 Episodic + Semantic Memory 实现无需梯度更新的世界模型自适应，对长 horizon agent 部署意义重大。

## 工具/代码资源
- `https://github.com/UKPLab/arXiv2026-uncertainty-aware` — 不确定性感知决策
- `https://github.com/SubramanyamSahoo/Conservative-Offline-Training-...` — DPO 保守性研究
- `https://github.com/hr-jin/Cross-sample-Consistency-Regularization` — SAE 正则化
- `https://github.com/uw-syfi/TraceLab` — Coding Agent traces

## 下一步
- 关注 Agents-A1 的知识-动作基础设施 (KAG) 设计
- 追踪 WorldEvolver 在更多 benchmark 上的表现
- 评估 RAPS-DA 在实际 RAG 场景的适用性
