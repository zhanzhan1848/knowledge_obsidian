---
type: paper
created: 2026-04-16
updated: 2026-04-16
tags: [gaussian-splatting, ray-tracing, reflection, transmittance, PBR, specular]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.00509
---

# RT-GS: Gaussian Splatting with Reflection and Transmittance Primitives

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Gaussian Splatting with Reflection and Transmittance Primitives |
| **作者** | Kunnong Zeng et al. |
| **发表** | arXiv 2026 (cs.GR) |
| **链接** | [原文](https://arxiv.org/abs/2604.00509) |
| **DOI** | 10.48550/arXiv.2604.00509 |

---

## 核心贡献

> 统一框架：联合建模高斯泼溅中的镜面反射和透射，结合微面元材质模型与光线追踪。

1. 提出分离的高斯原语分别处理反射和透射，支持远处反射重建和透明物体后方场景重建
2. 整合microfacet材质模型（BRDF），实现物理正确的镜面反射模拟
3. 可微分光线追踪框架联合优化，实现复杂环境下的高质量新视角合成

---

## 技术方案

### 核心思想

传统3DGS仅处理漫反射，难以同时建模镜面反射和透射。该工作引入两类新的高斯原语：
- **Reflection Gaussians**: 追踪镜面反射射线，捕捉远处反射
- **Transmittance Gaussians**: 追踪透射射线，重建透明物体后方场景

### 关键技术

| 技术 | 说明 |
|------|------|
| Microfacet BRDF | 物理材质模型处理镜面反射 |
| 分离高斯原语 | 独立反射/透射高斯避免干扰 |
| 可微分光线追踪 | 端到端可训练的光线求交与材质计算 |

---

## 实验结论

- **数据集**: 复杂室内外场景，包含镜面和透明物体
- **基线**: 现有3DGS方法（无反射/透射支持）
- **结果**: 在复杂光照交互场景下取得显著的定性改进

---

## 局限性

- 需要额外的分割mask引导（SAM2 + GroundingDINO）
- 分离高斯原语增加内存开销

---

## 实现建议

- **实现难度**: 高（需实现光线追踪+BRDF+可微分渲染）
- **预期性能**: 质量显著提升，计算开销增加约2-3x
- **适用场景**: 室内场景重建、透明物体渲染、镜面反射场景

---

## 相关笔记

- [[Stochastic-Ray-Tracing-3DGS]]
- [[PBR-Material-Models]]
- [[Differentiable-Ray-Tracing]]
