---
type: paper
created: 2026-10-09
updated: 2026-10-09
tags: [paper, neural-radiance-caching, path-tracing, specular, real-time-rendering, NRC, prefiltered-radiance, split-sum]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.11702
venue: arXiv preprint
year: 2026
---

# Neural Caching of Prefiltered Radiance for Specular Lighting

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Neural Caching of Prefiltered Radiance for Specular Lighting |
| **作者** | Dmitrii Klepikov, Vladimir Frolov |
| **发表** | arXiv preprint (2026-10-08) |
| **链接** | [原文](https://arxiv.org/abs/2610.11702) |
| **DOI** | [10.48550/arXiv.2610.11702](https://doi.org/10.48550/arXiv.2610.11702) |
| **代码** | 未公开 |

---

## 核心贡献

> 提出一种**针对镜面光照**的 Neural Radiance Caching (NRC) 变体：通过**反射方向参数化**和**粗糙度相关的辐照度目标**，让在线训练的神经网络预测**预滤波入射辐照度**，并与**预计算的 BRDF 积分图**结合（split-sum 近似），实现实时路径追踪中高质量镜面光照。

1. **反射方向参数化 (Reflection-Direction Parameterization)**：把入射辐照度在反射方向周围积分作为网络输入，更契合镜面 BRDF 的方向性
2. **粗糙度相关目标 (Roughness-Dependent Radiance Target)**：网络训练目标随表面粗糙度变化，避免低粗糙度下高频细节被过度平滑
3. **Split-Sum 近似集成**：网络预测的预滤波入射辐照度 × 预计算 BRDF 积分图 → 出射辐照度
4. **在线训练、实时推理**：在渲染过程中持续适应场景光照变化
5. **Bunny / Specular Sponza 验证**：相比 NRC baselines，收敛更快、镜面质量更高

---

## 技术方案

### 核心思想

经典 NRC（如 Müller et al. 2021）针对漫反射场景设计，将整个上半球入射辐照度编码到神经隐式表示。对镜面场景这种全局表达丢失方向信息，导致镜面高光模糊、闪烁。本工作核心思想：**让缓存"沿反射方向预滤波"**，即缓存的不是点周围的辐照度积分，而是沿镜面反射方向的预滤波版本，匹配 BRDF 的方向滤波特性。

### 关键流水线

```
Path tracing 像素 → 网络输入 (位置 + 法线 + 反射方向 + 粗糙度)
                  ↓
        NRC 网络推理 (online-trained MLP)
                  ↓
     预滤波入射辐照度 L_pre(r, ω_o, α)
                  ↓
       × 预计算 BRDF 积分图 D_Env(α)
                  ↓
     出射辐照度 L_o ≈ L_pre × D_Env (split-sum)
```

### 与经典 NRC 的对比

| 维度 | 经典 NRC (Müller 2021) | 本工作 NRC-Specular |
|------|----------------------|----------------------|
| 缓存量 | 表面点的入射辐照度 | 沿反射方向的预滤波入射辐照度 |
| 输入 | position + normal | + reflection direction + roughness |
| 训练目标 | 漫反射辐照度 | 粗糙度相关的预滤波辐照度 |
| 适用 | 漫反射 / 低粗糙度混合 | 镜面光照优化 |
| 集成方式 | 直接用 | Split-Sum 近似 |

### 关键技术

| 技术 | 说明 |
|------|------|
| 反射方向参数化 | 用 ω_r 替代 ω_i 引导网络注意力 |
| 粗糙度条件化 | 网络输入 α，网络按粗糙度自适应学习 |
| Split-sum 近似 | 预滤波环境光 + BRDF 查询复用 Karis 2013 思想 |
| 在线训练 | 渲染过程中持续采样、训练 MLP |
| 实时推理 | 维护紧凑 MLP，单次前向评估 |

---

## 公式

经典出射辐照度（split-sum）：

```math
L_o(\mathbf{x}, \omega_o) \approx \int_{\Omega^+} f_r(\omega_i, \omega_o) L_i(\mathbf{x}, \omega_i) (\omega_i \cdot \mathbf{n}) \, d\omega_i
```

近似为：

```math
L_o(\mathbf{x}, \omega_o) \approx \underbrace{\left(\int_{\Omega^+} L_i(\mathbf{x}, \omega_i) D(\omega_i, \omega_r, \alpha) \, d\omega_i\right)}_{\text{NRC 预测：预滤波入射辐照度}} \cdot \underbrace{\int_{\Omega^+} f_r \, d\omega_i}_{\text{预计算 BRDF 积分图}}
```

其中 $D(\cdot)$ 是围绕反射方向 $\omega_r$ 的预滤波核（宽度由 $\alpha$ 控制）。

---

## 实验结果

- **数据集**: Bunny、Specular Sponza（典型镜面场景）
- **基线**: 经典 NRC（Müller et al. 2021）、Path Tracing reference
- **结果**:
  - 比 NRC baselines **更快收敛**到 path tracing reference
  - 镜面光照质量（高光形状、闪烁）更好
  - 保持实时性能，缓存在线更新

---

## 局限性

- 极端镜面（如 $\alpha \to 0$）仍依赖环境贴图预滤波质量
- 动态场景需持续重训，计算开销
- 与原始 NRC 一样，需要初始 warm-up 帧

---

## 相关工作

- [[NRC-Muller-2021-Neural-Radiance-Caching]] — 经典 NRC 基础
- [[Split-Sum-Approx-Karis-2013]] — Karis 实时 PBR 环境光照
- [[Path-Guiding]] — 与 guided path tracing 思想相关

---

## 实现建议

- **实现难度**: 中（需要复现 NRC 训练管线 + 修改网络输入/目标）
- **预期性能**: 实时（30+ fps @ 1080p），具体取决于场景复杂度
- **适用场景**: 实时路径追踪器（如虚幻 5 Lumen、自研引擎），需要提升镜面光照质量
- **推荐度**: ⭐⭐⭐⭐ （与 moyuwan 协作价值高，可作为实时渲染镜面 GI 模块）
