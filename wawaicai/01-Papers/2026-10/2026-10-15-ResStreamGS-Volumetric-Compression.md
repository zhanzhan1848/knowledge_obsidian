---
type: paper
created: 2026-10-18
updated: 2026-10-18
tags: [paper, gaussian-splatting, compression, geometry-regularization, poisson-reconstruction]
status: processed
domain: 计算机图形学几何处理
agent: wawaicai
source: https://arxiv.org/abs/2610.21121
---

# ResStreamGS: Residual-Sensitive Dual-Stream Gaussian Splatting for Mobile Volumetric Video Streaming

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Residual-Sensitive Dual-Stream Gaussian Splatting for Mobile Volumetric Video Streaming |
| **作者** | Haoran Liu 等 |
| **发表** | arXiv 2610.21121 (cs.GR; cs.CV), 2026-10-15 |
| **链接** | [原文](https://arxiv.org/abs/2610.21121) |
| **DOI** | https://doi.org/10.48550/arXiv.2610.21121 |
| **代码** | 未提及 |

---

## 核心贡献

> 提出 **ResStreamGS**：识别时序稳定 / 残差敏感的 Gaussians，将两类 splats 分流到不同 stream；硬件视频编解码友好的帧级流 + GOP 级稳定的"基础"流。

1. **Residual-sensitive primitive 探测**：lightweight probe adaptation 识别需要逐帧更新的 Gaussians
2. **GOP-level stable Gaussian 复用**：时序稳定的 Gaussians 每 GOP 传一次
4. 复杂全场景 volumetric video 上 PSNR 提升 7.51–8.35 dB（vs controlled baseline），payload 节省 56.5%；Qualcomm 778G 平台 30.88 FPS

---

## 技术方案

### 核心思想

3D Gaussian Splatting (3DGS) 把所有 Gaussian 当 frame-varying，套用视频编解码不划算（大量 spline 是稳定的）。ResStreamGS 用 lightweight probe 找出真正需要每帧传的；稳定部分复用。

### 关键技术

| 技术 | 说明 |
|------|------|
| Probe adaptation | 小规模适配判断 Gaussian 时序稳定性 |
| Dual-stream coding | stable stream (GOP) + residual stream (per-frame hardware decodable) |
| Reuse within GOP | stable Gaussians 只发一次 |
| PSNR ↑ / payload ↓ | 编码后质量显著提升，带宽大幅下降 |
| Mobile decoding | 利用硬件视频解码器，30+ FPS on mid-tier mobile SoC |

---

## 公式

```
g_stable  = {g | σ_proxy(g) ≤ τ}                // probe 自适应阈值
g_resid   = V \ g_stable                         // 残差敏感
Stream 1: encode(g_stable, GOP-level)
Stream 2: encode(g_resid,  frame-level)
P_total  = |Stream1|/GOP + |Stream2|*F          // 平均 payload
```

---

## 代码片段

```text
// 概念伪代码：dual-stream residual-sensitive splitting
g_stable, g_resid = probe_split(gaussians, tau)
encode_gop  (g_stable, GOP=G)        // 每 GOP 一次
encode_frame(g_resid,  frame=t)     // 逐帧 video codec
decode(g_stable ∪ g_resid_t) → 渲染
```

---

## 实验结论

- **数据集**: 复杂全场景 volumetric video（含时序稳定区域）
- **基线**: V³ 风格全 Gaussian 帧级 baseline
- **结果**: PSNR +7.51–8.35 dB；payload 节省 56.5%；Qualcomm 778G 上 30.88 FPS

---

## 局限性

- Probe 适配增加额外训练成本
- Stable Gaussian 阈值 τ 是经验设置
- 主要是 streaming 应用，对单机离线渲染增益有限

---

## 相关工作

- 相关概念：3DGS compression, video codec for static regions, MPEG / VVC, BVH on Gaussian
- 相关：[[OctMesh]] (mesh 压缩), [[PCAsplat]] (geometric regularization)

---

## 实现建议

- **实现难度**: 中。需要 3DGS 训练管线 + probe 适配 + dual stream 编码
- **预期性能**: 在 mobile 上 30+ FPS；PC 端参考意义次之
- **适用场景**: 移动端 volumetric video streaming、AR/VR headset 流式内容
- **推荐依赖**: gsplat / 3DGS reference impl、H.265/VVC 硬件编码器、Qualcomm 778G SDK
- **数值稳定性**: 中。probe 阈值需校准
- **推荐度**: ⚠️ 谨慎评估（streaming 专用；非通用几何处理工具）

---

## 传递给 @墨鱼丸

🥢 **可行性分析：ResStreamGS — 移动端 3DGS 流式压缩**

**算法复杂度**
- Probe adaptation：与 3DGS 训练同一量级
- 编码：受 codec 主导
- 解码：硬件加速 O(F·N_per_frame)

**实现难度**：中（3DGS + codec 集成）

**数值稳定性**：中（probe 阈值需校准）

**依赖项**：3DGS 实现，硬件视频编解码器

**推荐结论**：⚠️ 谨慎评估（移动端 streaming 专用；离线渲染场景意义有限）

已传递给 @墨鱼丸。