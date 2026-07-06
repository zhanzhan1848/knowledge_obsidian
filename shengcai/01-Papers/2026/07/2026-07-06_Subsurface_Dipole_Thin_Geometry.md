---
type: paper
created: 2026-07-06
updated: 2026-07-06
tags: [paper, subsurface-scattering, dipole-model, path-tracing, diffusion-theory]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2606.29387
---

# Dipole Diffusion Error in Thin Geometry: Optical Thickness Laws for Grid-Free Subsurface Scattering

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Dipole Diffusion Error in Thin Geometry: Optical Thickness Laws for Grid-Free Subsurface Scattering |
| **作者** | (待补充) |
| **发表** | arXiv cs.GR (2026) |
| **链接** | [原文](https://arxiv.org/abs/2606.29387) |
| **DOI** | 10.48550/arXiv.2606.29387 |
| **代码** | Python/NumPy CPU 参考实现 + Apple Metal GPU 内核 |

---

## 核心贡献

> 系统分析偶极子模型在薄几何体和曲面物体上的扩散误差，建立光学厚度定律，并提出 Walk on Spheres 求解 SDF 内扩散方程的精确方法

1. **光学厚度衰减定律**：在平板几何中，漫反射反照率误差以 $Ce^{-2\tau}$ 速率衰减（$\tau = T/\ell_d$），透射通量以 $e^{-\tau}$ 衰减——材料无关的首要衰减率
2. **多极子对比分析**：在同一扩散模型和边界条件下，将偶极子与有限板多极子对比，隔离几何误差
3. **Walk on Spheres + SDF**：在符号距离域内直接求解筛选泊松扩散问题，无需内网格或切半空间近似，估算器与解析测试匹配到 0.75%

---

## 技术方案

### 核心思想

偶极子模型假设半无限平板几何，在薄物体和曲面上产生系统性几何误差。通过多极子对比和光学厚度分析建立误差界限，再用 Walk on Spheres 直接求解扩散方程。

### 关键技术

| 技术 | 说明 |
|------|------|
| 偶极子 vs 多极子 | 隔离几何误差与模型误差 |
| 光学厚度定律 | $Ce^{-2\tau}$ 反射衰减，$e^{-\tau}$ 透射衰减 |
| Walk on Spheres | SDF 域内直接求解筛选泊松扩散 |
| 暴力体积路径追踪 | 验证基准，拟合反射—缺陷率 ≈ 1.99 |

---

## 公式

```math
\text{Diffuse albedo error} \sim Ce^{-2\tau}, \quad \tau = \frac{T}{\ell_d}
```

```math
\text{Transmitted flux} \sim e^{-\tau}
```

---

## 实验结论

- **厚度预测器**：有效薄特征启发式方法
- **曲率影响**：曲率和照明在板几何以外场景主导误差
- **精度**：WoS 估算器与解析测试匹配到 0.75%
- **基准测试**：4 案例路径追踪基准，后背照明—厚度主导案例改善，非所有前照明或曲面案例

---

## 局限性

- 方法仅减少扩散内部几何误差，不能替代辐射传输
- 曲率和照明在其他场景中主导误差

---

## 实现建议

- **实现难度**: 中（理论复杂，但代码开源）
- **预期性能**: 离线渲染改善，实时不适用
- **适用场景**: 皮肤/蜡等薄材质渲染、扩散近似改进
