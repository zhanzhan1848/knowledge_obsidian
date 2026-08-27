---
title: "Compositional 3D Generation With Part-Level Semantic and Spatial Control"
authors: ["Ava Pun"]
date: 2026-08-20
arXiv: "2608.20448"
tags: [3D生成, 组分生成, 扩散模型, 语义控制]
---

# MultiCube: 部件级语义与空间控制的组分 3D 生成

## 核心方法

解决专业创意工作流中需要的精确部件级可控性问题。

### 输入

- 全局文本 prompt
- 指定部件的文本 schema
- 表示部件边界框的空间布局

### 输出

- 由独立网格组成的 3D 对象（每个指定部件一个网格）
- 符合给定的语义和空间条件

### 两阶段扩散过程

1. **第一阶段**：生成符合 schema 和布局的单体网格
2. **第二阶段**：同时将网格分解为各个独立部件

### 关键创新

**Part Layout Adapter**
- 独立编码每个部件的条件，不受其他部件影响

## 项目页面
https://multi-cube.github.io

## 可行性评估

✅ **值得关注**

- 问题定位清晰：针对专业 3D 资产创建的部件级控制
- 方法创新：两阶段扩散 + Part Layout Adapter
- 应用场景：游戏、动画资产生成

## 关键词
[[3D生成]], [[扩散模型]], [[语义控制]], [[网格分解]]
