---
tags: [点云重建, 主动扫描, 贝叶斯决策, Next-Best-View, 逆向几何]
date: 2026-05-12
source: arXiv cs.GR
conference: ACM SIGGRAPH 2026
---

# A Bayesian Approach for Task-Specific Next-Best-View Selection with Uncertain Geometry

## 核心方法

### 问题定义
3D 重建中的 **Next-Best-View (NBV)** 选择问题：
- 给定稀疏点云和不确定几何
- 选择下一个最佳视角进行扫描
- 传统方法均匀减少不确定性，与任务无关

### 核心创新：任务相关的贝叶斯框架

1. **在隐式表面空间放置先验分布**
2. **使用随机表面重建方法计算后验分布**
3. **利用后验分布直接推理下一个扫描视角**

关键洞察：**减少不确定性只在与任务相关的区域有意义**

### 三大下游任务验证

| 任务 | 说明 |
|------|------|
| Semantic Classification | 语义分类 |
| Segmentation | 分割 |
| PDE-guided Physics Simulation | PDE引导的物理仿真 |

## 技术框架

```
Prior Distribution (隐式表面空间)
         ↓
Stochastic Surface Reconstruction (计算后验)
         ↓
Bayesian Decision Theory (选择下一个视角)
         ↓
Task-Optimized Scanning
```

## 实验结果

- 在三个下游任务上实现更优任务性能
- 相比基线和通用不确定性减少技术，所需视角更少

## 开源参考
- Authors: Alexander Terenin et al.
- arXiv: [2605.05095](https://arxiv.org/abs/2605.05095)
- Code: [BayesianNBV](https://github.com/jingsenzhu/BayesianNBV)
- Journal: ACM SIGGRAPH 2026

## 相关笔记
[[2026-05-12-DAILY-SUMMARY]]

## 技术分类
- 点云处理 > 主动扫描 > Next-Best-View
- 几何重建 > 逆向工程 > 贝叶斯优化
