---
type: paper
created: 2026-09-03
updated: 2026-09-03
tags: [paper, cage-deformation, green-coordinates, harmonic-coordinates, siggraph-asia]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2608.31003
---

# Domain-Varying 2D Green's Functions for Cage-based Deformation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Domain-Varying 2D Green's Functions for Cage-based Deformation |
| **作者** | (Authors from paper) |
| **发表** | SIGGRAPH Asia 2026 Conference Paper |
| **链接** | [原文](https://arxiv.org/abs/2608.31003) |
| **DOI** | 10.48550/arXiv.2608.31003 |

---

## 核心贡献

> 提出**Domain-Varying Green Coordinates (DVGC)**，通过变化 Green 函数定义域统一 Harmonic Coordinates 和 Green Coordinates，实现从 cage 一致到保形之间的连续变形效果。

1. 提出基于**变化域 Green 函数**的 cage 形变理论框架，统一了 Harmonic Coordinates (HC) 和 Green Coordinates (GC) 两种经典方法
2. 发现当 Green 函数定义域 $\Theta$ 从 cage 区域 $\Omega$ 扩展到整个 $\mathbb{R}^2$ 时，效果从 HC 连续过渡到 GC
3. 当 $\Theta$ 为圆盘或矩形时，Green 函数具有解析或半解析表达式，无需有限元离散化即可计算
4. 当 $\Theta$ 为圆盘时，DVGC 对 2D 单纯 cage 具**闭式表达式**，无需数值积分

---

## 技术方案

### 核心思想

Harmonic Coordinates (HC) 和 Green Coordinates (GC) 是 cage 形变的经典方法，已有近二十年未有人统一。本文提出基于**变化域 Green 函数**的新视角，将 HC 和 GC 统一在同一个框架下。关键发现是：当 Green 函数定义域 $\Theta$ 从 cage 区域 $\Omega$ 扩展到整个 $\mathbb{R}^2$ 时，变形效果从 HC 连续过渡到 GC。

### 关键技术

| 技术 | 说明 |
|------|------|
| 变化域 Green 函数 | 定义域 $\Theta$ 可独立于 cage 包围域 $\Omega$，提供新的控制空间 |
| HC→GC 连续过渡 | $\Theta: \Omega \to \mathbb{R}^2$ 的连续变换 |
| 解析/半解析计算 | 圆盘和矩形域具有闭式或半解析 Green 函数 |
| 2D 单纯 cage 闭式解 | $\Theta$ 为圆盘时 DVGC 具闭式表达式 |

---

## 实验结论

- **数据集**: 多样化 2D cage 形变测试
- **结果**: 提供了从更 cage 一致到更保形的连续变形效果控制，通过变化 Green 函数定义域产生多样化变形效果

---

## 局限性

- 目前仅限 2D 形变
- 3D 扩展可能需要数值方法

---

## 相关工作

- [[Cage-Based Deformation]]
- [[Harmonic Coordinates]]
- [[Green Coordinates]]
- [[SIGGRAPH Asia 2026]]

---

## 实现建议

- **实现难度**: 中（理论框架清晰，2D 实现相对直接）
- **预期性能**: 解析解版本效率高，适合交互式应用
- **适用场景**: 2D 角色动画、图像变形、交互式编辑工具
