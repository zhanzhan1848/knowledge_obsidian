# CARVE: Content-Aware Recurrent with Value Efficiency for Chunk-Parallel Linear Attention

## 元信息
| 标题 | CARVE: Content-Aware Recurrent with Value Efficiency for Chunk-Parallel Linear Attention |
|------|-----|
| 作者 | Sayak Dutta |
| 链接 | [原文](https://arxiv.org/abs/2606.27229) |
| arXiv | arXiv:2606.27229 |
| 领域 | cs.CL, cs.AI, cs.LG, cs.NE |
| 发表 | 2026-06-25 |

## 核心贡献
1. **解决 GDN-2 三大耦合缺陷**: Memory-blind gating, value-axis erase mask, WY-form solver invalidation
2. **核心原则**: 仅在 key axis 上执行 erase（ provably necessary and sufficient for WY-form solver）
3. **Content-aware Gating**: 复用 recurrent output tensor 作为 erase gate 的 free content signal
4. **Value Efficiency**: 用每个 head 的单一标量替换 per-value write-gate projection

## 理论证明
6 个 formal theorems:
- Memory capacity
- Lyapunov stability
- Gradient flow
- Expressivity separation
- Pareto-optimal chunk size
- Hybrid optimality

## 实验结果 (1.3B params, 100B tokens)
- **WikiText perplexity**: 15.72 (比 GDN-2 低 0.18, 4.5σ 效应)
- **常识推理**: 领先所有 recurrent 基线
- **RULER retrieval**: 所有 probe 达到 SOTA
- **效率**: 0.4% throughput overhead, 13% lower peak memory, 19% fewer parameters

## 与 GDN-2 的关系
初始化时 CARVE 与 GDN-2 bit-identical；质量差异来自 content gate 学到的内容

## 标签
#LLM #transformer #linear-attention #recurrent #efficiency #architecture