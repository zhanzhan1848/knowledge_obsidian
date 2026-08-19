---
type: paper
created: 2026-08-19
updated: 2026-08-19
tags: [mesh-deformation, remeshing, generative-ai, text-to-shape, isotropic-remeshing]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2608.17182
---

# RADmesh: Remesh-Aware Mesh Deformation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | RADmesh: Remesh-Aware Mesh Deformation |
| **作者** | Nam Anh Dinh et al. |
| **发表** | ECCV 2026 (Oral) |
| **链接** | [原文](https://arxiv.org/abs/2608.17182) \| [PDF](https://arxiv.org/pdf/2608.17182) \| [Project](https://threedle.github.io/radmesh) |
| **DOI** | 10.48550/arXiv.2608.17182 |

---

## 核心贡献

> 将重网格化（remeshing）融入生成式网格变形流水线，解决大变形下网格元素质量退化问题，同时保持三角网格与几何的各向同性。

1. **顶点变形优化量**（vertex-based deformation optimization）：鲁棒对抗视觉损失噪声的大变形
2. **周期性各向同性重网格化**：在优化状态迁移中保持分辨率
3. **局部化新特征生长**：可在基础形状上长出新特征，保留其余部分不变

---

## 技术方案

### 核心思想

大变形会导致网格三角化质量严重退化（即使几何语义正确）。现有生成式/文本驱动网格变形方法大多数不改变三角化。RADmesh 通过**周期性重网格化**耦合视觉监督信号与几何感知，在 coarse-to-fine 添加分辨率过程中保持各向同性三角形。

### 关键技术

| 技术 | 说明 |
|------|------|
| 视觉损失鲁棒优化 | 顶点级优化量设计，对梯度噪声鲁棒 |
| 各向同性重网格化 | isotropic remesher，周期性重划分网格 |
| 变形状态迁移 | remesh 时携带 forward 变形优化状态 |
| 局部化控制 | 仅在指定区域生长新特征，其余保持不变 |
| 三角网格效率 | 优化后的三角网格贴合几何、元素各向同性 |

### 与 libigl 的关联

各向同性 remeshing 在 libigl 中有 `remesh_isotropic` 相关实现，可参考：
- `libigl::quadric_error_metrics` - QEM 简化
- `libigl::isotropic_remeshing` - 各向同性重网格化

---

## 实验结论

- **数据集**: 多种形状和提示词（本地 + 全局变形）
- **基线**: 固定三角化网格变形方法
- **结果**: 视觉质量更高，三角形效率更好（更少三角形达到同等质量）
- **优势**: 可生成新特征（feature growth），保留基础形状未变形区域

---

## 局限性

- 依赖各向同性重网格化器的质量
- 周期性 remesh 可能导致优化过程不稳定

---

## 实现建议

- **实现难度**: 中（需耦合视觉优化器与重网格化器）
- **开源依赖**: libigl（remeshing）、深度学习框架（视觉损失）
- **适用场景**: 文本驱动的 3D 形状生成、AI 生成式建模
- **推荐度**: ⭐⭐⭐⭐⭐ 核心网格处理技术 + AI 生成应用，ECCV Oral 水平

---

## 相关工作

- [[网格变形]] / [[Mesh Deformation]]
- [[重网格化]] / [[Remeshing]]
- [[各向同性网格化]] / [[Isotropic Remeshing]]
- [[文本转3D]] / [[Text-to-Shape]]
