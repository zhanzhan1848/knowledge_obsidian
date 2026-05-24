---
title: "Generative and isoparametric geometric modeling of large-scale and multiscale microstructures"
authors: []
date: 2026-05-18
venue: arXiv cs.GR
tags: [几何, 细分曲面, 多尺度建模, ExVCC, Catmull-Clark]
---

# Generative and isoparametric geometric modeling of large-scale and multiscale microstructures

## 核心方法

提出将微观结构建模作为**按需生成过程**，而非完全实例化所有几何细节。

### 核心技术: ExVCC (Extended Volumetric Catmull-Clark Splines)

1. **扩展的体积 Catmull-Clark 样条表示**
   - 支持局部样条细化，超越张量积拓扑
2. **新的形状编码方案和细化规则**
   - 紧凑编码大规模几何细节
   - 通过按需分层细化实现局部求值
3. **等参量表示**
   - 多尺度细节定义在共享参数域上
   - 使用相同的 ExVCC 样条基函数族

## 解决的问题

- 增材制造向更高打印分辨率和更大构建体积发展
- 显式表示内存成本过高
- 隐式表示仅在微观结构具有解析、周期或简洁程序描述时才能保持紧凑

## 创新点

- 几何编码、按需生成和跨尺度关联的统一框架
- 几何修改可自动跨尺度传播
- 支持大规模几何细节的紧凑表示

## 算法复杂度

- 时间: 按需细化 O(log n) 复杂度
- 空间: 紧凑编码，指数级压缩

## 实现难度

- 算法复杂度: **高**
- 依赖: 样条计算库，参数化工具
- 数值稳定性: 层次细化需稳定处理

## 推荐结论

✅ **推荐实现** - 对增材制造和微结构设计有重要应用价值

## 开源参考

- libigl: 细分曲面相关函数
- OpenSubdiv: 细分曲面求值
- 关联笔记: [[Subdivision Surface]], [[Multiscale Modeling]], [[Isoparametric Representation]]