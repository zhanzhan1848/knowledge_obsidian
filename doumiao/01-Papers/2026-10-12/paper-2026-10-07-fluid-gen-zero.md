---
title: "Fluid-Gen-Zero: Grounding Pretrained Video Generators in Physics without Training"
date: 2026-10-07
tags: [fluid-rendering, fluid-simulation, video-generation, physics-aware, training-free, agentic-workflow]
authors: [Hong Huang, Yuqiu Liu, Chenyu You, Daniel Martin, Chuhang Zou, Wuyang Chen]
paper_id: 2610.10984
subject: cs.CV
status: reviewed
priority: high
relevance: ⭐⭐⭐⭐⭐
---

## 核心创新点

### 问题定义
无需训练地将预训练视频生成模型与物理流体仿真结合，生成物理感知的流体-物体交互视频。

### 技术挑战
1. **物理-视觉融合** - 物理推理与外观生成本质上是两个域
2. **无训练约束** - 不能对现有视频基础模型进行微调
3. **流体-物体交互** - 需要同时建模流体动力学与物体运动
4. **基础模型兼容** - 框架应能 plug-and-play 接入多个视频模型

### 核心方法
- **解耦设计**: 物理推理 → 物理仿真器，外观 → 预训练视频生成器
- **双层 Agentic Workflow**:
  1. **生成时规划 (Generation-time planning)**: VLM Agent 解析意图 + 仿真 rollout，组织生成片段
  2. **潜空间引导 (Latent-space guidance)**: 通过 region-aware latent wrapping 将仿真信号注入去噪过程
- 引入流体-物体交互视频生成 benchmark

## 渲染技术

### 类型
- **物理驱动视频合成** (Physics-driven Video Generation)
- 流体仿真 + 神经视频生成器

### 关键创新
- 完全 training-free（无训练）
- plug-and-play 设计
- 兼容现有视频基础模型（Tora/CogVideoX、VACE、WanMove/Wan）

## 关键技术

| 技术 | 说明 |
|------|------|
| **Physics Simulator** | 提供流体-物体运动动力学 |
| **Pretrained Video Generator** | 提供高质量外观建模 |
| **VLM Agent** | 生成时规划与意图解析 |
| **Region-aware Latent Wrapping** | 仿真信号注入去噪过程 |
| **fEPE Metric** | 流体流端点误差评估指标 |

## 实验结果

### 兼容性
- ✅ Tora (CogVideoX-based)
- ✅ VACE (Wan-based)
- ✅ WanMove (Wan-based)

### 关键指标
- **对象轨迹误差下降**: 26.7% - 81.5%
- **流体 fEPE 下降**: 67.9% - 84.0%
- **人类偏好研究**:
  - 同 backbone 对比: 55.1% - 74.4% 胜出
  - 对比仿真方法: 90.4% - 94.2% 胜出

## 实现建议

### 实现难度
**高** - 需要集成物理仿真、VLM Agent、视频生成器、潜空间注入等多模块

### 预期性能
- **推理时间**: 取决于视频基础模型，分钟级/段
- **GPU 需求**: 高（视频生成基础模型）
- **训练**: 无（training-free）

### 适用场景
- ✅ 物理可信的流体-物体交互视频生成
- ✅ 短视频流体特效快速生成
- ✅ 多 backbone 即插即用部署
- ⚠️ 受限于预训练视频模型的质量
- ❌ 实时交互（生成式方法固有局限）

### 推荐度
**✅ 推荐** - 训练免费 + 物理感知 + 多模型兼容，是 fluid video generation 方向的实用突破

## 相关工作

- [[Video Generation Models]]
- [[Fluid Simulation]]
- [[Physics-Aware Generation]]
- [[Agentic Workflow]]
- [[VLM Planning]]

## 资源链接

- 论文: https://arxiv.org/abs/2610.10984
- arXiv PDF: https://arxiv.org/pdf/2610.10984
- 代码: 待发表（code and data will be released upon acceptance）

## 一句话总结
> 通过 VLM Agent 规划 + Region-aware latent wrapping，将物理仿真器与预训练视频生成器解耦结合，training-free 地实现物理感知的流体-物体交互视频生成，跨 3 个 backbone 显著提升物理对齐与人类偏好。

---
*由豆苗自动收集于 2026-10-12*