---
type: paper
created: 2026-06-19
updated: 2026-06-19
tags: [paper, rendering, path-tracing, holography, SIGGRAPH2026]
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
| **作者** | Wenbin Zhou et al. |
| **发表** | ACM Transactions on Graphics, Vol. 45, No. 4, Article 39, July 2026 (SIGGRAPH 2026) |
| **链接** | [原文](https://arxiv.org/abs/2606.14173) |
| **DOI** | https://doi.org/10.1145/3811351 |
| **代码** | - |

---

## 核心贡献

> 将路径追踪与 Rayleigh-Sommerfeld 衍射积分统一在 Monte Carlo 框架下，实现物理准确且计算高效的全息波前编码

1. **统一渲染框架**：同时求解渲染方程和 Rayleigh-Sommerfeld 积分，用 Monte Carlo 方法同时处理几何光学渲染和波动光学衍射
2. **环境辐射缓存加速**：通过环境 radiance cache 近似，实现约 10 倍收敛速度提升
3. **Path Reuse 技术**：生成多个时域复用随机全息图，仅需极少额外计算时间
4. **复杂材质支持**：支持光泽反射、镜面反射折射、基于物理的材质行为

---

## 技术方案

### 核心思想

现有全息显示方案将辐射率估计与波传播解耦——先预渲染场景 radiance，再做衍射计算。这种分离导致无法真实再现聚焦线索和基于物理的材质行为。

HoloPathTracer 将路径追踪扩展到波动光学领域，用 Monte Carlo 同时求解：
1. **渲染方程**（几何光学）：$L_o(\mathbf{x}, \omega_o) = L_e(\mathbf{x}, \omega_o) + \int_{\Omega} f_r(\mathbf{x}, \omega_i, \omega_o) L_i(\mathbf{x}, \omega_i) (\omega_i \cdot \mathbf{n}) d\omega_i$
2. **Rayleigh-Sommerfeld 积分**（波动光学）：$U(P_0) = \frac{1}{i\lambda} \iint_{\Sigma} U(P_1) \frac{e^{ikr}}{r} \frac{\cos(\theta)}{r} dS$

通过路径追踪采样光路，用 RS 积分计算波前，用户感知重建的 3D 场景。

### 关键技术

| 技术 | 说明 |
|------|------|
| Wave Path Tracing | 路径追踪扩展到波动光学，同时追踪路径和波前相位 |
| Ambient Radiance Cache | 预计算环境 radiance 近似，加速积分收敛 ~10x |
| Path Reuse | 同一路径复用生成多个时域随机全息图 |
| Complex-Amplitude Hologram | 复振幅全息图监督，将相干波场转换为相位全息图 |

---

## 实验结论

- **数据集**: 自然场景仿真 + 空间光调制器(SLM)原型实验
- **结果**: 实现了逼真的 3D 重建线索（defocus blur、view-dependent 效果、高光反射）
- **性能**: 环境 radiance cache 带来约 10 倍收敛速度提升

---

## 局限性

- 计算资源需求较高（Monte Carlo + 波动光学双重计算）
- 对全息显示器件（SLM）精度有要求

---

## 实现建议

- **实现难度**: 高（需同时实现路径追踪和波动光学传播）
- **适用场景**: VR/AR 全息显示、裸眼 3D 显示
- **优先级**: 中（学术前沿，硬件依赖较强）
