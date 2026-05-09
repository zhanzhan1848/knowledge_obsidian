# Daily Summary — 2026-05-09

🥬 LLM/NLP 领域每日论文搜索

## 搜索范围
- 时间范围：最近 24 小时（2026-05-07 ~ 2026-05-09）
- 来源：arXiv (cs.AI, cs.CL, cs.NE, cs.LG)
- 关键词：large language model, LLM, transformer, attention, GPT, BERT, NLP, fine-tuning, RLHF, instruction tuning, multimodal, reasoning

## 今日发现论文（7篇）

| # | 论文 | 标签 | 亮点 |
|---|------|------|------|
| 1 | **VLMs Get Lost in Attention** (arXiv:2605.05668) | 可解释性, 多模态 | Attention vs FFN 功能解耦；视觉 attention 严重冗余；ICML 2026 |
| 2 | **Federation of Experts (FoE)** (arXiv:2605.06206) | MoE, 分布式推理 | 分布式 MoE 通信优化；单节点完全消除 all-to-all；延迟降低 5.2× |
| 3 | **Cubit** (arXiv:2605.06501) | 架构创新, Token Mixer | Attention = Nadaraya-Watson 回归；提出 KRR 替代方案；长序列优势明显 |
| 4 | **NeWTral** (arXiv:2605.04992) | 安全对齐, LoRA | 非线性权重翻译恢复安全对齐；ASR 从 70% 降至 13%；72B 参数验证 |
| 5 | **Transformers ICRL** (arXiv:2605.05755) | 强化学习, 理论 | 证明 Transformer 实现 in-context RL；首个 ICRL 收敛保证 |
| 6 | **Emotion Consistency in LLMs** (arXiv:2605.06476) | 情感理解, 安全 | LLMs 在情感对话中表现低于平均；易受错误信念影响 |
| 7 | **LAMP** (arXiv:2601.21623) | 量化推理, 精度优化 | 混合精度推理优化；精度提升两个数量级 |

## 主题趋势观察
- **架构创新**: Cubit 重新审视 attention 理论基础（回归视角）
- **MoE 优化**: FoE 从结构上解决分布式 MoE 通信瓶颈
- **安全对齐**: NeWTral 在零资源场景下恢复 LoRA adapter 安全对齐
- **可解释性**: VLMs Get Lost in Attention 提供信息论+几何框架

## 知识库同步
- 新增笔记：7 篇
- 路径：`~/knowledge-vault/youmaicai/01-Papers/`
- Git 同步：✓ 已提交