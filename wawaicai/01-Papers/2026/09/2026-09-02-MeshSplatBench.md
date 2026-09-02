---
type: paper
created: 2026-09-02
updated: 2026-09-02
tags: [paper, mesh, neural-rendering, benchmark, topology, rasterization]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2609.01306
---

# MeshSplatBench: A Unified Benchmark for Triangle-Based Neural Rendering

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | MeshSplatBench: A Unified Benchmark for Triangle-Based Neural Rendering |
| **作者** | Kaixuan Zhang et al. |
| **发表** | arXiv cs.GR · Sep 1, 2026 |
| **链接** | [原文](https://arxiv.org/abs/2609.01306) |
| **DOI** | 10.48550/arXiv.2609.01306 |
| **代码** | 待发布 |

---

## 核心贡献

> 提出 MeshSplatBench 基准，系统评估三角形神经渲染方法从优化到游戏引擎部署的完整流程，并揭示网格拓扑质量对生产就绪资产的关键影响。

1. **统一基准协议**：建立标准评估协议，重现论文结果在 0.8% PSNR 偏差内
2. **分层 Unity 部署协议**：三种渲染层级的系统性评估——原生CUDA渲染器、方法特定着色器、标准不透明网格管线
3. **拓扑审计**：揭示现有方法重建网格中普遍存在的非流形结构、碎片化组件和边界伪影问题
4. **生产就绪性分析**：证明光栅化能力只是图元级属性，图形生产需要表征、拓扑和引擎兼容性的整体对齐

---

## 技术方案

### 核心思想

三角形神经渲染通过优化与标准光栅化硬件兼容的显式几何图元，桥接神经场景表征与传统图形管线。现有方法几乎只在自定义研究渲染器中评估，掩盖了其实际生产部署能力。

### 关键技术

| 技术 | 说明 |
|------|------|
| 三角形神经渲染 | 3DGS 等方法输出可光栅化的三角形网格 |
| 拓扑审计 | 系统检查非流形结构、连通性碎片、边界伪影 |
| 分层渲染评估 | CUDA原生 → 专用着色器 → 标准网格管线的逐层保真度损失分析 |
| 游戏引擎部署 | Unity Opaque Mesh Pipeline 集成测试 |

---

## 实验结论

- **数据集**: 自定义 MeshSplatBench 基准
- **基线**: 多种三角形神经渲染方法（Scaffold-GS, Plume, GaussianObject 等）
- **结果**: 
  - 所有方法在论文报告指标上可重现（<0.8% PSNR 偏差）
  - 从研究渲染器到游戏引擎适配存在显著保真度损失
  - 显式连通性和共享索引不足以保证生产就绪——非流形结构普遍存在
  - 光栅化能力 ≠ 图形就绪能力

---

## 局限性

- 基准主要关注网格层面的问题，未深入到顶点级别拓扑缺陷
- 评估局限于 Unity 引擎，其他商业引擎的兼容性尚待验证
- 拓扑修复建议尚未在基准中系统化提供

---

## 相关工作

- [[三角网格神经渲染]]
- [[3D Gaussian Splatting]]
- [[网格质量评估]]
- [[非流形网格修复]]

---

## 实现建议

- **实现难度**: 中（基准框架）/ 高（拓扑修复自动化）
- **预期性能**: 基准可作为 mesh → production pipeline 的评估工具
- **适用场景**: 神经渲染输出质量评估、网格后处理流程、3D 资产生成管线
