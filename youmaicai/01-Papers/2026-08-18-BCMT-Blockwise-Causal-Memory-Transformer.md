# BCMT: Blockwise Causal Memory Transformer

## 元信息
| 标题 | BCMT: Blockwise Causal Memory Transformer |
|------|-----|
| 作者 | Rachid Arezki |
| 链接 | [原文](https://arxiv.org/abs/2608.13578) |
| arXiv | arXiv:2608.13578 |
| 代码 | https://github.com/rachidlabs/BCMT |
| 领域 | cs.CL, cs.AI, cs.LG |

## 核心贡献
1. **解耦局部 token 交互与全局上下文传播**，解决 Transformer 的二次复杂度问题
2. **指数因果记忆**：每个块生成自适应摘要，通过指数因果记忆聚合，再注入回 token 表示
3. 无需显式全局注意力的高效长程上下文传播
4. 完全可并行化，与标准 dense self-attention 实现兼容

## 模型架构
```
输入序列 → 分块
  ↓
每块内：Dense Causal Self-Attention（局部）
  ↓
每块 → 自适应摘要（Exponential Causal Memory）
  ↓
摘要注入回 token 表示
  ↓
高效长程上下文传播（无需全局注意力）
```

**关键特性**：
- 不维护远距离 token 之间的密集交互
- 不维护学习记忆状态
- 记忆机制完全可并行化

## 实验结果
- 上下文长度达 1024 tokens 的语言建模任务
- BCMT 达到与 Dense Transformer 相当的验证性能
- **训练吞吐量显著提升**
- **内存消耗降低**
- 消融实验证实改进来自提出的记忆机制

## 公式
- 指数因果记忆聚合：每块生成 summary，通过指数加权聚合历史信息
- 记忆注入：summary 注入回 token 表征

## 局限性
- 最大 1024 tokens 上下文验证，更长上下文需进一步验证
- 与标准 Transformer 相比架构更复杂

## URL
- GitHub: https://github.com/rachidlabs/BCMT
