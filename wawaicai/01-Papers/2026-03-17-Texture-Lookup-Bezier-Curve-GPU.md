---
tags: [几何, 曲线曲面, GPU, Bézier, 纹理映射]
arxiv: 2603.15447
date: 2026-03-17
---

# A Texture Lookup Approach to Bézier Curve Evaluation on the GPU

## 基本信息
- **标题**: A Texture Lookup Approach to Bézier Curve Evaluation on the GPU
- **作者**: Muhammad Anas, Alan Wolfe
- **arXiv ID**: [2603.15447](https://arxiv.org/abs/2603.15447)
- **发布日期**: 2026-03-16
- **分类**: cs.GR

## 摘要
提出了一种基于纹理的技术，利用固定功能的线性纹理插值硬件在 GPU 上评估 Bézier 曲线。通过将曲线评估卸载到纹理插值器，可以在计算受限的 GPU 工作负载中提高性能。

## 核心方法

### 纹理查找曲线评估
- 利用 GPU 线性纹理插值硬件
- 避免在 shader 中进行多项式计算
- 提高计算受限场景的性能

### 扩展支持
- Bézier 曲线
- Bézier 曲面和体积
- B-splines
- NURBS
- 积分和有理多项式

### Seiler 插值优化
- 提高效率的插值方案
- 适配纹理查找框架

## 创新点
1. 利用固定功能硬件进行曲线评估
2. 适用于多种参数化曲线/曲面类型
3. 性能与精度平衡优化

## 应用场景
- GPU 计算受限的工作负载
- 实时曲线/曲面渲染
- 矢量图形渲染
- 字体渲染

## 性能对比
- 与 shader 多项式评估方法比较
- 评估精度分析
- 性能基准测试

## 技术复杂度
- **实现难度**: 中等
- **硬件要求**: GPU 纹理插值支持
- **数值稳定性**: 需要评估精度损失

## 开源参考
- arXiv: [https://arxiv.org/abs/2603.15447](https://arxiv.org/abs/2603.15447)
- PDF: [https://arxiv.org/pdf/2603.15447](https://arxiv.org/pdf/2603.15447)

## 相关技术
- [[Bézier 曲线]]
- [[B-spline]]
- [[NURBS]]
- [[GPU 优化]]

## 可行性评估
✅ **推荐实现**
- 实现相对简单
- 性能提升明显
- 适用于实时渲染场景
- 扩展性好
