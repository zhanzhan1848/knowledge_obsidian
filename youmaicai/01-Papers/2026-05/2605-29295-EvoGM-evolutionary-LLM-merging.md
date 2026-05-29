# EvoGM: Learning to Merge LLMs via Evolutionary Generative Optimization

## 基本信息
| 标题 | EvoGM: Learning to Merge LLMs via Evolutionary Generative Optimization |
|------|--------------------------------------------------------------------|
| 作者 | Tao Jiang, Xinmeng Yu, Chenhao Yi, et al. |
| 链接 | [原文](https://arxiv.org/abs/2605.29295) |
| arXiv | arXiv:2605.29295v1 |
| 代码 | [GitHub](https://github.com/JiangTao97/evogm) |
| 会议 | ICML 2026 |
| 领域 | cs.NE |

## 核心贡献

1. **问题**：现有模型合并方法依赖随机手工算子，忽略系数空间的潜在性能景观
2. **EvoGM 框架**：使用可学习的生成模型优化合并系数，超越手工启发式
3. **双生成器架构 + 循环一致性学习**：自适应采样并优化有前景的合并候选
4. **Winner-Loser Pairs**：从历史搜索轨迹构建，有效捕获高性能参数分布
5. **多轮进化管道**：精英合并模型迭代作为新专家基础

## 核心创新

```math
\text{EvoGM} = \text{Dual-Generator} + \text{Cycle-Consistent Learning} + \text{Evolutionary Pipeline}
```

## 实验结果

- 在 seen 和 unseen 任务上均显著优于 SOTA 基线
- 跨不同基准测试的稳健性能

## 标签
#model-merging #evolutionary-computing #LLM-composition