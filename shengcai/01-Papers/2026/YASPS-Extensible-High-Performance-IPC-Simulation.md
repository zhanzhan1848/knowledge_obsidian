---
title: YASPS: A Symbolic Framework for Extensible, High-Performance IPC Simulation
authors: Xuan Tang, et al.
date: 2026-05-21
source: arXiv (SIGGRAPH 2026)
url: https://arxiv.org/abs/2605.23088
pdf: https://arxiv.org/pdf/2605.23088
tags: [rendering, simulation, physics, IPC, GPU, SIGGRAPH-2026, 2026]
status: unread
---

# YASPS: A Symbolic Framework for Extensible, High-Performance IPC Simulation

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | YASPS: A Symbolic Framework for Extensible, High-Performance IPC Simulation |
| 作者 | Xuan Tang, et al. |
| 来源 | arXiv (SIGGRAPH 2026) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2605.23088) |
| PDF | [下载](https://arxiv.org/pdf/2605.23088) |

## 核心贡献
1. **GPU 导向的可扩展框架** - YASPS 移除扩展瓶颈
2. **关系型操作符 JOIN 和 UNION** - 使结构在可微分中间表示中显式化
3. **结构感知块稀疏存储** - 利用 Hessian 稀疏性和块布局
4. **JIT 编译 CUDA 内核** - 用于求值、导数、装配和求解

## 技术方案

### JOIN 操作符
- 组合用户声明关系上的依赖量（如 element-to-vertex 连接）
- 组合跨用户定义关系的依赖量

### UNION 操作符
- 在关系内表示替代参数化（如混合自由顶点与仿射体参数化）
- 不碎片化程序

### 关键创新
- 通过 JOIN 和 UNION 进行符号微分
- 高效二阶程序，重用中间 Jacobians
- Hessian 压缩实现近 10x 更快的 CG 迭代

### 性能
- 支持快速前端扩展，最小化后端更改
- 竞争性的端到端性能

## 实验结论
- 在 IPC 风格示例中表现优异
- 包括 cloth-on-bunny、mixed rigid/deformable bunnies、caged deformation model
- Hessian 压缩实现近 10x CG 迭代加速

## 局限性
- 专注于 IPC (Incremental Potential Contact) 模拟
- 需要 GPU 计算环境

## 可行性分析
- 实现难度：高（需理解 IPC 方法和 GPU 编程）
- 性能预期：10x CG 迭代加速
- 适用场景：物理仿真、cloth 模拟、刚体/柔体交互

## 相关工作
- [[IPC Simulation]]
- [[Physics-based Simulation]]
- [[GPU Computing]]

## 笔记
SIGGRAPH 2026 论文！IPC 方法的高性能仿真框架，对物理仿真和渲染管线有重要参考价值。