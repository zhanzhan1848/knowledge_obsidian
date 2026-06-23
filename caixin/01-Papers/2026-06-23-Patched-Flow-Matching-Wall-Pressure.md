---
type: paper
created: 2026-06-23
updated: 2026-06-23
tags: [AI, turbulence, wall-pressure, generative-model, flow-matching, DNS, super-resolution]
status: processed
domain: AI-CFD
agent: caixin
source: https://arxiv.org/abs/2606.22084
---

# Generative Wall-Pressure Reconstruction Beyond Training-Domain Scales from Sparse Sensors

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Patched Flow Matching (Patched FM) for Wall-Pressure Reconstruction |
| **arXiv ID** | 2606.22084 |
| **验证数据** | Compressible channel-flow DNS at $Re_\tau = 180, 500, 1000$ |
| **领域** | physics.flu-dyn / AI for turbulence |
| **链接** | [原文](https://arxiv.org/abs/2606.22084) \| [PDF](https://arxiv.org/pdf/2606.22084) |

---

## 核心贡献

> 提出 Patched Flow Matching (Patched FM)，将短域 DNS 数据与稀疏传感器测量融合，实现墙压全场重建和跨尺度迁移。

1. **问题**: 短域 DNS 无法捕获外层低波数内容；稀疏传感器无法捕获粘性尺度高波数内容
2. **Patched FM**: patch-additive 分解 + patch-local 先验 + 无需训练的推理时后验采样
3. **内尺度坐标**: 高波数统计在 Reynolds 数下近似不变 → 跨 Re 迁移
4. **分层迁移学习**: 仅需 500 个快照（2.5% 原始数据）即可完成跨域迁移

---

## 方法

### Flow Matching 框架

- patch-local prior learned from short-domain DNS
- 推理时融入稀疏传感器测量
- patch-additive decomposition: 独立于全局网格尺寸

### 跨尺度能力

| 项目 | 训练配置 | 测试配置 |
|------|---------|---------|
| 域尺寸 | $L_x^S = 4\pi\delta$ | $L_x^L = 16\pi\delta$ (4倍) |
| 传感器覆盖率 | — | 低至 0.25% |

---

## 推荐结论

✅ **推荐 — AI+CFD 重建/超分辨率**

**理由**:
- 解决短 DNS 数据的痛点：无法获取完整低波数谱
- 低传感器覆盖率（0.25%）即可实现全场重建
- 可扩展到实验 PIV/压力传感器数据融合

---

## 相关工作

- [[2026-06-23-PPLC-Latent-Compression-3D-Turbulence|PPLC]]
- [[2026-06-23-ML-Predictability-Ceiling-Turbulence|ML Predictability Ceiling]]
