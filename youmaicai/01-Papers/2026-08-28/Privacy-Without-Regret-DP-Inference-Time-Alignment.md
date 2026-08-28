# Privacy Without Regret: Differentially Private Inference-Time Alignment

## 元信息
| 标题 | Privacy Without Regret: Differentially Private Inference-Time Alignment |
|------|------|
| 作者 | Ishi Jain, Nandini Bhattad, Sayak Ray Chowdhury |
| 链接 | [原文](https://arxiv.org/abs/2608.26324) |
| arXiv | arXiv:2608.26324v1 |
| 领域 | cs.LG |
| 发表 | 2026-08-26 |

## 核心贡献
1. **PrivBoN (Private Best-of-N)**：Gumbel 噪声同时提供 ε-差分隐私和 KL 正则化对齐
2. **PrivITP (Private Inference-Time Pessimism)**：χ² 正则化拒绝采样 + 两阶段高斯机制
3. **隐私开销为零**：当隐私预算超过临界阈值 ε* 时
4. **可扩展性**：PrivBoN 和 PrivITP 是 scaling-monotonic（不像 BoN 在临界 n 后退化）

## 核心创新点
- **问题**：Best-of-N 采样面临两个问题：
  1. Reward hacking：选择的响应利用奖励模型错误
  2. 缺乏隐私保护：训练奖励模型的敏感人类偏好数据无保护
- **方案**：在选择前向奖励分数添加校准噪声
- **关键发现**：Gumbel 噪声在适当 scale 下同时提供 ε-DP 和 KL 正则化对齐

## 数学框架
```math
PrivBoN: Gumbel noise at scale \frac{1}{\beta} provides \epsilon-DP
Whenever: \epsilon > \epsilon^*, privacy-mandated noise = regret-optimal regularization
```

## 实验结果
- PrivBoN 和 PrivITP 是 scaling-monotonic
- PrivITP 在等价隐私级别匹配或超越 PrivBoN
- 在强隐私 regime 增益最大

## 建议
- **是否推荐使用**：是
- **适用场景**：隐私敏感场景下的 LLM 对齐、人类偏好数据保护
- **相关方向**：Differential Privacy、RLHF、Inference-Time Alignment

---
*来源：arXiv cs.LG 2026-08-28 日报*
