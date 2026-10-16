---
type: paper
created: 2026-10-16
updated: 2026-10-16
tags: [paper, arxiv, cs.GR, volume-rendering, 3dgs, streaming, volumetric-video, 4dgs, fluid-content]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2610.21121
---

# ResStreamGS: Residual-Sensitive Dual-Stream Gaussian Splatting for Mobile Volumetric Video Streaming

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | ResStreamGS: Residual-Sensitive Dual-Stream Gaussian Splatting for Mobile Volumetric Video Streaming |
| **作者** | Haoran Liu, Di Wu, Wang Luo, Hengyuan Na, Miao Hu, Guocong Quan |
| **发表** | arXiv preprint 2026-10-16 (cs.GR, cs.CV) |
| **链接** | [原文](https://arxiv.org/abs/2610.21121) |
| **DOI** | 10.48550/arXiv.2610.21121 |
| **代码** | 未公布 |
| **提交时间** | 2026-10-15 02:25 UTC（出现在 2026-10-16 14:00 arXiv 公告批次） |

---

## 核心贡献

> 第一个为复杂全场景 3DGS 体积视频设计的 **residual-sensitive 双流** 串流框架 — 通过 **probe 适配** 把高斯分为稳定/残差敏感两类，稳定高斯在 GOP 内复用、残差高斯进入视频码流。

1. **GOP-级稳定高斯复用**：用轻量 probe 适配识别时间稳定高斯，整个 GOP 仅传一次；只有 residual-sensitive 高斯走视频流。
2. **残差敏感探针 (Probe Adaptation)**：无需全量训练，仅做一次轻量测量即可分类。
3. **商用视频编解码器集成**：残差流走硬件视频管线（Snapdragon 778G 实测 30.883 FPS）。
4. **PSNR +7.51–8.35 dB** 提升 over V³-style baseline，平均 payload 减少最高 56.5%。

---

## 技术方案

### 核心思想

将 3DGS 高斯按时间稳定性分类：
- **稳定高斯 (stable)**：GOP 内不变化 → 一次发送，组内复用
- **残差敏感高斯 (residual-sensitive)**：每帧变化 → 进入视频码流

传统 V³ 把所有高斯视为时变信号，导致：
- 视频编解码器在静止区域引入量化噪声
- 不必要的 payload（重复传稳定高斯的每一帧属性）
- 移动端解码算力浪费

### 关键技术

| 技术 | 说明 |
|------|------|
| **Probe Adaptation** | 轻量梯度步 (1-3 步) 估计每个高斯的时间敏感性，O(N) 复杂度 |
| **Temporal Stability Field** | 每个高斯携带一个 stability score（每帧自适应阈值划分） |
| **Dual-Stream Pipeline** | 稳定流：GOP-scale 静态码流；残差流：帧级硬件视频流（H.264/H.265） |
| **Group of Pictures (GOP)** | 默认长度 30 帧（≈ 1 秒@30 FPS），平衡切换频率与复用收益 |
| **Hardware Decoder Path** | 残差流走 Snapdragon 778G 视频硬件解码器，避免 CPU/GPU 解析 |

### 系统流水线（核心）

```
[3DGS 训练] → [Probe Adaptation] → [Stable / Residual Split]
                                          ↓                ↓
                                  [Static Bitstream]   [Video Codec]
                                          ↓                ↓
                                  [客户端: GOP复用]   [客户端: HW Decode]
                                          └────────┬───────┘
                                                   ↓
                                              [Mobile Render]
```

---

## 公式

### 稳定性评分（推断）

每个高斯 g_i 的稳定性通过 probe adaptation 估计：

```math
s_i = \frac{1}{K} \sum_{k=1}^{K} \|g_i^{(t)} - g_i^{(t-1)}\|_2
```

稳定判定：`s_i < τ` → 进入静态流；`s_i ≥ τ` → 进入残差流。

### 速率-质量权衡（实证）

```math
\text{PSNR}_{\text{improvement}} = 7.51 - 8.35 \; \text{dB}
\text{Payload reduction} = 56.5\% \text{ (best case)}
```

---

## 实验结论

- **数据集**: 复杂全场景体积视频（来自 V³ benchmark 扩展）
- **基线**: V³-style all-Gaussians stream
- **硬件**: Qualcomm Snapdragon 778G 移动平台
- **结果**:
  - 编码后 PSNR: **+7.51 ~ +8.35 dB**
  - 摊销 payload: **-56.5%** (best)
  - 移动端渲染: **30.883 FPS** (1080p, 30 FPS GOP)

---

## 局限性

- **依赖 probe 适配质量**：阈值 τ 需调；probe 步数对分类精度敏感
- **未覆盖流体场景专门测试**：实验体积视频主要为人像/静态物体，**流体（烟雾、水）4D 内容**未专门验证
- **GOP 边界一致性**：跨 GOP 切换可能引入轻微抖动
- **编解码器依赖**：硬件解码依赖移动平台支持的视频 codec

---

## 与流体渲染的关系

虽然论文主场景为人像体积视频，但其方法对**流体场景的 4D 串流**有直接借鉴价值：

### 1. **4D Gaussian Splatting for Fluid Reconstruction** 串流化
- 现有 4DGS 流体方法（[[LagrangianSplats]], [[GauSmoke]]）多为离线训练+本地渲染
- ResStreamGS 的 **stable/residual 分类** 可直接迁移到 4D 流体：流体局部（湍流细节）是 residual-sensitive；整体流向/容器边界是 stable

### 2. **probe adaptation 思路**
- 流体高斯时间方差分布极不均匀（边界流体 → 高变化；内部流体 → 低变化）
- probe adaptation 1-3 步即可分类，**训练开销可忽略**

### 3. **移动端实时流体 VR**
- VR/AR 流体应用的核心瓶颈是 30+ FPS 实时串流
- 硬件解码路径为**移动 VR 流体可视化**打开工程通道

### 推荐度
✅ **推荐关注** — 工程层面 4D 流体串流的核心方法；与 [[2026-10-15-CAGS-Volumetric-Video-Streaming-3DGS]] 形成"颜色自适应 vs 时间自适应"的互补方法论

---

## 相关工作

- [[2026-10-15-CAGS-Volumetric-Video-Streaming-3DGS]] — 同日 SIGGRAPH 2026 颜色自适应串流
- [[2026-05-13-LagrangianSplats-Divergence-Free-Fluid-Reconstruction]] — 4DGS 流体重建
- [[2026-09-02-GauSmoke-Hybrid-Physics-Optical-Gaussian-Splatting]] — 3DGS 烟雾重建
- [[2024-01-GaussianSplashing]] — 3DGS 溅水重建

---

## 实现建议

- **实现难度**: 中（需集成硬件视频解码器）
- **预期性能**: 移动端 30 FPS @ 1080p
- **适用场景**:
  - 4D 流体 VR/AR 可视化
  - 移动端烟雾/水流可视化应用
  - 流体 4DGS 模型的串流分发