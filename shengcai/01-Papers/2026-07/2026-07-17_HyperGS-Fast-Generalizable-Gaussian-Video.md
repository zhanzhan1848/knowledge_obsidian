---
type: paper
created: 2026-07-17
updated: 2026-07-17
tags: [paper, 3DGS, video, feedforward, rendering, neural-rendering]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2607.11500
---

# HyperGS: Fast and Generalizable Gaussian Video Representation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | HyperGS: Fast and Generalizable Gaussian Video Representation |
| **作者** | Fatimah Zohra et al. |
| **发表** | arXiv cs.CV (2026) |
| **链接** | [原文](https://arxiv.org/abs/2607.11500) |

---

## 核心贡献

> 前馈、免优化的方法，直接从任意视频预测Gaussian表示，单次前向传播

1. **因子化时空Transformer**: 从视频提取token
2. **可学习query的Transformer**: 获取每帧8参数Gaussian表示
3. **Rank-based几何正则化器**: 动态适应强度稳定优化，解决needle-like退化问题

---

## 技术方案

### 核心思想

现有Gaussian Splatting方法依赖逐视频优化，导致编码慢且限制泛化。HyperGS通过**前馈预测**实现高效编码和解码，**10^4-10^5倍**加速。

### 关键技术

| 技术 | 说明 |
|------|------|
| 因子化时空Transformer | 高效token提取 |
| 8参数Gaussian | 每帧显式2D Gaussians |
| Rank-based几何正则化 | 防止退化 |

### 性能提升

- 编码速度: **10^4-10^5×** 提升
- K400, SSv2, UCF101上PSNR提升 **+2.9--3.1 dB**
- 零样本泛化到 **720p** 视频
- 更高分辨率渲染无需重新编码

---

## 实验结论

- 编码速度比逐视频Gaussian优化快4-5个数量级
- 重建质量匹配
- 分布外视频泛化能力强

---

## 局限性

- 需要大量视频数据训练
- 极端运动场景可能失败

---

## 实现建议

- **实现难度**: 高
- **适用场景**: 视频编码、视频编辑、实时视频处理
- **推荐度**: ⭐⭐⭐⭐⭐
