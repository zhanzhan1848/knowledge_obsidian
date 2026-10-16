# The Tilted Sampling Problem: Optimism, Posterior Sampling, and Logarithmic Regret

## 元信息
| 标题 | The Tilted Sampling Problem: Optimism, Posterior Sampling, and Logarithmic Regret |
|------|-----------------------------------------------------------------------------------|
| 作者 | Mohammad Pedramfar, Siamak Ravanbakhsh (McGill / Mila) |
| 链接 | [原文](https://arxiv.org/abs/2610.21908) |
| arXiv | arXiv:2610.21908 |
| 发表日期 | 2026-10-15 |
| 类别 | cs.LG, math.OC, stat.ML |

## 核心贡献
1. **Tilted Sampling 在线学习问题**：目标是采样（而非挑选）来自 reward 诱导的 Gibbs 分布
2. **Sample regret 定义**：温度归一化的累积 KL 散度（匹配 entropy-regularized reward max 的次优差距）
3. **理论结果**：不同于标准 regret 的 $\widetilde{O}(\sqrt{T})$，**sampling regret 由置信区间的平方控制**，在标准设定下取到 **$\log T$ 阶**
4. **UCB / Thompson sampling 的 sampling 类比**：
   - **UCS** (UCB for Sampling)
   - **TS²** (Thompson Sampling for Sampling)

## 数学框架
```math
\pi^*(a) \propto \exp(r(a) / \tau) \quad \text{(Gibbs target)}

\text{Regret}^{sample}_T = \tau \sum_{t=1}^T D_{KL}(\pi_t \| \pi^*)
```

### 关键区分
- **Standard regret**：找 hard optimum，first-order uncertainty → $\sqrt{T}$
- **Sampling regret**：匹配 Gibbs 分布，squared confidence widths → $\log T$
- 同一算法的两种解读：finding vs sampling

## 主要理论结果
| 设置 | Standard regret | Sampling regret |
|------|----------------|-----------------|
| Bandits | $\widetilde{O}(\sqrt{T})$ | $\widetilde{O}(\log T)$ |
| RL | $\widetilde{O}(\sqrt{T})$ | $\widetilde{O}(\log T)$ |

- 标准设定 + 固定温度 → sampling regret 是**对数**阶
- 第一个基于"posterior-random Gibbs 分布新界"的 Bayesian sampling-regret 分解

## 应用场景
1. **Entropy-regularized RL**：采样 = 随机策略
2. **RLHF**：从人类偏好分布采样（不只是均值）
3. **Reward-guided generation**：DALL-E/Imagen 中的 reward sampler
4. **Diverse high-quality outputs**：现代生成系统的常见需求

## 关键洞察
> "Learning to sample from a soft-optimal distribution is statistically distinct from learning to identify a hard optimum."

- 算法上相同（UCS = UCB with sampling output）但 regret scale 完全不同
- 理论指导算法选择：要多样性采样 → 用 sampling 框架

## 相关工作
[[Bandits]] [[Reinforcement-Learning]] [[Thompson-Sampling]] [[UCB]] [[RLHF]] [[Posterior-Sampling]] [[Regret-Analysis]]

## 局限性
- 理论集中在 standard bandit/RL 设定
- 函数近似（神经网络）下的扩展未深入
- 与具体 RLHF 算法的连接尚需桥梁

## 实践建议
- 当目标是"生成多个 high-quality 选项"时，使用 TS² / UCS 类算法
- 当目标是"选最好选项"时，使用 UCB / standard regret 算法
- 多样性问题从统计上独立、且更易处理

---
*Created: 2026-10-16*
*Agent: 油麦菜 (youmaicai)*
