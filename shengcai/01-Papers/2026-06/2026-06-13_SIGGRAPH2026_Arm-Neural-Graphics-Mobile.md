---
title: SIGGRAPH 2026 - How Arm Is Bringing Neural Graphics to Mobile
authors: Arm (sponsored content)
date: 2026-06
source: ACM SIGGRAPH Blog
url: https://blog.siggraph.org/2026/06/how-arm-is-bringing-neural-graphics-to-mobile-at-siggraph-2026.html
tags: [rendering, neural-graphics, mobile, real-time, ray-tracing, SIGGRAPH2026, upscaling, denoising]
status: unread
---

# SIGGRAPH 2026 - How Arm Is Bringing Neural Graphics to Mobile

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | How Arm Is Bringing Neural Graphics to Mobile at SIGGRAPH 2026 |
| 作者 | Arm (sponsored) |
| 来源 | ACM SIGGRAPH Blog |
| 年份 | 2026 |
| 链接 | [原文](https://blog.siggraph.org/2026/06/how-arm-is-bringing-neural-graphics-to-mobile-at-siggraph-2026.html) |

## 核心内容

### Neural Dawn游戏
Arm与Sumo Digital合作开发的**Neural Dawn**是首个使用Arm Neural Technology和Unreal Engine MegaLights的移动端游戏：
- 基于Unreal Engine 5.6.1
- 实时复杂直接光照和光线追踪阴影
- 神经渲染技术支持高质量图像和更平滑的运动

### 神经图形技术栈

| 技术 | 功能 | 描述 |
|------|------|------|
| **NSS (Neural Super Sampling)** | 超采样 | AI驱动的空间超采样 |
| **NSSD (Neural Super Sampling + Denoising)** | 超采样+去噪 | 去除光线追踪图像噪声同时保留细节 |
| **NFRU (Neural Frame Rate Upscaling)** | 帧率提升 | 生成中间帧，30fps → 60fps |

### 技术架构
- **去噪**：从光线追踪图像中移除噪声同时保留细节
- **帧插值**：生成中间帧提升流畅度
- **集成到Vulkan和Unreal管线**
- **开发者可控制**：可调节神经pass在渲染图中的位置

### 行业影响
- **已采用标准**：OpenPBR, MaterialX (MRM模型)
- **SIGGRAPH 2026活动**：Arm Create Dev Day (7月20日)
- **目标用户**：游戏工作室、渲染工程师、技术艺术家、研究人员

## 技术要点
1. **神经图形定位**：不是单一功能或黑盒渲染路径，而是一组可评估、调优和集成到现有工作流的技巧
2. **移动端优先**：解决移动设备功耗和性能限制下的高质量渲染问题
3. **实用工作流**：开发者可在熟悉的Vulkan/Unreal管线中实验神经渲染技术

## 相关技术
- Ray tracing (光线追踪)
- Neural denoising (神经去噪)
- Real-time upscaling (实时超分辨率)
- Mobile graphics (移动端图形)
- MegaLights (Unreal Engine)

## 笔记
**推荐优先级：中**

这是SIGGRAPH 2026的行业预览，展示了神经图形技术在移动端的实际应用进展。Neural Dawn作为生产规模的演示，表明神经去噪和超分辨率技术已达到实用阶段。对于关注实时渲染移动化的团队有参考价值。