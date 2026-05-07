---
tags: [几何, 主动扫描, 点云, Bayesian决策, SIGGRAPH2026]
date: 2026-05-07
source: arXiv cs.GR
---

# A Bayesian Approach for Task-Specific Next-Best-View Selection with Uncertain Geometry

## 核心方法

提出基于**贝叶斯决策理论**的任务特定主动下一最佳视角选择框架，用于从不完整点云进行3D重建。核心思想：

1. **先验分布**：在隐式曲面空间上放置先验分布
2. **后验计算**：使用随机曲面重建方法计算后验分布
3. **视角选择**：使用后验分布进行任务优化的视角推理

关键创新：不等量削减不确定性，而是只削减**任务相关区域**的不确定性。

## 核心算法

- 使用**高斯过程**建模点云中的不确定性（Sellán & Jacobson 2022）
- 贝叶斯决策理论框架：将下一视角选择建模为黑盒优化问题
- 任务特定获取函数（acquisition function）直接优化下游任务性能

## 下游任务验证

- **语义分类** (semantic classification)
- **分割** (segmentation)
- **PDE引导的物理模拟** (PDE-guided physics simulation)

## 实验结果

- 相比均匀不确定性削减方法，任务性能更优，视角数量更少
- Code: https://github.com/jingsenzhu/BayesianNBV

## 几何相关性

- 点云3D重建 → 曲面重建
- 主动扫描 → 迭代式点云精化
- 不确定性量化 → 几何质量评估

## 开源参考

- GitHub: jingsenzhu/BayesianNBV
- 相关方法: Gaussian Process Surface Reconstruction (Sellán & Jacobson 2022)

## 推荐度

✅ **推荐关注** — SIGGRAPH 2026 论文，贝叶斯框架与几何处理的结合是新的研究方向