---
type: paper
created: 2026-09-08
updated: 2026-09-08
tags: [paper, rendering, 3dgs, color-editing, real-time, siggraph-asia]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2609.03897
---

# Reparametrizing 3D Gaussian Splatting for Real-Time Palette-based Color and Luminance Editing

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Reparametrizing 3D Gaussian Splatting for Real-Time Palette-based Color and Luminance Editing |
| **作者** | - |
| **发表** | SIGGRAPH Asia 2026 |
| **链接** | [原文](https://arxiv.org/abs/2609.03897) |
| **DOI** | 10.48550/arXiv.2609.03897 |

---

## 核心贡献

> 实时交互式调色板颜色编辑框架，支持独立色相/饱和度/亮度控制

1. 基于调色板的重新着色，支持palette-based recoloring
2. 每调色板色调曲线实现颜色感知的亮度调整
3. 像素级颜色约束实现视图一致的编辑

---

## 技术方案

### 核心思想

不从头训练新表示，而是重新参数化预训练 vanilla 3DGS 的球谐函数，编码视图相关的调色板权重。通过基于图像空间稀疏性的损失同时求解权重和调色板颜色。

### 关键技术

| 技术 | 说明 |
|------|------|
| 球谐函数重参数化 | 编码视图相关调色板权重 |
| IRLS + 阻尼块坐标下降 | 数十毫秒内完成编辑 |
| 视图空间亮度编辑 | 沿消色差轴的像素级权重偏移 |

---

## 实验结论

- **与 prior primitive-space 方法对比**: 更稀疏、更局部的编辑
- **能力**: 每调色板颜色的独立亮度控制、视图一致的像素级约束

---

## 局限性

- 需要预训练 3DGS 模型
- 编辑质量依赖原始模型的球谐函数表示

---

## 实现建议

- **实现难度**: 中 (基于现有 3DGS 修改)
- **预期性能**: 毫秒级编辑速度
- **适用场景**: 实时颜色分级、产品可视化

---

## 相关工作

- [[3D Gaussian Splatting]]
- [[颜色编辑]]
- [[实时渲染]]
