---
title: CORF-GS: Real-Time Wireless Radiance Field Reconstruction via Coupled Optical-RF Gaussian Splatting
authors: Jinya Zhang et al.
date: 2026-08-05
source: arXiv cs.CV (cross-list cs.GR related)
url: https://arxiv.org/abs/2607.25569
pdf: https://arxiv.org/pdf/2607.25569
tags: [rendering, gaussian splatting, radiance field, real-time, 2026]
status: unread
---

# CORF-GS: Real-Time Wireless Radiance Field Reconstruction via Coupled Optical-RF Gaussian Splatting

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | CORF-GS: Real-Time Wireless Radiance Field Reconstruction via Coupled Optical-RF Gaussian Splatting |
| 作者 | Jinya Zhang et al. |
| 来源 | arXiv (cross-list) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2607.25569) |
| PDF | [下载](https://arxiv.org/pdf/2607.25569) |

## 核心贡献
1. 提出 **CORF-GS**：首个实时无线辐射场 (WRF) 重建框架
2. 统一 Gaussian 表示：光学与 RF 共享几何，模态特定外观
3. 光学引导的 Gaussian 采样 (Optical-guided Gaussian Sampling)：在欠表示区域 densify WRF
4. 耦合光学-RF 联合优化：解决光波与射频对同一表面响应不同的问题
5. 重建时间减少 **6.4×**，达到 SOTA RF 频谱合成质量

## 技术方案

### 问题背景
- 现有 WRF 重建依赖预收集观测和离线优化，无法实时
- 光与射频波段对物体表面的响应不同（波长差异）
- 需要实时感知动态无线环境

### 核心架构
```
输入：序列光学 + RF 关键帧
     ↓
共享几何 Gaussian 表示（光学结构先验）
     ↓
Optical-guided Gaussian Sampling（补充欠表示区域）
     ↓
Coupled Optical-RF Optimization（联合优化共享 Gaussian）
     ↓
实时 WRF 渲染输出
```

### 关键技术
1. **统一 Gaussian 表示**：同时建模光学和 RF 特性
2. **Optical-guided Sampling**：光学图像高分辨率 → 结构先验
3. **Coupled Optimization**：RF-informative 区域不因光学引导被忽略

## 性能指标
| 指标 | 数值 |
|------|------|
| 重建时间减少 | 6.4× vs 现有方法 |
| 渲染性能 | Real-time (论文标题) |
| RF 频谱合成质量 | SOTA |

## 实验结论
- 光学结构先验有效引导 WRF 重建
- 耦合优化防止 RF 重要区域被忽略
- 达到 SOTA 质量同时实现 6.4× 加速

## 局限性
- 依赖光学和 RF 双模态输入
- 无线通信专业应用，非通用渲染
- 对非静态场景的实时适应性待验证

## 可行性分析
- 实现难度：**中高**（涉及 Gaussian Splatting 扩展和双模态优化）
- 性能预期：实时性能优秀（6.4× 加速）
- 适用场景：无线通信信道建模、实时感知系统

## 相关工作
- 3D Gaussian Splatting (Kerbl et al. 2023)
- GSpaRC: Gaussian Splatting for Real-time Reconstruction of RF Channels
- Wireless Radiance Field (WRF)

## 笔记
CORF-GS 虽然主要面向无线通信，但其核心技术是 Gaussian Splatting 的扩展应用。论文的核心价值在于：1) 展示了 Gaussian Splatting 框架的可扩展性（从光学到 RF）；2) 统一表示 + 模态特定优化是处理多模态数据的有效范式，对渲染中的多通道材质、光照等多模态数据有借鉴意义。
