---
title: "GMT: Geometric Multigrid Transformer Solver for Microstructure Homogenization"
authors: [et al.]
date: 2026-04-30
tags: [几何, 神经求解器, 多重网格, 点云, 均匀化]
paper_id: 2604.26518
subjects: [cs.GR, physics.comp-ph]
conference: SIGGRAPH 2026 Journal Track
status: new
---

# GMT: Geometric Multigrid Transformer Solver for Microstructure Homogenization

## 核心方法

### 问题定义
晶格超材料（lattice metamaterials）可实现轻量级、多功能结构，但其有效属性的均匀化评估计算成本仍然很高。神经代理模型提供速度但往往缺乏工程级模拟所需的精度和稳定性。

### 关键创新

1. **架构对齐 Geometric Multigrid (GMG)**
   - 重构 Point Transformer V3 以在稀疏 GMG 层次结构上运行
   - 捕获多网格收敛所需的长程依赖和跨层交互

2. **Physics-aware Positional Encoding**
   - 严格保证周期性的物理一致性编码
   - 预测最精细级解决方案和多层次残差校正

3. **Solver-aware Training**
   - 谱对齐初始化
   - 在物理知情和求解器感知损失下进行端到端训练
   - 只需单次 GMG V-cycle 细化即可收敛

### 实验结果
- 相对残差误差达到 10^-5
- 在同等精度下比 SOTA GPU 求解器快 160 倍
- 在高分辨率（512³）下效果尤为显著

## 开源参考
- SIGGRAPH 2026 journal track

## 相关笔记
[[Neural Implicit Surface]]
[[Point Transformer]]
[[Lattice Metamaterials]]

## 可行性分析
✅ 推荐实现（针对特定场景）

**理由**：
- SIGGRAPH 2026 论文，数值精度有保证
- 160x 加速效果显著
- 适合材料设计、拓扑优化场景