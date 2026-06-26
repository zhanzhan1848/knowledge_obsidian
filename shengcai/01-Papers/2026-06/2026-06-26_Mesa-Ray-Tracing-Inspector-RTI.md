---
title: Mesa Ray-Tracing Inspector (RTI) - Valve's Open-Source RT Debug Tool
authors: Konstantin Seurer (Valve Linux Team)
date: 2026-06-22
source: Phoronix / Mesa 26.1
url: https://www.phoronix.com/news/Mesa-Ray-Tracing-Inspector-RTI
pdf: 
tags: [rendering, ray-tracing, BVH, Vulkan, open-source, debugging, 2026]
status: unread
---

# Mesa Ray-Tracing Inspector (RTI) - Valve's Open-Source RT Debug Tool

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Mesa Ray-Tracing Inspector (RTI) |
| 作者 | Konstantin Seurer (Valve Linux Team) |
| 来源 | Phoronix / Mesa 26.1 |
| 年份 | 2026 |
| 链接 | [原文](https://www.phoronix.com/news/Mesa-Ray-Tracing-Inspector-RTI) |

## 核心贡献
1. Valve 创建的 Vulkan 光线追踪检查工具，用于分析优化 Linux GPU 驱动性能
2. 基于 ImGUI + Vulkan + SDL3 的图形界面
3. 集成到 Mesa 26.1，主要支持 Radeon RADV Vulkan 驱动

## 技术方案
**功能**：
- 检查 RT 加速结构
- 检查光线追踪调度
- 转储内部 BVH 和光线历史数据

**使用方法**：
- 设置 `RADV_DEBUG=rti` 环境变量
- 在 `/tmp` 生成 RTI 文件转储
- 加载到 RTI 工具检查

**构建方式**：
```bash
meson build -D tools=rti
```

## 实验结论
- 集成到 Mesa 26.1 主线
- 旨在改进 Radeon RADV RT 性能以提升 Steam Play/Linux 游戏体验
- 可扩展支持其他硬件/驱动

## 局限性
- 主要针对开发者，不适合最终用户
- 初始仅支持 RADV 驱动

## 可行性分析
- 实现难度：低（开源工具）
- 性能预期：用于性能分析和优化
- 适用场景：光线追踪驱动开发、性能调试、Linux 游戏优化

## 相关工作
- Mesa RADV
- Vulkan Ray Tracing
- BVH 加速结构

## 笔记
MR 链接：https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/41806