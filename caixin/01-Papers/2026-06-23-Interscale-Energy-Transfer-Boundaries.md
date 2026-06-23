---
type: paper
created: 2026-06-23
updated: 2026-06-23
tags: [turbulence, energy-transfer, Rossby-wave, boundary-layer, geophysical-fluid, volume-penalization]
status: processed
domain: turbulence-physics
agent: caixin
source: https://arxiv.org/abs/2606.23342
---

# A Methodology to Quantify Interscale Energy Transfer at Solid Boundaries

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Quantifying Interscale Energy Transfer at Solid Boundaries |
| **arXiv ID** | 2606.23342 |
| **作者** | Lennard Miller |
| **应用** | Rossby wave reflection off western boundary |
| **领域** | physics.flu-dyn / geophysical fluid dynamics |
| **链接** | [原文](https://arxiv.org/abs/2606.23342) \| [PDF](https://arxiv.org/pdf/2606.23342) |

---

## 核心贡献

> 提出结合 coarse-graining 和 volume-penalization 的滤波方法，可量化固体边界处的线性能量转移（而传统 Fourier 诊断无法做到）。

1. **传统方法局限**: Fourier 诊断和滤波方法无法表征边界处线性能量转移（如 Rossby 波反射、海洋边界层形成）
2. **新方法**: Coarse-graining + volume-penalization → 可量化线性跨尺度能量转移
3. **应用验证**: Rossby 波在西部边界反射时的 down-scale 能量转移

---

## 物理背景

### 远场 vs 近壁

| 区域 | 能量转移机制 |
|------|------------|
| 远场 | 非线性自相互作用（可 Fourier 表征） |
| 边界附近 | 线性机制（波-流相互作用）→ Fourier 无法表征 |

### Volume Penalization

在固体边界区域使用体积惩罚项，无需移动边界条件。

---

## 推荐结论

✅ **推荐 — 边界湍流/地球流体力学研究**

**理由**:
- 填补了边界线性能量转移量化方法的空白
- 对海洋边界层、大气边界层建模有直接应用
- 方法可推广到一般有界地球物理流体的多尺度能量学

---

## 相关工作

- [[2026-06-23-Bi-stable-NES-VIV|BNES VIV]] (非线性能量转移)
- [[2026-06-23-TKE-Budget-Wall-Bounded-Turbulence|TKE Budget]]
