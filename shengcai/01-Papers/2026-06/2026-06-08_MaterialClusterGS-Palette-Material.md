---
tags: [渲染, PBR, 材质分解, 重光照, 2DGS, 高斯 splatting]
date: 2026-06-08
status: 待读
---

# Palette-Based Material Decomposition and Physically-Based Relighting with 2D Gaussian Splatting

## 元信息
| 标题 | Palette-Based Material Decomposition and Physically-Based Relighting with 2D Gaussian Splatting |
| 作者 | Hao Zhang et al. |
| 链接 | [arXiv](https://arxiv.org/abs/2606.09018) |
| 领域 | PBR材质, 材质分解, 重光照, 2D Gaussian Splatting |
| 提交日期 | 2026-06-08 |
| PDF | [arXiv PDF](https://arxiv.org/pdf/2606.09018) |

## 核心贡献
1. **全局调色板材质分解**：MaterialClusterGS使用紧凑全局调色板（BRDF prototypes）替代独立逐primitive材质分配，解决欠约束问题
2. **连续空间材质场**：通过连续空间材质场将调色板prototypes分配给场景，实现空间一致的材质编辑
3. **联合优化**：在PBR渲染目标下联合优化材质场、调色板prototypes和环境光照

## 技术方案

### 核心问题
逐primitive独立BRDF参数导致材质高度欠约束，阴影/间接光照/几何误差/可见性残差被吸收到数千个局部材质估计中。

### 解决方案
场景材质 → 紧凑全局调色板（共享BRDF prototypes）→ 连续空间材质场分配 → 联合优化

## 实验结论
- 紧凑、空间一致的材质属性恢复
- 支持材质编辑、重光照和迁移
- 相比逐primitive分解更稳定、编辑性更好

## 相关笔记
- [[2026-05-04_RealTime-GI-Dynamic-3D-Gaussian-Scenes]]
- [[2026-03-21_ReLi3D-Relightable-Multi-view-Reconstruction]]

## 链接
- [arXiv HTML](https://arxiv.org/html/2606.09018v1)

---

#标签 #PBR #材质分解 #重光照 #2DGS #Gaussian-Splatting #2026-06