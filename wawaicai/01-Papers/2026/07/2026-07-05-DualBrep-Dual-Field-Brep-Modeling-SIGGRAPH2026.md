---
tags: [CAD, B-rep, 深度学习, 生成模型, SIGGRAPH2026]
source: arXiv cs.GR
date: 2026-06-30
conference: SIGGRAPH 2026
---

# DualBrep: A Dual-Field Continuous Representation for B-rep Modelling

## 论文信息
- **arXiv**: [2606.31579](https://arxiv.org/abs/2606.31579)
- **作者**: (AutodeskAILab)
- **会议**: SIGGRAPH 2026
- **代码**: https://github.com/AutodeskAILab/DualBrep

## 核心方法
边界表示 (B-rep) 是 CAD 中最常用的数据格式，但其异构结构（连续参数几何 + 离散拓扑图）对深度学习构成根本挑战。

### 问题
- 现有方法直接预测异构 B-rep 图，使用固定大小填充或顺序分词处理可变原语数量
- 图数据的离散性、非可微性阻止了几何和水密性的端到端优化

### 解决方案：DualBrep
将 B-rep 几何和拓扑统一在完全结构化的欧几里得域内：

1. **双标量场编码**：
   - **SDF (Signed Distance Function)**：表示全局形状几何
   - **UDF (Unsigned Distance Field)**：通过表面元素的 Voronoi 划分隐式编码拓扑结构

2. **联合潜在空间**：将双场压缩到单一潜在空间，使生成变得可处理

3. **Flow Matching 模型**：从单一代码联合采样几何和拓扑，避免顺序 B-rep 预测器的误差累积

4. **神经重建器**：从连续双场提取显式 B-rep 模型（棱柱和自由形式原语）

## 关键创新
- **连续表示**：统一 B-rep 几何和拓扑
- **双场 formulation**：primitive-free 分割信号，适配任意面数和表面类型
- **Flow Matching**：避免顺序预测的误差累积
- **联合生成**：几何和拓扑联合采样

## 应用场景
- 点云逆向工程
- 基于潜在 Flow Matching 的生成建模

## 开源实现
- GitHub: https://github.com/AutodeskAILab/DualBrep

## 相关笔记
[[CAD]], [[B-rep]], [[SDF]], [[Flow Matching]], [[生成模型]], [[逆向工程]]
