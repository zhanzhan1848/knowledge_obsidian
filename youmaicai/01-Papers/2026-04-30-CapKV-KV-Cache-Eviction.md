# Rethinking KV Cache Eviction via a Unified Information-Theoretic Objective

## 元信息
| 标题 | Rethinking KV Cache Eviction via a Unified Information-Theoretic Objective |
| 作者 | Jiaming Yang, Chenwei Tang, Liangli Zhen, Jiancheng Lv |
| 链接 | [原文](https://arxiv.org/abs/2604.25975) |
| arXiv | arXiv:2604.25975 |
| 领域 | cs.LG, cs.AI, cs.IT |

## 核心贡献
1. 基于 **Information Bottleneck 原则**重新思考 KV cache eviction
2. 在 linear-Gaussian attention 近似下，推导出描述保留 KV cache 子集有效信息容量的**闭合形式互信息目标**
3. 提出 **CapKV**：capacity-aware eviction 方法，使用统计 leverage scores 的 log-determinant 近似
4. 实验：在多个模型和长上下文 benchmark 上持续优于 prior methods

## 核心创新点
现有 eviction 策略依赖经验启发式，缺乏理论基础。本文揭示：大量现有 eviction 策略可理解为同一 capacity-maximization 原则的不同近似。CapKV 用信息论替代启发式选择。

## 方法
- **理论框架**：Information Bottleneck → KV cache 互信息目标
- **CapKV**：通过 log-determinant 近似（用 statistical leverage scores）直接最大化信息保持
- 替换启发式选择为理论驱动机制

## 实验结果
- 多模型 × 长上下文 benchmark
- Memory efficiency 和 generational fidelity 的更好 trade-off
- 一致性超越 prior methods

## 建议
- 是否推荐使用：**是**
- 适用场景：LLM 长上下文推理、KV cache 内存优化、推理效率提升

---
*🥬 由 油麦菜 youmaicai 自动整理 | 2026-04-30*
