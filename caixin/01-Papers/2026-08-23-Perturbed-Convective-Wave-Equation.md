---
type: paper
created: 2026-08-23
updated: 2026-08-23
tags: [acoustic, compressible-flow, DNS, mixing-layer, Lighthill, perturbation-method]
status: processed
domain: fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2608.19236
---

# Generalised Perturbed Convective Wave Theory

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Generalised Perturbed Convective Wave Theory |
| **作者** | Stefan Schoder et al. |
| **发表** | arXiv:2608.19236 [physics.flu-dyn], Aug 2026 |
| **链接** | [原文](https://arxiv.org/abs/2608.19236) |
| **DOI** | 10.48550/arXiv.2608.19236 |
| **代码** | - |

---

## 核心贡献

> 将声学扰动方程（cPCWE）推广到空间变化的平均密度场，成为运动非均匀介质中声波生成与传播的精确标量公式

1. **推广 cPCWE**: 将压缩流扰动对流波动方程推广到空间变化的平均密度场
2. **Kovasznay 模态物理解释**: 建立了 Helmholtz 分解、泊松方程和 cPCWE 的中间变量与 Kovasznay 涡量、熵和声学模态之间的物理对应关系
3. **验证精度**: 在 $M=0.2$ 到 $M=0.4$ 范围内与二维等温混合层 DNS 和 Lighthill  analogy 对比
4. **低 Mach 数优势**: $M \geq 0.25$ 时三种方法在 0.9 dB 内一致；$M=0.2$ 时 Lighthill 高估 2.8 dB，但 cPCWE 仅偏差 -1.2 dB

---

## 技术方案

### 核心方程

**cPCWE (压缩流扰动对流波动方程)**:

$$\frac{\partial^2 \rho'}{\partial t^2} + 2\mathbf{U} \cdot \nabla \frac{\partial \rho'}{\partial t} - c^2 \nabla^2 \rho' = \text{source}(\mathbf{x},t)$$

推广版本允许 $\rho_0 = \rho_0(\mathbf{x})$ 空间变化。

### 工作流

1. **Helmholtz 分解**: 分离速度场为无旋、散度和旋度分量
2. **泊松方程**: 求解压力/速度势
3. **cPCWE**: 求解声学扰动密度 $\rho'$

### Kovasznay 模态对应

| 中间变量 | Kovasznay 模态 |
|----------|---------------|
| 速度势 $\phi$ | 声学模态 |
| 涡量 $\omega$ | 涡量模态 |
| 熵扰动 $s'$ | 熵模态 |

---

## 验证结果

- $M=0.2$ (弱声学): Lighthill 偏差 +2.8 dB，cPCWE 偏差 -1.2 dB
- $M \geq 0.25$: 三种方法在 0.9 dB 内一致
- $M \geq 0.3$: 偏差在 0.5 dB 内
- cPCWE 声源项仅局限于涡对区域，而 Lighthill 的声源项分布更广

---

## 局限性

- 二维等温假设
- 低 Mach 数（$M \leq 0.4$）验证
- 需要 DNS 提供参考数据

---

## 实现建议

- **实现难度**: 中（需要 Helmholtz 分解 + 泊松求解器 + cPCWE）
- **预期性能**: 在 $M \geq 0.2$ 范围内准确预测辐射声功率
- **适用场景**: 声学预测、混合层噪声、叶轮机械噪声、燃烧噪声

---

## 相关工作

- [[Lighthill 声类比]]
- [[声学扰动方程]]
- [[Kovasznay 模态分解]]
- [[DNS]]
- [[混合层流动]]

---

## 摘要

本文将压缩流扰动对流波动方程（cPCWE）推广到空间变化的平均密度场。该方程是声学扰动方程的精确标量表述，用单个未知量描述运动非均匀介质中的声波生成与传播。工作流的中间变量与 Kovasznay 的涡量、熵和声学模态相对应。在 $M=0.2$ 到 $M=0.4$ 范围内与二维等温混合层 DNS 和 Lighthill 类比进行定量验证。在 $M \geq 0.25$ 时，三种方法的辐射功率在 0.9 dB 内一致；在 $M=0.2$ 时，Lighthill 高估 2.8 dB，而 cPCWE 仅偏差 -1.2 dB。
