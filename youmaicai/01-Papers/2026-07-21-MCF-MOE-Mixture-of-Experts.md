# MCF-MOE: Multi-level Context Fusion for Mixture-of-Experts

## 元信息
| 标题 | Multi-level context Modeling for consistent expert selection in Mixture-of-Experts |
|------|------|
| 作者 | Shuhan Huang, Naifan Zhang, Yuanbo Tang, Yang Li, Wai Kin Victor Chan |
| 链接 | [原文](https://arxiv.org/abs/2607.16427) |
| arXiv | arXiv:2607.16427v1 |
| 代码 | [Anonymous 4Open Science](https://anonymous.4open.science/r/MCFMOE) |
| 领域 | cs.CL |
| 发表日期 | 2026-07-17 |

## 核心贡献
1. 识别"context incompleteness"作为限制有效专家专业化的关键瓶颈
2. 提出 MCF-MOE (Multi-level Context Fusion MOE)，通过跨层语义聚合和局部 token 级交互构建上下文感知表示
3. 实现更一致、更有信息的专家选择

## 问题背景
MoE 通过将 token 路由到专家小子集来实现 Transformer 模型的高效扩展。但现有路由器通常基于浅层或孤立的 token 表示进行专家选择，这常产生跨层不稳定且语义不一致的路由决策。

## 核心问题：Context Incompleteness
现有路由器专家选择的关键瓶颈：上下文不完整

## 解决方案：MCF-MOE

### 多层上下文融合
1. **跨层语义聚合**: 整合跨层语义信息
2. **局部 token 级交互**: 捕获局部 token 交互

### 效果
- 构建上下文感知表示
- 实现更一致、更有信息的专家选择

## 实验结果
- 语言建模基准
- 理解基准
- 持续改善路由一致性和下游性能
- 优于强 MoE 基线

## 关键洞察
> 上下文完整性对专家路由的重要性

## 建议
- **是否推荐使用**：是
- **适用场景**：MoE 架构优化、大模型效率、分布式 Transformer

---
*关键词*: Mixture-of-Experts, MoE, Transformer, Expert Routing, Context Modeling
