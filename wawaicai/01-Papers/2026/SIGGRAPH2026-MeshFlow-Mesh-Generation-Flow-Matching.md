---
title: "MeshFlow: Mesh Generation with Equivariant Flow Matching"
date: 2026-07
venue: SIGGRAPH 2026
tags: [几何, 网格生成, Flow-Matching, Equivariant]
authors:
  - Qi Sun
  - Kiyohiro Nakayama
  - Jing Yan
  - Qixing Huang
  - Alexander Rush
  - Leonidas Guibas
  - Gordon Wetzstein
  - Jing Liao
  - Guandao Yang
doi: "10.1145/3799902.3811195"
url: "https://dl.acm.org/doi/10.1145/3799902.3811195"
---

# MeshFlow: Mesh Generation with Equivariant Flow Matching

## 核心方法

通过**等变流匹配 (Equivariant Flow Matching)** 实现网格生成。

### 关键创新点
- **等变性**：保证生成结果的几何变换不变性
- **流匹配**：使用连续正规化流进行生成
- **中间表示**：通过中间表示转换后再生成网格

## 关键词
- Mesh Generation
- Flow Matching
- Equivariant
- Intermediate Representation

## 相关工作对比
| 方法 | 优点 | 缺点 |
|------|------|------|
| 传统网格生成 | 可控性强 | 需中间表示转换 |
| 直接生成 | 端到端 | 拓扑难控制 |
| Flow Matching | 等变性保证 | 计算成本高 |

## 开源实现
- 暂无

## 相关笔记
[[Nexus]]
[[SuperSDF]]
