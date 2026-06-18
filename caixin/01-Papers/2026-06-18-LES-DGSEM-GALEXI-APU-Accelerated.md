# APU-Accelerated Large Eddy Simulation with the Discontinuous Galerkin Solver GALÆXI

> **arXiv**: [2606.18927](https://arxiv.org/abs/2606.18927)  
> **Category**: physics.flu-dyn  
> **Submitted**: Wed, 17 Jun 2026  
> **Author**: Spencer Starr et al.

## 核心创新点

- **异构计算**: 在 AMD MI300A APU 上实现 DGSEM 求解器的 GPU 加速
- **壁面建模 LES**: 将壁面建模大涡模拟算法集成到 GPU 加速框架中
- **验证算例**: 平面湍流通道 + 跨音速压气机级联

## 数值方法

- **离散化**: 间断 Galerkin 谱元法 (DGSEM)
- **LES 模型**: 壁面建模大涡模拟 (Wall-Modeled LES, WMLES)
- **求解器框架**: GALÆXI (架构无关的 DGSEM 框架)
- **硬件**: AMD MI300A APU (Heterogeneous GPU)

## 关键发现

1. **强/弱可扩展性**: 在 Hunter 超算上分析了 AMD MI300A APU 的强/弱 scaling 性能
2. **计算分区**: 评估了 AMD MI300A 可用的计算分区模式影响
3. **物理验证**: 平面湍流通道 testcase 验证了 WMLES 算法
4. **复杂流动**: 跨音速压气机级联的壁面解析 LES 成功捕捉激波-湍流边界层干扰 (SWBLI)

## 计算成本

- DGSEM 局部计算模板(local stencil) 特性适合 GPU 并行
- 高阶精度 + 局部 stencil = 异构超算的理想基础

## 关联技术

- [[间断 Galerkin 方法]]
- [[大涡模拟 (LES)]]
- [[壁面建模]]
- [[GPU 加速 CFD]]
- [[激波-湍流边界层干扰]]

## 可行性分析: GPU 加速 DGSEM 求解器

## 控制方程
可压 N-S 方程，间断 Galerkin 谱元法离散

## 数值方法
- 离散化：间断 Galerkin 谱元法 (DGSEM)
- 求解器：高阶精度局部模板
- 稳定性：高阶方法 CFL 约束

## 计算成本
- 适合 GPU 并行化
- AMD MI300A APU 异构架构
- 强/弱 scaling 性能已验证

## 推荐结论
✅ 推荐实现 — DGSEM 的局部 stencil 特性天然适配 GPU 并行，壁面建模 LES 算法已成功集成

---
*Tags*: #LES #DGSEM #GPU #CFD #HPC #AMD #壁面建模
