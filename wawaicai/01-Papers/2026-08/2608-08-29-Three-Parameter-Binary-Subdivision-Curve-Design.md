---
type: paper
created: 2026-08-29
updated: 2026-08-29
tags: [subdivision-surface, curve-design, binary-subdivision, CAGD, approximating-scheme]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2608.23637
---

# A Three-Parameter Binary Subdivision Scheme for Shape-Controlled Curve Design

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | A Three-Parameter Binary Subdivision Scheme for Shape-Controlled Curve Design |
| **作者** | (待补充 - arXiv:2608.23637) |
| **发表** | arXiv cs.GR (2026-08-21) |
| **链接** | [原文](https://arxiv.org/abs/2608.23637) |

---

## 核心贡献

> 提出一种三参数 9 点二进制近似细分格式，通过组合 7 点 Lagrange 和 7 点 B-spline 细分格式的精化规则实现形状控制

1. **三参数 9 点二进制格式**: 通过加权组合 Lagrange 和 B-spline 细分规则构造
2. **位移向量组合**: 利用父格式对应精化点之间的位移向量，通过三个独立设计控制参数组合
3. **统一二进制细分格式族**: 保持近似细分性质的同时提供可调几何特征

---

## 技术方案

### 核心思想

形状控制曲线设计在计算机辅助几何设计 (CAGD)、计算机图形学和工程应用中具有基础地位。

**构造方法**:
1. 取 7 点 Lagrange 和 7 点 B-spline 细分格式
2. 计算对应精化点之间的位移向量
3. 通过三个独立设计-控制参数组合邻近位移向量 → 合成位移向量
4. 用合成位移向量推导精化规则 → 统一二进制细分格式族

### 理论分析

| 性质 | 结论 |
|------|------|
| 支撑 (support) | 已建立 |
| 连续性 | 已建立 |
| 开多边形端点规则 | 已建立 |
| Gibbs 振荡行为 | 已建立 |

通过两个代表性格式 (对参数施加适当约束) 验证

---

## 局限性

- 仅曲线 (1D)，未扩展到曲面/网格
- 论文为节选版本，完整理论证明待确认

---

## 实现建议

- **实现难度**: 低 — 细分规则明确，参数化直观
- **预期性能**: 可调形状控制能力强
- **适用场景**: 工业设计曲线、字体设计、路径规划
- **开源参考**: OpenSCAD、libigl (细分相关函数)
- **相关细分算法**: Loop 细分、Catmull-Clark、Butterfly 细分

---

## 相关工作

- [[Proximity-Preserving-Neural-Subdivision]] - 神经细分
- [[TriFlow-Artist-Like-Topology]] - 网格细分拓扑
- [[MeshFlow-SIGGRAPH-2026]] - SIGGRAPH 2026 网格工作流
