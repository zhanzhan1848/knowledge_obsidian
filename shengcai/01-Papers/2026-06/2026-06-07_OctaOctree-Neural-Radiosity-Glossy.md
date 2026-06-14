---
tags: [渲染, 全局光照, 神经辐射缓存, 实时渲染, glossy, 镜面反射]
date: 2026-06-07
status: 待读
---

# OctaOctree Neural Radiosity for Real-time Glossy Material Rendering

## 元信息
| 标题 | OctaOctree Neural Radiosity for Real-time Glossy Material Rendering |
| 作者 | Jierui Ren et al. |
| 链接 | [arXiv](https://arxiv.org/abs/2606.08469) |
| 领域 | 全局光照, 神经辐射缓存, 实时渲染, 镜面反射 |
| 提交日期 | 2026-06-07 |
| PDF | [arXiv PDF](https://arxiv.org/pdf/2606.08469) |

## 核心贡献
1. **OctaOctree**：结合3D空间自适应八叉树与八面体方向图的高效空间-角度辐射表示
2. **反射感知空间-角度先验嵌入表示本身**：减少神经网络从位置特征恢复高频视角相关效果的负担
3. **单次网络查询实现实时高质量GI**：在主光线交点单次查询即可获得高质量方向感知全局光照

## 技术方案

### 核心问题
现有神经辐射缓存方法依赖位置特征编码，难以表示高频方向辐射变化，对glossy/specular材质处理能力不足。

### OctaOctree架构
- 3D空间：自适应八叉树，自适应分配精细分辨率给光照和可见性变化区域
- 八面体方向图：每个空间节点关联八面体方向图存储出射辐射
- 空间-角度耦合：精细空间分辨率处理局部变化，粗糙空间层级+丰富角度分辨率处理glossy/specular辐射

## 实验结论
- 单次网络查询实现实时性能
- 从漫反射interreflection到锐利glossy反射的全方位间接光照
- 相比baseline神经辐射缓存保真度更高

## 相关笔记
- [[2026-05-04_RealTime-GI-Dynamic-3D-Gaussian-Scenes]]
- [[2026-04-10_RealTime-Neural-SixWay-Lightmaps]]

## 链接
- [arXiv HTML](https://arxiv.org/html/2606.08469v1)

---

#标签 #全局光照 #神经渲染 #实时渲染 #glossy #镜面反射 #辐射缓存 #2026-06