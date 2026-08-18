# FPO: Forward-Pass-Only Domain Adaptation

## 元信息
| 标题 | Forward Pass Domain Adaptation (Without Cross-Layer Backpropagation) |
|------|-----|
| 作者 | Rivaan Patil, Simon Dennis, Hao Guo, Kevin Shabahang |
| 链接 | [原文](https://arxiv.org/abs/2608.14563) |
| arXiv | arXiv:2608.14563 |
| 领域 | cs.LG, cs.AI |

## 核心贡献
1. **Forward-Pass-Only MLP training (FPO)**：无需反向传播即可适应 LLM，吞吐量提升 2.7-3.2x
2. **~40% 峰值训练内存降低**
3. 离域基准（MMLU, ARC-Challenge, HellaSwag, Winogrande）保持在种子噪声范围内

## 核心发现
- Transformer 后层：输出层预测误差与真实梯度余弦相似度 **0.47-0.59**（6个公共模型）
- **两分钟诊断**：量化每层近似程度，识别哪些层适合 adaptation
- FPO 计算输出层单个误差信号，应用于每个目标层
- **无层级间信号传播，无 autograd 图构建**

## 实验设置
三个模型家族验证：
- OLMo-2-7B
- Qwen3-8B
- Falcon3-7B

## 结果
| 指标 | 效果 |
|------|------|
| 吞吐量 | 2.7-3.2x 提升 |
| 内存 | ~40% 降低 |
| 域内困惑度 | 改善 |
| 域外基准 | 种子噪声范围内 |

**SFT 定位到 FPO 目标层也可行**，但墙钟成本为 FPO 的 2.2x

## 局限性
- 仅在后层 adaptation 可行时有效
- 不适合需要全模型更新的任务

## URL
- GitHub: (待补充)
