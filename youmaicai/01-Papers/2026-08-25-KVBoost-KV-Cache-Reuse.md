# KVBoost: Chunk-Level Key-Value Cache Reuse with Deviation-Guided Recomputation

## 元信息
| 标题 | KVBoost: Chunk-Level Key-Value Cache Reuse with Deviation-Guided Recomputation |
|------|------|
| 作者 | Srihari Unnikrishnan |
| 链接 | [原文](https://arxiv.org/abs/2608.21362) |
| arXiv | arXiv:2608.21362v1 |
| 领域 | cs.AI, cs.DC |
| 发表 | 2026-08-25 |

## 核心贡献
1. **Dual-Hash Keying Scheme**: 分离位置身份（前缀哈希）和内容身份（内容哈希），支持精确和近似缓存匹配，使 KV 缓存复用不再受限于连续前缀
2. **Boundary Repair Strategies**: 提出 SelectiveRecompute（重编码边界区域）和 CacheBlendRecompute（探测后重计算高偏移 token）解决注意力边界错误
3. **Memory-Bounded System**: 非对称 KV 量化（int8/int4）、自适应 chunk 边界分裂、重要性加权驱逐

## 模型架构
- 兼容 HuggingFace decoder 模型（RoPE-based）
- Chunk-level KV 缓存粒度
- Dual-hash: `prefix_hash` + `content_hash`

## 核心公式
- Time-to-First-Token 减少: 4.49x (142.4ms vs 639.1ms)
- 精度无损: 99.2% vs 99.1%

## 实验结果
| 指标 | KVBoost | Prefix Caching |
|------|---------|----------------|
| TTFT 提升 | 4.49x | baseline |
| 精度 | 99.2% | 99.1% |
| 相对提升 | +16% | - |

## 局限性
- 需 RoPE-based 模型
- 不修改模型架构但依赖特定注意力模式假设

## 标签
#LLM-Inference #KV-Cache #Transformer-Optimization #Attention-Mechanism
