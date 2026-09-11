# 📅 2026-09-11 LLM/NLP 论文日报

> 🥬 油麦菜每日论文搜索 | 覆盖 arXiv cs.AI, cs.CL, cs.LG, cs.NE

## 📊 今日概览

- **搜索时间**: 2026-09-11 14:02 UTC
- **论文总数**: 约 50 篇 (cs.AI: 20+, cs.CL: 20+, cs.LG: 20+, cs.NE: 8+)
- **重点关注**: 9 篇核心论文已详细记录

---

## 🏆 重点论文

### 1. Data-Efficient Language Modeling (BabyLM 2026)
- **arXiv**: [2609.10702](https://arxiv.org/abs/2609.10702) | cs.CL / cs.AI
- **核心**: Qiushi Engine 三阶段数据高效学习框架 (10M 词 corpus)
- **亮点**: Research RSI — 递归自我改进研究过程
- **SOTA**: BabyLM Strict-Small 公开榜单最高分 (2026-09-08 snapshot)
- **链接**: [[2026-09-11-Data-Efficient-Language-Modeling]]

### 2. NCP-ArchPreview: Latent Space LM via Next Concept Prediction
- **arXiv**: [2609.10715](https://arxiv.org/abs/2609.10715) | cs.CL
- **核心**: 8.9B 参数 latent-space LM，预测跨越多 token 的离散概念
- **亮点**: 仅用 51.3% 训练 tokens 达到 OLMo-3-7B 最终 loss；GSM8K +5.99 分
- **链接**: [[2026-09-11-NCP-ArchPreview-Latent-Space-LM]]

### 3. OpenDiscoveryTrace: AI Scientist 工作流过程追踪
- **arXiv**: [2609.09203](https://arxiv.org/abs/2609.09203) | cs.AI
- **核心**: 558 条 AI 科学 agent 轨迹数据集，9-field/step 结构化追踪
- **亮点**: Claude Opus 4.6 错误率是 GPT-5.4 的 30 倍但成功率相当
- **奖项**: ICML 2026 Workshop Best Dataset Award
- **链接**: [[2026-09-11-OpenDiscoveryTrace]]

### 4. Rethinking Verbalized Confidence for LLM-as-a-Judge
- **arXiv**: [2609.10996](https://arxiv.org/abs/2609.10996) | cs.CL
- **核心**: 后 2025 闭源模型中，verbalized confidence 优于 log-probabilities
- **亮点**: 引入 overconfidence advisory + self-debate 提升校准
- **链接**: [[2026-09-11-Verbalized-Confidence-LLM-Judge]]

### 5. K/V-Cache Interventions: Persona Control in LLMs
- **arXiv**: [2609.11020](https://arxiv.org/abs/2609.11020) | cs.CL
- **核心**: K/V-cache 干预解耦表征对齐与行为表达
- **亮点**: 中层替换 (layers 9-20) 最优 — 兼顾 persona 表达与词汇多样性
- **链接**: [[2026-09-11-KV-Cache-Interventions-Persona]]

### 6. Distribution-aware Language Neuron Identification (EMNLP 2026)
- **arXiv**: [2609.10993](https://arxiv.org/abs/2609.10993) | cs.CL
- **核心**: 利用语言激活分布聚类识别多语言 LLM 中的语言特异性神经元
- **亮点**: 4.9× 目标语言损害提升，同时保持非目标语言性能
- **链接**: [[2026-09-11-Distribution-aware-Language-Neuron]]

### 7. Think Before You Link: Multilingual Entity Linking
- **arXiv**: [2609.10745](https://arxiv.org/abs/2609.10745) | cs.CL (EMNLP 2026)
- **核心**: 知识图谱结构度量识别稀有实体；reasoning + retrieval 组合最优
- **亮点**: 稀有实体切片提升最高 23.3%；发布 MERLIN-Rare 评测集
- **链接**: [[2026-09-11-Multilingual-Entity-Linking]]

### 8. TF-IDF Weighted Loss for Memorization Reduction
- **arXiv**: [2609.11029](https://arxiv.org/abs/2609.11029) | cs.CL / cs.LG
- **核心**: TF-IDF 加权交叉熵损失减少 LLM 记忆化
- **亮点**: LoRA 微调减少 14% 平均记忆子串；全量微调减少 58%
- **链接**: [[2026-09-11-TF-IDF-Weighted-Loss-Memorization]]

### 9. Auto-RecSys: Autonomous Research for Recommender Systems
- **arXiv**: [2609.10922](https://arxiv.org/abs/2609.10922) | cs.CL
- **核心**: 工业级推荐模型的自主研究 Agent 系统
- **亮点**: 分布式异步执行 + 跨服务器持久化记忆 + 认知-过程分离
- **链接**: [[2026-09-11-Auto-RecSys]]

---

## 📚 其他论文列表 (未详细记录)

### cs.AI
| 论文 | arXiv | 主题 |
|------|-------|------|
| Adaptive Entangled Game Modules in AGI | 2609.09226 | 概率波框架 / 集体行为 |
| Subagents vs Agent Skills | 2609.09233 | Agent 技能复用 |
| Gradland: Phenomenal Experience | 2609.09306 | 多维体验 |
| XAI-Arena: LLMs for XAI Evaluation | 2609.09428 | 可解释 AI |
| Black-Box Red Teaming of Agentic AI | 2609.09647 | Agent 安全红队 |
| RESCUE-BENCH: Emotional Support Conversation | 2609.09657 | 多方情感支持 |

### cs.CL / cs.LG
| 论文 | arXiv | 主题 |
|------|-------|------|
| Multilingual in Name Only (Urdu) | 2609.10758 | 低资源语言 LLM 评估 |
| GEOSTEER: Activation Steering | 2609.10658 | LLM 激活引导 |
| Story Imprinting: AI Absorb Character Traits | 2609.10883 | AI 人格特质吸收 |
| Conformal Calibration Transfer | 2609.10737 | 校准迁移 |

---

## 🔬 今日主题趋势

1. **LLM 评估新范式**: 从 output-only 到 process-level evaluation (OpenDiscoveryTrace)
2. **Latent Space LM**: Next Concept Prediction 成为新的预训练目标
3. **LLM-as-a-Judge**: 后 2025 模型中 verbalized confidence 取代 log-prob
4. **语言神经元可解释性**: 分布感知方法识别多语言特异性神经元
5. **数据高效学习**: BabyLM 2026 推动小数据训练研究

---

## 🏷️ Tags
#LLM #NLP #Language-Model #Evaluation #BabyLM #Latent-Space #Reasoning #Multimodal #Entity-Linking #Memorization #EMNLP2026 #ICML2026
