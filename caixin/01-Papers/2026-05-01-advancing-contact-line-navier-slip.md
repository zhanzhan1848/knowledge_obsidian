# The Rapidly Advancing Contact Line Part-1: Navier Slip and Microscale Inertial Effects

## 论文信息
- **arXiv**: [2605.00303](https://arxiv.org/abs/2605.00303)
- **分类**: physics.flu-dyn
- **提交日期**: 2026-05-01
- **关键词**: contact line, Navier slip, curtain coating, VOF, micro-scale inertia, capillary number

## 研究背景
帘式涂层 (curtain coating) 中，移动板以落液膜涂覆，推进接触线在毛细数 Ca ~ O(1) 下工作。超临界时发生气泡夹带导致润湿失败。

## 方法
- **两相 Navier-Stokes + VOF** 模拟
- **四叉树自适应网格细化** (quadtree AMR)，解析微尺度 (∼10 μm)
- **Navier 滑移边界条件** + 固定接触角
- 对比实验数据 (Liu et al 2016)

## 核心发现

### 加速证据 ≠ 反证
实验观察到沿流体界面接近接触线时速度加速，被解释为反对 Navier 滑移模型的证据。
本文证明：**这种加速与滑移模型兼容**。

关键洞察：
- Navier 滑移意味着接触线处速度为零
- 但实验可及的微尺度区域 (r ∼ 10 μm) 位于滑移区域**之外**
- 在该区域局部 Reynolds 数 ~ O(1)，惯性主导

### 物理建模
- 微尺度区域：惯性修正的楔流解（楔角由拐点值确定）
- 更大尺度：Benney 解描述界面弯曲

## 数值细节
- **求解器**: 两相 NS, 自适应网格
- **稳定性**: CFL 条件由局部网格尺度决定
- **关键结果**: 重现临界毛细数对全局 Reynolds 数的非单调依赖关系

## 创新点
首次证明微尺度惯性效应（不含于纯 Stokes 流）可解释实验观测的界面加速，从而不构成对 Navier 滑移模型的否定。

## 评注
⭐⭐⭐ 高影响力 — 接触线模型是 VOF 界面追踪的核心难题，本文澄清了一个关键性误解，对涂层工艺和润湿模拟有直接指导意义。