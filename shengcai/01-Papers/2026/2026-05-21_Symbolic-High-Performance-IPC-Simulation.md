---
title: A Symbolic Framework for Extensible, High-Performance IPC Simulation
authors: Xuan Tang
date: 2026-05-21
source: SIGGRAPH 2026
url: https://arxiv.org/abs/2605.23088
pdf: https://arxiv.org/pdf/2605.23088
tags: [rendering, simulation, IPC, physics, SIGGRAPH2026, 2026]
status: unread
---

# A Symbolic Framework for Extensible, High-Performance IPC Simulation

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | A Symbolic Framework for Extensible, High-Performance IPC Simulation |
| 作者 | Xuan Tang |
| 来源 | SIGGRAPH 2026 |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2605.23088) |
| PDF | [下载](https://arxiv.org/pdf/2605.23088) |

## 核心贡献
1. 提出 YASPS：GPU 导向框架，解决 IPC 可扩展性瓶颈
2. 两个一等关系运算符：JOIN 和 UNION
3. 结构感知块稀疏存储 + JIT 编译 CUDA kernels

## 技术方案
### JOIN 运算符
组合用户声明关系中的依赖量（如 element-to-vertex 连接）

### UNION 运算符
表示关系内的替代参数化（如自由顶点与仿射体混合）

### 关键优化
- Hessian 压缩：CG 迭代加速近 10x
- 结构感知块稀疏存储和压缩
- JIT 编译 CUDA kernels

## 实验结论
- 快速前端扩展，最小后端更改
- 端到端性能有竞争力
- Hessians 压缩实现近 10x 更快 CG 迭代

## 可行性分析
- 实现难度：高
- 性能预期：10x CG 迭代加速
- 适用场景：物理仿真、碰撞处理、 cloth 模拟

## 相关工作
- [[IPC]]
- [[Physics Simulation]]
- [[GPU Computing]]

## 笔记
SIGGRAPH 2026 论文，与物理仿真和渲染管线相关。