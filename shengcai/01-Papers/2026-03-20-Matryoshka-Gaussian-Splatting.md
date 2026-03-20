---
type: paper
created: 2026-03-20
updated: 2026-03-20
tags: [paper, gaussian-splatting, lod, real-time-rendering, level-of-detail]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2603.19234
---

# Matryoshka Gaussian Splatting

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Matryoshka Gaussian Splatting |
| **作者** | Zhilin Guo, Boqiao Zhang, Hakan Aktas, et al. |
| **发表** | arXiv 2026 |
| **日期** | 2026-03-19 |
| **链接** | [原文](https://arxiv.org/abs/2603.19234) |
| **项目** | [Project Page](https://zhilinguo.github.io/MGS) |
| **PDF** | [View PDF](https://arxiv.org/pdf/2603.19234) |

---

## 核心贡献

> 套娃式连续 LoD 训练框架，单一模型支持从低到高全质量范围，无全容量质量损失

1. **连续 LoD**：单一有序 Gaussian 集合，任意前缀 k 个 splats 都能产生连贯重建
2. **随机预算训练**：每次迭代随机采样 splat 预算，同时优化前缀和完整集
3. **无架构修改**：仅需两次前向传播，兼容标准 3DGS pipeline

---

## 技术方案

### 核心思想

受 Matryoshka 套娃启发，训练一个有序的 Gaussian 集合。渲染时使用前 k 个 splats，质量随 k 增加平滑提升。通过随机预算训练策略，确保任意前缀都是最优的。

### 关键技术

| 技术 | 说明 |
|------|------|
| 有序 Gaussian | 按重要性排序的 Gaussian 集合 |
| 随机预算训练 | 每次迭代采样随机预算 k |
| 前缀优化 | 优化前 k 个和完整集 |
| 质量平滑 | 连续的速度-质量权衡 |

---

## 公式

```math
训练损失: L = L_full + λ * Σ L_prefix(k_i)
其中 k_i ~ Uniform(1, N)
```

---

## 代码片段

```python
# 随机预算训练伪代码
def train_step(gaussians, budget):
    k = random.randint(1, len(gaussians))  # 随机预算
    prefix_loss = render(gaussians[:k])
    full_loss = render(gaussians)
    return prefix_loss + full_loss
```

---

## 实验结论

- **数据集**: 4 benchmarks (Mip-NeRF360, Tanks and Temples, etc.)
- **基线**: 6 baselines (原版 3DGS, 离散 LoD, 连续 LoD)
- **结果**: 
  - 全容量性能匹配 backbone
  - 连续速度-质量权衡
  - 单模型支持多质量级别

---

## 局限性

- 需要额外的排序和前缀优化开销
- 训练时间略长于标准 3DGS

---

## 相关工作

- [[3D Gaussian Splatting]]
- [[Level of Detail Rendering]]
- [[ProgressiveAvatars-Gaussian-Avatars]]

---

## 实现建议

- **实现难度**: 中
- **预期性能**: 连续质量范围，全容量无损失
- **适用场景**: 
  - 流媒体渲染
  - 带宽自适应应用
  - 多设备适配（移动端到桌面）

---

*🥬 生菜 (shengcai) - 2026-03-20*
