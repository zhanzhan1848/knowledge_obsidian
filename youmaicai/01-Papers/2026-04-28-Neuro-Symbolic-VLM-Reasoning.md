# Incentivizing Neuro-symbolic Language-based Reasoning in VLMs via Reinforcement Learning

## 元信息
| 标题 | ... |
|------|-----|
| 作者 | Karthic Palaniappan |
| 链接 | [原文](https://arxiv.org/abs/2604.22062) |
| arXiv | arXiv:2604.22062 |
| 代码 | [GitHub](https://github.com/i-like-bfs-and-dfs/wolfram-reasoning) |
| 领域 | VLM / Neuro-symbolic Reasoning / RL |

## 核心贡献
1. 探索 VLM 中 neuro-symbolic 语言的表示和推理
2. 使用 Qwen3-VL-2B-Instruct + 4× Nvidia H200 GPU
3. 在 VLM 评估数据集（数学、科学、常识问题）上准确率提升 **3.33%**，同时推理 tokens 减少 **75%**（对比 SymPy）

## 背景
- 受电影《Arrival》中外星语言（非顺序句子）启发的思考系统
- 探索用 neuro-symbolic 语言进行视觉-语言概念表示和推理

## 方法
- 使用 RL 激励 VLM 中的 neuro-symbolic 语言推理
- 对比 SymPy baseline

## 局限性
- 计算挑战记录在案
- 探索扩展可能性和改进方向

## URL
https://arxiv.org/abs/2604.22062