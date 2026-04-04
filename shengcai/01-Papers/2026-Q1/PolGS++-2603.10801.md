---
type: paper
created: 2026-04-04
updated: 2026-04-04
tags: [paper, 3DGS, polarization, pBRDF, reflective, surface-reconstruction]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2603.10801
---

# PolGS++: Physically-Guided Polarimetric Gaussian Splatting for Fast Reflective Surface Reconstruction

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | PolGS++: Physically-Guided Polarimetric Gaussian Splatting for Fast Reflective Surface Reconstruction |
| **作者** | Yufei Han et al. |
| **发表** | arXiv:2603.10801 [cs.CV] — 2026-03-11 |
| **链接** | [原文](https://arxiv.org/abs/2603.10801) |
| **DOI** | 10.48550/arXiv.2603.10801 |
| **代码** | 待发布 |

---

## 核心贡献

> 将偏振 BRDF (pBRDF) 集成到 3DGS，实现快速反射表面重建，训练仅需约 10 分钟

1. **pBRDF 模型集成**：将偏振 BRDF 集成到 3DGS，显式解耦漫反射和镜面分量
2. **物理接地反射建模**：提供物理 grounded 反射建模和更强的几何线索
3. **深度引导可见性掩膜获取**：无需代价高昂的光线追踪交点，实现 AoP 切线空间一致性约束
4. **快速训练**：约 10 分钟训练时间

---

## 技术方案

### 核心思想

精确反射表面重建是计算机视觉的基础挑战，在实时虚拟现实和数字内容创建中有广泛应用。3DGS 的显式表示虽然实现高效新视角渲染，但在反射表面上性能仍落后于隐式神经方法，尤其在恢复精细几何和表面法线方面。PolGS++ 通过物理引导设计改善质量和效率。

### 关键技术

| 技术 | 说明 |
|------|------|
| 偏振 BRDF (pBRDF) | 解耦漫反射和镜面反射 |
| 深度引导可见性掩膜 | 基于 AoP 的切线空间一致性约束，无需光线追踪 |
| 物理引导设计 | 改善重建质量 |
| 快速训练 | 约 10 分钟 |

### 与 PhyGaP 对比

| 方法 | 偏振使用 | 特殊技术 | 训练时间 |
|------|---------|---------|---------|
| PolGS++ | pBRDF | 深度引导可见性掩膜 | ~10 分钟 |
| PhyGaP | PolarDR | GridMap | 标准 |

---

## 实验结论

- **数据集**：合成和真实世界数据集
- **基线**：3DGS 反射表面方法
- **结果**：在反射表面重建上优于现有方法
- **训练效率**：约 10 分钟

---

## 局限性

- 需要偏振输入
- 与 PhyGaP 有部分文本重叠
- 对非反射表面可能无显著优势

---

## 实现建议

- **实现难度**：中高（需要偏振成像）
- **预期性能**：实时渲染
- **适用场景**：VR/AR、数字内容创建、反射表面扫描

---

## 相关工作

- 3D Gaussian Splatting
- 偏振成像
- BRDF
- 反射表面重建
- Ref-NeRF

---

## 标签

#渲染 #3DGS #偏振 #pBRDF #反射 #表面重建 #2026
