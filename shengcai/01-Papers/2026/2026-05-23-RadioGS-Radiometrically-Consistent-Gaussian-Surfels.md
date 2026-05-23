---
title: RadioGS: Radiometrically Consistent Gaussian Surfels for Inverse Rendering
authors: Kyu Beom Han, Jaeyoon Kim, Woo Jae Kim, Jinhwan Seo, Sung-Eui Yoon
date: 2026-03
source: arXiv
url: https://arxiv.org/abs/2603.01491
pdf: https://arxiv.org/pdf/2603.01491.pdf
tags: [rendering, inverse-rendering, Gaussian-splatting, global-illumination, 2026]
status: unread
---

# RadioGS: Radiometrically Consistent Gaussian Surfels for Inverse Rendering

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | RadioGS: Radiometrically Consistent Gaussian Surfels for Inverse Rendering |
| 作者 | Kyu Beom Han, Jaeyoon Kim, Woo Jae Kim, Jinhwan Seo, Sung-Eui Yoon |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2603.01491) |
| PDF | [下载](https://arxiv.org/pdf/2603.01491.pdf) |

## 核心贡献
1. **Radiometric Consistency Loss**: 物理约束，通过最小化未观测方向的残差提供监督，自纠正 Gaussian 原语辐射率
2. **RadioGS 框架**: 基于 Gaussian Surfels 和 2D Gaussian Ray Tracing 的高效逆渲染框架
3. **快速微调重光照策略**:几分钟内适应新光照条件，渲染时间 <10ms

## 技术方案

### 问题背景
- Gaussian Splatting 逆渲染中，从复杂全局光照（尤其是间接光照）解耦材质属性仍是重大挑战
- 现有方法从预训练 Gaussian 原语查询间接辐射，但监督不足于建模未观测视角的间接辐射

### Radiometric Consistency Loss
```math
\mathcal{L}_{RC} = \|L_{learned} - L_{PBR}\|^2
```
- 最小化 Gaussian 原语学习辐射率与物理渲染辐射率的残差
- 在未观测方向上建立自纠正反馈循环

### RadioGS 框架
- Gaussian Surfels: 使用各向异性 surfel 表示
- 2D Gaussian Ray Tracing: 高效光线追踪
- 结合 NVS 训练约束和物理渲染原则

## 实验结论
- 在逆渲染基准测试中优于现有 Gaussian 方法
- 准确建模 inter-reflection (如红色灯泡与黄色 Lego 表面间的反射)
- 鲁棒的场景属性分解
- 新光照条件下逼真的间接光照

## 局限性
- 计算复杂度较高
- 需要多视角训练数据

## 可行性分析
- 实现难度：高 (涉及物理渲染和逆渲染)
- 性能预期：渲染 <10ms，训练时间分钟级
- 适用场景：逆渲染，重光照，材质分解

## 相关工作
- [[3D Gaussian Splatting]]
- [[Inverse Rendering]]
- [[Neural Radiance Caching]]

## 笔记
**来源机构**: KAIST (Korea Advanced Institute of Science and Technology)
**项目页面**: https://qbhan.github.io/radiogs-page/
**应用领域**: 逆渲染，材质分解，重光照，全局光照