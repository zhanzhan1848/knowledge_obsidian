---
tags: [渲染, 面部毛发, 3DGS, 曲线表示, 生产级资产生成]
date: 2026-06-06
status: 待读
---

# Wispy to Voluminous: Prior-free Multi-view Capture of Strand-level Facial Hair

## 元信息
| 标题 | Wispy to Voluminous: Prior-free Multi-view Capture of Strand-level Facial Hair |
| 作者 | (cs.GR + cs.CV) |
| 链接 | [arXiv](https://arxiv.org/abs/2606.08041) |
| 领域 | 面部毛发重建, 3D Gaussian Splatting, 曲线渲染, 生产级资产生成 |
| 提交日期 | 2026-06-06 |
| PDF | [arXiv PDF](https://arxiv.org/pdf/2606.08041) |

## 核心贡献
1. **首个从3D Gaussian表示重建高精度面部毛发strands的方法**
2. **无先验多视图捕获**：无需特殊prior，从多视图图像自动重建胡须、胡子、睫毛、眉毛
3. **四阶段几何歧义解决**：优化3D Gaussians → 追踪连续strands → 接地和根-尖歧义解决 → 不透明度驱动密度控制
4. **生产级资产生成**：支持面部动画、物理模拟、几何修饰和迁移、外观编辑、基于物理的渲染

## 技术方案

### 四阶段管线
1. 3D Gaussians优化：头几何追踪约束，强制早期光线终止，抑制次表面噪声
2. 连续strand追踪：鲁棒处理频繁跨越和极端曲率
3. 接地和根-尖歧义解决：基于物理的prior，表面接地+根-尖方向推断
4. 不透明度驱动密度控制：光度优化下的精细化

## 实验结论
- 首个从3D Gaussian表示生产高精度面部毛发strands
- 忠实保留方向和稀疏模式
- 资产生成后立即可用于下游生产任务

## 相关笔记
- [[2026-06-14-daily-search-report]]

## 链接
- [arXiv HTML](https://arxiv.org/html/2606.08041v1)

---

#标签 #面部毛发 #3DGS #曲线渲染 #生产级资产 #毛发渲染 #2026-06