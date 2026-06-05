---
title: PureLight: Learning Complex Luminaires with Light Tracing
authors: Pedro Figueirêdo, Zixuan Li, Beibei Wang, Miloš Hašan, Nima Khademi Kalantari
date: 2026-06-03
source: arXiv cs.GR
url: https://arxiv.org/abs/2606.04319
pdf: https://arxiv.org/pdf/2606.04319
tags: [rendering, luminaire, light-tracing, path-tracing, neural-rendering, normalizing-flow, 2026]
status: unread
---

# PureLight: Learning Complex Luminaires with Light Tracing

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | PureLight: Learning Complex Luminaires with Light Tracing |
| 作者 | Pedro Figueirêdo, Zixuan Li, Beibei Wang, Miloš Hašan, Nima Khademi Kalantari |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2606.04319) |
| PDF | [下载](https://arxiv.org/pdf/2606.04319) |

## 核心贡献
1. **分布学习框架**：提出使用光追样本来学习复杂灯具外观的分布学习方法，解决了传统路径追踪难以处理的高难度灯具问题
2. **无偏训练数据生成**：使用 light tracing 从发光元件向外构建路径，即使在其他无偏蒙特卡洛估计器具有任意高方差的情况下也能算法化生成有效训练数据
3. **蒸馏推理方案**：将大学习到的外观蒸馏成轻量级 MLP，直接估计出射表面的辐亮度
4. **重要性采样网络**：训练采样网络用于从灯具进行有效的直接光照计算
5. **混合表示方案**：提供替代的低分辨率表示（16×16 map），在轻微偏差下显著降低方差

## 技术方案

### 问题背景
- 复杂灯具（小型发光体被多层透镜包裹）使用传统双向路径追踪难以有效采样高贡献光路
- 现有方法训练数据依赖 (bidirectional) path tracing，对于复杂材质和小发光体效果不佳

### 核心方法
1. **光追踪采样**：从发光元件向外追踪光子，构建到达出射表面的路径
2. **分布学习**：建模出射表面上辐亮度的概率密度函数 (pdf)
   - 使用大型 normalizing flow 网络估计 pdf
   - 通过 pdf × flux 恢复辐亮度
3. **蒸馏**：将大学习到的表示蒸馏成轻量级 MLP
4. **混合网络**：
   - 采样网络：条件重要性采样
   - 混合网络：将灯具合成到场景中

### 数学框架
```
Lo(x,ω) = Φ · p(x,ω)
```
其中 Lo 是出射辐亮度，Φ 是总光通量，p(x,ω) 是与辐亮度成比例的概率密度函数

### 优化目标
通过最小化 KL 散度来学习分布：
```math
D(p∥pθ) = ∫𝒮∫ℋ p(x,ω) log(p(x,ω)/pθ(x,ω)) dσ⊥(ω) dx
```

## 实验结论
- 使用仅 64 samples per pixel (spp) 即可获得比 1M spp 路径追踪更低的噪声
- 在任意场景中使用低样本数渲染复杂灯具变得可行
- 提出的 "Ours Fast" 版本更快且噪声更低

## 局限性
- 假设不考虑体积效应（吸收和散射）
- 轻微偏差换取更低方差的权衡

## 可行性分析
- 实现难度：中（需要实现 normalizing flow、MLP 蒸馏）
- 性能预期：高质量渲染 + 低样本数
- 适用场景：复杂灯具渲染、室内渲染、产品可视化

## 相关工作
- PureSample (Li et al., 2026) - 通过前向路径追踪构建神经材质
- Zhu et al., 2021 - 学习球面代理上的光场
- Condor and Jarabo, 2022 - 使用 NeRF 编码灯具

## 笔记
**重要性采样技术**：使用 spherical cap 参数化来最小化采样浪费

**潜在应用**：
- 专业照明设计可视化
- 汽车内饰渲染
- 博物馆照明模拟
