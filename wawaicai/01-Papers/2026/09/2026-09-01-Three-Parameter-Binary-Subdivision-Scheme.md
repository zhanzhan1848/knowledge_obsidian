---
tags: [几何, 细分曲面, 曲线设计, CAGD, 二进制细分格式]
date: 2026-08-23
---

# Three-Parameter Binary Subdivision Scheme for Shape-Controlled Curve Design

## 论文信息

| 字段 | 内容 |
|------|------|
| arXiv | [2608.23637](https://arxiv.org/abs/2608.23637) |
| 作者 | Rabia Hameed |
| 提交 | 2026-08-23 |

## 核心方法

提出**三参数 9 点二进制逼近细分格式**，通过组合 7 点 Lagrange 细分和 7 点 B-spline 细分的 refine 规则构造。

### 构造方法

1. 计算父格式对应 refine 点之间的**位移向量**
2. 用三个独立**设计控制参数**组合相邻位移向量
3. 用组合后的结果向量推导新的 refine 规则
4. 得到保持逼近性质的统一二进制细分族

## 技术细节

### 理论性质
- **支撑 (Support)**: 确定的有限支撑
- **连续性 (Continuity)**: 理论推导的连续阶
- **端点规则**: 开多边形的端点处理
- **Gibbs 振荡行为**: 振荡抑制特性

### 设计控制参数
- 三个独立参数控制几何特性
- 可导出两个代表性子格式（通过参数约束）

## 创新点

1. **三参数控制**: 灵活的几何特性调整
2. **统一框架**: Lagrange + B-spline 的统一表示
3. **保持逼近性**: 推导过程保持逼近细分本质

## 几何分类

- 类别: 细分曲面 (Subdivision Surface)
- 子类: Binary Approximating Scheme / Curve Design
- 关联: Lagrange Interpolation, B-spline, CAGD

## 开源参考

- libigl: `subdivision` 相关函数
- OpenFlipper: 细分曲面实现
- 论文代码: 待发布

## 可行性评估

| 指标 | 评分 |
|------|------|
| 算法复杂度 | 低 |
| 数值稳定性 | 高 |
| 实现难度 | 低 |
| 工程价值 | 中（曲线设计专用） |

**推荐度**: ✅ 推荐实现（曲线设计方向）

## 关联笔记

[[细分曲面]]
[[曲线设计]]
[[CAGD]]

---

*🥬 Wawaicai | 2026-09-01*
