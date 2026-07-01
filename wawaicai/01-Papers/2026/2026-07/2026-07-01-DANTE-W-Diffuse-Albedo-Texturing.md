---
type: paper
created: 2026-07-01
updated: 2026-07-01
tags: [mesh-texturing, diffuse-albedo, neural-texturing, relighting, parameterization]
status: new
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2606.30677
---

# DANTE-W: Diffuse Albedo Neural Texturing in the Wild

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | DANTE-W: Diffuse Albedo Neural Texturing in the Wild |
| **作者** | Guangyu Wang, Tianheng Lu, Ruqi Huang, Lu Fang |
| **发表** | arXiv cs.GR (2026-06-26) |
| **链接** | [原文](https://arxiv.org/abs/2606.30677) |
| **DOI** | 10.48550/arXiv.2606.30677 |
| **代码** | 未提供 |
| **项目页** | http://dante-wild.github.io |

---

## 核心贡献

> 从无结构图像集合中恢复高保真漫反射反照率纹理，解决传统网格纹理化中的着色和阴影 baked-in 问题

1. **神经纹理框架**: 给定重建网格及其表面参数化，将视图空间生成反照率先验融合到连贯的纹理空间
2. **物理原则神经渲染**: 通过物理原则神经渲染增强细粒纹理细节
3. **与现有 3D 重建流程无缝集成**: 适用于大规模野外场景
4. **高保真反照率恢复**: 支持高质量重光照

---

## 技术方案

### 核心思想

传统网格纹理技术直接将捕获的多视图图像融合，但不可避免地会受到 baked-in 着色的影响，在重光照时损害视觉保真度。

**解决方案**：利用视图空间生成反照率先验，通过表达性神经表示融合到连贯纹理空间，结合物理原则神经渲染增强细节。

### 关键技术

| 技术 | 说明 |
|------|------|
| Surface Parameterization | 使用网格表面参数化作为纹理空间 |
| View-space Generative Albedo Priors | 视图空间生成反照率先验融合 |
| Physically Principled Neural Rendering | 物理原则神经渲染增强细节 |
| Unstructured Image Collections | 支持无结构野外图像 |

---

## 实验结论

- **数据集**: 自建 benchmark，包含真实世界野外场景和合成物体
- **结果**: 有效重建精确反照率纹理，显著提升重光照保真度

---

## 局限性

- 依赖于网格表面参数化质量
- 对镜面反射场景效果有限（专注于漫反射反照率）
- 代码未公开

---

## 相关工作

- [[Mesh Texturing]]
- [[Albedo Recovery]]
- [[Neural Rendering]]
- [[Surface Parameterization]]

---

## 实现建议

- **实现难度**: 中高（需神经渲染 + 参数化整合）
- **预期性能**: 高保真漫反射纹理恢复
- **适用场景**: 野外场景网格纹理化、重光照应用