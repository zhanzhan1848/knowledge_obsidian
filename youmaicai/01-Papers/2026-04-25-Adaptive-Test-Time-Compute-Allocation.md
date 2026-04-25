# Adaptive Test-Time Compute Allocation with Evolving In-Context Demonstrations

## 元信息
| 标题 | Adaptive Test-Time Compute Allocation with Evolving In-Context Demonstrations |
|------|------|
| 作者 | Bowen Zuo et al. |
| 链接 | [原文](https://arxiv.org/abs/2604.21018) |
| arXiv | arXiv:2604.21018 |
| 发表 | cs.AI |

## 核心贡献
1. **自适应测试时计算分配框架**：同时适应计算花在哪里（where）和如何生成（how）
2. **Warm-up Phase**：识别简单查询，从测试集本身组装初始 question-response 对池
3. **Evolving In-Context Demonstrations**：在语义相关查询的成功响应上条件化生成，而非从固定分布重采样
4. **显著降低推理计算成本**：在数学、编程、推理 benchmark 上一致超越基线，同时消耗更少推理时间

## 现有方法局限
- 静态计算分配
- 从固定生成分布采样

## 方法流程

### Phase 1: Warm-up
1. 识别简单查询
2. 从测试集组装初始 question-response pairs 池

### Phase 2: Adaptive
1. 对未解决查询集中更多计算
2. 通过 evolving in-context demonstrations 重塑生成分布
3. 在语义相似查询的成功响应上条件化每次生成

## 实验
- **Benchmarks**：数学、编程、推理
- **结果**：一致超越现有基线，且推理时计算消耗显著更少

## 核心洞察
现有测试时计算方法要么分配固定计算量，要么从固定分布采样。本文利用查询间的语义相似性，通过成功案例动态调整生成条件，实现计算的自适应高效分配。

## 局限性
- Warm-up 阶段需要一定初始数据池
- 语义相似性度量选择影响效果
- 对高度新颖/罕见的查询可能效果有限

## 建议
- **适用场景**：推理效率优化、Test-time Compute Scaling、Inference Optimization
- **推荐程度**：⭐⭐⭐⭐ — 解决 test-time compute 的关键痛点（静态分配问题）
