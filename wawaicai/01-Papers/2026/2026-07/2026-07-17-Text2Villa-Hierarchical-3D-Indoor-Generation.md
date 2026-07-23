---
title: "Hierarchical Generation of 3D Indoor Environments with Physics-Aware Analysis-by-Synthesis"
authors: ["..."]
date: 2026-07-17
tags: [3D场景生成, 物理仿真, 室内场景, 网格碰撞检测, 几何处理]
venue: arXiv cs.GR
paper: https://arxiv.org/abs/2607.17145
arXiv: 2607.17145
---

## 核心方法

Text2Villa：层次化3D室内场景文本生成框架。

### 关键创新点
1. **宏层级**：多楼层数据集微调自回归布局生成器，支持多边形边界+多楼层垂直连通
2. ** Affordance-driven Physical-Semantic Scene Graph (A-PSSG)**：显式抽象物理 affordance（支撑面、容纳腔）到节点属性，建立严格几何和语义边约束
3. **物理感知闭环优化**：几何碰撞检测引擎 + MLLM 高层语义推理，迭代解决网格穿透、悬浮伪影、容纳失败

### 技术细节
- **A-PSSG**：将物理 affordance 抽象为节点属性，建立几何+语义约束图
- **闭合循环优化**：analysis-by-synthesis 范式，观察-评估-修改机制
- **几何引擎**：底层碰撞检测 + 高层 MLLM 推理协同

### 应用
- 文本生成多房间别墅3D环境
- 物理合理的场景布局
- 下游3D内容基础

## 算法复杂度
- **宏层级**：自回归生成，复杂度与楼层数相关
- **微层级**：闭环优化，迭代次数依赖场景复杂度
- **几何碰撞检测**：可使用 libigl 的 `IGL Collision Detection`

## 相关笔记
[[3D场景生成]]
[[物理仿真]]
[[网格碰撞检测]]

## 可行性评估

✅ **关注跟进**

- 场景生成 + 物理验证结合
- 碰撞检测部分可使用 libigl 实现
- 适合作为室内场景生成 + 几何验证 pipeline 参考

### 开源参考
- libigl: `collision_detection`, `embree` 模块
