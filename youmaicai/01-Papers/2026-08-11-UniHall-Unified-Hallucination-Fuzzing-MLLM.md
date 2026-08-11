# UniHall: Unified Hallucination Fuzzing for Multimodal Large Language Models

## 元信息
| 标题 | Unified Hallucination Fuzzing for Multimodal Large Language Models |
|------|-----|
| 作者 | Pengfei Zhou, Jiajun Song, Zhiwei Tang, Yixing Ma, Xiaopeng Peng, Donghui Si, Yuhang Xu, Huiqi Song, Yiyuan Miao, Yichen Qian, Weihua Chen, Wangbo Zhao, Bohan Zhuang, Jiasheng Tang, Yang You |
| 链接 | [原文](https://arxiv.org/abs/2608.07525) |
| arXiv | arXiv:2608.07525 |
| 代码 | [EvalHall](https://github.com/LanceZPF/EvalHall) |

## 核心贡献

1. **UniHall**: 细粒度幻觉评估数据集，基于 Object、Instruction、Knowledge 三个维度构建统一分类体系
2. **SAMF (Self-Adaptive Multimodal Fuzzing)**: 自适应多模态模糊测试框架，采用进化变异策略探索模型幻觉边界
3. **多模态 Oracle 集成度量套件**: 确保动态输入的可靠评估

## 核心发现

- 最先进的 MLLM 在模糊测试下相比传统设置出现显著性能下降
- **推理能力与事实 grounding 之间存在解耦** (dissociation)
- **Helpfulness-Hallucination Trade-off**: RL 对齐会无意中加剧指令跟随任务中的谄媚倾向 (sycophancy)

## 关键结论

- 现有静态基准测试覆盖范围窄、性能饱和快，无法反映真实场景鲁棒性
- 进化模糊测试揭示了当前 MLLM 的能力与事实准确性之间的差距

## 局限性

- 基准测试和代码见 GitHub: https://github.com/LanceZPF/EvalHall

## 相关领域
[[multimodal]] [[LLM evaluation]] [[hallucination]] [[RLHF]] [[fuzzing]]

---
*🥬 LLM/NLP Paper | 2026-08-11*
