---
title: "FluidGen: Physics-Aware Fluid Video Generation via Motion-Guided Post-Training"
date: 2026-10-20
tags: [fluid-rendering, smoke-rendering, fire-rendering, video-generation, diffusion-model, velocity-field, houdini, physics-aware]
authors: [Yang Zheng, Zizhang Li, Boyang Deng, Jan Ackermann, Lei Shu, Yinghao Xu, Jiajun Wu, Gordon Wetzstein, Leonidas Guibas]
paper_id: 2610.25660
subject: cs.CV; cs.GR
venue: arXiv preprint 2026
status: reviewed
source: arXiv 2026-10-19
---

## 核心创新点

### 问题定义
视频生成模型（Sora、Wan2.1 等）在流体现象（烟雾、火焰、爆炸碎片）上系统性地失败：生成的运动缺乏连贯的涡量结构，坍塌为违反真实流体物理的平庸动态。传统 CFD 求解器物理保真度极高，但需要精细 3D 场景和参数调优，无法直接用于 in-the-wild 视频生成。

### 核心方法
**双流架构 + 速度场 DPO**
将数据驱动的流体先验注入预训练视频扩散模型，训练数据采用 Houdini 高保真仿真（带速度场真值）+ 真实流体视频（外观多样性）的混合。

1. **双流架构** - 共享 Wan2.1 denoiser 同时预测 RGB 与逐帧 3D 速度场（速度通道零初始化）
2. **速度编码** - 每像素 3D 速度通过球坐标被编码为 RGB 色彩，复用预训练 VAE 隐空间
3. **两阶段后训练** - 仿真 + 真实视频联合有监督微调 → 速度感知的直接偏好优化（DPO）
4. **物理奖励** - 基于预测速度场计算物理一致性，作为 DPO 偏好信号

### 技术亮点
- **可解释物理量**：速度场作为中间表征，可被 Houdini 接收用于驱动新仿真
- **仅后训练**：继承 14B 参数 Wan2.1-I2V 视觉先验，不改变模型架构
- **零样本真实视频速度估计**：RePaint 风格条件采样从 RGB 视频反推 3D 速度

## 渲染技术
- **类型**: 粒子/体积渲染（生成式）
- **方法**: 扩散模型 + 双流架构 + 速度监督 + DPO
- **风格**: 物理保真的视频流体渲染（生成式管线）
- **逼真度**: ⭐⭐⭐⭐⭐

## 性能与实验

### 与基线对比
| 方法 | 类型 | 物理一致性 |
|------|------|----------|
| Wan2.1-I2V-14B | 纯 RGB 扩散 | 缺乏涡量结构 |
| FluidGen w/o DPO | 微调后 | 运动连贯 |
| FluidGen (Full) | + DPO | 精细涡量、逼真细节 |

### 应用
- **从真实视频反推速度场**：恢复的烟雾场展示与观测一致的连贯平流
- **驱动 Houdini 仿真**：生成的速度场直接导入 Houdini 用于新流体源仿真
- **形状过渡**：烟雾被引导塑形为马、猫、龙等形态，同时保持物理可行

## 数据集与训练
- **仿真数据**: Houdini 高保真流体仿真，含速度场真值配对
- **真实数据**: 真实流体视频（in-the-wild fire/smoke/explosion/ink），用于外观多样性
- **训练**: 两阶段 — 联合监督微调 → 速度感知 DPO

## 局限性（推测）
- 仅作为生成管线，未提供实时 CG 物理引擎可用的轻量级表示
- 速度场仅用于监督信号，未直接落到 3DGS / NeRF 等可重光照的可控表征
- 仍依赖 Wan2.1-I2V 基模型，推理成本高（14B 参数）

## 相关工作 / 知识图谱链接
- [[2026-10-09_Fluid-Gen-Zero]]（同时期另一篇无训练的物理流体视频生成）
- [[2024-01-GaussianSplashing]]（高斯粒子流体）
- [[2025-02-05-volumetric-nca-smoke-stylization]]（神经 CA 烟雾风格化）
- [[Foundation-Models-For-Fluid-Rendering]]（流体渲染生成式方向）

## 实现建议
- **实现难度**: 高（需要 Houdini 仿真管线、14B 扩散模型微调、速度场 DPO 训练）
- **预期性能**: 离线生成（实时性依赖基模型，>10s/clip 量级）
- **适用场景**: VFX 预可视化、影视特效烟雾/火焰/爆炸生成、广告合成素材

## 资源链接
- 论文: https://arxiv.org/abs/2610.25660
- 项目页: https://y-zheng18.github.io/FluidGen/
- DOI: https://doi.org/10.48550/arXiv.2610.25660

---
*由 🌱 豆苗自动收集于 2026-10-20 (cron: doumiao-daily-paper-search)*
