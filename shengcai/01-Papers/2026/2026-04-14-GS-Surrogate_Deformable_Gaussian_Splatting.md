---
type: paper
created: 2026-04-14
updated: 2026-04-14
tags: [paper, gaussian-splatting, surrogate-model, ensemble-simulation, scientific-visualization]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.06358
---

# GS-Surrogate: Deformable Gaussian Splatting for Parameter Space Exploration of Ensemble Simulations

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Deformable Gaussian Splatting for Parameter Space Exploration of Ensemble Simulations |
| **作者** | Ziwei Li et al. |
| **发表** | arXiv cs.GR 2026 |
| **链接** | [原文](https://arxiv.org/abs/2604.06358) |

---

## 核心贡献

> 引入基于可变形高斯散点的可视化代理，用于参数空间探索

1. 构建规范高斯场作为基础 3D 表示
2. 通过顺序参数条件变形进行适配
3. 将模拟相关变化与可视化特定变化分离
4. 支持等值面提取和传输函数编辑等可视化任务

---

## 技术方案

### 核心思想

现有可视化代理模型在图像空间操作而没有显式 3D 表示，或依赖计算昂贵的神经辐射场。GS-Surrogate 通过可变形高斯散点实现高效且可控的参数空间探索。

### 关键创新

| 创新 | 说明 |
|------|------|
| 规范高斯场 | 作为基础 3D 表示 |
| 参数条件变形 | 顺序适配到不同参数 |
| 显式公式 | 分离模拟变化与可视化变化 |
| 实时探索 | 支持等值面提取、传输函数编辑 |

---

## 实验结论

- **数据集**: 多样化模拟数据集
- **任务**: 参数空间探索、可视化任务
- **结果**: 在模拟和可视化参数空间中实现实时灵活探索

---

## 实现建议

- **实现难度**: 中等 (需要高斯散点基础 + 参数化变形)
- **适用场景**: 科学模拟可视化、参数敏感性分析、假设探索

---

## 相关工作

- [[Gaussian Splatting]]
- [[Scientific Visualization]]
- [[Ensemble Simulation]]
- [[Neural Rendering]]