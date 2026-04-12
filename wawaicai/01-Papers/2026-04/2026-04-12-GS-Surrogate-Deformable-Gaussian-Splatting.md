---
tags: [几何, 高斯溅射, 参数化探索, 科学可视化]
---

# GS-Surrogate: Deformable Gaussian Splatting for Parameter Space Exploration

## 核心方法

**问题定义**: 科学模拟ensemble数据的灵活后验探索，需要在存储成本和可视化灵活性之间权衡。

**核心方法**:
1. 构建 **canonical Gaussian field** 作为基础3D表示
2. 通过**顺序参数条件变形**adapt
3. 分离模拟相关变化与可视化特定变化 → 显式 formulation
4. 支持等值面提取、传输函数编辑等可视化任务

**与NeRF对比**:
- NeRF隐式编码所有参数变化，计算开销大
- GS-Surrogate 显式几何表示，支持实时交互探索

## 开源实现
- Subjects: Graphics (cs.GR); Artificial Intelligence (cs.AI)

## 相关笔记
[[几何, 高斯溅射]]
[[几何, 科学可视化]]
