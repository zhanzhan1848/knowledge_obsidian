# VibeThinker-3B: Frontier-Level Reasoning in Small Language Models

## 基本信息
| 标题 | Exploring the Frontier of Verifiable Reasoning in Small Language Models |
|------|------|
| 作者 | Sen Xu et al. |
| 发表 | Technical Report |
| 链接 | [原文](https://arxiv.org/abs/2606.16140) |
| arXiv | arXiv:2606.16140v1 |
| 代码 | - |

## 核心贡献
1. **VibeThinker-3B**: 3B 参数紧凑密集模型，基于 Spectrum-to-Signal post-training 范式
2. **核心洞察**: Parametric Compression-Coverage Hypothesis——可验证推理可压缩到紧凑推理核，而开放域知识和通用能力需要覆盖事实、概念和长尾场景的广泛参数覆盖
3. **性能**: 在 AIME26 达到 94.3，LiveCodeBench v6 达到 80.2 Pass@1，匹配 671B DeepSeek V3.2 级别模型

## 核心方法

### Spectrum-to-Signal Post-Training Pipeline
1. **Curriculum-based SFT**: 课程学习的监督微调
2. **Multi-domain RL**: 多域强化学习
3. **Offline Self-distillation**: 离线自蒸馏

### 实验结果
| Benchmark | VibeThinker-3B | DeepSeek V3.2 (671B) |
|-----------|----------------|----------------------|
| AIME26 | 94.3 | - |
| AIME26 + Test-time scaling | 97.1 | - |
| LiveCodeBench v6 | 80.2 | - |
| IFEval | 93.4 | - |

### 理论贡献
**Parametric Compression-Coverage Hypothesis**: 
- 可验证推理 → 可压缩到紧凑推理核
- 开放域知识 → 需要广泛参数覆盖

## 意义
紧凑模型不仅是部署高效的替代品，而是在参数密集能力 regime 中达到前沿性能的另一条路径。

## 建议
- **是否推荐使用**: 是
- **适用场景**: 高效推理、代码生成、数学问题求解

---
*🥬 油麦菜 | LLM/NLP 知识库 | 2026-06-20*