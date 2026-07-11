---
type: paper
created: 2026-07-11
updated: 2026-07-11
tags: [paper, inverse rendering, PBR, diffusion model, material reconstruction, ECCV2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2606.31065
---

# Diffusion-Based Material Regularization for Physics-Based Inverse Rendering

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Diffusion-Based Material Regularization for Physics-Based Inverse Rendering |
| **作者** | Jingwang Ling 等 |
| **发表** | ECCV 2026 |
| **链接** | [原文](https://arxiv.org/abs/2606.31065) |
| **DOI** | 10.48550/arXiv.2606.31065 |
| **代码** | https://gerwang.github.io/diffusion-regularized-inverse-rendering/ |

---

## 核心贡献

> 将扩散模型的预测作为优化相似核而非目标材质值，通过正则化损失惩罚优化结果在扩散预测平稳区域偏离，缓解逆向渲染中光照-材质歧义问题。

1. 提出扩散模型作为逆渲染优化正则项的框架，将扩散预测转化为相似核而非目标值
2. 在表面区域使优化自由匹配输入图像，同时在扩散预测平稳区域惩罚材质偏差
3. 端到端管线联合重建几何、材质、光照，输出可重光照 PBR 资产

---

## 技术方案

### 问题背景

物理逆向渲染面临严重欠约束问题：
- 无强先验时，光照被 baked 进材质，重建结果在novel view/光照下泛化差
- 扩散模型能预测视觉可信的材质，但预测结果很少满足渲染方程，不能直接用于物理渲染

### 核心方法

将扩散模型预测作为**相似核**而非目标：
- 当扩散预测在表面区域变化剧烈 → 该区域材质可靠性高 → 惩罚项权重高
- 当扩散预测平稳（近常数）→ 该区域材质不可靠 → 惩罚项权重低，允许自由优化

### 正则化损失

```math
\mathcal{L}_{\text{reg}} = \sum_{\text{surface regions where diffusion prediction is near-constant}} \| \mathbf{M}_{\text{optimized}} - \mathbf{M}_{\text{diffusion}} \|
```

对扩散预测接近常数的区域惩罚优化材质与扩散预测的偏差，其他区域允许自由优化以匹配输入图像。

---

## 实验结论

- **数据集**：Synthetic4Relight, Stanford-ORB, DTC-Synthetic
- **基线**：Mitsuba (纯物理渲染), Neural Gaffer, IllumiNeRF
- **结果**：在重建精度和重光照质量上显著优于 SOTA 基线
- **关键优势**：同时产出可重光照 PBR 资产（非仅图像）

---

## 局限性

- 依赖预训练扩散模型质量
- 对极稀疏视图场景效果可能受限

---

## 可行性分析

- **实现难度**：中
- **预期性能**：稀疏多视图逆渲染质量显著提升
- **适用场景**：多视图图像的3D资产重建、可重光照PBR材质提取、真实场景编辑
- **相关工作**：Mitsuba 物理渲染器；Flash Cache 辐射缓存；IRGS 2D高斯射线追踪

---

## 相关论文

- [[2026-06-Richer-Material-Generation-Procedural-Data-Enhancement]] - SIGGRAPH 2026 PBR材质增强生成
- [[2026-07-11-HiPR-Hierarchical-Progressive-Rendering]] - 同日 SIGGRAPH 2026 实时渲染
