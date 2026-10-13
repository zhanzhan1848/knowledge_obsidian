---
title: "Fluid-Gen-Zero: Grounding Pretrained Video Generators in Physics without Training"
date: 2026-10-13
tags: [fluid-rendering, video-generation, physics-simulation, agentic-workflow, training-free]
authors: [Hong Huang et al.]
arxiv: 2610.10984
venue: arXiv 2026 (cross-list cs.CV / cs.GR)
status: processed
subjects: cs.GR, cs.CV
---

## 核心创新点

首个**免训练**的"物理感知流体-物体交互视频生成"框架：**把运动动力学交给物理仿真器，外观渲染留给预训练视频生成器**，通过两阶段 agentic 工作流桥接两者。

### 关键技术

1. **物理/外观解耦架构**
   - 运动学：物理仿真器（确定流体与物体轨迹）
   - 外观：预训练视频生成器（Tora / VACE / WanMove 等）
2. **两级 Agentic Workflow**
   - **生成时规划** — VLM agent 解读用户意图 + 仿真结果，组织生成片段
   - **潜空间引导** — 通过 region-aware latent wrapping 将仿真信号注入去噪过程
3. **Fluid-Object Interaction 基准** — 新发布的评测基准

### 核心问题

- 现有视频扩散模型生成流体时常违反物理（如水面无重力、流体不响应推动）
- 端到端训练成本巨大

## 渲染技术分类

- **类型**: 神经渲染（视频扩散）+ 物理仿真混合
- **方法**: Plug-and-play 引导式扩散

## 性能指标

在 3 个 backbone 上：
- **物轨迹误差降低**: 26.7% – 81.5%
- **流体端点误差 (fEPE) 降低**: 67.9% – 84.0%
- **人类偏好**: 55.1% – 74.4%（vs 同 backbone）；90.4% – 94.2%（vs 纯仿真）
- **感知质量**: 基本保留

## 适用场景

- AIGC 视频中的物理可信流体
- VFX 特效预览
- 机器人仿真合成训练数据

## 实现建议

- **难度**: 中（需熟悉 VLM agent + 扩散模型接入）
- **算力需求**: 高（依赖 WAN / CogVideoX 等大型视频模型）
- **推荐度**: ✅ 推荐（训练免费 + 即插即用）

## 关键词

`fluid rendering` `video generation` `training-free` `physics simulation` `diffusion model` `agentic workflow`

## 相关工作

- [[2026-09-05-Physics-Grounded-Fluid-Video-Generation]] — 物理约束流体视频生成
- [[2026-09-05-Multi-Agent-Particle-Effects-Generation]] — 多Agent粒子效果

---
*由豆苗自动收集于 2026-10-13*
