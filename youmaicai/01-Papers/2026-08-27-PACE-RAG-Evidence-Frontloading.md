# PACE: Relieving RAG Bottlenecks via Evidence Frontloading and Pressure-Adaptive Budgeting

## 元信息
| 标题 | Less can be More: Relieving RAG Bottlenecks via Evidence Frontloading and Pressure-Adaptive Budgeting |
|------|------|
| 作者 | Weibin Cai et al. |
| 链接 | [原文](https://arxiv.org/abs/2608.25115) |
| arXiv | arXiv:2608.25115 |
| 分类 | cs.CL, cs.IR |

## 核心贡献
1. **揭示 RAG 瓶颈漂移现象**：在不同服务负载和重排预算下，RAG 的瓶颈会从上游重排转移到下游生成
2. **提出 PACE 框架**：结合 evidence frontloading 和 pressure-adaptive budgeting
3. **次模性理论保证**：证明贪婪选择可达 (1-1/e) 的近似比

## 核心洞察

### 瓶颈漂移
```
高查询率 / 大重排预算 → 上游重排成为瓶颈
低查询率 / 小重排预算 → 下游生成成为瓶颈
```
减少重排预算可以缓解上游瓶颈，但可能丢失支撑证据、降低召回率。

## PACE 方法

### 1. Evidence Frontloading（证据前置）
目标：优先选择 query-relevant、complementary、能形成多跳证据链的文档

特点：
- **单调次模函数**：最大化边际证据覆盖
- **贪婪近似保证**：(1-1/e) approximation
- **覆盖指标**：互补性、多跳链形成能力

### 2. Pressure-Adaptive Budgeting（压力自适应预算）
动态调整重排预算，根据 reranker 和 LLM 的相对压力分配资源。

## 实验结果
- **数据集**：3 个多跳 QA 数据集 + 在线服务模拟
- **指标**：证据召回率、p95 延迟
- **结论**：「少即是多」——证据密集的 top-k 候选可以用更少重排文档达到更高最终召回

## 关键结论
> Less can be more: 密集证据的 top-k 候选能在更少重排文档下实现更高最终召回

## 建议
- **是否推荐使用**：是（PACE 为训练无关框架，易于部署）
- **适用场景**：高负载 RAG 系统、多跳问答

## 相关研究
- RAG: [[Retrieval-Augmented Generation]]
- Multi-hop QA: [[Multi-hop Question Answering]]

---
*标签*: #RAG #evidence-frontloading #retrieval #efficiency #cs.CL
