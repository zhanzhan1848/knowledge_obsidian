---
title: Gaussian Splatting with Reflection and Transmittance Primitives
authors: Kunnong Zeng
date: 2026-04-01
source: arXiv cs.GR
url: https://arxiv.org/abs/2604.00509
pdf: https://arxiv.org/pdf/2604.00509
tags: [rendering, 3DGS, ray-tracing, specular, transparency, 2026]
status: unread
---

# Gaussian Splatting with Reflection and Transmittance Primitives

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Gaussian Splatting with Reflection and Transmittance Primitives |
| 作者 | Kunnong Zeng |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2604.00509) |
| PDF | [下载](https://arxiv.org/pdf/2604.00509) |

## 核心贡献
1. 提出 RT-GS 统一框架，将微面元材质模型与光线追踪结合
2. 使用独立的反射和透射 Gaussian 基元建模镜面反射与半透明表面
3. 实现可微分光线追踪框架获取镜面反射和透射外观

## 技术方案
3D Gaussian Splatting (3DGS) 在重建漫射场景方面表现强劲，但在同时建模镜面反射和半透明表面后的物体外观方面存在困难。

**核心方法：**
- 引入微面元（microfacet）材质模型
- 使用独立 Gaussian 基元分别处理反射和透射
- 可微分光线追踪（differentiable ray tracing）计算外观

**方法流程：**
1. 对每个 Gaussian 分配反射或透射属性
2. 光线与场景交互时，通过光线追踪确定反射/透射贡献
3. 联合优化所有 Gaussian 参数

## 实验结论
- 成功生成反射效果
- 重建半透明表面后的物体
- 在复杂环境中显著定性改进

## 局限性
- 计算成本较高（光线追踪）
- 需要额外的 Gaussian 基元

## 可行性分析
- 实现难度：中（需实现光线追踪与 3DGS 集成）
- 性能预期：需权衡渲染质量与速度
- 适用场景：高质量新颖视角合成、透明/反射场景

## 相关工作
- [[3D Gaussian Splatting]]
- [[Ray Tracing in 3DGS]]
- [[Microfacet Materials]]

## 笔记
**关键词**: #3DGS #ray-tracing #reflections #transmittance #novel-view-synthesis
