---
tags: [渲染, 逆渲染, 3DGS, 全局光照, 全局光照, 辐射一致性, 2026]
date: [[2026-04-02]]
status: 待读
---

# RadioGS: Radiometrically Consistent Gaussian Surfels for Inverse Rendering

## 基本信息
| 项目 | 内容 |
|------|------|
| 作者 | Kyu Beom Han et al. |
| 发表 | ICLR 2026 Oral, arXiv:2603.01491 [cs.CV/cs.GR] |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2603.01491) |

## 核心贡献
1. 提出**辐射一致性**（Radiometric Consistency）——一种基于物理的约束，通过最小化未观测视角的残差来监督间接光照建模
2. 提出 RadioGS（Radiometrically Consistent Gaussian Surfels），利用 Gaussian surfels 和 2D Gaussian ray tracing 高效整合辐射一致性
3. 提出基于微调的重新照明策略，可在几分钟内适应新光照，渲染成本 <10ms

## 技术方案

### 问题：间接光照建模的监督缺失
现有方法从预训练的 Gaussian 基元查询间接辐射，但这些基元仅在有限训练视角监督，缺少对未观测视角的间接辐射监督。

### 核心思想：辐射一致性约束
```math
\mathcal{L}_{RC} = \| L_{primitive} - L_{physically\_rendered} \|
```
对每个 Gaussian 基元，将其学习到的辐射与物理渲染的对应值做比较，最小化残差，从而在未观测视角上建立自校正反馈循环。

### 2D Gaussian Ray Tracing
将 3D surfel 投影到 2D，用 2D Gaussian ray tracing 高效计算物理渲染结果。

### 重新照明策略
用微调方式将 Gaussian surfel 辐射适应到新光照，<10ms 渲染。

## 实验结论
- 在逆渲染基准上超越现有 Gaussian 方法
- 保持计算效率
- 训练收敛快

## 局限性
- 仅在 3DGS 框架下验证
- 对复杂材质泛化待验证

## 标签
#逆渲染 #全局光照 #3DGS #辐射一致性 #ICLR2026
