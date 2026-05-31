# Entropy-Cut MH: Reasoning with Sampling at Decision Points

## 元信息
| 标题 | Reasoning with Sampling: Cutting at Decision Points |
| 作者 | Anay Mehrotra et al. |
| 发表 | Preprint |
| 链接 | [原文](https://arxiv.org/abs/2605.30327) |
| arXiv | arXiv:2605.30327 |

## 核心贡献
1. **问题**：从 power分布采样需要高效地在目标分布的模式间移动（mixing）
2. **现有方法局限**：先前方法在推理轨迹中统一随机选择"cut"位置并重采样后缀——这倾向于重写局部细节而非重新访问决策点
3. **关键观察**：推理轨迹只有少数关键决策点（proof strategy、algorithm 选择），熵跃点是决策点的有效代理
4. **提出 Entropy-Cut Metropolis-Hastings**：使用 base model 的 next-token 熵作为代理来识别关键决策点并从这些位置重采样

## 核心机制

```
Uniform cut → Rewrites local details
Entropy-cut → Revisits key decision points

Entropy jump = proxy for decision points
Mixing time ∝ number of decisions (not tokens)
```

## 理论证明
- 在推理的风格化模型中，方法 mixing time 与轨迹中的决策数成比例（而非 token 数）
- Token 数可能远大于决策数

## 实验结果
- MATH500, HumanEval, GPQA Diamond, AIME26
- 一致地超越基线和 RL 训练的模型

## 与 RL 的关系
- 挑战了"frontier reasoning models 需要 RL posttraining"的观点
- 证明从 power分布采样可获得可比推理能力，无需额外训练、策划数据集或验证器

## 标签
#sampling #reasoning #Metropolis-Hastings #decision-points