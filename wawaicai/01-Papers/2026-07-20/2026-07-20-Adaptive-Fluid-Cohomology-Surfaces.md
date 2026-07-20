---
tags: [几何, 流体模拟, 网格处理, 自适应, 上同调]
type: paper
date: 2026-07-20
source: arXiv cs.GR
---

# Adaptive Fluid Cohomology on Surfaces

## 论文信息

- **arXiv**: [2607.12001](https://arxiv.org/abs/2607.12001)
- **作者**: David Stotko
- **会议/期刊**: cs.GR → CGF (Computer Graphics Forum)
- **日期**: 2026-07-13

## 核心方法

### 问题定义
- 非单连通曲面上的无粘不可压缩流体模拟
- 需要仔细处理流体的局部和全局行为
- 现有方法缺乏空间和时间自适应性
- 质量差的网格导致数值不稳定

### 创新点：Adaptive Fluid Cohomology

#### 1. 动态空间自适应
- 利用先验误差估计实时调整空间分辨率
- 自适应网格细化/粗化

#### 2. 时间精度
- Dormand-Prince 5(4) 时间步进方案
- 高阶时间精度

#### 3. 网格变换时谐波基稳健传输
- 解决重网格化过程中的数值不稳定
- 保持流体的底层谐波分量

## 技术亮点

### 欧拉方程在曲面
- 流体力学基本方程
- 适配曲面几何

### 上同调 (Cohomology)
- 处理流体的全局拓扑
- 谐波分量分析

### 内存优化
- 内存占用减少高达 **86%**
- 保持数值稳定

## 实验结果

- 准确重现高分辨率模拟动态
- 低质量三角网格上稳定运行
- 静态方法失败的场景可正常工作

## 会议链接

- DOI: https://doi.org/10.2312/cgf.70569

## 相关技术

- [[Fluid Simulation]]
- [[Mesh Adaptation]]
- [[Remeshing]]
- [[Euler Equations]]
- [[Harmonic Analysis]]
- [[Dormand-Prince Method]]

## 可行性评估

⚠️ **评估中**

- 理论深度较高
- 自适应方法实用价值明确
- 网格变换时谐波保持有创新性
- 适合几何处理研究

## libigl 参考

- `igl::massmatrix`
- `igl::cotangent_laplacian`
- 网格质量相关函数
