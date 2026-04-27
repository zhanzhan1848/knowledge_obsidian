# Incentivizing Neuro-symbolic Language-based Reasoning in VLMs via Reinforcement Learning

## 元信息
| 标题 | Incentivizing Neuro-symbolic Language-based Reasoning in VLMs via Reinforcement Learning |
|------|-------|
| 作者 | Karthic Palaniappan |
| 链接 | [原文](https://arxiv.org/abs/2604.22062) |
| arXiv | arXiv:2604.22062 |
| 代码 | [GitHub](https://github.com/i-like-bfs-and-dfs/wolfram-reasoning) |
| 分类 | cs.CL |

## 核心贡献

1. **神经符号语言推理**: 探索 VLM 中神经符号语言的视觉-语言概念表示和推理
2. **RL 激励推理**: 使用强化学习激励 VLM 中的符号化推理能力
3. **效率提升**: 在 Qwen3-VL-2B-Instruct 上实现推理 tokens 减少 75%

## 实验设置

- **基础模型**: Qwen3-VL-2B-Instruct
- **硬件**: 4 × Nvidia H200 GPU nodes
- **评估集**: 数学、科学、常识问题的 VLM 评估集

## 核心结果

| 指标 | 数值 |
|------|------|
| 准确率提升 | +3.33% |
| 推理 tokens 减少 | 75%（相比 SymPy） |

## 核心方法

1. **神经符号语言**: 使用类 Heptapod（非顺序语言）风格的符号表示
2. **RL 训练**: 通过强化学习激励符号化推理
3. **思考效率优化**: 减少推理 tokens 同时保持/提升准确率

## 建议
- **适用场景**: VLM 推理效率优化、神经符号推理研究
- **推荐指数**: ⭐⭐⭐ (有趣但非核心论文)
