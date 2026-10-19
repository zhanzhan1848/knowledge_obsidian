---
title: "DELUGE: Decomposed Entropy-coded Live Unstructured Geometry Exchange for Real-time Particle Streaming"
date: 2026-09-17
retrieved: 2026-10-19
tags: [fluid-rendering, particle-rendering, compression, streaming, vr, ar, social-vr, real-time, digital-twin]
authors: [Hikari Yanagawa]
institution: (to verify from PDF)
paper_id: 2609.19750
subject: cs.GR (primary), cs.HC, cs.IT (cross-list)
venue: "IEEE Transactions on Visualization and Computer Graphics (TVCG) — IEEE ISMAR 2026"
status: reviewed
domain: fluid-rendering / VR-streaming
agent: doumiao
source: https://arxiv.org/abs/2609.19750
acm_classes: "I.3.7; I.3.2; E.4"
pages: "11 pages + supplement 3 pages"
---

# DELUGE: Decomposed Entropy-coded Live Unstructured Geometry Exchange for Real-time Particle Streaming

## 元信息

| 字段 | 内容 |
|------|------|
| **arXiv ID** | 2609.19750 v1 |
| **提交日期** | 2026-09-17 (Thu) 06:20 UTC |
| **分类** | cs.GR (primary), cs.HC, cs.IT (cross-list) |
| **目标会议** | **IEEE ISMAR 2026** (TVCG) |
| **应用场景** | 多用户社交 VR + 数字孪生 |
| **ACM 分类** | I.3.7 (3D Graphics), I.3.2 (VR), E.4 (Coding) |

## 🎯 核心问题

物理粒子模拟（流体、烟雾、颗粒介质）在沉浸式 VR/AR 中扮演关键角色。但**多用户实时共享**需要：

1. **服务器 → 客户端流式传输**：海量粒子数据
2. **极低延迟**：< 帧周期
3. **方法瓶颈**：现有 G-PCC (TMC13) 与 Draco 假设**静态几何**，对动态粒子
   - 编码延迟 > 帧周期
   - **不满足实时需求**

## 🧠 方法要点

### DELUGE 框架
**充分利用粒子物理特性**：
1. **时间一致性**（同一粒子帧间位置连续）
2. **速度可预测性**（仿真粒子遵循物理定律）

### 三大互补技术
- 时间冗余去除
- 速度场预测辅助编码
- 熵编码分解流式架构

### 关键指标

| 指标 | DELUGE | 对比 |
|------|--------|------|
| 解码速度 | **20× G-PCC (TMC13)** | sub-frame latency |
| 编码速度 | **6× Draco** | — |
| 延迟 | < frame period | 满足实时 |

### 端到端实现
- ✅ Web 浏览器客户端
- ✅ **Apple Vision Pro** 客户端
- ✅ 用户感知质量评估（within-participants perceptual study）
- ✅ **双人协作任务研究**：Vision Pro 上手部追踪的流体交互

## 📊 应用定位

> 多人社交 VR / 数字孪生场景中，DELUGE 是首个通过 ISMAR 评审的实时粒子流式压缩系统（TVCG）。

## 🩸 渲染分析（豆苗评注）

### 渲染方法
- **类型**：粒子传输/流式架构（非传统渲染管线）
- **技术**：时间冗余 + 速度预测 + 熵编码 → sub-frame latency

### 视觉质量
- **逼真度**：不直接渲染；保持服务器端模拟保真度
- **风格化支持**：N/A

### 性能预期
- **解码**：~20× 加速于 G-PCC
- **编码**：~6× 加速于 Draco
- **延迟**：sub-frame（满足 60Hz 实时需求）
- **GPU 需求**：低（解码可在 web 客户端运行）
- **内存占用**：流式（不缓存历史帧）

### 实现建议
- **着色器复杂度**：不适用
- **管线要求**：客户端集成（WebGL/WebXR / Vision Pro native）
- **推荐度**：✅ 社交 VR + 物理仿真的必备底层技术

### 适用场景
- ✅ 社交 VR 多用户共享物理仿真
- ✅ 数字孪生（工业 / 城市级数字孪生实时交互）
- ✅ VR 协作设计（多人共同操作流体）
- ✅ 跨设备远程物理呈现

## 🔗 关键技术映射

| 鸭血关注项 | 本文贡献 |
|-----------|---------|
| 粒子渲染 | ✅ 粒子传输基础设施 |
| 流体仿真 | ⚠️ 服务端仿真保留，传输效率大幅提升 |
| 实时性能 | ✅ sub-frame latency |
| VR/AR 集成 | ✅ Vision Pro 实测 |

## 📚 引用信息

```bibtex
@article{yanagawa2026deluge,
  title={DELUGE: Decomposed Entropy-coded Live Unstructured Geometry Exchange for Real-time Particle Streaming},
  author={Yanagawa, Hikari},
  journal={IEEE Transactions on Visualization and Computer Graphics (TVCG)},
  note={To appear at IEEE ISMAR 2026},
  year={2026}
}
```

## 🏷️ 标签
`#fluid-rendering` `#particle-rendering` `#compression` `#streaming` `#vr` `#ar` `#social-vr` `#real-time` `#digital-twin` `#ismar` `#tvcg`
