# 📚 2026-03-20 LLM/NLP 论文日报

## 概览
- **日期**: 2026-03-20
- **论文数量**: 12篇
- **来源**: arXiv cs.CL, cs.AI
- **关键词**: LLM, Transformer, 多语言, 强化学习, RAG, Agent

---

## 🌟 重点推荐

### 1. Nemotron-Cascade 2 (NVIDIA)
**arXiv:2603.19220** | [[2026-03-20_Nemotron-Cascade2_MoE_RL]]
- 30B MoE模型，仅激活3B参数
- **第二个在IMO/IOI/ICPC达到金牌水平的开源LLM**
- Cascade RL + 多域策略蒸馏
- 代码已开源: HuggingFace Collections

### 2. F2LLM-v2
**arXiv:2603.19223** | [[2026-03-20_F2LLM-v2_Multilingual_Embeddings]]
- 8种规模(80M-14B)多语言嵌入模型
- 6000万训练样本，200+语言
- F2LLM-v2-14B在11个MTEB基准排名第一
- Matryoshka学习 + 模型剪枝 + 知识蒸馏

---

## 📊 分类汇总

### 多语言/NLP
| 论文 | arXiv | 核心贡献 |
|------|-------|----------|
| F2LLM-v2 | 2603.19223 | 200+语言嵌入模型 |
| VEPO | 2603.19152 | 低资源语言RL优化 |
| DaPT | 2603.19097 | 多语言多跳QA (ICASSP 2026) |

### 强化学习/训练
| 论文 | arXiv | 核心贡献 |
|------|-------|----------|
| Nemotron-Cascade 2 | 2603.19220 | Cascade RL + 蒸馏 |
| VEPO | 2603.19152 | 可变熵策略优化 |
| MoRI | 2603.19044 | 科学创意生成RL |

### RAG/检索
| 论文 | arXiv | 核心贡献 |
|------|-------|----------|
| DaPT | 2603.19097 | 双路径多语言RAG |
| HCQR | 2603.19008 | 假设条件查询重写 |

### Agent/推理
| 论文 | arXiv | 核心贡献 |
|------|-------|----------|
| OS-Themis | 2603.19191 | GUI Agent评论框架 |
| Box Maze | 2603.19182 | LLM推理过程控制 |

### 偏置/公平性
| 论文 | arXiv | 核心贡献 |
|------|-------|----------|
| UGID | 2603.19144 | 图同构去偏框架 |

### 训练优化
| 论文 | arXiv | 核心贡献 |
|------|-------|----------|
| LM Splitting | 2603.19149 | 领域专用模型分裂训练 |

### 评估/认知
| 论文 | arXiv | 核心贡献 |
|------|-------|----------|
| LLM Analogies | 2603.19066 | LLM类比优于人类 |
| Strategic Reasoning | 2603.19167 | 反事实博弈推理评估 |

---

## 🔗 论文链接汇总

1. [F2LLM-v2](https://arxiv.org/abs/2603.19223) - 多语言嵌入
2. [Nemotron-Cascade 2](https://arxiv.org/abs/2603.19220) - MoE + RL
3. [Strategic Reasoning](https://arxiv.org/abs/2603.19167) - 博弈推理
4. [VEPO](https://arxiv.org/abs/2603.19152) - 低资源语言
5. [LM Splitting](https://arxiv.org/abs/2603.19149) - 模型分裂
6. [UGID](https://arxiv.org/abs/2603.19144) - 去偏框架
7. [DaPT](https://arxiv.org/abs/2603.19097) - 多语言QA
8. [LLM Analogies](https://arxiv.org/abs/2603.19066) - 类比生成
9. [MoRI](https://arxiv.org/abs/2603.19044) - 科学创意
10. [HCQR](https://arxiv.org/abs/2603.19008) - 查询重写
11. [OS-Themis](https://arxiv.org/abs/2603.19191) - GUI Agent
12. [Box Maze](https://arxiv.org/abs/2603.19182) - 推理控制

---

## 📝 技术趋势观察

1. **MoE架构持续发展**: Nemotron-Cascade 2展示高智能密度
2. **多语言能力突破**: F2LLM-v2支持200+语言
3. **RL训练创新**: Cascade RL, VEPO等新方法
4. **RAG系统进化**: 多语言、多路径、查询重写
5. **Agent可靠性**: GUI Agent、推理过程控制
6. **公平性研究**: 内部表示级别去偏

---

*由油麦菜(youmaicai)自动生成 - 2026-03-22*
