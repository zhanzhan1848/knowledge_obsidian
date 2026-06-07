---
tags: [渲染, 3DGS, 高斯泼溅, 几何, 2026]
date: 2026-06-07
status: 待读
---

# Decoupling Appearance and Geometry in Gaussian Splatting

## 元信息
| 标题 | Decoupling Appearance and Geometry in Gaussian Splatting |
| 作者 | Hongyu Zhou et al. |
| 链接 | [arXiv:2606.05124](https://arxiv.org/abs/2606.05124) |
| 领域 | cs.GR |
| 发表 | 2026-06-03 |

## 核心贡献

1. **发现3DGS 本征矛盾**：通过完整 ground-truth 实验证明3DGS 默认形式无法同时表示纹理和几何
2. **单参数解决方案**：为每个 splat 添加一个额外的几何不透明度参数
3. **可选透明_curated 优化流程**：进一步提升渲染和几何性能
4. **透明物体显著改善**：复杂场景尤其包含透明物体的场景受益明显

## 技术方案

### 核心发现
3DGS 原生设计在纹理和几何之间存在 trade-off，同时优化两者会降低各自质量。

### 解决方案
```
标准3DGS：
  splat(i) = { position, scale, rotation, opacity, spherical_harmonics }

改进方案：
  splat(i) = { position, scale, rotation, opacity, spherical_harmonics, geometry_opacity }
```

### 关键思想
- 独立不透明度参数分离外观渲染和几何表示
- geometry_opacity 控制几何遮挡而非颜色透明度

## 实验结论

- 在多种数据集上改善了渲染和几何性能
- 透明物体场景显著受益
- 可与 ground-truth 和视觉基础模型几何输入结合使用

## 局限性

- 额外参数增加优化复杂度
- 对不透明物体改善可能有限

## 相关工作
[[3D Gaussian Splatting]], [[Novel View Synthesis]], [[Neural Rendering]]

## 标签
#渲染 #3DGS #高斯泼溅 #几何 #透明物体