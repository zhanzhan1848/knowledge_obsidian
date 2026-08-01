---
title: "Kinetic Linear Stability Theory for High-Speed Compressible Flows: A High Performance Computing Framework"
authors: []
date: 2026-07-29
arXiv: "2607.27440"
subjects: ["physics.flu-dyn"]
tags: [CFD, navier-stokes, kinetic-theory, stability, HPC, compressible-flow]
review-date: 2026-08-01
---

## 核心创新点

1. **动力学线性稳定性理论 (kLST)**：首次对一元法向激波开发并应用基于 Boltzmann-BGK 方程线性化的动力学线性稳定性理论
2. **突破连续介质假设限制**：激波内有限厚度高梯度区域，连续介质假设变得可疑，产生平移非平衡
3. **非麦克斯韦速度分布**：保留激波内双模态速度分布
4. **HPC 框架**：开发并行 SLEPc/PETSc 基础设施

## 控制方程

- **Boltzmann-BGK 方程**：线性化关于动力学 BE-BGK 基态流
- **约化分布函数**：扰动以约化分布函数形式提出
- **宏观场恢复**：通过速度空间矩恢复

## 数值方法

- **特征值问题**：线性稳定性算子作用于 VDF 而非封闭连续系统
- **验证**：与连续介质附近的可压缩 Couette 特征值基准进行验证
- **计算条件**：氩气激波，$M_\infty = 1.2, 3.0, 4.0$
- **大规模计算**：
  - $O(10^5)$ 未知量，多达数十亿非零元
  - Shift-and-invert Arnoldi + MUMPS LU（中等规模）
  - Jacobi-Davidson + block-Jacobi ILU（最大规模）
  - $M_\infty=4.0$ 激波：281088 未知量

## 关键发现

- **低 Mach 数**：BE-BGK 和 Gilbarg-Paolucci 轮廓几乎重合，谱恢复稳定连续分支
- **高 Mach 数**：基于非平衡 VDF 的特征谱与麦克斯韦相比移向稳定性降低区域
- **动力学效应**：连续介质预测可能遗漏重要变化，即使宏观轮廓看起来已充分解析
- **已知最高 Mach 数**：据我所知，这是孤立有限厚度激波层报告的最高 Mach 动力学线性稳定性计算

## 链接

- arXiv: https://arxiv.org/abs/2607.27440
- 65 pages, 19 figures, 17 tables
