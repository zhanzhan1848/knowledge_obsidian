---
type: paper
created: 2026-04-30
updated: 2026-04-30
tags: [paper, SDF, rasterization, mesh-reconstruction, neural-implicit]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.23537
---

# Distance Field Rasterization for End-to-End Mesh Reconstruction

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Distance Field Rasterization for End-to-End Mesh Reconstruction |
| **作者** | arXiv submission |
| **发表** | arXiv cs.GR (2026-04-28) |
| **链接** | [原文](https://arxiv.org/abs/2604.23537) |
| **DOI** | 10.48550/arXiv.2604.23537 |
| **代码** | TBD |

---

## 核心贡献

> 提出 **SDFRaster**，一种可光栅化的 SDF 表示，结合光栅化效率与符号距离场进行端到端网格重建

1. 解决基于体素的方法（3DGS 等）不暴露全局一致表面表示的问题
2. 解决隐式 SDF 方法需要计算密集的射线 marching 的问题
3. 结合光栅化效率与 SDF 精度

---

## 技术方案

### 核心思想

基于光栅化的方法（如 3DGS）以实时速率实现高质量新视角合成，但其底层体素原语不暴露直接、全球一致的表面表示，表面提取依赖启发式后处理。

SDFRaster 将 SDF 可光栅化，结合两种方法的优势。

### 关键技术

| 技术 | 说明 |
|------|------|
| SDFRaster | 可光栅化的 SDF 表示 |
| 端到端网格重建 | 无需后处理 |
| 光栅化效率 | 利用现代 GPU 光栅化管线 |
| SDF 精度 | 保持隐式方法的表面精度 |

---

## 实验结论

- 端到端网格重建，无需启发式后处理
- 利用光栅化效率
- 保持 SDF 的精确表面表示

---

## 局限性

- 可能受限于 SDF 分辨率
- 与纯神经方法相比可能需要更多手工设计

---

## 实现建议

- **实现难度**: 中高（涉及 SDF + 光栅化集成）
- **预期性能**: 高质量 + 实时速度
- **适用场景**: 网格重建、新视角合成、实时渲染
- **优先级**: 高 - 填补体素和 SDF 方法的空白

---

## 相关工作

- [[SDF]]
- [[Rasterization]]
- [[3D Gaussian Splatting]]
- [[Mesh Reconstruction]]