---
tags: [几何, 参数化, 共形映射, Beltrami系数, 网格处理]
arxiv: https://arxiv.org/abs/2603.19240
date: 2026-03-23
---

# Beltrami Coefficient and Angular Distortion of Discrete Geometric Mappings

**作者**: Zhiyuan Lyu, Gary P. T. Choi
**发表日期**: 2026-02-08
**arXiv ID**: 2603.19240
**分类**: cs.GR, math.CV

## 核心方法

本研究建立了 **Beltrami 系数** 与 **角度失真** 之间的理论联系：

1. **Beltrami 系数** 作为共形失真的表示，在拟共形理论中被广泛使用
2. **角度失真** 作为共形性度量的传统方法
3. **核心发现**: 映射的 Beltrami 系数范数与三角形单元的角度失真存在简单关系

### 关键公式
```
max_angular_distortion ≈ f(|μ|)  // μ 为 Beltrami 系数
```

## 算法复杂度
- **时间复杂度**: O(n) - n 为网格顶点数
- **空间复杂度**: O(n)

## 实验验证
- 测试多种几何映射方法：
  - 共形映射算法
  - 拟共形映射算法
  - 保面积映射算法
- 应用领域：生物学和工程学表面网格

## 创新点
1. 首次建立 Beltrami 系数与角度失真的精确理论联系
2. 提出最大角度失真的简单估计公式
3. 为表面映射算法的量化分析提供新途径

## 相关技术
- [[共形映射]]
- [[拟共形理论]]
- [[表面参数化]]

## 开源实现
- 论文代码: 未提及
- 相关库: libigl, CGAL

## 应用场景
- UV 展开
- 纹理映射
- 网格变形
- 表面配准

## 推荐度
✅ **推荐实现** - 为几何映射质量评估提供理论基础

## 来源
- arXiv: https://arxiv.org/abs/2603.19240
- PDF: https://arxiv.org/pdf/2603.19240
