# Self-Distillation Zero: Self-Revision Turns Binary Rewards into Dense Supervision

## 元信息
| 标题 | Self-Distillation Zero: Self-Revision Turns Binary Rewards into Dense Supervision |
|------|-----|
| 作者 | Yinghui He, Simran Kaur, Adithya Bhaskar, Yongjin Yang, Jiarui Liu, Narutatsu Ri, Liam Fowl, Abhishek Panigrahi, Danqi Chen, Sanjeev Arora |
| 链接 | [原文](https://arxiv.org/abs/2604.12002) |
| arXiv | arXiv:2604.12002 |
| 代码 | - |

## 核心贡献
1. 提出 **Self-Distillation Zero (SD-Zero)**，一种无需外部教师或高质量示范的自训练方法
2. 将二元奖励（binary reward）转化为密集的 token 级自监督信号
3. SD-Zero 训练单个模型同时扮演 Generator 和 Reviser 两个角色

## 方法

### 核心思想
- **Generator**: 生成初始响应
- **Reviser**: 基于 Generator 的响应和二元奖励生成改进响应
- 通过 on-policy self-distillation 将 Reviser 的 token 分布蒸馏回 Generator

### 关键特性
1. **Token-level Self-localization**: Reviser 能识别 Generator 响应中需要修订的关键 token
2. **Iterative Self-evolution**: 修订能力可逐步蒸馏回生成性能

## 实验结果
- 在 Qwen3-4B-Instruct 和 Olmo-3-7B-Instruct 上测试
- 数学和代码推理基准测试中，比基线模型提升至少 **10%**
- 优于 RFT、GRPO、SDFT 等强基线

## 相关领域
- RLHF (Reinforcement Learning from Human Feedback)
- Self-Distillation
- Instruction Tuning
- Reasoning

## 关键词
#fine-tuning #RLHF #self-distillation #reasoning #LLM
