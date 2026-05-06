---
type: paper
created: 2026-05-06
updated: 2026-05-06
tags: [paper, fire-synthesis, physics-simulation, gaussian-splatting, volume-rendering]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2605.00177
---

# In-the-Wild Fire Synthesis with Physics-Integrated Gaussian Splatting (FieryGS)

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | In-the-Wild Fire Synthesis with Physics-Integrated Gaussian Splatting |
| **作者** | Qianfan Shen |
| **发表** | ICLR 2026, arXiv cs.GR, 2026-04-30 |
| **链接** | [原文](https://arxiv.org/abs/2605.00177) |
| **DOI** | https://doi.org/10.48550/arXiv.2605.00177 |
| **代码** | https://pku-vcl-geometry.github.io/FieryGS/ |

---

## 核心贡献

> 在3DGS管道中集成物理精确且用户可控的燃烧模拟和渲染，实现真实场景的火特效合成

1. 多模态大语言模型的物理材质推理
2. 高效的体积燃烧模拟
3. 火和3DGS的统一渲染器
4. 无需手动调参，自动生成可控的真实火焰动力学

---

## 技术方案

### 核心思想

传统CFD和图形管道依赖手工几何和专家调参，难以扩展到真实世界。本方法将燃烧模拟与3DGS管道紧密耦合，通过物理集成实现真实场景的火特效合成。

### 关键模块

| 模块 | 说明 |
|------|------|
| 物理材质推理 | LLM多模态推理燃烧材质参数 |
| 体积燃烧模拟 | 高效体积模拟火焰传播、烟雾扩散、表面碳化 |
| 统一渲染器 | 火和3DGS的统一渲染 |
| 重建-模拟-渲染统一 | 无需手动调参 |

---

## 实验结论

- **数据集**: 多种室内外场景
- **基线**: 多种基线方法
- **结果**: 视觉真实度、物理保真度和可控性均优于基线

---

## 局限性

- 计算成本较高（体积模拟）
- 需要场景几何先验

---

## 实现建议

- **实现难度**: 高（需要物理模拟与3DGS集成）
- **预期性能**: 实时渲染性能
- **适用场景**: 电影特效、游戏、VR/AR火焰效果
