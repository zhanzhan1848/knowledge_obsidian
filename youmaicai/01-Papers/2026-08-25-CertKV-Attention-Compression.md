# Beyond Sparse Weights: When Is Attention Compressible?

## 元信息
| 标题 | Beyond Sparse Weights: When Is Attention Compressible? |
|------|------|
| 作者 | Chiwun Yang |
| 链接 | [原文](https://arxiv.org/abs/2608.21541) |
| arXiv | arXiv:2608.21541v1 |
| 领域 | cs.LG, cs.CL |

## 核心贡献
1. **理论分析**: KV-cache 压缩不能仅用"几个大权重"论证——大权重可能不含最多质量、省略值可能相消、保留注意力输出不一定保留任务
2. **Global Score Gaps**: 用全局分数间隙而非阈值计数决定需保留多少 token
3. **CertKV**: 训练无关压缩器，每 head 保留一个 tail-summary slot，剩余按 value dispersion 分配

## 关键洞察
- 可压缩性依赖：质量、值、未来查询、任务——而非稀疏图外观
- 省略值的加权和是确切的缺失统计量

## 实验结果
- LongBench-v2: 9 项中 7 项 top-two
- 128K RULER: 保持领先压缩层
- 10x cache budget 实现于 packed Llama prototype

## 局限性
- 理论分析依赖特定假设
- 对动态查询模式可能效果下降

## 标签
#KV-Cache #Attention-Mechanism #Transformer-Optimization #Compression
