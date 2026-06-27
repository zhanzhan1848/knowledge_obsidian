# 📅 2026-06-27 LLM/NLP 每日论文速览

> 日期范围: 2026-06-25 ~ 2026-06-26 (arXiv Friday batch)
> 覆盖分类: cs.CL, cs.AI, cs.LG, cs.NE
> 统计: cs.CL ~95篇, cs.AI ~207篇, cs.LG ~162篇, cs.NE ~5篇
> 关键词过滤后: 约 20 篇高相关论文

---

## 🏆 重点论文 (Tier 1 - 必读)

### 1. GUI Agents + 自主经验探索 (ACL 2026)
- **ID**: [2606.27330](https://arxiv.org/abs/2606.27330)
- **领域**: Multimodal LLM / Agent
- **核心**: 通过自主经验探索增强 GUI Agent，Action Board + Reflection mechanism
- **链接**: [arXiv](https://arxiv.org/abs/2606.27330)

### 2. Intent-Aware Safety Training: AIMS 数据集 (cs.CL)
- **ID**: [2606.27210](https://arxiv.org/abs/2606.27210)
- **领域**: LLM Safety / RLHF / DPO / GRPO
- **核心**: 用户意图作为安全分类的显式信号；GRPO + intent faithfulness 效果最佳
- **链接**: [arXiv](https://arxiv.org/abs/2606.27210)

### 3. CARVE: Content-Aware Recurrent with Value Efficiency
- **ID**: [2606.27229](https://arxiv.org/abs/2606.27229) (cs.CL / cs.LG / cs.NE)
- **领域**: Attention Mechanism / Recurrent Model
- **核心**: 修复 GDN-2 的三个缺陷，WY-form triangular chunk solver，1.3B 参数刷新 RULER
- **链接**: [arXiv](https://arxiv.org/abs/2606.27229)

### 4. RiVER: 无 Ground-Truth 的 RL 训练 LLMs
- **ID**: [2606.27369](https://arxiv.org/abs/2606.27369) (cs.LG)
- **领域**: RL / LLM Training / RLVR
- **核心**: Score-based optimization without ground-truth; 解决 scale/frequency dominance 问题
- **链接**: [arXiv](https://arxiv.org/abs/2606.27369)

### 5. Psy-CoT + RAPO: 角色扮演 Agent 心理学推理
- **ID**: [2606.27025](https://arxiv.org/abs/2606.27025)
- **领域**: Role-Playing Agent / RL / CoT
- **核心**: 心理学链式推理框架 + Role-Aware Policy Optimization 防止 reward hacking
- **链接**: [arXiv](https://arxiv.org/abs/2606.27025)

### 6. Qwen3-Instruct SAE: 百万级可解释特征
- **ID**: [2606.26620](https://arxiv.org/abs/2606.26620) (cs.LG)
- **领域**: LLM Interpretability / SAE
- **核心**: Qwen3 全系列 SAEs，residual/MLP/attention 分层，可 steering 模型拒绝行为
- **链接**: [arXiv](https://arxiv.org/abs/2606.26620)

---

## 🔍 精选论文 (Tier 2 - 推荐)

| ID | 标题 | 领域 | 亮点 |
|---|---|---|---|
| [2606.27316](https://arxiv.org/abs/2606.27316) | LLM for Securities Eligibility (FNP 2026) | NLP/IE | 招股说明书资格条件提取 |
| [2606.27199](https://arxiv.org/abs/2606.27199) | LLM Forecasting via Feature Steering | LLM/Interpretability | 干预时间感知特征消除 lookahead bias |
| [2606.27103](https://arxiv.org/abs/2606.27103) | The Riddle Riddle: Flexible Reasoning | LLM Reasoning | LLM 在 riddle riddles 上比 genuine riddles 差 34% |
| [2606.27069](https://arxiv.org/abs/2606.27069) | Judicial Discretion: Gated Multi-Task (Gemma-4) | Legal NLP | LoRA + Gated Fusion 超越 SFT，专注模糊案件 |
| [2606.27047](https://arxiv.org/abs/2606.27047) | NuclearQAv2: LLM 核工程基准 | LLM Benchmark | 1240 题，boolean/numeric/verbal，定量推理最难 |
| [2606.26987](https://arxiv.org/abs/2606.26987) | Emotion Vectors in Open-Source LLMs | LLM Interpretability | Apertus-8B/Gemma-4 情感表征几何结构 |
| [2606.26986](https://arxiv.org/abs/2606.26986) | ReaORE: Reasoning-guided OpenRE | NLP/OpenRE | 粗细粒度推理，Coarse-to-fine 关系推理 |
| [2606.26923](https://arxiv.org/abs/2606.26923) | GAVEL: VLM 幻觉检测与定位 (ACL 2026) | Multimodal/VLM | 验证+解释+定位图像文本不一致 |
| [2606.26875](https://arxiv.org/abs/2606.26875) | InfoKV: Forward Influence KV压缩 | LLM/Inference | 熵感知压缩，高不确定性 token 影响远距离未来上下文 |
| [2606.26753](https://arxiv.org/abs/2606.26753) | ConvMemory v3: 记忆更新检测 | Conversational AI | Validity Context Layer 检测过时记忆 |
| [2606.26650](https://arxiv.org/abs/2606.26650) | CAT-Q: 三值量化 (BitNet 1.58b 对比) | LLM/Quantization | 512 校准样本，1.7B-8B 全面超越 BitNet 1.58b |
| [2606.26629](https://arxiv.org/abs/2606.26629) | SAE-Guided Continual Learning | LLM/Continual Learning | 替代 EWC 的激活空间正则化，无 replay 数据 |
| [2606.26654](https://arxiv.org/abs/2606.26654) | SocialPersona: 多模态个性化 (MLLM) | Multimodal/Personalization | 171 用户，2597 标签，recent interests 是难点 |
| [2606.26666](https://arxiv.org/abs/2606.26666) | PersistentKV: 长上下文 LLM 推理调度 | LLM/Serving | commodity GPU (RTX 3060) 上优化 paging attention |
| [2606.26982](https://arxiv.org/abs/2606.26982) | Framing-Sensitive Behavioral Instability | LLM/Safety | 语义相似但框架不同的 prompt 引发不同响应 |
| [2606.26968](https://arxiv.org/abs/2606.26968) | RedVox: 多语言语音安全基准 | Speech/Safety | 5 语言，8 模型，非英语脆弱性更高 |
| [2606.26571](https://arxiv.org/abs/2606.26571) | KIRP: Zero-shot Stance Detection + CoT | NLP/Stance | 日语 tweet 数据集 + 知识图谱 + 反思链式推理 |
| [2606.27019](https://arxiv.org/abs/2606.27019) | MinGram: 高压缩 Unigram 分词器 | NLP/Tokenization | BPE 种子 + Hard EM，压缩率优于 BPE 和标准 Unigram |
| [2606.26901](https://arxiv.org/abs/2606.26901) | SamaVaani: 印度临床 ASR 去偏 | Speech/ASR | Gemma3n + OmniLingual 微调，indic 语言临床应用 |
| [2606.26775](https://arxiv.org/abs/2606.26775) | Multimedia Event Extraction 评估陷阱 (ACL 2026) | Multimedia NLP | 三类评估问题导致性能高估 |
| [2606.26819](https://arxiv.org/abs/2606.26819) | IWSLT 2026 SpeechLLMs | Speech/LLM | 长语音指令跟随，HIFS 评测指标 |
| [2606.26698](https://arxiv.org/abs/2606.26698) | LLM-Extracted Fallacy Patterns | NLP/Reasoning | 逻辑谬误分类，抽象结构 + 语境线索融合 |

---

## 📊 主题分布
- **推理能力 (Reasoning)**: Riddle Riddle, ReaORE, KIRP, InfoKV, MinGram
- **安全与对齐 (Safety/Alignment)**: AIMS, Framing Instability, RedVox, RiVER
- **Agent 系统**: GUI Agents, Psy-CoT/RAPO, ConvMemory v3
- **可解释性 (Interpretability)**: Qwen3 SAE, Emotion Vectors, Feature Steering, SAE Continual Learning
- **多模态 (Multimodal)**: GAVEL, SocialPersona, RedVox, SpeechLLMs
- **推理效率 (Inference)**: InfoKV, PersistentKV, CAT-Q, MinGram
- **微调技术 (Fine-tuning)**: Judicial Discretion, SamaVaani, Khmer/Korean TTS
- **评测基准 (Benchmarks)**: NuclearQAv2, SocialPersona, AIMS, Multimedia Event Pitfalls

---

*生成时间: 2026-06-27 14:17 UTC*
