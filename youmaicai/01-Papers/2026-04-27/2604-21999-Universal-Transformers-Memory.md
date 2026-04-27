# Universal Transformers Need Memory: Depth-State Trade-offs in Adaptive Recursive Reasoning

## 元信息
| 标题 | Universal Transformers Need Memory: Depth-State Trade-offs in Adaptive Recursive Reasoning |
|------|-------|
| 作者 | Grigory Sapunov |
| 链接 | [原文](https://arxiv.org/abs/2604.21999) |
| arXiv | arXiv:2604.21999 |
| 代码 | [GitHub](https://github.com/che-shr-cat/utm-jax) |
| 分类 | cs.LG, cs.AI, cs.CL |

## 核心贡献

1. **记忆 tokens 必要性**: 记忆 tokens 对于单块 Universal Transformer (UT) + ACT 是经验性必要
2. **最优阈值效应**: T=0 始终失败，T=4 边缘，T=8 可靠成功，T=64 因注意力稀释崩溃
3. **路由器初始化陷阱**: >70% 训练运行失败源于 ACT 初始化问题，需"deep start"偏置 -3

## 关键实验结果

| 配置 | 性能 |
|------|------|
| T=0 (无记忆) | 完全失败 |
| T=4 | 边缘 |
| T=8-32 | 57.4% ± 0.7% exact-match |
| T=64 | 崩溃 |

### ACT vs 固定深度
| 方法 | 性能 |
|------|------|
| ACT | 56.9% ± 0.7% |
| 固定深度 | 53.4% ± 9.3% |

### Lambda Warmup
- 准确率匹配 (57.0% ± 1.1%)，同时减少 34% ponder steps

## 注意力头专门化

在递归深度上，注意力头专门化为：
1. **Memory Readers**: 读取记忆 tokens
2. **Constraint Propagators**: 传播约束
3. **Integrators**: 整合信息

## 路由器初始化陷阱

```
标准零偏置 (p ~ 0.5): 约 2 步后 halt，浅平衡 ~5-7 步
Graves 正偏置 (p ~ 0.73): 同上问题
Deep Start 偏置 -3 (p ~ 0.05): 消除失败模式
```

## 建议
- **适用场景**: Universal Transformer、ACT、递归推理架构研究
- **推荐指数**: ⭐⭐⭐⭐ (对 ACT 和记忆机制有深入洞察)
