# Decomposing Evolutionary Mixture-of-LoRA Architectures

## 元信息
| 标题 | Decomposing Evolutionary Mixture-of-LoRA Architectures: The Routing Lever, the Lifecycle Penalty, and a Substrate-Conditional Boundary |
|------|-------|
| 作者 | Ramchand Kumaresan |
| 链接 | [原文](https://arxiv.org/abs/2605.11153) |
| arXiv | arXiv:2605.11153 |
| 领域 | cs.CL, cs.LG, cs.NE |

## 核心贡献
在 ~150M 参数 widened-D substrate 上对 evolutionary mixture-of-LoRA 系统进行三因素分解：

### 三个因素
1. **Router rewrite**: parallel sigmoid gate + learnable per-adapter floor + bounded temperature anneal，接收 post-stack hidden states（而非 token-embedding means）
2. **Per-domain leave-one-out evaluation scope**
3. **Lifecycle**: death + alpha-blend inheritance + SVD mutation + slot reallocation

## 关键结果

### 5-of-8 partial 2³ factorial design
- n=3 seeds, 25000 adaptation steps per cell

### 归因链
| 因素 | 效果 | 统计显著性 |
|------|------|----------|
| Router rewrite | +0.0426 nat balanced log-PPL 改善 | t=12.86, p=0.006 |
| Per-domain evaluation | 在 seed 分辨率上为 null | - |
| Lifecycle | -0.028 nats 净拖累 | t=-4.46, p=0.047 |

### 重要发现
- 路由器 rewrite 携带了全部改善效果
- **Substrate-conditional regime boundary**：进化搜索在 routing channel 上仅在 adapters 预对齐任务时是 load-bearing；在其他所有 regime 下表现相当或更差

## 关键词
Mixture-of-LoRA, 路由器设计, 进化优化, LoRA, 参数高效微调