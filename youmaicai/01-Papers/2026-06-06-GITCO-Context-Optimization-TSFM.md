# GITCO: Gated Inference-Time Context Optimization in TSFMs

## 元信息
| 标题 | GITCO: Gated Inference-Time Context Optimization in TSFMs |
|------|------|
| 作者 | Manya Pandey, Dhruv Kumar, Murari Mandal, Saurabh Deshpande |
| 链接 | [原文](https://arxiv.org/abs/2606.05332) |
| arXiv | arXiv:2606.05332 |
| 领域 | cs.AI |
| 发表 | 2026-06-03 |
| 会议 | ICML 2026 Workshop on Foundation Models for Structured Data |

## 核心贡献

1. **解决 context poisoning 问题**：结构异常 patch 捕获过多注意力，静默降低零样本预测质量
2. **提出 GITCO 框架**：无需参数更新的轻量级三组件框架
3. **引入 context sensitivity profiles**：可表征的属性，映射时间序列元特征到推理时间上下文干预下的预期精度提升

## 核心问题

Patch-based Time Series Foundation Models (TSFMs) 存在 context poisoning：
- 结构异常 patch 捕获不成比例的注意力
- 静默降低零样本预测质量

## GITCO 三组件

1. **Gate**: 选择性识别和抑制有害 patch
2. **Router**: 路由信息
3. **Critic**: 评估 patch 重要性

### 关键特性
- 无需任何参数更新
- 在推理时优化输入上下文而非修改模型权重

## 实验结果

- **数据集**: TimesFM 2.5，53 个 GIFT-Eval 数据集，K-fold 交叉验证
- **MASE 降低**: 平均 +1.95%
- **改进上限捕获**: 89.9%

## Context Sensitivity Profiles

定义为：时间序列元特征到推理时间上下文干预下预期精度提升的映射。

由模型架构和数据统计结构共同塑造。

## URL
- 原文: https://arxiv.org/abs/2606.05332