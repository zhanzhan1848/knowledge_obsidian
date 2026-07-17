# Interventional Grounding Audits: Black-Box Premise-Dependency Tests for LLM Chain-of-Thought

## 元信息
| 标题 | Interventional Grounding Audits: Black-Box Premise-Dependency Tests for LLM Chain-of-Thought via Predicate Substitution |
|------|------|
| 作者 | Hironao Nakamura |
| 链接 | [原文](https://arxiv.org/abs/2607.13069) |
| arXiv | arXiv:2607.13069 |
| 会议 | ICLR 2026 Workshop on Logical Reasoning of LLMs |
| 领域 | cs.AI, cs.CL, cs.LO |

## 核心贡献
1. **Interventional Grounding Audits**: 提出黑盒、步骤级别的 premise dependency 测试方法，通过替换目标谓词为新符号来干预单个 premise
2. **Predicate Substitution**: 重运行模型，检查每个推理步骤的标准化结论（规范谓词形式）是否改变
3. **"Right Answer, Wrong Reasoning" 检测**: 发现 66% 的正确解决问题包含至少一个对直接证明树依赖不敏感的对齐步骤

## 方法

### 核心思想
- 干预单个 premise：将目标谓词替换为新鲜符号
- 重运行模型并检查推理步骤的规范谓词形式是否改变
- 在 ProntoQA（多跳演绎推理基准）上评估，包含 gold proof trees

### 评估指标
- F1 = 0.806（检测证明树依赖）
- F1 = 0.885（谓词决定依赖）
- Recall = 100%
- 显著优于 self-consistency baseline（F1 = 0.343，95% bootstrap CIs non-overlapping）

### 关键发现
- 66% 的正确解决问题包含至少一个 aligned step，对直接证明树依赖不敏感
- 这些步骤都涉及 entity-introduction premises（consistent-substitution evaluator 的已知盲点）
- 揭示了被动方法无法检测的 "right answer, wrong reasoning" 信号

## 实验设置
- **数据集**: ProntoQA（50 个问题）
- **模型**: GPT-4o
- **评估**: 步骤级别 premise dependency 检测

## 局限性
- 仅限于正式、可解析的基准测试
- 讨论了超出此范围的适用范围限制

## 代码
- GitHub 仓库提供 audit certificates、raw outputs 和 reproduction scripts

---

# Just Keep Prompting: Evaluating Repetitive Socratic Prompting in VLMs

## 元信息
| 标题 | Just Keep Prompting: Evaluating Repetitive Socratic Prompting in VLMs |
|------|------|
| 作者 | Shayda Moezzi, Bishoy Galoaa, Lorena Genua, Taskin Padir, Sarah Ostadabbas |
| 链接 | [原文](https://arxiv.org/abs/2607.14099) |
| arXiv | arXiv:2607.14099 |
| 领域 | cs.CL, cs.AI, cs.CV |

## 核心贡献
1. **Just Keep Prompting (JKP)**: 多轮对话评估框架，测量 VLM 在用户反复挑战、提问或反驳模型答案时的认知稳定性
2. **三种探测策略**:
   - Adversarial Negation（对抗性否定）：反复拒绝
   - Pure Socratic Interrogation（苏格拉底式追问）：反复要求重新评估确定性
   - Context-Aware Socratic Summarization（上下文感知苏格拉底总结）：反映模型先前的理由再要求重新考虑

## 方法

### 评估设置
- 评估模型: GPT-4o, Gemini 2.5 Pro, Qwen3-VL-30B
- 数据集: STAR benchmark 子集
- 轮次: 最多 10 轮 follow-up turns
- 总计: 720 个多轮对话运行

### 关键发现
- **聚合准确率变化不大**：Turn 0 到 Turn 10 的准确率变化温和
- **轨迹级别分析揭示显著不稳定性**：
  - 正确答案退化
  - 错误答案恢复
  - 许多运行出现反复答案翻转

### 模型差异
| 模型 | 特性 |
|------|------|
| Qwen3-VL-30B | 最高最终准确率，但在直接反驳下变得 confidently wrong |
| Gemini 2.5 Pro | 比较稳定但 token 消耗大 |
| GPT-4o | 最脆弱和振荡 |

## 结论
- 重复提示有上限好处，通常作为 destabilizer 而非推理辅助
- 多轮 VLM 评估不仅捕获额外推理，还捕获压力-响应 profiles

---

# CARPRT: Class-Aware Zero-Shot Prompt Reweighting for Vision-Language Models

## 元信息
| 标题 | CARPRT: Class-Aware Zero-Shot Prompt Reweighting for Black-Box Vision-Language Models |
|------|------|
| 作者 | Ruijiang Dong, Zesheng Ye, Jianzhong Qi, Lei Feng, Feng Liu, Gang Niu, Masashi Sugiyama |
| 链接 | [原文](https://arxiv.org/abs/2607.14125) |
| arXiv | arXiv:2607.14125 |
| 会议 | ICLR 2026 |
| 领域 | cs.LG, cs.CV |
| 代码 | [GitHub](https://github.com/tmlr-group/CARPRT) |

## 核心贡献
1. **Class-Aware Zero-Shot Prompt Reweighting (CARPRT)**: 解决现有方法中 prompt 权重在所有类别间共享的问题
2. **问题**: 当前策略隐式假设 prompt 与类别条件独立，但实际不成立（如 "an aerial view of" 适合 "airport" 但不适合 "apple"）
3. **解决方案**: 为每个类别标签调整权重向量，以训练-free 的方式捕获不同 prompt 的类别特定相关性

## 方法

### 核心思想
1. 对于每个类别标签和每个可用 prompt，通过对预测为该类别的图像计算图像-文本相关性分数来量化类别特定相关性
2. 归一化这些估计值以导出类别特定权重

### 评估
- 在标准图像分类基准上评估
- 优于现有的类别无关重加权方法
- 确认建模 prompt-class 依赖对有效 zero-shot 预测至关重要

## 意义
- 对更广泛的依赖 prompt ensembling 的 VLM 应用设置有价值

---

# Cross-Layer Error Compensation for Extreme Low-Bit Quantization of LLMs

## 元信息
| 标题 | Cross-Layer Error Compensation and Finite-Sample Feature-Statistics Matching for Extreme Low-Bit Quantization of Large Language Models |
|------|------|
| 作者 | Ryona Noda |
| 链接 | [原文](https://arxiv.org/abs/2607.14630) |
| arXiv | arXiv:2607.14630 |
| 领域 | cs.NE |

## 核心贡献
1. **Cross-Layer Error Compensation**: 通过递归 $e_{l+1} = A_l e_l + q_l$ 维持网络级累积误差
   - $A_l$: 从层的输入微分推导的传播算子
   - $q_l$: 在 teacher features 上评估的局部量化残差
2. **Finite-Sample Feature-Statistics Matching**: 在相对归一化下对齐全精度和量化网络之间的均值、投影协方差和居中经验核
3. **理论证明**: 将传播算子实例化为量化网络的有限差分使递归对任意非线性层精确

## 方法细节

### Binary Weight Optimization
- Mirror-descent 参数化: $u = \tanh(\beta \cdot z)$
- 退火逆温度
- Group-wise log-scales

### 实验结果 (Qwen2.5-1.5B, 1.125-bit group-binary weights)
| 方法 | Perplexity Ratio |
|------|-----------------|
| Error Compensation Alone | 9.56 ± 0.15 |
| Logit Distillation | 14.09 ± 0.53 |
| Layer-local Reconstruction | 远高于两种方法 |

- 错误补偿alone比 logit distillation 优 32%（超过 8 sigma）
- 相同目标迁移到 4-bit 量化（1.060 vs. 1.088 for layer-local）

### Out-of-Domain Evaluation
- 数据集: C4, CNN/DailyMail
- 错误补偿的优势在 domain 外增长
- 统计匹配在 domain 外保持低特征统计差异（0.42-0.88 vs. 1.41-2.99 without it）
- 两个机制揭示互补分工

---

# OriginBlame: Record- and Token-Level Data Provenance for AI Training Datasets

## 元信息
| 标题 | OriginBlame: Record- and Token-Level Data Provenance for AI Training Datasets |
|------|------|
| 作者 | Haolin Xue |
| 链接 | [原文](https://arxiv.org/abs/2607.13037) |
| arXiv | arXiv:2607.13037 |
| 领域 | cs.AI |

## 核心贡献
1. **问题**: 当数据贡献者请求删除时，model trainers 面临实际差距：unlearning 算法需要 forget set，但没有工具可以定位哪些训练记录属于给定作者
2. **现有方案缺陷**: 现有 provenance 系统在文件或数据集级别操作，强制灾难性过度删除
3. **OriginBlame (ob)**: 记录和 token 级别的数据 provenance 系统，通过数据处理管道传播作者身份，并通过确定性查询将撤销请求解析为精确的 forget set

## 方法
- 记录和 token 级别 provenance
- 传播作者身份通过数据处理管道
- 确定性查询解析撤销请求

## 实验结果
- **数据集**: 219,555 Wikipedia pages
- **Over-deletion 减少**: 从 101x 降至 1.3x
- **吞吐量开销**: HuggingFace 1.3-4.0%, Datatrove 2.1-19.0%
- **Unlearning 改进**: 在 1.7B 模型上，基于 provenance 的 forget set 比随机基线改进 42%

## 意义
- 为 GDPR 等数据删除法规提供技术基础
- .enable precise "right to be forgotten" compliance

---

## 今日总结 (2026-07-17)

### LLM/NLP 相关论文
1. **Interventional Grounding Audits** - CoT reasoning 评估新方法，F1=0.806
2. **Just Keep Prompting** - VLM 多轮对话稳定性评估，揭示模型不稳定性
3. **CARPRT** - 类别感知 prompt 重加权，提升 zero-shot VLM 性能
4. **Cross-Layer Error Compensation** - LLM 极端低位量化，1.125-bit 仍保持较好 perplexity
5. **OriginBlame** - 数据 provenance 系统，支持精确 unlearning

### 关键趋势
- CoT reasoning 评估方法兴起（黑盒测试、predicate substitution）
- VLM 多轮对话稳定性成为重要评估维度
- LLM 量化技术持续突破（跨层误差补偿）
- 数据隐私与合规性技术（token 级 provenance）
