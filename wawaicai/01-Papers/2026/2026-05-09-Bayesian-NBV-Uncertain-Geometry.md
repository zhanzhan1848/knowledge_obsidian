---
tags: [几何, 点云, 重建, 贝叶斯, Next-Best-View]
date: 2026-05-09
category: [arXiv, cs.GR]
venue: ACM SIGGRAPH 2026
---

# A Bayesian Approach for Task-Specific Next-Best-View Selection with Uncertain Geometry

## 核心方法

将**任务特定主动 Next-Best-View (NBV) 选择**问题框架置于**贝叶斯决策理论**中，用于点云 3D 重建。

### 技术流程
1. 在隐式表面空间上放置**先验分布**
2. 使用随机表面重建方法计算**后验分布**
3. 使用后验分布推理下一步扫描视角

### 核心思想
直接针对重建数据的下游任务用途进行优化——仅减少对任务有影响区域的不确定性，而非像之前方法那样在空间上均匀减少不确定性。

## 下游任务评估
1. **语义分类** (semantic classification)
2. **分割** (segmentation)
3. **PDE 引导的物理模拟** (PDE-guided physics simulation)

## 实验结果
- 在三个下游任务上，使用更少视角达到优于 baseline 和一般不确定性减少技术的任务性能

## 算法复杂度
- 时间复杂度：O(N) 每视角评估
- 空间复杂度：O(N) 隐式表面表示

## 创新点
- 首次将贝叶斯决策理论用于 NBV 选择
- Task-specific uncertainty reduction（非均匀）

## 可行性分析
- ✅ 可推荐实现
- 难度：中
- 数值稳定性：依赖随机表面重建方法的收敛性
- 代码：https://github.com/jingsenzhu/BayesianNBV

## 相关笔记
[[点云重建]]
[[贝叶斯优化]]
