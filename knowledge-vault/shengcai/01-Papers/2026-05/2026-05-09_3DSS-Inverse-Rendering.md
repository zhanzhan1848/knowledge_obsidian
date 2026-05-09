---
tags: [渲染, 可微渲染, 逆向渲染, 表面点渲染, PBR]
date: 2026-05-09
status: 待读
---

# 3DSS: 3D Surface Splatting for Inverse Rendering

## 元信息
| 标题 | 3DSS: 3D Surface Splatting for Inverse Rendering |
| 作者 | Adnane Boukhayma (INRIA, University of Rennes) |
| 链接 | [arXiv](https://arxiv.org/html/2605.05876v1) |
| 领域 | 可微渲染, 逆向渲染, 3D Gaussian Splatting, PBR |
| 提交日期 | 2026-05-07 |

## 核心贡献
1. 提出首个**可微表面点渲染器 (Differentiable Surface Splatting)**，用于物理基础逆向渲染
2. 提出**多层表面分离算法**：将表面分离问题转化为区间合并问题，基于 EWA 重建核的深度重叠判断
3. 提出**覆盖率不透明度模型**：从累积 EWA 权重直接导出 smooth per-layer opacity
4. 实现几何、材质（spatially-varying BRDF）、光照的联合优化重建

## 技术方案

### 核心思想
传统表面点渲染的问题：**visibility 无法定位到单个 surfel**，因为表面是从相邻核支持的结合中涌现的。

**关键洞察**：两个 surfel 位于同一表面层当且仅当它们的 view-space 深度范围重叠。深度间隔序列中的间隙标志着新层。

### 架构组成
1. **Multi-layer Surface Separation**: 单次遍历排序后的图元流，通过区间合并替代二元/三元深度测试
2. **Coverage-based Compositing Model**: per-layer opacity 直接从累积 EWA 权重得出，无需阈值
3. **Forward Microfacet Shading**: co-optimized HDR environment lighting
4. **Density-aware Adaptive Refinement**: 自适应精细化

### 关键公式
```math
\text{Same layer}: \text{depth\_extent}(s_i) \cap \text{depth\_extent}(s_j) \neq \emptyset
\text{New layer}: \text{gap in sorted depth interval sequence}
```

### 与现有方法对比
| 方案 | 优点 | 缺点 |
|------|------|------|
| Triangle-mesh rasterizers | 清晰图像，显式表面几何 | 固定连通性，优化困难 |
| Volume-based (NeRF/3DGS) | 无连通性约束，新视角合成好 | volumetric blending 混合材质属性 |
| **3DSS (Ours)** | 兼具两者优点，表面级渲染，可微 | 新范式，实现复杂度 |

## 实验结论
- 几何重建、Novel-view synthesis、Novel-illumination relighting 三个任务全面评估
- 相比 mesh-based、implicit、Gaussian-splatting baselines 均有竞争力
- 支持 surfel sets 通过 oriented point cloud 方法重建为 mesh

## 相关链接
- [arXiv HTML](https://arxiv.org/html/2605.05876v1)

---

#标签 #可微渲染 #逆向渲染 #表面点渲染 #EWA #PBR #INRIA #2026-05
