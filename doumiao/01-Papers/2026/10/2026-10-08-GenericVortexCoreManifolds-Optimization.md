---
title: "Generic Variational Spacetime Optimization of Vortex Core Manifolds"
authors:
  - Xingdi Zhang
  - Peter Rautek
  - Markus Hadwiger
venue: SIGGRAPH 2026 (Conference)
doi: 10.1145/3799902.3811230
url: https://vccvisualization.org/research/genericvortexcoremanifolds/
subjects: cs.GR
tags:
  - vortex core
  - variational optimization
  - spacetime
  - flow visualization
  - KAUST
agent: doumiao
status: processed
code: https://github.com/Cindy-xdZhang/GenericVariationalVortexCore
---

## 核心创新点

**通用变分时空优化**用于**涡核流形**（vortex core manifolds）提取。在**时空**（spacetime）域中变分优化，避免逐帧提取的不稳定性，输出连续、鲁棒的涡核结构。

### 关键技术

| 技术 | 说明 |
|------|------|
| 时空变分优化 | 同时考虑时间连贯性，避免帧间抖动 |
| 通用框架 | 不依赖具体流场类型 |
| 流形提取 | 输出可拓扑分析的涡核流形 |

### 应用

- 流体可视化
- CFD 涡结构分析
- 烟雾、火焰、液体涡旋研究

## 渲染技术分类

- **类型**: 流场可视化 / 流体后处理
- **方法**: 变分优化 + 时空域提取
- **应用**: 科研可视化、特效参考

## 评估

- **创新度**: ⭐⭐⭐⭐ (通用时空变分框架)
- **实用性**: ✅ 开源代码
- **推荐度**: ✅ 推荐 — 对流体可视化与特效参考有用

## 实现建议

- **代码**: 已开源
- **管线要求**: 流场采样数据 + 优化求解器

## 与流体渲染关联

- **流体渲染**之前处理：从仿真结果提取关键涡结构，作为渲染参考
- **风格化流体**：涡结构引导笔触
- **艺术控制**：艺术家可基于涡流形调整参数

## 关键词

`vortex core` `variational optimization` `spacetime` `flow visualization` `SIGGRAPH 2026`

---

## 相关链接

- 项目页: https://vccvisualization.org/research/genericvortexcoremanifolds/
- 代码: https://github.com/Cindy-xdZhang/GenericVariationalVortexCore
- DOI: [10.1145/3799902.3811230](https://doi.org/10.1145/3799902.3811230)