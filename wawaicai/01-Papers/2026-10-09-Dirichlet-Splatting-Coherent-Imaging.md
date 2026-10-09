---
tags: [几何, 渲染基元, 高斯泼溅, 相干成像, 波形反演, 太赫兹, 算法]
date: 2026-10-09
source: arXiv
arxiv_id: 2610.00618
venue: ACM Transactions on Graphics
authors: Xingyu Chen et al.
---

# Dirichlet Splatting: Differentiable Rendering for Wave-Based Inverse Problems

## 核心问题
基于波相干的成像（太赫兹层析、合成孔径声学、毫米波雷达）通过 Fourier 处理有限长度信号成像，其**精确点扩散函数不是高斯**，而是**Dirichlet 核**：复数、振荡、周期。

将 3D 高斯泼溅迁移到相干传感**因构造而失败**：
- 高斯 splats 抛弃旁瓣能量（占总量 10-20%）
- 高斯 splats 抛弃控制相干反射器间干涉的**相位**

## 方法概述

**关键想法**：用物理精确的**Dirichlet 核**（有限窗口 DFT）替换学习的高斯斑点。

### 渲染基元
- 每个 surfel 携带 area、normal、material
- 渲染基元匹配测量物理而不是近似

### 求解器
- **Dirichlet Sliding Frank-Wolfe (DSFW)**：
  - 可变投影
  - 残差对偶证书
  - 证书驱动的低效用 surfels 硬替换
  - 周期性低分辨率耦合 Levenberg-Marquardt 校正
- 导航让通用一阶优化器崩溃的崎岖损失景观

### 数学保证
- Dirichlet 核的 O(1) 闭合形式评估
- 前向模型与 FFT 真解**机器精度一致**
- 端到端可微

## 实验结果

**密集太赫兹重建**：
- 反射器中心 RMSE = **0.018 bin**
- 比波形级自动微分快 **10-50×**
- 在此基准上高斯 splats **失败**

## 复杂度分析
- **前向模型**：O(n)（n 为 surfel 数）
- **导数**：与正向同量级，因 O(1) Dirichlet 评估
- **优化轮数**：受 DSFW 算法收敛保证控制

## 实现难度
- 算法复杂度：**高**
  - Dirichlet 核的数学分析
  - Sliding Frank-Wolfe 优化
  - Levenberg-Marquardt 校正耦合
- 数值稳定性：**优秀**（O(1) 闭合形式 + 残差证书）
- 依赖项：
  - FFTW — DFT 计算
  - Mitsuba 3 — 可微渲染基线（参考）
  - 自实现 DSFW

## 推荐结论
✅ **推荐关注**（跨学科：图形学 + 物理成像）

技术亮点：
1. **真正的物理渲染基元**：不是近似，而是 DFS 物理内核
2. **机器精度一致**：O(1) 评估带来强稳定性
3. **替代 3DGS 范式**：对相干成像场景中的几何重建有显著差异

## 开源参考
- **FFTW** — 快速 Fourier 变换
- **Mitsuba 3** — 可微路径追踪器（实现参考）
- **OpenCV** — 波束成形参考
- 论文接受 ACM TOG — 顶刊，代码应会开源

## 与几何处理的关联
- 渲染基元的本质是**几何表示**：Dirichlet 核代表了一种新的可选基元
- 可激发"非高斯 splat"的更广泛研究
- 在黄喉知识库中可归类为"网格/点云替代表示"

## 应用场景
- 太赫兹层析成像
- 合成孔径雷达 (SAR)
- 毫米波 3D 传感
- 声学成像

## 备注
- 论文已被 ACM TOG 接收，**高质量确认**
- 代码应在 TOG 配套项目页给出

---
相关主题：[[3D 高斯泼溅]] [[相干成像]] [[可微渲染]]
