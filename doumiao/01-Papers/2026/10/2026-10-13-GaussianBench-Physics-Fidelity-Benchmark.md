---
title: "GaussianBench: Physics-Fidelity Evaluation for Gaussian Scene Representations"
date: 2026-10-13
tags: [fluid-simulation, 3dgs, physics-integrated, benchmark, MPM, thermomechanical]
authors: [Unspecified]
arxiv: 2610.10554
venue: arXiv 2026
status: processed
subjects: cs.GR, cs.LG
---

## 核心创新点

针对"物理集成 Gaussian 场景表示"出现的**评估失真**问题：现有评估指标只测视觉合理性，无法识别**内部物理机制错误**。**GaussianBench** 提供物理保真度评估套件，专门检测"看起来对、不一定对"的问题。

### 关键技术

1. **冻结文件场景** — 不依赖具体仿真器接口，可复现评测
2. **仿真器独立打分** — 多套物理量度，与具体实现解耦
3. **六大物理测试**
   - 守恒律 (Conservation)
   - 连续介质响应 (Continuum response)
   - 多材料耦合 (Heterogeneous-material coupling)
   - Gaussian 协方差传输与渲染 (Covariance transport)
   - 热相变 (Thermal phase change)
   - 反事实响应 (Counterfactual response)
4. **四值判定** — PASS / FAIL / NA / INVALID（区分物理失败 vs 能力不支持 vs 比较无效）

### 配套参考实现

**GaussianFlesh**：高斯做渲染 primitive + 连续介质物质点，由 shared-grid MPM 推进，含：
- per-particle constitutive dispatch
- 持久热/相态

### 评测结果

评测 6 个 release 系统：PhysGaussian / GaussianFluent / OmniPhysGS / PhysDreamer / Physics3D / GASP

发现的问题：
- 单材质对，**多材料接触面失败**
- 对未出现过的形变类型，高斯更新正确但回滚异常

## 渲染技术分类

- **类型**: 物理仿真 + 神经渲染
- **方法**: 物理积分 3DGS + MPM

## 适用场景

- 物理 + 神经渲染项目的内部校验
- 学术评测基准
- 物理仿真器辅助评估

## 推荐度

✅ 推荐 — 对做物理集成 Gaussian 表征的工作有直接参考价值

## 关键词

`3D Gaussian Splatting` `physics simulation` `benchmark` `MPM` `conservation` `thermomechanical`

## 相关工作

- [[2026-09-05-GauSmoke-Hybrid-Physics-Optical-Gaussian-Splatting]] — 烟雾 Gaussian 表征
- [[2026-09-05-LagrangianSplats-Divergence-Free-Fluid-Reconstruction]] — 散度自由流体

---
*由豆苗自动收集于 2026-10-13*
