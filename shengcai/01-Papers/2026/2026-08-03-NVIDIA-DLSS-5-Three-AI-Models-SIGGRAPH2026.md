---
title: NVIDIA DLSS 5 — Three AI Models with Per-Object Control at SIGGRAPH 2026
authors: NVIDIA Research (Edward Liu, Ming-Yu Liu, Neil Ashton)
date: 2026-07-20
source: SIGGRAPH 2026
url: https://blogs.nvidia.com/blog/siggraph-news-2026/
tags: [rendering, neural-rendering, real-time, DLSS, NVIDIA, siggraph, 2026]
status: important
---

# NVIDIA DLSS 5 — Three AI Models with Per-Object Control at SIGGRAPH 2026

## 元信息

| 项目 | 内容 |
|------|------|
| 标题 | NVIDIA DLSS 5: Neural Rendering with Three AI Models |
| 来源 | SIGGRAPH 2026 Sponsored Keynote |
| 日期 | 2026-07-20, Los Angeles |
| 链接 | [NVIDIA Blog](https://blogs.nvidia.com/blog/siggraph-news-2026/) |
| PDF | N/A (Industrial release, no paper) |

## 核心贡献

1. **生成式帧 enrichment 架构**: DLSS 5 在游戏引擎完成常规渲染帧后进行内容增强，区别于 DLSS 1-4 的性能技术（超分/帧合成）
2. **三模块 AI 模型架构**: Model A / B / C 提供不同的 structural intensity、global illumination、texture detail 平衡
3. **逐对象级艺术控制**: 开发者可为不同场景/角色/道具选择不同模型和参数
4. **紧凑单步 Diffusion Transformer**: 从大型离线生成网络蒸馏，实现 <16ms 实时约束

## 技术方案

### 架构定位
DLSS 5 引入**第三类 AI 实时渲染用法**：
- DLSS 1-4: 重建 (Reconstruction) + 函数近似 (Ray Reconstruction)
- DLSS 5: **生成式 enrichment** — "学习后的阶段，丰富渲染帧的外观"

### 实时性工程
- **目标**: 4K@60fps，整个管线 <16ms
- **方法**: Compact one-step pixel-space diffusion transformer
- **蒸馏**: 从大型离线生成网络蒸馏而来
- **因果模式**: 1帧输入 → 1帧输出，无 lookahead
- **输入数据**: 标准 color buffer + motion vectors + 引擎内部数据 (albedo, normals, lighting buffers)
- **运动追踪**: Motion vectors 提供 per-pixel 位移，减少闪烁和"漂移"伪影

### 三模型对比

| 模型 | Structural Intensity | Global Illumination | Texture Detail | 适用场景 |
|------|---------------------|--------------------|--------------|---------|
| Model A | 低 | 轻 | 保留 | 写实/保守增强 |
| Model B | 中 | 中 | 中 | 通用场景 |
| Model C | 高 | 强 | 高 | 电影级/激进增强 |

- 开发者可混合使用：不同环境用不同模型
- 支持逐角色/逐道具级别切换
- 提供独立滑块控制

### 开发者控制工具
- **NVIDIA Streamline**: 集成到游戏引擎的标准包
- **场景级/对象级模型选择**
- **效果强度滑块** (per-object)
- 针对 2026 年 3 月争议（AI 覆盖角色艺术风格）的直接回应

## 实验结论

- DLSS 5 推理仅占用 **16ms 帧预算的一小部分**
- 大部分时间仍用于游戏引擎渲染
- 4K@60fps 在 RTX 50 系列单卡上可运行（非双卡）
- 秋季发布（fall 2026）

## 局限性

1. **输入信息不完整**: 主要输入为 2D 渲染帧 + motion vectors，非 3D 场景图
2. **遮挡边界 hallucination 风险**: 当前景物体移动暴露被遮挡表面时，系统无法精确重建（motion vectors 编码物体去向，不编码背后内容）
3. **艺术家争议**: 2026 年 3 月 GTC 展示引发"AI 美颜滤镜"批评，部分工作室（如 Capcom、Ubisoft）表示未被提前告知
4. **技术细节未公开**: VRAM 需求、最小 GPU 等关键参数仍未披露

## 可行性分析

- **实现难度**: 极高 (NVIDIA 内部，无开源)
- **性能预期**: 4K@60fps 在 16ms 内完成
- **适用场景**: 游戏实时渲染、实时 GI 增强、电影预演

## 相关工作

- DLSS 4 (帧生成 + 超分辨率)
- NVIDIA Ray Reconstruction
- Real-Time Neural Radiance Caching
- Temporal upsampling techniques

## 附注

- SIGGRAPH 2026: July 19-23, Los Angeles
- GTC 2026 initial reveal: March 16, 2026 (controversial)
- Jensen Huang called it "the GPT moment for graphics"
- 官方博客: https://blogs.nvidia.com/blog/siggraph-news-2026/
