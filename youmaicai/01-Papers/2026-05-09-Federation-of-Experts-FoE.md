# Federation of Experts (FoE): Communication Efficient Distributed Inference for LLMs

## 元信息
| 标题 | Federation of Experts: Communication Efficient Distributed Inference for Large Language Models |
|------|------|
| 作者 | Muhammad Shahir Abdurrahman, Chun Deng, Azalia Mirhoseini, Philip Levis (Stanford University) |
| 链接 | [原文](https://arxiv.org/abs/2605.06206) |
| arXiv | arXiv:2605.06206 |
| 代码 | 待发布 |
| 会议/期刊 | 待投稿 |

## 核心贡献
1. 提出 Federation of Experts (FoE) 架构，将 MoE block 重构为多个独立的 MoE clusters
2. 每个 cluster 负责一组 KV heads，expert parallelism 在集群内部执行
3. 单节点完全消除 all-to-all 通信；多节点将 all-to-all 通信限制在节点内部

## 核心问题
MoE 在分布式部署中的 token embedding 通信是主要瓶颈。在多节点设置中，节点间 InfiniBand 带宽（400 Gb/s）远低于节点内 NVLink（900 GB/s），差距约 18 倍。通信开销占端到端延迟的 68%+。

## 架构设计
- 将标准 MoE 的单一 EP group 拆分为 H 个独立的 expert groups
- 每个 group 拥有 1/H 的 KV heads 和 1/H 的 experts，运行在独立 GPU 子集
- 不执行全局 top-k 路由，而是在每个 group 内执行 per-group 路由（每 token 每层选择 k/H experts）
- 各 group 通过轻量级 cross-group all-reduce 同步 post-attention residuals

## 实验结果
在 LongBench 数据集上的结果：
- 端到端 forward-pass latency 降低最多 **5.2×**
- TTFT (Time-to-First-Token) 降低最多 **3.62×**
- TBT (Time-Between-Tokens) 降低最多 **1.95×**
- 生成质量与同规模 MoE 模型相当

## 关键技术指标
- **Local Activation Rate (LAR)**: 本地解决的 expert 选择比例，FoE 结构性保证高 LAR
- 负载均衡：FoE 结构性地在 GPU 间均匀分布负载

## 建议
- 是否推荐使用：**是**
- 适用场景：大规模 MoE LLM 分布式推理加速，特别是多节点部署场景