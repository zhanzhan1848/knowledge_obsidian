# EVOTS: Evolutionary Transformer Search for Time Series Forecasting

## 元信息
| 标题 | EVOTS: Evolutionary Transformer Search for Time Series Forecasting |
|------|------|
| 作者 | AbdElRahman ElSaid, Damir Pulatov |
| 链接 | [原文](https://arxiv.org/abs/2607.00154) |
| arXiv | arXiv:2607.00154 [cs.LG] |
| 发表 | 2026-06-30 |

## 核心贡献

1. **首个多变量时间序列预测的进化神经架构搜索框架**：发现任务自适应的 Transformer-like 模型
2. **模块化基因组表示**：可灵活组合 attention、feed-forward、projection 组件
3. **结构有效性强制机制**：通过 repair mechanism 确保进化过程中的结构有效性

## 核心问题

- 现有时间序列预测大多依赖固定 Transformer 架构
- 不同任务和预测设置之间存在实质性差异
- 手工设计架构耗时且难以泛化

## EVOTS 方法

### 基因组编码

```genome = {
  attention_components: [...],
  feed_forward_components: [...],
  projection_components: [...]
}
```

### 进化过程

1. **Mutation**：随机修改组件
2. **Crossover**：组合父代基因组
3. **Repair**：修复无效结构
4. **Selection**：基于验证集性能选择

## 实验

### 数据集

ETT family: ETTh1, ETTh2, ETTm1, ETTm2

### 预测设置

- Univariate → Univariate
- Multivariate → Univariate
- **Multivariate → Multivariate**（主要设置）

### 预测跨度

96, 192, 336, 720

### 结果

- 在 multivariate-to-multivariate 设置下，进化出的架构达到或超越强 Transformer 基线
- 某些情况下 MSE 显著改善
- Wall-clock 训练时间在实用范围内

## 建议

- **是否推荐使用**：是
- **适用场景**：时间序列预测、Transformer 架构自动化设计
- **使用建议**：可作为 AutoML 流程的一部分

## 标签
#transformer #neural-architecture-search #time-series #evolutionary-algorithm
