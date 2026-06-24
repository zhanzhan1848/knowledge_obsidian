# Weight-Space Geometry of Offline Reasoning Training

## 元信息
| 标题 | Weight-Space Geometry of Offline Reasoning Training |
|------|------|
| 作者 | Aleksandr Nikolich (et al.) |
| 链接 | [原文](https://arxiv.org/abs/2606.23740) |
| arXiv | arXiv:2606.23740 |
| 发表 | ICML 2026 Workshop |
| 领域 | Offline RL, Reasoning Distillation, Mechanistic Interpretability |

---

## 核心贡献

**研究问题**：SFT、RFT、RIFT、DFT、Offline GRPO、DPO 等离线推理损失函数在权重空间中是机制性不同还是收敛到相似的权重更新？

**实验设计**：在 Qwen3-4B 上使用相同 rollouts、相同 LoRA 初始化，对比 6 种方法。

### 主要发现

1. **SFT/RFT/RIFT 几乎共线**（cosine ≥ 0.97，top-1 principal angle ~7°），GSM8K 准确率 87-88%（两两 McNemar p ≥ 0.15 无显著差异）
   - RIFT 只是调整了步长，方向与 SFT 基本相同

2. **DFT 比任何 reward-weighted 方法都更偏离 SFT 方向**（cosine ~0.55）
   - DFT 是 SFT 的单行修改（down-weight confident tokens），但产生了更独特的更新

3. **Offline GRPO 添加了substantial orthogonal component**：
   - 全球约 67% 正交于 SFT 方向
   - 在后几层高达 ~86%
   - 保持在 SFT loss basin 内

4. **DPO 处于near-orthogonal subspace**：
   - 与 SFT/RFT/RIFT 的 cosine 在 [0.057, 0.065]
   - 存在 linear mode connectivity barrier
   - 后层 CKA collapse 到 ~0.46
   - **达到最高 GSM8K 准确率 93.5%**（McNemar p < 10⁻⁹）
   - 但使用了 10× 更小的学习率（代码库惯例）

5. **Online GRPO 几乎完全正交于 SFT**：
   - orthogonal fraction 0.998
   - on-policy sampling 而非 group-relative loss 驱动了与 SFT 的偏离

---

## 分析方法

- **Cosine similarity**：全局和逐层权重向量相似度
- **Principal-angle subspace analysis**：top-10 singular vectors 之间的 principal angles
- **Linear mode connectivity**：线性插值 loss basin 分析
- **CKA (Centered Kernel Alignment)**：隐藏状态的表征相似度

---

## 关键数据

### Weight-space Cosine（到 SFT 的距离）

| 方法 | Cosine to SFT |
|------|--------------|
| SFT | 1.000 |
| RFT | 0.977 |
| RIFT | 0.967 |
| DFT | 0.572 |
| Offline GRPO | 0.730 |
| DPO | 0.061 |
| Online GRPO | 0.025 |

### Per-layer Principal Angles（top-1, 中位数）

| 方法对 | 角度 |
|--------|------|
| SFT–RFT | 6.7° |
| SFT–RIFT | 8.2° |
| SFT–Offline GRPO | 18.5° |
| SFT–DFT | 26.7° |
| SFT–DPO | 54.6° |

### 准确率

| 方法 | GSM8K | AIME26 |
|------|-------|--------|
| DPO | **93.5%** | **30.0%** |
| SFT/RFT/DFT/RIFT/Offline GRPO | 87.3–88.2% | 3.3–10.0% |
| Online GRPO | 93–94% | 20.0% |

---

## 核心结论

1. **Reward-weighted MLE 就是 SFT**：SFT、RFT、RIFT 方向几乎相同，准确率差异来自步长而非方向
2. **DFT 是惊喜**：单行修改产生比任何 reward-weighted 方法更大的方向变化
3. **Offline GRPO 移向新方向但留在同一 basin**；Online GRPO 不留
4. **DPO 完全独立**：高维更新、小范数、sharp barrier、最高准确率——但 DPO 使用 10× 更小 LR，因果归因不确定

---

## 标签
#offline-RL #reasoning-distillation #LoRA #weight-space #mechanistic-interpretability #DPO