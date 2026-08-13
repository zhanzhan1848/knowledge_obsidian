---
type: paper
created: 2026-08-13
updated: 2026-08-13
tags: [paper, geometry-processing, surface-reconstruction, 3DGS, SDF, differentiable-rendering]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2608.10602
---

# Gaussian Sculpting: End-to-End Controllable Surface Reconstruction via Field Optimization

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Gaussian Sculpting: End-to-End Controllable Surface Reconstruction via Field Optimization |
| **作者** | Juncheng Liu et al. |
| **发表** | arXiv cs.CV/cs.GR 2026-08-11 |
| **链接** | [原文](https://arxiv.org/abs/2608.10602) |
| **arXiv ID** | 2608.10602 |
| **代码** | 未提供 |

---

## 核心贡献

> 通过将高斯锚定到可微分流形，实现端到端可控的3DGS表面重建

1. **Bi-level训练策略**：外层优化SDF表示的几何，内层在几何固定时更新高斯，实现稳定的梯度隔离
2. **Gaussian Anchoring**：将高斯锚定到演化的可微分流形上，引导SDF优化而非仅在后处理中提取表面
3. **多分辨率细分方案**：基于八叉树式划分的多分辨率细分方案，在保持细节的同时降低内存消耗

---

## 技术方案

### 核心思想

3DGS在有限视角下难以恢复准确表面，且高斯原语的不规则性导致的几何误差难以手动纠正。Gaussian Sculpting的核心是将高斯锚定到演化的可微分流形上，让高斯引导SDF优化，而非仅在后处理中提取表面。

### 关键技术

| 技术 | 说明 |
|------|------|
| Bi-level Training | 外层优化SDF几何，内层更新高斯，固定几何 |
| Gaussian Anchoring | 将高斯参数约束与底层表面一致 |
| Octree-like Subdivision | 多分辨率细分，保持细节降低内存 |
| SDF-guided Optimization | 高斯引导符号距离场优化 |

### 算法流程

1. 初始化一组3D高斯和SDF
2. **外循环**：优化SDF几何表示
3. **内循环**：在几何固定下更新高斯参数
4. 对高斯施加与表面一致的约束
5. 多分辨率细分以保留细节

---

## 实验结论

- **数据集**: 目标级场景 (Object-level scenes)
- **结果**: 
  - 有效去除冗余表面
  - 恢复有限视角导致的缺失结构
  - 即使在较低分辨率下也能实现强重建质量

---

## 局限性

- 主要针对目标级场景，大规模场景效果未知
- 需要多视角输入，单视角效果有限
- 细分方案增加了实现复杂度

---

## 相关工作

- [[3D Gaussian Splatting]]
- [[SDF Surface Reconstruction]]
- [[Differentiable Rendering]]

---

## 实现建议

- **实现难度**: 中高
- **依赖项**: 3DGS, Neural SDF, Differentiable rendering
- **适用场景**: 物体级3D重建、有限视角重建、表面编辑
- **libigl参考**: `extract_occluded_surface`, `triangle_mesh`

---

## 可行性评估

🥢 可行性分析：**Gaussian Sculpting**

## 技术概述
将3DGS高斯锚定到可微分流形，通过bi-level训练实现端到端表面重建

## 算法复杂度
- 时间复杂度：O(n × k) 其中n为高斯数量，k为迭代次数
- 空间复杂度：O(n) 高斯存储 + O(m) SDF体素网格

## 实现难度
- 算法复杂度：**中高**
- 数值稳定性：需要仔细处理SDF与高斯的梯度隔离
- 依赖项：3DGS、Neural SDF、不同可微渲染器

## 推荐结论
✅ 推荐实现（中等优先级）

## 开源参考
- 3DGS原始实现
- libigl: `extract_accurate_sdf`, `marching_cubes`
