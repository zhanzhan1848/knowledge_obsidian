---
title: "Real-time Rendering of Pre-integrated Neural Emitters"
authors: (arXiv preprint, see source URL)
date: 2026-10-05
source: arXiv (cs.GR)
url: https://arxiv.org/abs/2610.06762
pdf: https://arxiv.org/pdf/2610.06762
arxiv_id: "2610.06762v1"
tags: [rendering, paper, 2026, real-time, direct-illumination, neural-representation, PBR, light-source, GI]
status: unread
---

# Real-time Rendering of Pre-integrated Neural Emitters

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Real-time Rendering of Pre-integrated Neural Emitters |
| 类别 | cs.GR |
| 年份 | 2026 |
| 发布时间 | 2026-10-05 |
| 链接 | [原文](https://arxiv.org/abs/2610.06762) |
| PDF | [下载](https://arxiv.org/pdf/2610.06762) |

## 核心贡献
1. 提出 **Neural Emission Fields (NEF)**：在**光源体积周围预积分光照**，消除运行时的 integration 开销。
2. 两头（diffuse / glossy）网络架构，输入为 **位置 + 法线 + 视角方向 + 材质参数**，**单次求值**即可得到**无噪声的非遮挡 direct illumination**。
3. 训练于**光源局部坐标系**，训练完成后即可作为**可移植光照资产**随刚体变换跨场景复用；变形、自遮挡、内部互反射、空变 emission 全部吸收进网络，**运行时零额外开销**。

## 技术方案
- 输入参数化：$(\mathbf{p}, \mathbf{n}, \omega_o, \text{material params})$
- 双头输出：$L_{\text{diff}}(\cdot)$ 与 $L_{\text{glossy}}(\cdot)$
- 在 emitter 局部 frame 训练 → 推理时通过刚体变换将查询点 / 方向变换到同一 frame 即可。
- 解决了三难问题：
  - **解析方法**：受限于简单几何（点光源、面光源）。
  - **实时采样**：需要大样本才能无噪。
  - **代理表示**：仍需运行时积分。
- NEF = **预积分神经网络** → 三者兼顾。

## 实验结论
- 在含**复杂几何 + 自遮挡 + 空间变化发射 + 变形** 的真实光源 (如灯泡、灯罩、LED 阵列) 上表现稳定。
- 相比基线方法在**信噪比 / 视觉质量**与**运行开销**两端同时更优。
- 作为**可重用资产**，大幅减少场景切换 / 多光源配置下的 integrator 重训练时间。

## 局限性
- 强烈依赖训练质量；对**全新形态**的光源需重新训练（尽管训练本身较快）。
- 未能涵盖**全场强可微积分**（如参与介质）。

## 可行性分析
- 实现难度：**中**。需要 PyTorch + 自定义渲染 shader (CUDA / HLSL) 集成。
- 性能预期：每 shading point **单次网络推理**（~200–500 us on modern GPU），足够实时（30–60 FPS）。
- 适用场景：游戏 / 建筑可视化 / 影视前期中**复杂 emissive 资产**的快速集成；IES profile 数字孪生。
- 推荐度：**⭐⭐⭐⭐⭐** — 团队近期最有产业落地价值的工作之一，可作为"复杂光源即插即用"核心能力。

## 相关工作
- [[2026-06-19_PureLight_Learning_Complex_Luminaires_Light_Tracing]]
- [[2026-06-16_Neural-Irradiance-Volume-Eurographics2026]]
- 经典 IES Profile / Area Light Sampling。

## 笔记
- 落地建议：优先做 1) 简单灯泡 / 灯柱 NEF 资产；2) 与现有 deferred / forward 渲染器的 integration demo。
- 与团队 ReSTIR / path tracing 主线正交，可独立成模块。
