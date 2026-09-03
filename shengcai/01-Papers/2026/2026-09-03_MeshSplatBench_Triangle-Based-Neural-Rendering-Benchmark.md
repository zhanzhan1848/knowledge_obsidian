---
type: paper
created: 2026-09-03
updated: 2026-09-03
tags: [paper, neural-rendering, benchmark, rasterization, triangle-mesh, production]
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
| **作者** | (Authors from paper abstract) |
| **发表** | arXiv 2026 (cs.GR) |
| **链接** | [原文](https://arxiv.org/abs/2609.01306) |
| **DOI** | 10.48550/arXiv.2609.01306 |
| **代码** | 待发布 |

---

## 核心贡献

> 提出首个系统性评估**三角形神经渲染**从原生优化到游戏引擎部署完整流程的基准测试框架 MeshSplatBench。

1. 提出 **MeshSplatBench**——统一基准，系统性研究三角形神经渲染从原生优化到游戏引擎部署的完整流程
2. 建立标准化评估协议，复现发表结果在 **0.8% PSNR 偏差**内
3. 引入分层 **Unity 部署协议**，覆盖三个渲染层级：原生 CUDA 渲染器、方法专用引擎着色器、标准 opaque mesh 管线
4. 对重建表面进行**拓扑审计**，揭示仅有显式连通性和共享索引不足以保证生产级资产（存在非流形结构、碎片化组件、边界伪影）

---

## 技术方案

### 核心思想

三角形神经渲染通过优化与标准光栅化硬件兼容的显式几何图元，桥接神经场景表示与传统图形管线。然而，现有方法几乎只在定制研究渲染器中评估，掩盖了其实际可部署性。

MeshSplatBench 的核心贡献是建立了从优化到引擎部署的完整评估链路，揭示了**光栅化能力只是图元级属性，而图形就绪需要表示、拓扑与引擎兼容性的整体对齐**。

### 关键技术

| 技术 | 说明 |
|------|------|
| 标准化评估协议 | 保留每种方法的原生优化语义，PSNR 偏差 <0.8% |
| 分层 Unity 部署协议 | Native CUDA → 专用着色器 → 标准 opaque mesh 三层级联 |
| 拓扑审计 | 非流形结构、碎片化组件、边界伪影检测 |
| 引擎适配 vs 表示缩减的解耦 | 隔离引擎适配带来的精度损失与表示缩减带来的精度损失 |

---

## 实验结论

- **数据集**: 多样化三角网格神经渲染数据集
- **基线**: 现有三角形神经渲染方法
- **结果**: 揭示了从研究到生产环境部署的关键差距，指出光栅化能力≠图形就绪

---

## 局限性

- 仅覆盖三角形图元方法
- 生产就绪标准仍需进一步定义

---

## 相关工作

- [[Triangle-Based Neural Rendering]]
- [[Neural Radiance Fields vs 3D Gaussian Splatting]]
- [[Game Engine Deployment of Neural Rendering]]

---

## 实现建议

- **实现难度**: 中（基准框架构建，数据集管理）
- **预期性能**: 提供标准化性能对比基准
- **适用场景**: 神经渲染方法评估、游戏引擎集成研究
