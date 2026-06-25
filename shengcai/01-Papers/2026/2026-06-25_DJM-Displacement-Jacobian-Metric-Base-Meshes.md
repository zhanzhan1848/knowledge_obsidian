---
tags: [渲染, 位移映射, 微几何, SIGGRAPH2026, 2026]
date: [[2026-06-25]]
status: 待读
---

# Compact Base Meshes for Displacement Mapping using Triangle Jacobians

## 基本信息
| 标题 | 值 |
|------|-----|
| 作者 | Congyi Zhang |
| 发表 | SIGGRAPH 2026 |
| 链接 | [arXiv:2606.22880](https://arxiv.org/abs/2606.22880) |
| PDF | [PDF](https://arxiv.org/pdf/2606.22880) |
| 项目 | [DJM Project](https://www.cs.ubc.ca/labs/imager/tr/2026/djm) |

## 核心贡献
1. 提出 **DJM (Displacement Jacobian Metric)** 基网格构建方法
2. 使用位移函数的 Jacobian 引导基网格计算
3. 提出 QEM 简化变体，保证映射的双射性和低失真
4. 避免不可靠的 ray-mesh 相交，使用显式存储的映射关系

## 技术方案

### 问题背景
将复杂三角形网格转换为位移函数表示时，核心挑战是计算尽可能少三角形且支持精确近似输入的基网格。

### 关键创新
1. **Displacement Jacobian Metric**：通过评估位移函数的逐点 Jacobian 测量失真
2. **约束 QEM 简化**：保证基网格与输入之间的位移映射是双射且低失真的
3. **鲁棒逆重心位移求解器**：使用显式存储的映射关系辅助所有计算

### 优势
- 在重建精度与尺寸权衡上优于先前方法
- 适用于 micromesh 渲染和神经编码

## 实验结论
- 优于替代方案的重建精度/尺寸权衡
- 在 micromesh 渲染和神经编码中表现稳健

## 标签
#DisplacementMapping #Micromesh #MeshSimplification #SIGGRAPH2026

## 相关笔记
