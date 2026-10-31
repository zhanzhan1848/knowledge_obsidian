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

### Week 4 补充主题（2026-10-28）

| 日期 | 论文 | 核心标签 |
|------|------|----------|
| 2026-10-28 | [Heads of Security](https://arxiv.org/abs/2610.37657) | Prompt Injection, Attention Gates, ASR 97%→10% |
| 2026-10-28 | [Concordat](https://arxiv.org/abs/2610.37461) | Typestate, Session Types, Protocol Enforcement, tau-bench |
| 2026-10-28 | [Follow the Gradient](https://arxiv.org/abs/2610.37481) | Gradient Attribution, SimpleLoRIF, SafeTulu, Emergent Misalignment |
| 2026-10-28 | [Teach reality, not ethics](https://arxiv.org/abs/2610.37484) | Continued Pretraining, QLoRA, Ecological Alignment, Construct-Neutral Control |
| 2026-10-28 | [Attention as Lattice Gauge Theory](https://arxiv.org/abs/2610.37656) | Wilson Loop, Holonomy, Gauge Theory, $S_4$ 0.88 vs 0.083 |
| 2026-10-28 | [MERLIN (Multi-State Linear Attention)](https://arxiv.org/abs/2610.37645) | Second-Order Moments, Long Context, Gated DeltaNet, Mamba-2 |
| 2026-10-28 | [GTFormer](https://arxiv.org/abs/2610.37524) | Hierarchical GNN, 8192× Extrapolation, O(N), Convex Highway Gating |
| 2026-10-28 | [CoS-VQ](https://arxiv.org/abs/2610.37336) | VQ Quantization, Joint Index-Scale, QTIP, LLVQ |
| 2026-10-28 | [Orthogonal & Parametrized Steering](https://arxiv.org/abs/2610.37517) | Activation Steering, Parameterized Strength, Orthogonalization |
| 2026-10-28 | [MuonGS](https://arxiv.org/abs/2610.37647) | Accumulated Effective LR, Relaxed Weight-Norm, Muon, +15% |
| 2026-10-28 | [LinMix](https://arxiv.org/abs/2610.37390) | Domain Attribution, Vertex Sampling, Optimal Design, MBPP +46% |
| 2026-10-28 | [Scaling Laws for Tool-Use Agents](https://arxiv.org/abs/2610.37648) | SynthAPI, Environment Synthesis, Diversity > Quantity, 458k Tasks |
| 2026-10-28 | [What Improves During Pretraining?](https://arxiv.org/abs/2610.37631) | TVS, Point-in-Time Models, Knowledge Acquisition |
| 2026-10-28 | [What Carries Forward?](https://arxiv.org/abs/2610.37465) | FMTI 2025, Pretraining Disclosure, Score Masking, Audit |
| 2026-10-28 | [ETAMem](https://arxiv.org/abs/2610.37443) | Event/Affect/Time Views, Entropy Budget, Long-Term Memory |
| 2026-10-28 | [Rare, Relevant, and Still Wrong](https://arxiv.org/abs/2610.37624) | CrossProfile, Social Proof, Hidden Profile, Evidence Balance |
| 2026-10-28 | [GEPA-Curator](https://arxiv.org/abs/2610.37651) | Task Curation, Prior Success Retrieval, GEPA, ACE |
| 2026-10-28 | [Where Should the Evaluation Budget Go?](https://arxiv.org/abs/2610.37276) | Scaffold Evolution, Sparse Feedback, Paired Successive Halving, IRT |
| 2026-10-28 | [Agent-Conditioned Routing](https://arxiv.org/abs/2610.37375) | MoE, Expert Mask, Reasoning Diversity, Frozen Model |
| 2026-10-28 | [Uncovering Why LLMs Fail](https://arxiv.org/abs/2610.37369) | CauTrace, Attention-MLP Agreement, Failure Dynamics |
| 2026-10-28 | [Metacognitive Decoding](https://arxiv.org/abs/2610.37642) | Diffusion LM, FLOPs −20.6%, Adaptive Stopping |
| 2026-10-28 | [The Structure Gap](https://arxiv.org/abs/2610.37523) | Identifiability, Wiener Solver, Persistent Excess Risk, Cell Coverage |
| 2026-10-28 | [RPSD](https://arxiv.org/abs/2610.37281) | On-Policy Self-Distillation, Optimal Transport, Token-Level Credit |
| 2026-10-28 | [EmbeddingGemma 2](https://arxiv.org/abs/2610.37364) | Multimodal Embedding, Unified Space, Pareto Frontier, Open Weights |
| 2026-10-28 | [Lightweight Attention CNN](https://arxiv.org/abs/2610.37314) ⚠️ | cs.CV 医学影像 · 非本域 · 仅因关键词入选 |

#### 2026-10-28 主题

- **不要问模型，用机制约束它**（今日主线）：5 个子领域独立收敛 —— 协议化 agent [[Concordat]]、架构层注入防御 [[Heads of Security]]、梯度级数据清洗 [[Follow the Gradient]]、解耦归属与内容 [[Rare, Relevant, and Still Wrong]]、教事实而非教话术 [[Teach reality, not ethics]]
- **注意力机制三路进攻**：安全 [[Heads of Security]] · 效率 [[MERLIN]] · 理论 [[Attention as Lattice Gauge Theory]] —— 同一天三篇从三个角度动注意力结构
- **数据配方两篇 scaling law 互证**：[[LinMix]]（域权重 × 顶点采样 × 域归因）+ [[Scaling Laws for Tool-Use Agents]]（环境多样性 > 样本数量）
- **Agent 自改进的瓶颈在评测**：学什么 [[GEPA-Curator]] + 花多少 [[Where Should the Evaluation Budget Go?]] —— 而非优化器强度
- **合规 ≠ 高分**：tau-bench reward 检测不出大多数违规（[[Concordat]]），现存 agent 评测分数需重新审视
- **诊断量可立即复用**：累积有效学习率 $C_T$（[[MuonGS]]）、TVS 时间变异性（[[What Improves During Pretraining?]]）、证据平衡（[[Rare, Relevant, and Still Wrong]]）


### 2026-10-31 (每日批次 · 90 篇)

| arXiv ID | 标题 | 分类 |
|----------|------|------|
| [2610.40655v1](https://arxiv.org/abs/2610.40655v1) | Elucidating the Design Space of LM Data Attribution | cs.CL |
| [2610.40649v1](https://arxiv.org/abs/2610.40649v1) | Rethinking Neural Thickets Without Weight Perturbations | cs.LG |
| [2610.40637v1](https://arxiv.org/abs/2610.40637v1) | world2vec: Mechanistic world models through latent dynamics learning | cs.LG |
| [2610.40627v1](https://arxiv.org/abs/2610.40627v1) | ShallowDefend: Harnessing Shallow Safety Alignment for Multi-Turn Defender | cs.CL |
| [2610.40619v1](https://arxiv.org/abs/2610.40619v1) | Testimony from Timelines: Evidence-Grounded Significance Testing of Temporal Clinical Hypotheses | cs.CL |
| [2610.40613v1](https://arxiv.org/abs/2610.40613v1) | TextSeal2: Distortion-Free LLM Watermarking with Copula Mixing and Memoryless Races | cs.CR |
| [2610.40611v1](https://arxiv.org/abs/2610.40611v1) | When to Assist and What to Suggest: Joint Gating and Memory-Grounded Hint Generation in One Compact Decoder | cs.CL |
| [2610.40588v1](https://arxiv.org/abs/2610.40588v1) | Pre-Crime for Agents, at the Last Second: Probing When a Recruited Agent Gives In | cs.AI |
| [2610.40578v1](https://arxiv.org/abs/2610.40578v1) | VeriCUA: Verification as Agentic Exploration for Computer-Using Agents | cs.AI |
| [2610.40577v1](https://arxiv.org/abs/2610.40577v1) | Multi-View MoE: Letting Every Router Shape Expert Computation | cs.CL |
| [2610.40576v1](https://arxiv.org/abs/2610.40576v1) | PIVOT: Progressive Intervention via Online Teacher Correction | cs.CL |
| [2610.40574v1](https://arxiv.org/abs/2610.40574v1) | Every Token Needs Its Own Teacher: Multi-teacher Adaptive On-policy Self-distillation | cs.CL |
| [2610.40565v1](https://arxiv.org/abs/2610.40565v1) | Gym-Anything for Robotics: Scaling physical simulations with digital agents | cs.RO |
| [2610.40563v1](https://arxiv.org/abs/2610.40563v1) | Comparing Human Role-Players and LLM-Simulated Clients in Online Counselling Training: An Analysis of Counselling Patterns | cs.AI |
| [2610.40551v1](https://arxiv.org/abs/2610.40551v1) | Ramanujan Challenge Results: AI-Assisted Evaluation Pipeline for Multi-Format Proofs | cs.AI |
| [2610.40541v1](https://arxiv.org/abs/2610.40541v1) | On the Fundamental Limits of Prefill-Based Decoding Length Prediction | cs.AI |
| [2610.40532v1](https://arxiv.org/abs/2610.40532v1) | BURGER: Benchmarking and Understanding Robotic Generalization via Embodied Drawing | cs.RO |
| [2610.40518v1](https://arxiv.org/abs/2610.40518v1) | IndicIPR-QA: A Benchmark for Extractive Question Answering on Indian IPR Laws | cs.CL |
| [2610.40516v1](https://arxiv.org/abs/2610.40516v1) | How I Aligned Your Model: Scaling Up Multilingual Safety Training with Templates | cs.CL |
| [2610.40511v1](https://arxiv.org/abs/2610.40511v1) | A Low-Rank Space Captures Linear Alignment Between LLM and Human Neural Activity During Naturalistic Language Listening | cs.CL |
| [2610.40503v1](https://arxiv.org/abs/2610.40503v1) | Algebraic World Model: From Exploration to Proofs | cs.AI |
| [2610.40492v1](https://arxiv.org/abs/2610.40492v1) | Agentic University: Collaborative Agents for Personalized Learning | cs.AI |
| [2610.40476v1](https://arxiv.org/abs/2610.40476v1) | Training language models in simulation for psychiatric intake | cs.AI |
| [2610.40407v1](https://arxiv.org/abs/2610.40407v1) | SCARL: Sequence Confidence-Aligned Reinforcement Learning | cs.LG |
| [2610.40396v1](https://arxiv.org/abs/2610.40396v1) | Understanding and Mitigating Role Spoofing in LLMs | cs.CR |
| [2610.40394v1](https://arxiv.org/abs/2610.40394v1) | Scaling Mathematical Proof Supervision from Structured Textbooks | cs.CL |
| [2610.40382v1](https://arxiv.org/abs/2610.40382v1) | Beyond Selected Breakthroughs: Evaluating Language Models on Randomly Sampled Mathematical Conjectures | cs.AI |
| [2610.40379v1](https://arxiv.org/abs/2610.40379v1) | Agentic LLM reasoning in pediatric diabetes outcome prediction from multimodal medical records | q-bio.QM |
| [2610.40370v1](https://arxiv.org/abs/2610.40370v1) | The Athlete as a Scientist of One: Agentic Bayesian Experimental Design for Individualized Physiology from Consumer Wearables | cs.RO |
| [2610.40350v1](https://arxiv.org/abs/2610.40350v1) | Don't Lose the Thread: Empowering Long-Horizon LLM Agents with Cognitive Resource Self-Allocation | cs.CL |
| [2610.40345v1](https://arxiv.org/abs/2610.40345v1) | A Unified Hessian-Guided Framework for Post-Training Quantization | cs.LG |
| [2610.40327v1](https://arxiv.org/abs/2610.40327v1) | Radiology Guideline-derived Decision Graph for Efficient Clinical Decision Support | cs.CV |
| [2610.40305v1](https://arxiv.org/abs/2610.40305v1) | Rimuru: Unified Memory Management for Modern LLM Serving via Elastic Expert Offloading | cs.OS |
| [2610.40292v1](https://arxiv.org/abs/2610.40292v1) | DolphinRouting: Cluster-Level Binary Routing for Disaggregated LLM Inference Serving | cs.LG |
| [2610.40283v1](https://arxiv.org/abs/2610.40283v1) | Latent Path Exploration via Potential-Guided Subtrajectory Balance | cs.CL |
| [2610.40280v1](https://arxiv.org/abs/2610.40280v1) | Latent Prediction Yields Cross-Subject Alignable Representations in Sensory-Evoked fMRI | cs.LG |
| [2610.40278v1](https://arxiv.org/abs/2610.40278v1) | Neighborhood Elites: Quality-Diversity Search for Uncertainty Quantification in Question Answering | cs.AI |
| [2610.40276v1](https://arxiv.org/abs/2610.40276v1) | TaskFrame: Connecting Task-Level Planning with Frame-Level Control for Game Agents | cs.CV |
| [2610.40256v1](https://arxiv.org/abs/2610.40256v1) | When Requirements Interact: Scaling Long-Horizon Coding via Interdependent Specifications | cs.SE |
| [2610.40250v1](https://arxiv.org/abs/2610.40250v1) | Distributional Reward Calibration and Budget-Neutral Credit Assignment for Multimodal RLVR | cs.AI |
| [2610.40248v1](https://arxiv.org/abs/2610.40248v1) | LLM-guided Planar Loco-Manipulation for Quadruped Robots | cs.RO |
| [2610.40246v1](https://arxiv.org/abs/2610.40246v1) | EnvOS: Auditing Computer-Use Agents When the World Moves On : Phenomenon-Based Task Construction, Certification, and Evidence-Based Evaluation | cs.AI |
| [2610.40241v1](https://arxiv.org/abs/2610.40241v1) | Judged in Company: In-Context Batching Makes LLM Verdicts Depend on Other Items | cs.CL |
| [2610.40238v1](https://arxiv.org/abs/2610.40238v1) | ScienceJudge: Pattern Perturbation Augmentation for Sentence-Level Scientific Claim Verification | cs.CL |
| [2610.40233v1](https://arxiv.org/abs/2610.40233v1) | Mobilizing the Archive: Bitext Extraction at Scale from Archival Documents for Extremely Low-resource Languages | cs.CL |
| [2610.40227v1](https://arxiv.org/abs/2610.40227v1) | EpiAgent: Epistemic Self-Play for LLM Agents | cs.AI |
| [2610.40196v1](https://arxiv.org/abs/2610.40196v1) | Towards Full-Text Scholarly Argument Mining using Entity-Anchored Claim Extraction | cs.CL |
| [2610.40186v1](https://arxiv.org/abs/2610.40186v1) | Locating and Closing Information Gaps in Multi-Agent Systems | cs.AI |
| [2610.40133v1](https://arxiv.org/abs/2610.40133v1) | DynaRev: Benchmarking Web Agents under Dynamic Goal Revision | cs.AI |
| [2610.40124v1](https://arxiv.org/abs/2610.40124v1) | It Takes Two to Probe, Thousands to Retrieve: Putting Vision--Language Probes to the Retrieval Test | cs.CV |
| [2610.40091v1](https://arxiv.org/abs/2610.40091v1) | Upcycling Language Models for Multiple Specialized Domains | cs.CL |
| [2610.40071v1](https://arxiv.org/abs/2610.40071v1) | Agentic process evidence | cs.AI |
| [2610.40055v1](https://arxiv.org/abs/2610.40055v1) | One Vector or Many? Clustered Optimal-Transport Steering under Quantization | cs.LG |
| [2610.40042v1](https://arxiv.org/abs/2610.40042v1) | UPPAAi: Towards LLM-Assisted Modeling, Verification, Analysis and Synthesis | cs.SE |
| [2610.40036v1](https://arxiv.org/abs/2610.40036v1) | Hybrid AI Patterns: Thirteen Ways to Couple Language Models with Rules, and How to Choose Among Them | cs.AI |
| [2610.40031v1](https://arxiv.org/abs/2610.40031v1) | AI Cosmos: An Agentic Infra for Situated Learning | cs.CL |
| [2610.40023v1](https://arxiv.org/abs/2610.40023v1) | HEMO: Harness Self-Evolution for Multi-Objective Combinatorial Optimization | cs.NE |
| [2610.40002v1](https://arxiv.org/abs/2610.40002v1) | How Much Should a VLA Trust Its Reasoning? Step-Level Guidance as a Measured Action-Value Function | cs.RO |
| [2610.39955v1](https://arxiv.org/abs/2610.39955v1) | Mind The Gap (MTG-AD): Dataset and Fine-grained Evaluation for End-to-End Inline Audio Descriptions | cs.CV |
| [2610.39939v1](https://arxiv.org/abs/2610.39939v1) | Can LLMs Ignore What They Know? Measuring Knowledge Leakage in Persona-Based User Simulation | cs.CL |
| [2610.39934v1](https://arxiv.org/abs/2610.39934v1) | H$^2$R: Hierarchical Hint-Based Reward for Mathematical Reasoning via Reinforcement Learning | cs.LG |
| [2610.39927v1](https://arxiv.org/abs/2610.39927v1) | Learning Calibrated Confidence for Multi-Agent Collaboration | cs.LG |
| [2610.39876v1](https://arxiv.org/abs/2610.39876v1) | Turing LLM Post-Training: Calibrated Distillation and Efficient Dynamic-MoE Execution | cs.LG |
| [2610.39854v1](https://arxiv.org/abs/2610.39854v1) | Attention, Dynamic Wave and Hybrid Sequence Mixers in Language Models | cs.LG |
| [2610.39853v1](https://arxiv.org/abs/2610.39853v1) | KV Cache Quantization for Diffusion Language Models | cs.CL |
| [2610.39852v1](https://arxiv.org/abs/2610.39852v1) | DWISE: Denoising Workload-Informed Scheduling Engine | cs.LG |
| [2610.39840v1](https://arxiv.org/abs/2610.39840v1) | Surprise Alone Learns Lies: Evidence-Gated Continual Learning for LLMs from Streaming Claims | cs.LG |
| [2610.39835v1](https://arxiv.org/abs/2610.39835v1) | Aligning Medical Vision Language Models at the Capability Boundary with Entropy Adaptive Rubric Grounding | cs.CV |
| [2610.39825v1](https://arxiv.org/abs/2610.39825v1) | AegisFlow: Training-Free Non-Myopic Path-Safe Guided Flow Matching | cs.AI |
| [2610.39813v1](https://arxiv.org/abs/2610.39813v1) | EvoTeam: Multi-Agent Collaboration via Evolving Teams | cs.AI |
| [2610.39807v1](https://arxiv.org/abs/2610.39807v1) | InferD: A Honeypot Framework for AI Inference Infrastructure | cs.CR |
| [2610.39802v1](https://arxiv.org/abs/2610.39802v1) | Revisiting Over-refusal in Safety-aligned Large Language Models: A Representation and Optimization Perspective | cs.AI |
| [2610.39796v1](https://arxiv.org/abs/2610.39796v1) | AI at a Turning Point: From ChatGPT through Neural Networks to Neuromorphic AI | cs.LG |
| [2610.39795v1](https://arxiv.org/abs/2610.39795v1) | The Role of Self-Concept In Language Models | cs.AI |
| [2610.39781v1](https://arxiv.org/abs/2610.39781v1) | Finding Is Not Returning, Returning Is Not Reconstructing: A Multi-Dimensional Evaluation of Agent Social Re-entry | cs.AI |
| [2610.39744v1](https://arxiv.org/abs/2610.39744v1) | PAPERBENCHX: Can AI Reproduce Science Across Disciplines? | cs.AI |
| [2610.39671v1](https://arxiv.org/abs/2610.39671v1) | Incentivizing Self-Learning in Large Language Models via Reinforcement Learning | cs.CL |
| [2610.39602v1](https://arxiv.org/abs/2610.39602v1) | Evaluating Cultural Knowledge Editing in Vision-Language Models | cs.CV |
| [2610.39590v1](https://arxiv.org/abs/2610.39590v1) | Red-Teaming Large Language Models in Low-Resource African Languages: A Case Study of Yoruba and Nigerian Pidgin | cs.CL |
| [2610.39562v1](https://arxiv.org/abs/2610.39562v1) | Raincheck: Deferred Multimodal Prefill for Efficient Multi-Turn MLLM Inference | cs.CL |
| [2610.39433v1](https://arxiv.org/abs/2610.39433v1) | ARBITRA: Robust Document-Level ATT&CK Extraction via Multi-Expert Argumentation | cs.CL |
| [2610.39419v1](https://arxiv.org/abs/2610.39419v1) | Diagnosing the Reference Gap: What Visual Scaffolds Can and Cannot Fix in Multimodal Reasoning | cs.CV |
| [2610.39417v1](https://arxiv.org/abs/2610.39417v1) | Well-Specified and Well-Tested? Assessing SWE-bench-Style Datasets with a Self-Evolving Agent | cs.SE |
| [2610.39398v1](https://arxiv.org/abs/2610.39398v1) | Robustness of Chatbot LLM Judgments of Presidential Actions and Hypothetical Reforms | cs.CL |
| [2610.39372v1](https://arxiv.org/abs/2610.39372v1) | Cord: Confidence-Anchored Order Residual Decoding for Masked Diffusion Language Models | cs.CL |
| [2610.39237v1](https://arxiv.org/abs/2610.39237v1) | Grounding Multimodal Reasoning with Evidence-Ablated Negatives | cs.CL |
| [2610.39234v1](https://arxiv.org/abs/2610.39234v1) | AgentHeal: Evaluating Goal-Preserving Resource Recovery of Web Agents under Access Barriers | cs.CR |
| [2610.39227v1](https://arxiv.org/abs/2610.39227v1) | XLaw-JP-27B: A Lightweight Open Model Specialized for Japanese Law | cs.CL |
| [2610.39182v1](https://arxiv.org/abs/2610.39182v1) | Reasoning or Pattern Exploitation? Mechanistic Insights from RL-Trained Language Models | cs.AI |
| [2610.39086v1](https://arxiv.org/abs/2610.39086v1) | HALO: Human-Grounded Granular Evaluation of Proactive Agents | cs.CL |

*最后更新: 2026-10-31*
