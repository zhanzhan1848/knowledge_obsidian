---
type: paper
created: 2026-07-17
updated: 2026-07-17
tags: [paper, inverse-rendering, diffusion, PBR, material, rendering]
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
| **作者** | Jingwang Ling et al. |
| **发表** | ECCV 2026 |
| **链接** | [原文](https://arxiv.org/abs/2606.31065) |
| **代码** | https://gerwang.github.io/diffusion-regularized-inverse-rendering/ |

---

## 核心贡献

> 将扩散模型预测作为相似核用于优化，而非目标材质值

1. **正则化损失**: 当扩散预测接近常数时惩罚优化材质偏离
2. **联合优化**: 几何+材质+光照端到端重建
3. **桥接两个范式**: 物理基础逆渲染 + 数据驱动扩散模型

---

## 技术方案

### 核心思想

物理基础逆渲染提供准确的图像形成模型但严重欠约束；数据驱动扩散模型预测视觉上合理的材质但不满足渲染方程。**本文将扩散预测作为相似核而非目标值**。

### 问题

- 无强先验时，光照会被 baked 进材质
- 重建对新视角和光照泛化差
- 纯分析-综合优化会吸收阴影到估计材质

### 解决方案

```math
L_{reg} = \sum_{regions} w_i \cdot ||material_{optimized} - material_{diffusion}||^2
```

- 当扩散预测在表面区域接近常数时惩罚偏离
- 当扩散预测变化时允许自由优化匹配输入图像

### 数据集验证

- Synthetic4Relight
- Stanford-ORB
- DTC-Synthetic

---

## 实验结论

- 重建准确性和重光照质量显著优于SOTA
- 扩散先验有效防止光照 baked-in
- 适用于复杂材质

---

## 局限性

- 依赖扩散模型质量
- 需要多视角输入

---

## 实现建议

- **实现难度**: 高
- **适用场景**: 高质量资产重建、 relighting、编辑
- **推荐度**: ⭐⭐⭐⭐
