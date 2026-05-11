---
type: paper
created: 2026-05-11
updated: 2026-05-11
tags: [paper, point-cloud, reconstruction, bayesian, siggraph2026]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2605.05095
---

# A Bayesian Approach for Task-Specific Next-Best-View Selection with Uncertain Geometry

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | A Bayesian Approach for Task-Specific Next-Best-View Selection with Uncertain Geometry |
| **作者** | Alexander Terenin et al. |
| **发表** | ACM SIGGRAPH 2026 |
| **链接** | [原文](https://arxiv.org/abs/2605.05095) |
| **代码** | https://github.com/jingsenzhu/BayesianNBV |

---

## 核心贡献

> 基于贝叶斯决策理论的-task-specific next-best-view 选择框架，用于不确定几何的三维重建

1. 将 next-best-view 问题表述为贝叶斯决策理论框架
2. 在隐式表面空间上放置先验分布，使用随机表面重建方法计算后验
3. 根据下游任务（语义分类、分割、PDE引导的物理仿真）优化视图选择

---

## 技术方案

### 核心思想

将NBV选择问题分解为三个步骤：
1. 在隐式表面空间上放置先验分布
2. 使用随机表面重建方法计算后验分布
3. 利用后验分布进行任务优化的视图选择

### 关键技术

| 技术 | 说明 |
|------|------|
| 隐式表面 | 使用SDF/occupancy function表示几何 |
| 贝叶斯决策 | 在后验分布上进行期望效用最大化 |
| 随机表面重建 | 生成多个可能的重建结果 |

---

## 实验结论

- **数据集**: 多种下游任务场景
- **基线**: 通用不确定性减少方法
- **结果**: 显著更少的视图数量达到同等任务性能

---

## 局限性

- 依赖于隐式表面表示的质量
- 计算开销随场景复杂度增加

---

## 实现建议

- **实现难度**: 中等
- **预期性能**: 显著减少扫描视图数量
- **适用场景**: 自动扫描规划、机器人抓取、检测任务

---

## 相关工作

- [[Implicit Surface Reconstruction]]
- [[Point Cloud Processing]]
- [[Next-Best-View Planning]]
