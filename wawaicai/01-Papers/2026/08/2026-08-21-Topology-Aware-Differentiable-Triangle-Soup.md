---
title: "Topology-Aware Differentiable Triangle-Soup Reconstruction via Persistent Homology"
authors: [Viritphon Chongpermwattanapol]
date: 2026-08-17
tags: [几何, 拓扑, 表面重建, 持续同调, 可微分编程]
arxiv: "2608.16848"
doi: "10.48550/arXiv.2608.16848"
subjects: [cs.GR]
---

# Topology-Aware Differentiable Triangle-Soup Reconstruction via Persistent Homology

## 核心方法

解决**可微分三角形重建中拓扑缺失问题**，首次将拓扑信息（通过持续同调）纳入可微分表面重建的目标函数。

### 核心问题
现有可微分三角形重建的目标函数（光度损失、几何损失）无法衡量拓扑——重建中的坍塌环或穿孔封闭空腔可能与正确重建得分相同。

### 关键发现
- 在 Chamfer 相同探测下，diagram 在 bottleneck 距离上差异 35-40x
- 标准隐式补救（引导 resampler 分配）无法修复
- 拓扑 informed prior 效果与随机 prior 相当
- 没有任何 prior 能修复环

### 核心创新

1. **可微分持续项**（Differentiable Persistence Term）
   - 将拓扑信息纳入目标函数
   - 比较演化表面 diagram 与固定目标
   - 梯度通过配对冻结的向后重表达 matched birth/death simplices 为闭式 circumradii
   - 加上 recruitment term 恢复缺失特征的梯度

2. **单一比率旋钮**
   - 一个比率旋钮校准损失与光度梯度的平衡
   - 无需课程学习（curriculum）

### 性能提升
- **封闭空腔（enclosed voids）**：4.0-7.9x 更低误差
- **环（loops）**：2.3x（零伪handle），对照方法坍塌一个
- H0（连通分量）：无显著差异（预期）

## 算法复杂度
- 时间复杂度：待分析
- 空间复杂度：与标准 Chamfer 损失相当

## 相关技术
- Persistent Homology / 持续同调
- Differentiable Surface Reconstruction
- Bottleneck Distance
- Topological Data Analysis

## 可行性评估

**推荐度：✅ 推荐实现**

- 将拓扑引入可微分重建是重要创新
- 对网格拓扑修复、孔洞填充有直接参考价值
- DIPhop（持续同调 Python库）可用于参考实现
- CGAL 的 Persistent Homology 模块可参考

## 会议信息
arXiv Submission, 2026-08-17
