# AdaGATE: Adaptive Gap-Aware Token-Efficient Evidence Assembly

## 元信息
| 标题 | AdaGATE: Adaptive Gap-Aware Token-Efficient Evidence Assembly for Multi-Hop Retrieval-Augmented Generation |
|------|------|
| 作者 | Yilin Guo, Yinshan Wang, Yixuan Wang |
| 链接 | [原文](https://arxiv.org/abs/2605.05245) |
| arXiv | arXiv:2605.05245 |
| 代码 | [GitHub](https://github.com/eliguo/AdaGATE) |
| 领域 | RAG, Multi-Hop QA |

## 核心贡献

1. **Gap-Aware Evidence Selection**: 将证据选择框定为 token 约束的修复问题，而非传统相关性优化
2. **Entity-Centric Gap Tracking**: 追踪实体级别知识缺口，生成针对性微查询
3. **Utility-Based Selection**: 平衡 gap 覆盖率、一致性、新颖性、冗余性、直接问题相关性
4. **无训练**: 完全无需训练的证据控制器

## 方法

AdaGATE 三个核心组件：

1. **Entity-Centric Gap Tracking**: 识别当前已收集证据未能覆盖的关键实体关系
2. **Targeted Micro-Query Generation**: 基于 gap 生成针对性小查询，从检索系统获取补充证据
3. **Utility-Based Selection**: 多维度评分选择最优证据组合

## 实验结果

- HotpotQA 三种设置（clean/redundancy/noise injected retrieval）：
  - Clean: **62.3%** evidence F1（最佳）
  - Redundancy injection: **71.2%** evidence F1
  - 仅需 **2.6x fewer input tokens** vs Adaptive-k

## 局限性

- 仅在 HotpotQA 验证，多跳场景泛化性待验证
- 依赖外部检索系统质量

## 关键词
`Multi-Hop RAG` `Evidence Assembly` `Gap Tracking` `Retrieval-Augmented Generation`

## 日期
2026-05-08