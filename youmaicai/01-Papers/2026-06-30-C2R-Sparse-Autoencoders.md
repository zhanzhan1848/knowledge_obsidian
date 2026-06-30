# Cross-Sample Consistency Regularization for Sparse Autoencoders (C²R)

## 元信息
| 标题 | Cross-sample Consistency Regularization Mitigates Feature Splitting and Absorption in Sparse Autoencoders |
|------|------|
| 作者 | Haoran Jin et al. |
| 链接 | [原文](https://arxiv.org/abs/2606.30609) |
| arXiv | arXiv:2606.30609 [cs.LG] |
| 代码 | [GitHub](https://github.com/hr-jin/Cross-sample-Consistency-Regularization) |
| 会议 | ICML 2026 |
| 类别 | LLM Interpretability, Sparse Autoencoders, Mechanistic Interpretability |

## 核心贡献
1. **问题识别**：SAE 扩展到大规模字典时暴露两个 fundamental challenges：
   - **Feature Splitting**: 将连贯概念碎片化为非原子 latent
   - **Feature Absorption**: 在一般特征中创建任意 exceptions
   - 根因：缺乏跨样本约束，per-sample 优化允许同一概念被不一致地分配到多个冗余/干扰 latents
2. **C²R (Cross-sample Consistency Regularization)**：
   - 核心思想：明确鼓励每个语义特征在 batch 中跨样本由统一 latent 一致表示
   - 通过惩罚方向相似 latents 的 co-activation 来实现
3. **效果**：有效缓解 split 和 absorption，同时保持重建保真度

## Feature Splitting vs Absorption
```
Feature Splitting:
概念 "Paris" → latent_42 (France), latent_137 (capital cities), latent_289 (European cities)

Feature Absorption:  
latent_42 ("France") + (unrelated token "hello") → 共激活被错误归因
```

## C²R 公式
```math
\mathcal{L}_{\mathrm{C^2R}} = \mathcal{L}_{\mathrm{SAE}} + \lambda \cdot \sum_{(i,j)} \mathbb{1}[cos(h_i, h_j) > \tau] \cdot g(score_i, score_j)
```
其中 $h_i, h_j$ 为相似 hidden directions，$g$ 为 co-activation penalty

## 实验结果
- ICML 2026 接收
- 有效缓解 feature splitting 和 absorption
- 保持 reconstruction fidelity

## 局限性
- 正则化系数 λ 和相似度阈值 τ 需调优
- 对极稀疏特征可能过度惩罚

## 建议
- **适用场景**：LLM 内部机制分析、SAE 可解释性提升
- **推荐指数**: ⭐⭐⭐⭐
- **亮点**：首个系统解决 SAE 扩展中 split/absorption 问题的正则化方法

---

## 相关资源
- PDF: https://arxiv.org/pdf/2606.30609
- HTML: https://arxiv.org/html/2606.30609v1
