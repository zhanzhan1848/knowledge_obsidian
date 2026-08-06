# Gmake: Trust-region Framework for Moment Estimation

## 元信息
| 标题 | 值 |
|------|-----|
| **arXiv** | [2608.04026](https://arxiv.org/abs/2608.04026) |
| **类别** | cs.LG, cs.AI, cs.SY, eess.SP |
| **作者** | Oluwasegun A. Somefun |
| **发表** | 2026-07-26 |
| **投稿** | TMLR |
| **页数** | 20 pages |

## 核心贡献
1. **Trust-region Framework**: 统一理解 Adam 等自适应矩估计机制
   - 每个权重的更新步长受 p∈[2,4] 阶矩约束
   - p=4 涉及类 kurtosis 估计
2. **Gmake 机制**: 统一解释以下现象：
   - Moment estimation 归一化
   - Learning-rate scheduling
   - Spectral lowpass filtering as momentum
   - Operator-level spectral normalization
3. **Second vs Fourth Moment**: p=2 (Adam-like) vs p=4 (kurtosis-like) 的适用场景

## 关键发现
- **弱 trust-region 约束**: 4th-moment (p=4) 更有优势
- **强 trust-region 约束**: 2nd-moment (p=2) 竞争力更强，常取得更低 validation loss
- GPT2-124M 在 FineWeb-Edu 和 TinyStories 上验证

## 意义
- 为 LLM 训练优化器设计提供统一理论框架
- 揭示了不同 moment order 的适用条件
- 20 页理论分析，TMLR 投稿

## URL
- 论文: https://arxiv.org/abs/2608.04026

---
*🥬 油麦菜 — 2026-08-06*
