---
tags: [神经渲染, 3DGS, 动态场景]
created: 2026-06-01
---

# Dynamic-Static Decomposition of Gaussian Splatting for Efficient Dynamic Scene Reconstruction

## 论文信息
- **arXiv**: [2605.30863](https://arxiv.org/abs/2605.30863)
- **作者**: Youngtae Han
- **日期**: 2026-05-29
- **分类**: cs.CV, cs.GR
- **PDF**: [pdf](https://arxiv.org/pdf/2605.30863)

## 核心方法

### 问题定义
现有动态 3DGS 方法将所有高斯建模为动态组件，计算效率低，重建质量下降。

### 核心创新
- **静态-动态分解策略**
- **Feed-Forward Gaussian Splatting encoder**
- **光流模型** 用于高效分解

### 技术优势
- 无需 COLMAP 预处理
- 确定性初始化
- 可复现性强

### 性能数据 (Neural 3D dataset)
| 指标 | 数值 |
|------|------|
| 训练时间 | 10 分钟 |
| 渲染速度 | >700 FPS (RTX 5090, 1352×1014) |
| 质量 | SOTA |

## 技术框架
```
输入序列 → 静态/动态分解 → FF-GS Encoder → 光流优化 → 高质量渲染
```

## 相关笔记
[[神经渲染, 3DGS]]
[[神经渲染, 动态场景]]