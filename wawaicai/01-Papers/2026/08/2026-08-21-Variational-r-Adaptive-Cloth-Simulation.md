---
title: "Variational r-Adaptive Cloth Simulation"
authors: [Jiahao Wen et al.]
date: 2026-08-18
tags: [几何, 布料模拟, r-自适应, 变分法]
arxiv: "2608.17833"
doi: "10.48550/arXiv.2608.17833"
subjects: [cs.GR]
---

# Variational r-Adaptive Cloth Simulation

## 核心方法

首个**现代布料管线中模拟布料动力学和静力学的 r 自适应方法**，含摩擦接触。

### 核心问题
薄布料需要高有效空间分辨率以再现皱纹、褶皱、屈曲和尖锐接触特征，但现有变分 r 自适应应用于分段线性壳层时存在两个耦合失败模式。

### 关键技术

1. **退火激活质量正则化**（Degeneracy-Activated Quality Regularization）
   - 仅对良好形状元素保持不活跃
   - 保留各向异性适应和局部加密
   - 在退化附近变强
   - 抑制伪低能量盆地
   - 防止元素聚集（cloth-specific failure）

2. **动态非线性求解器**
   - 利用时间步内一致性
   - 加速导数评估
   - 动态 IPC 容差更新
   - 3-6x 加速 vs 最佳 ITR

## 性能对比
- 相等顶点数和时间预算下，视觉保真度更高

## 相关技术
- r-Adaptive Methods
- Cloth Simulation
- Variational Methods
- Incremental Potential Contact (IPC)

## 可行性评估

**推荐度：✅ 推荐实现**

- 布料模拟中的 r 自适应方法有重要应用
- 动态求解器设计有参考价值
- 摩擦接触处理值得学习

## 会议信息
arXiv Submission, 2026-08-18
