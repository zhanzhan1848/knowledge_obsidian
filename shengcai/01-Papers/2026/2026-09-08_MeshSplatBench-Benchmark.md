---
type: paper
created: 2026-09-08
updated: 2026-09-08
tags: [paper, rendering, neural-rendering, benchmark, triangle-mesh]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2609.01306
---

# MeshSplatBench: A Unified Benchmark for Triangle-Based Neural Rendering

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | MeshSplatBench: A Unified Benchmark for Triangle-Based Neural Rendering |
| **作者** | - |
| **发表** | arXiv (Under review) |
| **链接** | [原文](https://arxiv.org/abs/2609.01306) |

---

## 核心贡献

> 统一基准测试，系统研究三角网格神经渲染从原生优化到游戏引擎部署的完整流程

1. **MeshSplatBench**: 标准化评估协议，复现发表结果在 0.8% PSNR 偏差内
2. **分层 Unity 部署协议**: 三层渲染层：原生 CUDA 渲染器、方法特定着色器、标准 opaque mesh 管道
3. **拓扑审计**: 显示显式连接和共享索引不足以保证生产级资产

---

## 技术方案

### 核心思想

三角网格神经渲染桥接神经场景表示和传统图形管线，通过优化与标准光栅化硬件兼容的显式几何基元。但现有方法几乎只在定制研究渲染器中评估，掩盖了实际部署性。

### 关键技术

| 技术 | 说明 |
|------|------|
| 标准化评估协议 | 保留每个方法的原生优化语义 |
| Unity 部署分层 | 隔离引擎适配 vs 表示缩减造成的保真度损失 |
| 拓扑审计 | 识别非流形结构、碎片化组件、边界伪影 |

---

## 实验结论

- 光栅化性仅仅是基元级属性
- 生产级部署需要更多考量

---

## 局限性

- 主要关注 Unity 引擎
- 拓扑问题修复方案未涵盖

---

## 实现建议

- **实现难度**: N/A (基准测试)
- **预期性能**: 参考基准
- **适用场景**: 神经渲染研究、渲染系统评估

---

## 相关工作

- [[神经渲染]]
- [[三角网格]]
- [[基准测试]]
- [[游戏引擎集成]]
