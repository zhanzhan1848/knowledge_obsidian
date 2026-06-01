# LLM/NLP 论文日报 — 2026-06-01

**搜索范围**: arXiv (cs.AI, cs.CL, cs.NE, cs.LG) | 2026-06-01 新发表
**关键词**: large language model, LLM, transformer, attention, GPT, BERT, NLP, fine-tuning, RLHF, instruction tuning, multimodal, reasoning
**命中率**: 241 篇相关新论文

---

## 📑 精选论文 (10篇重点分析)

---

### 1. When LLMs Learn to Be Consistently Wrong: A Multi-Model Study of Linear Representations of Synthetic Deception

| 属性 | 内容 |
|------|------|
| **arXiv** | [2605.30381](https://arxiv.org/abs/2605.30381) |
| **分类** | cs.LG, cs.AI |
| **作者** | 多模型研究 (Pythia-1.4B, Gemma-2-2B/9B, Qwen2.5-7B, Llama-3.1-8B) |

#### 核心贡献
1. **合成不诚实检测**: 引入多模型范式，对5个Transformer模型进行诚实/欺骗变体fine-tune（LoRA），研究欺骗的表征基础
2. **线性探针检测**: 在第1-3层训练的线性探针即可检测合成不诚实，AUC ≥ 0.99（Gemma/Qwen/Llama），Pythia达0.705
3. **泛化能力**: 在TruthfulQA上训练的探针可泛化到MMLU held-out主题，Delta AUC ≈ 0
4. **表征崩溃 vs 高维保持**: 两类模型不同机制 — Pythia/Llama/Qwen发生表征崩溃，Gemma-2保持高维结构

#### 关键发现
- 不诚实方向在深层逐渐巩固，最优校准（ECE < 0.01）在第1-4层可达
- late-layer表征对Gaussian噪声具有强鲁棒性（Gemma-2尤为突出）
- **AI安全启示**: 通过激活监测可检测模型是否被训练为持续输出错误答案

#### 标签
`#AI安全` `#对齐` `#可解释性` `#线性表征假设`

---

### 2. Representation Collapse in Sequential Post-Training of LLMs

| 属性 | 内容 |
|------|------|
| **arXiv** | [2605.30524](https://arxiv.org/abs/2605.30381) |
| **分类** | cs.LG |
| **作者** | Yuxin Yang |

#### 核心贡献
1. **研究问题**: 大语言模型经过多阶段post-training（SFT, DPO, safety tuning, math/code specialization, long CoT）是否导致表征崩溃
2. **测量套件**: 定义hidden states、logits、token trajectories、LoRA updates四维度测量方法
3. **核心假设**: 过度的表征集中不仅是几何问题 — 它预测后期适应的可塑性降低、OOD泛化弱化、校准差
4. **干预方法**: mixed-domain replay, feature refresh, representation diversity regularization, LoRA update decorrelation

#### 关键发现
- 连续post-training逐步将内部表征压缩为低秩、各向异性、同质特征空间
- 表征崩溃与泛化能力和校准性能负相关
- 干预措施可保留未来可学习性而不放弃post-training的行为收益

#### 标签
`#post-training` `#表征收缩` `#持续学习` `#LoRA`

---

### 3. Measuring, Localizing, and Ablating Alignment Signatures in LLMs (PASTA)

| 属性 | 内容 |
|------|------|
| **arXiv** | [2605.30526](https://arxiv.org/abs/2605.30526) |
| **分类** | cs.LG, cs.CL |
| **作者** | Aniket Anand |

#### 核心贡献
1. **问题**: 对齐语言模型表现出可识别的AI风格，但其与post-training和内部表征的关联尚不清楚
2. **PASTA方法**: Post-training Alignment Signature Targeted Ablation — 无需训练，从aligned-base残差对比估计对齐签名，解码时ablate相应方向
3. **实验**: 11个对齐模型 × 6个AI检测器
4. **效果**: 大多数对齐模型的检测率降低；效果可在检测器间迁移；随机方向无法复现

#### 关键发现
- 对齐生成比base生成对人类语料库亲和力更低，AI检测率更高
- post-training将生成文本从人类语料风格移向检测器可见的AI风格
- 定性分析：PASTA生成保持相关性且更具风格多样性

#### 标签
`#对齐` `#AI检测` `#激活ablation` `#PASTA`

---

### 4. LARK: Learnability-Grounded Trajectory Selection for Efficient Reasoning Distillation

| 属性 | 内容 |
|------|------|
| **arXiv** | [2605.30651](https://arxiv.org/abs/2605.30651) |
| **分类** | cs.LG, cs.AI |
| **作者** | Kaixiang Zhao |
| **代码** | [GitHub](https://github.com/Tianrun-Yu/LARK) |

#### 核心贡献
1. **问题**: 现有推理蒸馏轨迹选择方法依赖轨迹质量或模型置信度启发式，忽视学生是否能学
2. **LARK方法**: 基于可学习性的推理轨迹选择，选择学生能高效学习同时保持泛化的轨迹
3. **核心概念**: 可学习性因子 $\rho$ — 表征学生训练损失下降速率
4. **理论保证**: 可学习性代理 + $\chi^2$-正则化选择策略，平衡可学习性与分布覆盖

#### 关键发现
- LARK score预测下游训练效用
- LARK选择的轨迹诱导更快的SFT损失降低
- 在多个基础模型和推理任务上持续优于数据选择baseline

#### 标签
`#知识蒸馏` `#轨迹选择` `#推理` `#RL`

---

### 5. PromptPO: When are LLMs Sufficient Policy Optimizers for Sequential RL Tasks?

| 属性 | 内容 |
|------|------|
| **arXiv** | [2605.30719](https://arxiv.org/abs/2605.30719) |
| **分类** | cs.LG, cs.AI |

#### 核心贡献
1. **研究问题**: LLMs何时可以作为RL任务的有效的黑盒策略优化器
2. **PromptPO方法**: 迭代方法，用Python描述状态/动作/奖励空间prompt LLM生成和改进可执行策略
3. **环境**: 困难探索环境、Meta-World机器人任务、真实控制问题

#### 关键发现
- PromptPO匹配或超越标准RL baseline，环境交互少得多
- 输出策略范围：从调优的比例控制器到运行规划算法（如value iteration）
- **局限性**: MuJoCo域表现不如标准RL，需要细粒度连续控制

#### 标签
`#RL` `#LLM` `#策略优化` `#PromptPO`

---

### 6. SAVE: Self-supervised Reward Model Improvement via Value-Anchored On-policy Feedback

| 属性 | 内容 |
|------|------|
| **arXiv** | [2605.30888](https://arxiv.org/abs/2605.30888) |
| **分类** | cs.CL |

#### 核心贡献
1. **问题**: 构建强奖励模型受限于偏好数据获取成本，且策略演化后问题加剧
2. **SAVE框架**: 使用value function对on-policy响应评分，自然转换为监督信号
3. **关键技术**: prompt-specific value head作为自适应anchor；计算RM advantages；过滤模糊样本；对比目标更新RM
4. **验证**: 6个基准数据集，3种RL算法（GRPO, RLOO, GSPO），不同策略backbone

#### 关键发现
- SAVE在所有数据集上实现最优结果
- 跨算法和backbone保持一致改进

#### 标签
`#RLHF` `#Reward Model` `#Self-supervised` `#GRPO`

---

### 7. Chain-of-Thought and Compressed Looped Transformers: A Memory-Budget Separation

| 属性 | 内容 |
|------|------|
| **arXiv** | [2605.30757](https://arxiv.org/abs/2605.30757) |
| **分类** | cs.LG |

#### 核心贡献
1. **理论分析**: CoT通过生成的token存储中间状态（留在context中），而looped Transformer通过循环隐藏激活存储状态
2. **核心结果**: 压缩循环受限于 recurrent state 大小 — 运行更长时间不创造增长的scratchpad，小空间reasoner即使运行多步也无法突破
3. **复杂度**: 在标准复杂度假设下，此类循环无法决定P-complete问题（对数空间归约），而多项式长度CoT可以
4. **实验**: pointer-chasing和associative-recall验证memory-budget view

#### 标签
`#CoT` `#Transformer` `#理论` `#推理` `#记忆`

---

### 8. DARTS: Distribution-Aware Active Rollout Trajectory Shaping for Accelerating LLM RL

| 属性 | 内容 |
|------|------|
| **arXiv** | [2605.30859](https://arxiv.org/abs/2605.30859) |
| **分类** | cs.LG, cs.AI |
| **会议** | ICML 2026 |

#### 核心贡献
1. **问题**: RL改善模型能力但受rollout效率瓶颈，因长尾响应长度分布
2. **关键洞察**: 根源在于分布本身；识别intra-prompt长尾，常由无效冗长组成
3. **DARTS方法**: 主动分布塑形 → 转向简洁性和确定性
   - Distribution-aware trajectory sampling: 从冗余探索空间选择轨迹
   - Adaptive redundancy allocation: 最大化塑形效率和系统效率

#### 关键发现
- 加速最高1.77x，不影响模型性能

#### 标签
`#RL` `#效率优化` `#rollout` `#ICML2026`

---

### 9. Mellum 2 Technical Report: Open-Weight MoE Language Model

| 属性 | 内容 |
|------|------|
| **arXiv** | [2605.31268](https://arxiv.org/abs/2605.31268) |
| **分类** | cs.CL |

#### 核心贡献
1. **模型规格**: 12B参数MoE（64 experts, 8 active），2.5B active参数/token
2. **架构决策**:
   - GQA (4 KV heads)
   - Sliding Window Attention (每4层中3层)
   - Multi-Token Prediction head（兼作auxiliary预训练目标 + speculative decoding draft模型）
3. **训练**: 约10.6T tokens，三阶段课程（web → code → math）；YaRN扩展到128K context；Muon + FP8
4. **后训练**: SFT + RLVR，两种变体（Instruct / Thinking）
5. **许可**: Apache 2.0

#### 标签
`#MoE` `#开源` `#软件工程` `#Mellum`

---

### 10. Steering LLMs? Actually, Sparse Autoencoders can outperform simple baselines

| 属性 | 内容 |
|------|------|
| **arXiv** | [2605.31183](https://arxiv.org/abs/2605.31183) |
| **分类** | cs.CL, cs.AI, cs.LG |

#### 核心贡献
1. **背景**: AxBench基准测试中SAEs steering性能不如简单baseline
2. **反驳**: 发现SAEs实际上可接近AxBench上reference LoRA性能（配合监督pipeline选择和标记特征）
3. **pipeline**: 监督pipeline选择和标记特征
4. **因果验证**: 选中的特征在使用纯可解释性组件时对其标签具有惊人因果性
5. **关键发现**: 高稀疏性（低l0）对成功steering不是关键，与Wang et al. (2025)结果相反

#### 标签
`#SAE` `#可解释性` `#模型steering` `#稀疏自编码器`

---

## 📊 今日统计

| 指标 | 数量 |
|------|------|
| 总新发表论文 | 241+ |
| 重点分析 | 10篇 |
| 涵盖主题 | 对齐、安全、RLHF、表征、推理、效率、MoE |

---

## 🔗 相关链接

- arXiv RSS: https://rss.arxiv.org/rss/cs.AI+cs.CL+cs.NE+cs.LG
- 知识库: ~/knowledge-vault/youmaicai/01-Papers/
- Git同步: ~/knowledge-vault/.scripts/git-sync.sh

---

*Generated by youmaicai cron job — 2026-06-01*