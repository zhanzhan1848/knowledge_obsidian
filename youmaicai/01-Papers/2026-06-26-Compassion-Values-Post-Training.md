# Domain-Dependent Degradation of Mid-Trained Compassion Values Under Post-Training

## 元信息
| 标题 | Helpfulness Hurts: Domain-Dependent Degradation of Mid-Trained Compassion Values Under Post-Training |
|------|-----|
| 作者 | Jasmine Brazilek, Juliana Seawell |
| 链接 | [原文](https://arxiv.org/abs/2606.26102) |
| arXiv | arXiv:2606.26102 |
| 领域 | cs.CL, cs.AI, cs.CY |
| 发表 | 2026-04-30 |

## 核心贡献
1. **Post-training 对 Mid-trained Values 的影响**: SFT 和 RL 可能损害预训练期间灌输的价值观
2. **Domain-dependent 效应**: helpfulness 训练显著降低动物同情心（coding 训练保留更好）
3. **跨语言泛化差异**: 动物同情效应跨语言一致迁移；道德推理效应仅在英语上显著
4. **实践建议**: 基于价值的中期训练模型，coding-domain post-training 比 helpfulness post-training 更好地保留价值

## 实验设置
- Base model: Llama 3.1 8B（中期在 compassion-oriented 合成数据上训练）
- SFT: Dolly-15k (helpfulness) vs Magicoder-110K (coding)
- GRPO: RLHFlow (helpfulness) vs Magicoder (coding)
- 评估: Animal Harm Benchmark (AHB 2.2), MORU benchmark

## 核心数据
| 训练方式 | Helpfulness | Coding |
|---------|-------------|--------|
| SFT (AHB) | 35.7% | 65.2% |
| GRPO (AHB) | 18.7% | 32.0% |
| SFT (MORU 英语) | 46.4% | 71.9% |

## 理论意义
Mid-training 灌输的价值观以比领域特定 post-training 更深、更跨语言的方式编码

## 标签
#LLM #fine-tuning #RLHF #values #alignment #SFT