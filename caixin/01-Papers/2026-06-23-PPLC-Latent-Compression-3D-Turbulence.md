---
type: paper
created: 2026-06-23
updated: 2026-06-23
tags: [AI, turbulence, compression, VAE, wavelet, 3D, super-resolution]
status: processed
domain: AI-CFD
agent: caixin
source: https://arxiv.org/abs/2606.21781
---

# Physics-Preserving Latent Compression for Zero-Shot Resolution Transfer in 3D Turbulence

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Physics-Preserving Latent Compression for Zero-Shot Resolution Transfer in 3D Turbulence |
| **arXiv ID** | 2606.21781 |
| **关键词** | VAE, wavelet, latent compression, 3D turbulence |
| **领域** | physics.flu-dyn / AI for science |
| **链接** | [原文](https://arxiv.org/abs/2606.21781) \| [PDF](https://arxiv.org/pdf/2606.21781) |

---

## 核心贡献

> 提出 PPLC (Physics-Preserving Latent Compression)，一种 patch-local 隐变量压缩器，实现零样本分辨率迁移（低分辨率训练 → 高分辨率测试）。

1. **Patch-local 策略**: 固定大小 patch 作为可迁移单元，独立于全局网格尺寸
2. **共享 VAE**: 全局网格无关的变分自编码器
3. **精确均值保持**: 精确保持湍流统计均值
4. **零均值波动编码**: 仅编码波动部分
5. **可逆 Haar 小波前端**: 多尺度特征提取
6. **shift-consistency 正则化**: 平移一致性约束
7. **重叠感知重建**: 处理 patch 重叠区域

---

## 技术架构

### PPLC 组成

| 组件 | 功能 |
|------|------|
| 固定大小 patch | 可迁移单元，与网格尺寸解耦 |
| Variational Autoencoder | 隐变量压缩 |
| Haar wavelet frontend | 多尺度特征 |
| Mean preservation | 物理量守恒 |
| Fluctuation encoding | 零均值编码 |
| Shift-consistency | 平移不变性 |

### 关键优势

- **零样本分辨率迁移**: 训练于 $4\pi\delta$，测试于 $16\pi\delta$（4倍大）
- **无需 retraining**: 新分辨率无需再训练
- **物理保持**: 精确保持统计量

---

## 推荐结论

✅ **推荐 — AI+CFD 数据压缩**

**理由**:
- 解决 DNS/LES 数据存储瓶颈的实用方案
- 零样本超分辨率对 CFD 数据后处理有直接价值
- 物理保持特性确保湍流统计一致性

**潜在应用**: 湍流数据库压缩、跨分辨率数据融合、实时CFD可视化

---

## 相关工作

- [[2026-06-23-Patched-Flow-Matching-Wall-Pressure|Patched Flow Matching]]
- [[2026-06-23-ML-Predictability-Ceiling-Turbulence|ML Predictability Ceiling]]
