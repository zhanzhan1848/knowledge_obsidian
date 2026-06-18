---
title: HoloPathTracer - Fast and Accurate Wave Path Tracing for Holography
date: 2026-06-18
tags: [渲染, 路径追踪, 全息, SIGGRAPH2026, VR/AR]
status: 待读
source: arXiv cs.GR
---

# HoloPathTracer: Fast and Accurate Wave Path Tracing for Holography

## 基本信息
| 属性 | 值 |
|------|-----|
| 作者 | （待补充） |
| 发表 | ACM Transactions on Graphics, Vol. 45, No. 4, Article 39, July 2026 - SIGGRAPH 2026 |
| 链接 | [arXiv:2606.14173](https://arxiv.org/abs/2606.14173) |
| 代码 | （待补充） |

## 核心贡献
1. **蒙特卡洛路径追踪求解渲染方程和瑞利-索末菲积分**
   - 同时求解渲染方程和波动光学传播
   - 完全兼容现代图形技术

2. **Path Reuse 快速近似**
   - 环境辐射缓存实现数量级收敛加速
   - 多路复用的随机全息图

3. **复杂振幅监督的相位全息图**
   - 忠实重建自然3D线索
   - 复杂材质（ glossy、镜面反射和折射）

## 技术方案

### 核心方法
```python
# 伪代码框架
Monte Carlo path tracing
    ↓
同时求解:
  - 渲染方程 (radiance)
  - 瑞利-索末菲积分 (wave propagation)
    ↓
Path Reuse + Ambient Radiance Cache
    ↓
Complex-amplitude → Phase-only hologram
```

### 关键创新
- 将路径追踪与波动光学统一在一个框架下
- 使用蒙特卡洛方法同时估计辐射率和波前
- 通过环境辐射缓存实现高效采样

## 实验结论
- 真实的3D线索重建（视差、深度）
- 复杂材质的物理精确渲染
- 全息显示中实现 defocus blur、view-dependent effects、highlights、reflections

## 适用场景
- VR/AR 全息显示
- 裸眼3D显示
- 光场摄影

## 局限性
- 计算成本仍然较高
- 需要特殊硬件（SLM - 空间光调制器）

## 可行性分析
- 实现难度：高（需要波动光学知识）
- 代码工作量：高
- 学术贡献：⭐⭐⭐⭐⭐
- 实用价值：⭐⭐⭐⭐⭐

## 行动建议
已传递给 @墨鱼丸 进行算法评估。

---

## 原始摘要

Holography offers unique advantages for delivering perceptual realism while preserving compact form factors in VR/AR. Its perceptual quality, however, hinges on encoding rich wavefronts of photorealistic scenes into interference patterns and then incoherently multiplexing the resulting wave fields for perception. Existing CGH paradigms decouple radiance estimation from wave propagation by pre-rendering radiance on discretized scene sectors. This separation between radiometric and wave-optical computation inherently limits the range of focus cues and visual effects that can be faithfully reproduced, including depth- and view-continuity, and physically based material behaviors such as glossy or mirror-like reflection and refraction.

We present a physically accurate yet computationally efficient wave optics rendering framework leveraging path tracing to encode full 3D visual cues into phase holograms. Specifically, we employ a Monte Carlo method to solve both the rendering equation and the Rayleigh--Sommerfeld integral simultaneously. Our algorithm is fully compatible with modern graphics techniques and can generate multiple time-multiplexed random holograms with minimal additional time cost via Path Reuse. By employing a fast approximation with an ambient radiance cache, we realize an order of magnitude convergence speed improvement. The resulting coherent wave fields that inherently encode comprehensive visual effects are converted into phase-only holograms under complex-amplitude supervision. Through extensive simulations and experimental validations on a spatial light modulator-based display prototype, we demonstrate faithful holographic reconstructions of natural 3D cues and complex materials, including realistic defocus blur, view-dependent effects, as well as appearance highlights and reflections.
