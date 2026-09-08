---
tags: [3DGS, 参数化, 调色板编辑, 球谐函数, 颜色编辑]
---

# Reparametrizing 3D Gaussian Splatting for Real-Time Palette-based Color and Luminance Editing

## 论文信息

| 属性 | 内容 |
|------|------|
| arXiv | [2609.03897](https://arxiv.org/abs/2609.03897) |
| 分类 | cs.GR |
| 日期 | 2026-09-03 |
| 会议 | SIGGRAPH Asia 2026 |
| DOI | 10.1145/3829340.3842202 |

## 核心问题

3DGS的球谐函数(SH) alpha-blending在原语空间方法中破坏每Gaussian稀疏性，导致编辑渗入非目标区域。

## 核心方法

1. **重参数化SH编码调色板权重** - 不从头训练表示
2. **视图空间公式** - 解决原语空间方法的核心限制
3. **迭代重加权最小二乘 + 阻尼块坐标下降** - 耦合色调曲线和调色板偏移

## 关键创新点

- 调色板着色
- 每调色板色调曲线用于颜色感知亮度调整
- 像素级颜色约束
- 视图空间稀疏性解决编辑渗入问题
- 可 baked 回标准3DGS

## 算法性能

- 数十毫秒级编辑速度
- 比原语空间方法更稀疏、更局部化的编辑

## 开源实现

- 待发布

## 相关笔记

[[Differentiable-Weights-Gaussian-Splat-Deformation]]

## 可行性分析

✅ **推荐实现**

- 参数化思想可用于UV/纹理映射研究
- 视图空间vs原语空间对比对几何处理有参考价值
