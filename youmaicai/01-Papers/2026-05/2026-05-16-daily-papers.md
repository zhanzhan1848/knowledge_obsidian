# 🥬 LLM/NLP 论文日报 - 2026年5月16日

> 搜索范围: arXiv cs.AI, cs.CL, cs.NE, cs.LG | 最近24小时

---

## 📚 本日论文列表

### 1. Is Grep All You Need? How Agent Harnesses Reshape Agentic Search
| 标题 | 内容 |
|------|------|
| **arXiv** | [2605.15184](https://arxiv.org/abs/2605.15184) |
| **作者** | Sahil Sen |
| **分类** | cs.CL |
| **日期** | 2026-05-14 |

**核心贡献:**
- 系统比较了 grep 和向量检索在 LLM Agent 搜索系统中的表现
- 使用 Chronos 定制 Agent harness 和 provider-native CLI (Claude Code, Codex, Gemini CLI)
- 对比 inline vs file-based 工具输出呈现方式

**关键发现:**
- Grep 在多数场景下准确率高于向量检索
- 整体性能高度依赖 harness 和 tool-calling 风格
- 随着无关对话历史增加，检索性能下降

**实验设置:**
- LongMemEval 116题样本
- 比较了 Chronos 和 provider CLIs

**链接:** [PDF](https://arxiv.org/pdf/2605.15184)

---

### 2. AsyncFC: Future-based Asynchronous Function Calling for LLMs
| 标题 | 内容 |
|------|------|
| **arXiv** | [2605.15077](https://arxiv.org/abs/2605.15077) |
| **作者** | Guangyu Feng |
| **分类** | cs.CL, cs.AI, cs.LG |
| **日期** | 2026-05-14 |

**核心贡献:**
- 提出 AsyncFC，解耦 LLM 解码与函数执行
- 实现模型解码与函数执行的 overlap
- 支持函数间并行（依赖允许时）

**技术要点:**
- 无需微调，不改变标准同步函数调用协议
- LLMs 原生具备推理符号 future 的能力
- 显著降低端到端任务完成时间

**性能:**
- 在标准 function-calling 和软件工程基准上有效
- 保持任务准确率的同时减少延迟

**链接:** [PDF](https://arxiv.org/pdf/2605.15077)

---

### 3. Tokenizer Fertility and Zero-Shot Performance on Ukrainian Legal Text
| 标题 | 内容 |
|------|------|
| **arXiv** | [2605.14890](https://arxiv.org/abs/2605.14890) |
| **作者** | Volodymyr Ovcharov |
| **分类** | cs.CL |
| **日期** | 2026-05-14 |

**核心贡献:**
- 基准测试 7 个模型在乌克兰法律文本上的 tokenizer fertility
- 测量 273 个验证法庭判决的 zero-shot 性能

**关键发现:**
1. Tokenizer fertility 差异 1.6x: Qwen3 比 Llama 多消耗 60% tokens
2. NVIDIA Nemotron Super 3 (120B) 达到最高复合分数 83.1，优于 Mistral Large 3 (5.6x 更多参数)
3. Few-shot prompting 性能下降达 26 个百分点
4. Zero-shot 是形态丰富语言的更可靠默认设置

**实践建议:**
- 模型选择前先分析 tokenizer
- 形态丰富语言推荐 zero-shot

**链接:** [PDF](https://arxiv.org/pdf/2605.14890)

---

### 4. SciPaths: Forecasting Pathways to Scientific Discovery
| 标题 | 内容 |
|------|------|
| **arXiv** | [2605.14600](https://arxiv.org/abs/2605.14600) |
| **作者** | Eric Chamoun |
| **分类** | cs.CL |
| **日期** | 2026-05-14 |

**核心贡献:**
- 提出 discovery pathway forecasting 任务
- 给定目标科学贡献和历史文献，识别使能贡献并追溯prior work

**数据集:**
- SciPaths: 262 条专家标注 gold pathways + 2,444 条 silver pathways
- 来自 ML 和 NLP 论文

**关键发现:**
- 最佳模型在严格语义匹配下 F1 仅 0.189
- 方法论依赖最难恢复
- Prior-work grounding 在 gold 使能贡献提供时显著改善

**意义:**
- 转向科学预测中缺失的能力：从目标贡献逆向推理使能构建块

**链接:** [PDF](https://arxiv.org/pdf/2605.14600)

---

### 5. CIPO: Correction-Oriented Policy Optimization
| 标题 | 内容 |
|------|------|
| **arXiv** | [2605.14539](https://arxiv.org/abs/2605.14539) |
| **作者** | Mengjie Ren |
| **分类** | cs.CL |
| **日期** | 2026-05-14 |

**核心贡献:**
- 提出 CIPO (Correction-Oriented Policy Optimization)
- 扩展 RLVR，将 on-policy 失败轨迹转为 correction-oriented 监督
- 联合优化 correction samples 和标准 RLVR 目标

**技术要点:**
- 无需外部信号
- 显式增强模型纠正自身错误的能力
- 利用失败轨迹中的有用信息

**性能:**
- 跨 11 个基准测试（数学推理、代码生成）持续显著优于基线
- 更强的 pass@K 增益
- 改进内在推理能力而非仅重新分配概率质量

**链接:** [PDF](https://arxiv.org/pdf/2605.14539)

---

### 6. GradShield: Alignment Preserving Finetuning
| 标题 | 内容 |
|------|------|
| **arXiv** | [2605.14194](https://arxiv.org/abs/2605.14194) |
| **作者** | Zhanhao Hu |
| **分类** | cs.CL |
| **日期** | 2026-05-13 |

**核心贡献:**
- 发现微调后的 LLM 存在安全对齐风险
- 提出 GradShield，在微调前识别并移除有害数据点

**技术方案:**
- 计算每个数据点的 Finetuning Implicit Harmfulness Score (FIHS)
- 使用自适应阈值算法
- 在多个 utility fine-tuning 任务上评估

**性能:**
- ASR 保持在 6% 以下
- 保持 utility 性能

**链接:** [PDF](https://arxiv.org/pdf/2605.14194)

---

### 7. CAST: Case-Based Calibration for LLM Tool Use
| 标题 | 内容 |
|------|------|
| **arXiv** | [2605.15041](https://arxiv.org/abs/2605.15041) |
| **作者** | Renning Pang |
| **分类** | cs.AI, cs.CL |
| **日期** | 2026-05-14 |

**核心贡献:**
- 提出 CAST，将历史执行轨迹作为结构化案例
- 从案例中提取 complexity profiles 和 failure profiles

**技术方案:**
- 估计最优推理策略
- 映射可能的结构分解
- 转化为细粒度 reward design 和自适应推理

**性能:**
- BFCLv2 和 ToolBench 上提升 5.85% 执行准确率
- 减少 26% 平均推理长度
- 显著减轻高影响结构错误

**链接:** [PDF](https://arxiv.org/pdf/2605.15041)

---

### 8. Orchard: An Open-Source Agentic Modeling Framework
| 标题 | 内容 |
|------|------|
| **arXiv** | [2605.15040](https://arxiv.org/abs/2605.15040) |
| **作者** | Baolin Peng, Wenlin Yao, et al. |
| **分类** | cs.AI |
| **日期** | 2026-05-14 |

**核心贡献:**
- 提出 Orchard，开源可扩展的 Agentic Modeling 框架
- Orchard Env: 轻量级环境服务，提供跨任务域的 sandbox 生命周期管理

**Recipes:**
- **Orchard-SWE**: 目标编码 agent
  - 从 MiniMax-M2.5 和 Qwen3.5-397B 提炼 107K 轨迹
  - Credit-assignment SFT 从未解决轨迹的生产性片段学习
  - Balanced Adaptive Rollout for RL

**链接:** [PDF](https://arxiv.org/pdf/2605.15040)

---

### 9. Measuring and Mitigating Toxicity in LLMs: Comprehensive Replication
| 标题 | 内容 |
|------|------|
| **arXiv** | [2605.14087](https://arxiv.org/abs/2605.14087) |
| **作者** | Mokshit Surana |
| **分类** | cs.CL, cs.LG |
| **日期** | 2026-05-13 |

**核心贡献:**
- 全面复制 DExperts (Decoding-time Experts) 毒性缓解技术

**三阶段研究:**
1. 使用 RealToxicityPrompts 建立基线毒性测量
2. 实现评估 DExperts 缓解显式毒性
3. 使用 ToxiGen 对抗性数据集压力测试隐式仇恨言论

**关键发现:**
- 显式毒性安全率 100%
- 隐式仇恨言论安全率降至 98.5%
- ~10x 延迟惩罚 (0.2s → 2.0s)

**启示:** 需要更复杂的方法来泛化不同仇恨言论模式

**链接:** [PDF](https://arxiv.org/pdf/2605.14087)

---

### 10. Multilingual Knowledge Editing: Vector Merging Methods
| 标题 | 内容 |
|------|------|
| **arXiv** | [2605.13919](https://arxiv.org/abs/2605.13919) |
| **作者** | Kunil Lee |
| **分类** | cs.CL, cs.LG |
| **日期** | 2026-05-13 |

**核心贡献:**
- 研究多语言知识编辑 (MKE) 中的向量合并方法
- 评估 TSVM 减少多语言干扰的能力

**关键发现:**
- Vector summation with shared covariance 是最可靠的整体策略
- 简单 summation without shared covariance 表现差
- TSVM 在某些设置下改善，但减少多语言干扰能力有限
- 性能对 weight scale 和 rank ratio 敏感

**设置:**
- 6 种合并变体
- 2 种骨干 LLM，2 种基础 KE 方法
- 12 种语言，MzsRE 基准，批量编辑设置

**链接:** [PDF](https://arxiv.org/pdf/2605.13919)

---

### 11. Context-Aware Synthetic Augmentation for Psychological Defense Classification
| 标题 | 内容 |
|------|------|
| **arXiv** | [2605.14380](https://arxiv.org/abs/2605.14380) |
| **作者** | Hoang-Thuy-Duong Vu |
| **分类** | cs.CL |
| **日期** | 2026-05-14 |

**核心贡献:**
- 在 PsyDefDetect 共享任务 (BioNLP@ACL 2026) 上提出 context-aware 合成增强框架
- 混合分类模型：语言表示 + 临床特征

**性能:**
- 准确率 58.26% (+40.25%)
- Macro-F1 24.62% (+15.99%)

**关键发现:**
- 提示中的 definition quality 直接决定生成保真度和下游性能

**代码:** https://github.com/htdgv/CASA-PDC

---

## 📊 主题分布

| 主题 | 论文数 |
|------|--------|
| LLM Agent / Tool Use | 4 (AsyncFC, CAST, Orchard, Grep vs Vector) |
| RL / Fine-tuning | 3 (CIPO, GradShield, MKE) |
| Toxicity / Safety | 1 (DExperts Replication) |
| Scientific NLP | 2 (SciPaths, PsyDefDetect) |
| Multilingual | 2 (Ukrainian Legal, MKE) |

---

## 🔬 趋势观察

1. **Agent 基础设施成熟**: Orchard 等开源框架降低 agent 训练门槛
2. **异步执行优化**: AsyncFC 展示解码-执行解耦的潜力
3. **纠错学习兴起**: CIPO 利用失败轨迹增强推理
4. **Tokenizer 重要性**: Qwen3 vs Llama 1.6x 差异影响实际部署成本
5. **科学预测新任务**: 从目标反向推理使能贡献是新的研究方向

---

*生成时间: 2026-05-16 14:17 UTC*