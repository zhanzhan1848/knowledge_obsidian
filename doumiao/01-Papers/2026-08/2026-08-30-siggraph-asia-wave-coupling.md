# Hamiltonian Two-Way Coupling of Nonlinear Waves and 3D Flows

## 论文信息
- **arXiv**: [2608.25203](https://arxiv.org/abs/2608.25203)
- **DOI**: https://doi.org/10.1145/3842540
- **会议**: ACM Transactions on Graphics (SIGGRAPH Asia 2026)
- **作者**: Sinan Wang et al.
- **日期**: 2026-08-25

## 核心创新点

### 问题背景
大规模自由水面模拟长期以来面临 2D 波模型与 3D 流体求解器耦合时的波动力学不匹配问题。传统的 2D 波模型（如图 2.3 所示方法）在 graphics 领域通常要么是线性的，要么是非色散的，在平静、小振幅海域表现快速、简单且准确，但与强非线性 3D 求解器耦合时会在 2D-3D 接口处产生明显的反射和伪影。

### 解决方案：哈密顿双向耦合
本文引入基于 Zakharov 规范公式的非线性色散 2D 波模型，其哈密顿结构中：
- 表面高程和表面势能构成规范对 (η, ψ)
- 受波能控制

### 关键技术优势
1. **规范一致的双向耦合方案**：信息可平滑跨 2D-3D 接口传递
2. **误差降低 1.7-5 倍**：相比 SWE、BEM 和 Airy 基线
3. **速度提升超过 10³ 倍**：比 BEM 更快
4. **更大非线性精度和耦合保真度**：相比 SWE 和 Airy

### 耦合性能
- 与 3D Navier-Stokes 求解器耦合
- 在各种实验中抑制可见的接缝伪影
- 包括色散匹配和 Kelvin 尾流测试
- 比纯 GPU NB-FLIP 模拟快 4 倍以上

## 技术公式

### 哈密顿 formulation
表面高程和表面势能构成规范对 (η, ψ)

### 关键方程
$$p(r,u) \propto \exp(-\beta r g(u))$$
其中 $g(u) = 1 - b \cdot u + u^T Q u$

## 渲染相关技术标签
#water-rendering #ocean-rendering #fluid-simulation #wave-dynamics #siggraph-asia-2026 #2d-3d-coupling

## 笔记
- 这是 SIGGRAPH Asia 2026 的论文，直接涉及水面渲染
- 哈密顿结构保证了数值稳定性和耦合的一致性
- 对于大规模海面渲染有重要参考价值
