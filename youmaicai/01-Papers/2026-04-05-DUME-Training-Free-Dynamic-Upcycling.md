# DUME: Training-Free Dynamic Upcycling of Expert Language Models

## 元信息
| 标题 | Training-Free Dynamic Upcycling of Expert Language Models |
|------|------|
| 作者 | Gensyn AI (Eros et al.) |
| 链接 | [原文](https://arxiv.org/abs/2603.29765) |
| arXiv | arXiv:2603.29765 |
| 代码 | [github.com/gensyn-ai/dume](https://github.com/gensyn-ai/dume) |
| 发表 | 2026-03-31 |

## 核心贡献

1. **DUME (Dynamic Upcycling MoE)**：无需额外训练即可将多个领域专家模型合并为统一的多领域 MoE 模型
2. **基于岭回归闭合解的路由器初始化**：利用ridge回归的闭合解初始化MoE路由，无需微调即可接近或超越最佳单一领域专家
3. **支持增量学习**：可在之后动态添加新专家而不影响原有性能

## 模型架构

### MoErging 流程
1. 多个Dense专家在不同领域独立训练
2. 合并时：非MLP层（embedding、attention）参数取平均
3. MLP层转换为MoE experts，通过稀疏路由激活

```
MoEl(x) = ∑d=1^D [g(x; Wl)]d · E_dl(x)
g(x; Wl) = Top-k(Softmax(Wl^⊤ x))
```

### DUME 路由器初始化
利用岭回归闭合解：

```
W* = (X^⊤ X + λ IH)^(-1) X^⊤ Y
```

**核心思想**：用领域标签作为one-hot目标，用MoErging后冻结的hidden states作为输入，求解最优路由权重

**关键特性**：
- 无需训练即可使用
- 支持增量添加专家（sequential batch updates）
- 在因果语言建模中保留97.6%专家性能
- 在推理任务中达到102.1%专家性能

## 实验设置

| 模型 | 规模 | 领域 |
|------|------|------|
| LLaMA | 115M, 3B | 多领域 |

**基线对比**：
- Naive weight averaging
- Task Arithmetic
- Branch-Train-Mix (BTX)
- Mixture-of-Experts

## 核心创新点

1. **零训练成本**：利用岭回归闭合解，无需梯度优化
2. **隐私友好**：不需要聚合领域数据到中央节点
3. **可微调**：如需进一步提升，仍可对路由器进行微调

## 局限性

- 路由器初始化依赖于领域标签的获取
- Top-k=1 设置的适用性讨论

## 标签
#LLM #MoE #模型合并 #动态Upcycling #岭回归 #专家混合 #参数高效

## 相关论文
- Branch-Train-Mix (BTX) (sukhbaatar2024branch)
- MoErging
- 经典 transformer (vaswani2017attention)
- LLaMA (touvron2023llama)
