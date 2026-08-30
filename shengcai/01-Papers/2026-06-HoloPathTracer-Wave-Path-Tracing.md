---
type: paper
created: 2026-08-30
updated: 2026-08-30
tags: [paper, rendering, path-tracing, wave-optics, holography, SIGGRAPH-2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2606.14173
---

# HoloPathTracer: Fast and Accurate Wave Path Tracing for Holography

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | HoloPathTracer: Fast and Accurate Wave Path Tracing for Holography |
| **作者** | Wenbin Zhou 等 |
| **发表** | ACM Transactions on Graphics (SIGGRAPH 2026), July 2026 |
| **链接** | [原文](https://arxiv.org/abs/2606.14173) |
| **DOI** | https://doi.org/10.1145/3811351 |

---

## 核心贡献

> 结合路径追踪与波动光学实现全息显示的物理精确渲染

1. **同时求解渲染方程和 Rayleigh-Sommerfeld 积分**：使用蒙特卡洛方法同时求解光传输和波动传播
2. **Path Reuse 技术**：通过时间复用随机全息图实现数量级收敛加速
3. **环境辐亮度缓存**：快速近似方案实现 10 倍收敛速度提升
4. **相位全息图生成**：在复振幅监督下将相干波场转换为相位全息图

---

## 技术方案

### 核心思想

现有计算全息图（CGH）方法将辐亮度估计与波传播解耦，在焦距线索和物理材质行为上存在局限。HoloPathTracer 提出统一框架：

1. 蒙特卡洛路径追踪同时求解渲染方程和 Rayleigh-Sommerfeld 积分
2. Path Reuse 复用路径减少随机采样方差
3. 环境辐亮度缓存加速收敛
4. 生成编码完整 3D 视觉线索的相干波场

### 关键技术

| 技术 | 说明 |
|------|------|
| Monte Carlo 渲染 | 求解渲染方程 |
| Rayleigh-Sommerfeld 积分 | 波动光学传播模型 |
| Path Reuse | 减少采样方差的复用技术 |
| Ambient Radiance Cache | 环境辐亮度缓存加速 |
| Complex Amplitude Supervision | 复振幅监督生成相位全息图 |

---

## 公式

**渲染方程**：
```math
L_o(x, \omega_o) = L_e(x, \omega_o) + \int_{\Omega} f_r(x, \omega_i, \omega_o) L_i(x, \omega_i) (\omega_i \cdot n) d\omega_i
```

**Rayleigh-Sommerfeld 积分**：
```math
U(P) = \frac{1}{i\lambda} \iint_{\Sigma} U_0(\xi) \frac{e^{ikr}}{r} \cos(\theta) d\xi d\eta
```

---

## 实验结论

- 忠实重建自然 3D 线索和复杂材质
- 实现逼真的焦散模糊、视角相关效果、高光和反射
- 收敛速度提升 10 倍

---

## 局限性

- 主要针对漫反射和镜面反射，未涉及次表面散射
- 计算复杂度仍然较高

---

## 实现建议

- **实现难度**: 高
- **预期性能**: 离线渲染，适合全息显示内容生成
- **适用场景**: VR/AR 全息显示、全息摄影、科学可视化

---

## 与渲染领域的关联

本文使用 **路径追踪（Path Tracing）** 求解渲染方程，与以下经典渲染技术相关：
- Monte Carlo 路径追踪
- 辐亮度缓存（Radiance Cache）
- 全局光照
- 重要性采样

---

## 相关工作

- [[EAG-PT]] - Emission-Aware Gaussians and Path Tracing
- [[TRON]] - Tracing Rays to Orchestrate a Neural Renderer
