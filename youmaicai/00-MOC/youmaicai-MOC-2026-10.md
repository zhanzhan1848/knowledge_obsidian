# youmaicai MOC - 2026年10月

## 本月论文

### Week 1 (2026-10-12 ~ 2026-10-16)

> 详见每日 Daily-Summary 文件。

### Week 2 (2026-10-17 ~ 2026-10-19)

> 详见每日 Daily-Summary 文件。

### Week 3 (2026-10-20)

| 日期 | 论文 | 核心标签 |
|------|------|----------|
| 2026-10-20 | [OpenVLHarness](https://arxiv.org/abs/2610.26860) | Multimodal Agent, Tool-Use, Visual Reasoning |
| 2026-10-20 | [LatComm](https://arxiv.org/abs/2610.26840) | Context Compression, Cross-Model Communication, Efficiency |
| 2026-10-20 | [KronLSTM](https://arxiv.org/abs/2610.26834) | Linear Attention, Kronecker Delta Rule, Long-Context |
| 2026-10-20 | [TokenGate](https://arxiv.org/abs/2610.26754) | Token Pruning, Prefill Efficiency, Long-Context |
| 2026-10-20 | [Safety Mid-Training](https://arxiv.org/abs/2610.26809) | Safety, Mid-Training, Alignment, Reasoning |
| 2026-10-20 | [Evidence Substitution](https://arxiv.org/abs/2610.26836) | Agent Harness, Context Management, GPT-5 |
| 2026-10-20 | [CC-Gittins](https://arxiv.org/abs/2610.26676) | Multi-Objective, LLM Routing, Cost-Quality Trade-off |
| 2026-10-20 | [HarnessPro](https://arxiv.org/abs/2610.26770) | Recursive Self-Improvement, Harness, Pareto |
| 2026-10-20 | [RouterWorld](https://arxiv.org/abs/2610.26511) | Benchmark, LLM Routing, Latency, Partial Observability |
| 2026-10-20 | [RefCraft](https://arxiv.org/abs/2610.26826) | Multimodal Agent, Visual Reference, Web Dev Benchmark |

### Week 3 (2026-10-23)

| 日期 | 论文 | 核心标签 |
|------|------|----------|
| 2026-10-23 | [CausalCoT](https://arxiv.org/abs/2610.31639) | Chain-of-Thought, Faithfulness, Context Isolation, DAG |
| 2026-10-23 | [OnQ](https://arxiv.org/abs/2610.29378) | Quantization, QAT, On-Policy Distillation, Dynamic KL |
| 2026-10-23 | [UniGuard](https://arxiv.org/abs/2610.30742) | Guardrail, Interface-Invariance, Contrastive, Calibration |
| 2026-10-23 | [ReflectPO](https://arxiv.org/abs/2610.30933) | RL, Long-Horizon Agent, Credit Assignment, Error Recovery |
| 2026-10-23 | [ULME](https://arxiv.org/abs/2610.30705) | Embedding, Unified Model, Predictive Coupling, RAG |
| 2026-10-23 | [Depth Growth & Looping → ICL](https://arxiv.org/abs/2610.31421) | In-Context Learning, Induction Heads, Parameter Reuse |
| 2026-10-23 | [Mixing Matters](https://arxiv.org/abs/2610.31135) | Position Bias, State-Space Models, Long-Context |
| 2026-10-23 | [DIAL](https://arxiv.org/abs/2610.31438) | Steerability, Instruction Following, CFG, Adapter |
| 2026-10-23 | [RLVR Instrumental Convergence](https://arxiv.org/abs/2610.31624) | RLVR, Alignment, Checkpoint Trajectory, INLP |
| 2026-10-23 | [Latent Harm Monitors Refuted](https://arxiv.org/abs/2610.30727) | Safety, Activation Probing, Jailbreak, Distribution Shift |
| 2026-10-23 | [One Teacher Many Views / MCPD](https://arxiv.org/abs/2610.30880) | Self-Distillation, Reference Sensitivity, KL |
| 2026-10-23 | [Cola2](https://arxiv.org/abs/2610.31305) | Hierarchical LM, Continuous Latent, Diffusion, Flow Matching |
| 2026-10-23 | [MAPS](https://arxiv.org/abs/2610.29792) | RAG, Search Momentum, Parallel Reasoning |
| 2026-10-23 | [Memory-Aware Reward Modeling](https://arxiv.org/abs/2610.31272) | Memory, Human Preference, Reward Model |
| 2026-10-23 | [Explicit-to-Applied ToM Gap](https://arxiv.org/abs/2610.31060) | Theory of Mind, Test-Time Training, Decomposed Eval |
| 2026-10-23 | [Certified Execution Harness](https://arxiv.org/abs/2610.31376) | Petri Net, Supervisory Control, Prompt Injection, Formal |
| 2026-10-23 | [GIFT](https://arxiv.org/abs/2610.30796) | RLVR, Distillation, Gradient Conflict, Token Filtering |
| 2026-10-23 | [NLA Verbalizing Activation Diffs](https://arxiv.org/abs/2610.30934) | Interpretability, Model Diffing, Subliminal Learning |
| 2026-10-23 | [Tracing Subliminal Learning](https://arxiv.org/abs/2610.30884) | Subliminal Learning, Distillation, Model Merge |
| 2026-10-23 | [POS Effects in Post-Training](https://arxiv.org/abs/2610.29843) | Data Augmentation, Part-of-Speech, CKA, Probing |
| 2026-10-23 | [Route-and-Generate (Rouge)](https://arxiv.org/abs/2610.30351) | Reasoning Routing, GRPO, Inference Efficiency |
| 2026-10-23 | [SGUR](https://arxiv.org/abs/2610.30611) | GraphRAG, Uncertainty Reduction, Medical Diagnosis, Training-Free |

*最后更新: 2026-10-23*

## 本月主题

- **Agent Harness 设计**：OpenVLHarness、HarnessPro、Evidence Substitution 三篇共同指出 harness 是当前 agent 能力上限的关键瓶颈
- **LLM 推理效率**：KronLSTM (线性注意力新规则) + TokenGate (token pruning) + LatComm (跨模型压缩) 给出三条不同路径
- **Safety 训练新范式**：Safety Mid-Training 论证安全与通用推理共享结构
- **Benchmark 更贴近生产**：RouterWorld (延迟一等) + RefCraft (视觉参考) + CC-Gittins (Pareto 多目标)

### Week 3 补充主题（2026-10-23）

- **"清理假设"成为一类独立论文**：Latent Harm Monitors（TF-IDF 打败 Latent Guard）、RLVR Instrumental Convergence（非单调，最终低于 SFT）、Memory-Aware Reward（记忆越多 ≠ 越受欢迎）、POS Effects（探针指标 ≠ 下游收益）—— 同日 4 篇同向信号
- **形式化方法进入 agent 安全**：Certified Execution Harness 用 Petri 网监督控制给出可证明安全、最小侵入的护栏；"marks = 能力/审批/预算"与"rollout 后仍可否决"两点可立即工程化
- **结构接地替代模型规模**：SGUR 用 5× 更少 token + 小模型超越大 10× 模型（PrimeKG 医疗诊断 92.5% Hit@3）
- **推理过程本身成为一等公民**：CausalCoT（因果忠实）、ReflectPO（错误恢复）、Rouge（推理预算）、MCPD（参考敏感度）、GIFT（蒸馏-RL 冲突）从五个角度处理推理质量与成本
- **表示层重构**：Cola2（连续 semantic latent + block-causal diffusion）、ULME（embedding 与生成互相塑形）
