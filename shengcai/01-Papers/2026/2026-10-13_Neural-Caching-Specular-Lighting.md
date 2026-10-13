---
type: paper
created: 2026-10-13
updated: 2026-10-13
tags: [paper, path-tracing, global-illumination, neural-rendering, specular, real-time, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.11702
---

# Neural Caching of Prefiltered Radiance for Specular Lighting

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Neural Caching of Prefiltered Radiance for Specular Lighting |
| **作者** | Dmitrii Klepikov |
| **发表** | arXiv 2026-10 |
| **链接** | [原文](https://arxiv.org/abs/2610.11702) |
| **DOI** | 10.48550/arXiv.2610.11702 |
| **代码** | - |

---

## 核心贡献

> NRC (Neural Radiance Caching) 的镜面 (specular) 变体，针对实时路径追踪中 specular GI 的精准估计。

1. **反射方向参数化** — 用反射方向作为参数化输入。
2. **粗糙度相关 radiance 目标** — 训练目标信号与表面粗糙度耦合。
3. **Split-sum BRDF 集成** — 与预计算的 BRDF 集成图结合，输出 outgoing radiance。

---

## 技术方案

### 核心思想

> 经典 NRC 主要对 diffuse GI 工作良好，但对 specular 表现欠佳。本工作通过反射方向参数化让网络直接学习方向依赖的入射辐射度，并通过 split-sum 近似联合查询预积分 BRDF。

### 关键技术

| 技术 | 说明 |
|------|------|
| 反射方向参数化 | 网络输入包含反射方向 ω_r |
| 粗糙度条件化 | 输出目标的强度与粗糙度匹配 |
| 在线训练 | 渲染过程中持续优化缓存 |
| Split-sum 集成 | 网络输出 + BRDF LUT 查询 |

---

## 公式

```math
L_o(x, \omega_o) \approx \int_{\Omega} f_r(\omega_i, \omega_o) L_{\text{prefiltered}}(x, \omega_r, \alpha) (\omega_i \cdot n) d\omega_i

L_{\text{prefiltered}}(x, \omega_r, \alpha) = \text{NRC}_\theta(x, \omega_r, \alpha)
```

---

## 代码片段

```cpp
// NRC specular 推理流程（概念）
vec3 radiance_cache = nrc_infer(position, reflect_dir, roughness);
vec3 brdf_lut       = sample_brdf_lut(roughness, NoV);
vec3 outgoing       = radiance_cache * brdf_lut * NoV;
```

---

## 实验结论

- **数据集**: Bunny、Specular Sponza（典型 specular-heavy 场景）
- **基线**: 原版 NRC (diffuse-focused)
- **结果**:
  - 更快收敛到 path-tracing 参考图
  - specular 照明质量优于评估的 NRC 基线
  - 保持实时性能，缓存随渲染过程动态更新

---

## 局限性

- 仅在 Bunny / Specular Sponza 上评估，泛化需要更多场景
- 在线训练开销随路径长度增长
- 反射方向的离散化分辨率影响质量

---

## 与团队相关

- 与墨鱼丸 (moyuwan): 可作为实时降噪 / 神经 GI 方案的对比基线
- 实时引擎集成: specular GI 是 PBR 渲染里最难的环节之一
