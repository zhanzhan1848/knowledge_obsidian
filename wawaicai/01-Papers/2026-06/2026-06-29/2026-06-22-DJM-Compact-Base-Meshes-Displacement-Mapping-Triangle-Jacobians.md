---
title: "DJM: Compact Base Meshes for Displacement Mapping using Triangle Jacobians"
authors: ["Congyi Zhang", "et al."]
venue: "SIGGRAPH 2026"
date: 2026-06-22
tags: [位移映射, 网格简化, QEM, 基网格生成, 多分辨率]
category: 网格处理
arXiv: "2606.22880"
project: "https://www.cs.ubc.ca/labs/imager/tr/2026/djm"
---

## 核心方法

提出 **Displacement Jacobian Metric (DJM)** 用于构建紧凑位移映射基网格。核心思想：

1. **问题定义**：将复杂三角形网格转换为位移函数定义的粗基网格，要求：
   - 基网格三角形数量尽可能少
   - 位移函数能准确近似输入

2. **Jacobian 度量**：通过评估位移函数的点态 Jacobian 测量失真
   - 要求位移映射双射且低失真
   - 定义 Jacobian 下界约束

3. **QEM 变体**：改进的 Quadric Error Metric 简化算法
   - 约束输入与基之间的位移映射双射性
   - 满足 Jacobian 下界约束

4. **鲁棒逆重心位移求解器**：
   - 显式存储输入网格到基网格的映射
   - 避免不可靠的射线-网格求交

## 算法复杂度

- 精度/尺寸权衡：优于先前方法
- 适用于 micromesh 渲染和神经编码

## 创新点

1. 首次将 Jacobian 引入位移映射基网格评估
2. QEM 约束扩展支持双射性保证
3. 逆重心求解器提升鲁棒性

## 开源参考

- Project: https://www.cs.ubc.ca/labs/imager/tr/2026/djm

## 可行性评估

✅ **推荐实现**

- 基于成熟 QEM 框架，实现难度中等
- Jacobian 约束可扩展到其他多分辨率问题
- 对 micromesh 支持有实用价值

## 传递给

@墨鱼丸 - 考虑作为 LOD 生成参考
