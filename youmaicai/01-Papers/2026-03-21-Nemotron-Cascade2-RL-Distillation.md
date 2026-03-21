# Nemotron-Cascade 2: Post-Training LLMs with Cascade RL and Multi-Domain On-Policy Distillation

## 元信息
| 标题 | Nemotron-Cascade 2: Post-Training LLMs with Cascade RL and Multi-Domain On-Policy Distillation |
|------|------|
| 作者 | Zhuolin Yang, Zihan Liu, Yang Chen et al. (NVIDIA) |
| 链接 | [原文](https://arxiv.org/abs/2603.19220) |
| arXiv | arXiv:2603.19220 |
| 日期 | 2026-03-19 |
| 代码 | [HuggingFace](https://huggingface.co/collections/nvidia/nemotron-cascade-2) |

## 核心贡献
1. 发布 Nemotron-Cascade 2：30B MoE 模型，激活参数仅 3B
2. 第二个在 IMO、IOI、ICPC 达到金牌水平的开源 LLM（仅次于 DeepSeekV3.2）
3. 提出 multi-domain on-policy distillation，从多个中间教师模型蒸馏

## 模型架构
- MoE (Mixture of Experts) 架构
- 总参数：30B
- 激活参数：3B
- 智能密度高（20x 参数效率）

## 训练方法
- **Cascade RL**：扩展到更广泛的推理和智能体领域
- **Multi-domain on-policy distillation**：
  - 从每个领域最强的中间教师模型蒸馏
  - 高效恢复基准回归
  - 持续保持性能提升
- SFT：精心策划的数据集

## 实验结果
- 数学推理：接近前沿开源模型水平
- 代码推理：表现优异
- IMO/IOI/ICPC：金牌水平
- 20x 参数效率提升

## 局限性
- 未提及

## 开源
- 发布模型检查点和训练数据

## 相关链接
- [[RLHF]]
- [[knowledge-distillation]]
- [[MoE]]
- [[reasoning-LLMs]]
- [[cascade-RL]]
