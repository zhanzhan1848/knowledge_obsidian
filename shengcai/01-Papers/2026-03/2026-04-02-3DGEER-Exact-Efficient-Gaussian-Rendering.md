---
tags: [渲染, 3DGS, 光线追踪, 大视场相机, 精确渲染, 2026]
date: [[2026-04-02]]
status: 待读
---

# 3DGEER: 3D Gaussian Rendering Made Exact and Efficient for Generic Cameras

## 基本信息
| 项目 | 内容 |
|------|------|
| 作者 | Zixun Huang et al. (Bosch Research) |
| 发表 | ICLR 2026, arXiv:2505.24053 [cs.GR] |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2505.24053) |
| 代码 | [GitHub](https://github.com/boschresearch/3dgeer) |

## 核心贡献
1. 从第一性原理推导光线沿线上 Gaussian 密度积分的**闭合形式表达式**，实现任意相机模型下的精确前向渲染和可微优化
2. 提出 **PBF (Particle Bounding Frustum)**：紧致的光线-Gaussian 关联，无需 BVH 遍历
3. 提出 **BEAP (Bipolar Equiangular Projection)**：统一 FoV 表示，加速关联并提升重建质量
4. 在针孔和鱼眼数据集上全面超越先前方法，比现有精确投影 baseline 快 **5×**，泛化到训练时未见过的更大 FoV

## 技术方案

### 问题：3DGS 的投影近似误差
3DGS 将 3D Gaussian 近似为 2D 投影，该假设在大视场（large FoV）相机下精度严重下降。

### 闭合形式光线积分
对沿光线 $r(t) = o + td$ 的 Gaussian 密度积分：
```math
\int_0^\infty G(r(t)) dt = \text{闭合形式解（论文给出）}
```
这避免了蒙特卡洛采样，实现了精确前向渲染。

### PBF (Particle Bounding Frustum)
为每个 Gaussian 构建包围视锥，无需 BVH 遍历即可完成光线-Gaussian 关联（association）。

### BEAP (Bipolar Equiangular Projection)
将 FoV 表示统一化到双极等角投影空间，加速关联计算。

## 实验结论
- 针孔和鱼眼数据集上各项指标超越 prior arts
- 比 projective exact ray-based baselines 快 5×
- 泛化到未见大 FoV 场景

## 标签
#3DGS #光线追踪 #大视场 #精确渲染 #ICLR2026
