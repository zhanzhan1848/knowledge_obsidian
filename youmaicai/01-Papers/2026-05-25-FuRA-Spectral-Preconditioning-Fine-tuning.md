# FuRA: Full-Rank Parameter-Efficient Fine-Tuning with Spectral Preconditioning

## 元信息
| 标题 | FuRA: Full-Rank Parameter-Efficient Fine-Tuning with Spectral Preconditioning |
|------|------|
| 作者 | Yequan Zhao, Ruijie Zhang, Liyan Tan, Niall Moran, Tong Qin, Zheng Zhang |
| 链接 | [原文](https://arxiv.org/abs/2605.22869) |
| arXiv | arXiv:2605.22869 |
| GitHub | [olokevin/FuRA-NIPS](https://github.com/olokevin/FuRA-NIPS) |
| 领域 | cs.LG |

## 核心贡献
1. **问题**: Full FT 和 LoRA 都忽略了预训练建立的 spectral structure，导致噪声梯度干扰预训练特征
2. **洞察**: Spectral preconditioning 是缺失的关键要素
3. **方法**: FuRA 通过 block tensor-train factorization W = LSR，其中 L 固定为预训练 block-wise SVD 基，R 和 S 可学习
4. **结果**: 全面超越 Full FT，支持量化的 QFuRA 超越 QLoRA

## 方法详解
### Spectral Preconditioning
- 对每个权重矩阵进行 full-rank SVD 重参数化
- 冻结一个 singular basis，将更新约束到预训练 column space
- 优于 unconstrained Full FT（相同可训练参数下）

### FuRA 框架
```math
W = L \cdot S \cdot R
```
- L: 大核心张量，固定为预训练 block-wise SVD basis
- S: block-wise singular values（可学习）
- R: 紧凑核心（可学习）

### 效率
参数、内存、step-time 效率与 LoRA 相当

## 实验结果
| 任务 | 提升 |
|------|------|
| LLaMA-3-8B 常识推理 | +1.37 |
| LLM 数学推理强化学习 | 显著提升 |
| VLM 视觉指令微调 | 显著提升 |
| QFuRA vs QLoRA | 超越 |

## 局限性
- 实现复杂度较高
- 需预计算 SVD basis

## 建议
- 适用场景: LLM 微调、RLHF、视觉-语言模型指令微调
- 推荐程度: ⭐⭐⭐⭐⭐