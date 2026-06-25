---
tags: [渲染, 3DGS, 全局光照, 神经渲染, 2026]
date: [[2026-06-25]]
status: 待读
---

# White-Box 3DGS Construction via Plenoptic Sampling

## 基本信息
| 标题 | 值 |
|------|-----|
| 作者 | Youcheng Cai |
| 发表 | arXiv cs.GR (2026) |
| 链接 | [arXiv:2606.21898](https://arxiv.org/abs/2606.21898) |
| PDF | [PDF](https://arxiv.org/pdf/2606.21898) |

## 核心贡献
1. 提出 **Mesh2GS** 框架，基于 plenoptic sampling 理论从 mesh 直接生成 3DGS
2. 理论推导了采样视图的最小采样率及 3D Gaussian 分布
3. 提出基于 **albedo-shading decomposition** 的新型 3DGS 更新流程
4. 引入神经光照增强模块处理非 Lambertian 效应

## 技术方案

### 核心思想
现有方法将 3DGS 绑定到 mesh 使用启发式策略，而本文提出白盒框架，直接从 mesh 几何生成 3DGS，基于 plenoptic sampling 理论达到 Nyquist 级性能。

### 关键方法
1. **Plenoptic Sampling 引导的 3DGS 构造策略**：理论推导最小采样率和 Gaussian 分布
2. **Albedo-Shading 分解**：将光照分解为 albedo 和 shading 分量，提高全局光照捕获效率
3. **神经光照增强模块**：处理镜面高光等非 Lambertian 效应

## 实验结论
- 在实时渲染和非 Lambertian 效应捕获方面超越 state-of-the-art
- 项目代码将在接收后开源

## 局限性
- 需要预知 mesh 几何信息
- 神经光照增强模块可能带来额外计算开销

## 标签
#3DGS #PlenopticSampling #GlobalIllumination #NeuralRendering

## 相关笔记
[[2026-06-17_HoloPathTracer-Wave-Path-Tracing-Holography]]
[[2026-05-04_RealTime-GI-Dynamic-3D-Gaussian-Scenes]]
