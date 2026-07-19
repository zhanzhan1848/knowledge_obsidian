---
type: paper
created: 2026-07-19
updated: 2026-07-19
tags: [paper, rendering, volumetric, inverse-rendering, neural, global-illumination]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2607.13695
---

# Volumetric Inverse Rendering via Neural Radiative Transfer

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Volumetric Inverse Rendering via Neural Radiative Transfer |
| **作者** | Ntumba Elie Nsampi, et al. |
| **发表** | arXiv cs.GR (2026) / CGF (Related DOI: 10.1111/cgf.70541) |
| **链接** | [arXiv](https://arxiv.org/abs/2607.13695) |
| **DOI** | 10.1111/cgf.70541 |

---

## 核心贡献

> 将物理完整的 light transport 与通用神经优化结合，实现参与介质的体积逆渲染

1. **神经体积场表示**：将介质的光学属性和完整光场表示为神经场
2. **联合优化**：通过联合优化估计光学属性和光场
3. **全局光照约束**：通过辐射传输方程的残差目标强制全局光照
4. **体积渲染一致性**：沿主视线的体积渲染项减少低频偏差
5. **生成模型支持**：支持在物理光学属性下学习参与介质的生成模型

---

## 技术方案

### 核心思想

现有方法依赖可微分随机光传输模拟（计算量大）或简化模型（无法捕获全局光照）。本文提出一种在物理完整光传输与通用神经优化之间取得平衡的公式。

### 关键技术

| 技术 | 说明 |
|------|------|
| Neural Radiative Transfer | 神经场表示参与介质的光学属性 |
| Residual Objective | 基于辐射传输方程局部微分形式的残差目标 |
| Volume Rendering Term | 沿主视线累积，减少低频偏差 |
| Joint Optimization | 联合优化光学属性和光场 |

---

## 公式

```math
\frac{dL(\mathbf{x}, \boldsymbol{\omega})}{ds} = -\sigma_t(\mathbf{x}) L(\mathbf{x}, \boldsymbol{\omega}) + \sigma_s(\mathbf{x}) \int_{S^2} p(\boldsymbol{\omega}, \boldsymbol{\omega}') L(\mathbf{x}, \boldsymbol{\omega}') d\boldsymbol{\omega}'
```

---

## 实验结论

- **重建质量**: 从多视角图像重建空间变化的颜色分辨散射、吸收和相位函数
- **应用范围**: 体积逆渲染和生成模型学习

---

## 局限性

- 计算成本较高
- 依赖于多视角输入

---

## 相关工作

- [[Neural Rendering]]
- [[Volume Rendering]]

---

## 实现建议

- **实现难度**: 高 (需要光传输物理知识和神经优化经验)
- **预期性能**: 高质量体积渲染，较高计算成本
- **适用场景**: 体积介质渲染、科学可视化
