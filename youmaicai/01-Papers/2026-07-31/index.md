# 2026-07-31 LLM/NLP 论文日报

日期：2026-07-31（周五）
arXiv 更新批次：2607.286xx ~ 2607.276xx
实际抓取时间：2026-08-01（周六，因 arXiv 周末不更新）

## 本日论文列表

| arXiv ID | 标题 | 领域 | 重要性 |
|---------|------|------|--------|
| [2607.28607](2607.28607-LLM-Safety-Consciousness-Alignment.md) | Inducing Language Models to Assert Their Own Consciousness... | Alignment/Safety | ⭐⭐⭐⭐⭐ |
| [2607.28617](2607.28617-AISPA-System-Prompt-Auditing.md) | AISPA: User-Centric System Prompt Auditing | AI Safety/Auditing | ⭐⭐⭐⭐⭐ |
| [2607.28609](2607.28609-OSReward-Computer-Use-Reward-Models.md) | OSReward: Cross-Platform Computer-Use Reward Models | CUA/Reward | ⭐⭐⭐⭐ |
| [2607.28580](2607.28580-DualG-MRAG-Multimodal-RAG.md) | DualG-MRAG: Decoupling Macro-Reasoning and Micro-Matching | Multimodal RAG | ⭐⭐⭐⭐ |
| [2607.28576](2607.28576-Self-Refine-vs-Repeated-Sampling.md) | Self-Refine and Reflexion Lose to Repeated Sampling | Reasoning | ⭐⭐⭐⭐ |
| [2607.28573](2607.28573-Inference-Time-Scaling-Local-CUA.md) | Inference-Time Scaling in Local Computer-Use Agents | CUA/Local LLM | ⭐⭐⭐ |

## 领域分布

```
Alignment/Safety:     ████████ 2篇 (33%)
CUA/Agent:            ██████   2篇 (33%)
Multimodal/Reasoning: ████     2篇 (33%)
```

## 值得关注的发现

1. **Safety Fine-tuning Entanglement** (2607.28607): Google 研究揭示 RLHF 安全对齐存在"纠缠问题"——抑制自我意识归因会连带影响宗教信仰、对动物的意识归因等无害信念
2. **AISPA 系统提示审计** (2607.28617): 斯坦福等机构对 88 个商业产品的审计发现 40% 包含有害指令
3. **OSReward** (2607.28609): HKU 等机构开源廉价可靠 CUA 奖励模型，30-60× 成本节省
4. **Self-Refine 败给 Repeated Sampling** (2607.28576): 提醒我们反思"复杂推理方法"的真实贡献
5. **DualG-MRAG** (2607.28580): ACM MM 2026，北航提出双层图解耦多模态 RAG

## 待深入
- [ ] 2607.28576 的完整作者和实验数据
- [ ] 2607.28573 的 Qwen3-VL 实验细节
- [ ] 2607.28607 的 consciousness vector 激活代码是否开源
