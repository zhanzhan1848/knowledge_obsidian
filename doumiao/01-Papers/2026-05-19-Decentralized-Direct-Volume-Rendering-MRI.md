---
title: "Decentralized Direct Volume Rendering: A Browser-Native GPU Architecture for MRI Digital Twins"
authors:
  - Oserebameh Beckley
date: 2026-05-19
arxiv: 2605.19737
subjects: cs.GR, cs.CV
tags:
  - volume rendering
  - ray marching
  - webgpu
  - medical imaging
  - digital twin
  - browser

---

## 核心创新点

**去中心化直接体积渲染** — 在浏览器中通过 WebGPU 实现 MRI 数字孪生的高质量体积渲染，无需服务端或外部依赖。

### 关键技术

1. **单次 Pass Ray Marching**
   - Deterministic single-pass raymarching
   - 直接在低功耗集成 GPU 上执行
   - 消除网络延迟

2. **Morphological Gradient 计算**
   - 形态学梯度计算
   - 用于解剖结构分割

3. **WebGPU 原生架构**
   - 客户端执行，无服务端渲染
   - Uniform buffers 实现零延迟参数操作
   - 无需深度学习或外部计算依赖

### 技术规格

| 指标 | 数值 |
|------|------|
| TTFP (Time to First Pixel) | < 920ms |
| 帧率 | >= 82 FPS |
| 部署方式 | 浏览器原生 |
| GPU | 低功耗集成边缘 GPU |

---

## 渲染方法

- **类型**: 体积渲染 (Volume Rendering)
- **技术**: Direct Volume Rendering via Ray Marching
- **特点**: 单次 Pass、无需服务端

---

## 性能表现

- **帧率**: >= 82 FPS 稳定交互
- **TTFP**: < 920ms
- **适用**: 资源受限环境 (Resource-Constrained Settings)

---

## 实现建议

- **着色器复杂度**: 中等
- **管线要求**: WebGPU
- **推荐度**: ✅

**适用场景**: 医学影像数字孪生、手术规划、远程医疗

---

## 链接

- Paper: https://arxiv.org/abs/2605.19737
- Demo: https://webgpu-mri.vercel.app/
- Code: https://github.com/Bahdmanbabzo/webgpu-mri