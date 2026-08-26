---
title: "Maximum Entropy Encoding of Energy-Weighted Spherical Moments"
authors: Jiaze Sun
date: 2026-08-20
source: arXiv cs.GR
url: https://arxiv.org/abs/2608.20429
pdf: https://arxiv.org/pdf/2608.20429
tags: [rendering, paper, 2026, spherical-harmonics, irradiance, global-illumination, SH, radiance-caching]
status: unread
---

# Maximum Entropy Encoding of Energy-Weighted Spherical Moments

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Maximum Entropy Encoding of Energy-Weighted Spherical Moments |
| 作者 | Jiaze Sun |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2608.20429) |
| PDF | [下载](https://arxiv.org/pdf/2608.20429) |

## 核心贡献
1. **最大熵闭合**: 使用最大熵闭合处理非负蒙特卡洛路径样本组成的角能量信号
2. **能量加权方向特征**: 将样本写作 x = ru，使用总能量、方向一阶矩、无迹二阶矩作为 1+3+5 个可加统计量
3. **五参数 MaxEnt**: 在偶极子四参数子族基础上提出 coaxial 五参数子族
4. **无负辐照度**: 两种 MaxEnt 变体在所有场景中保持零负辐照度

## 技术方案

### 信号表示
将每个样本表示为能量加权方向特征：
```math
x = r u
```
其中 r 是能量，u 是方向。

### 矩统计量
- 总能量（1 个）
- 方向一阶矩（3 个）
- 无迹二阶矩（5 个）

共 1+3+5 = 9 个线性可加、旋转协变的统计量。

### 最大熵闭合
```math
p(r,u) \propto \exp(-\beta r g(u))
```
其中：
```math
g(u) = 1 - b \cdot u + u^T Q u
```

当 g_min > 0 时闭合可归一化，重建严格为正。

### 五参数子族（dipole-second-moment coaxial）
- 提供解析矩匹配、方差、逆采样、漫反射响应
- 提供可实现域、配分函数、方位角代数积分
- 提供 LUT 导向重建形式

## 实验结论
- **981 个 Poly Haven HDRI 2K 场景** + 3 个 Debevec 探针
- **五参数 MaxEnt 胜率**: 78.7%（单场景 vs 存储 QZH）
- **平均亮度 RMSE**: 降低 15.8%
- **优势场景**: 强方向性场景
- **零负辐照度**: 两种变体在所有场景均保持

### 方法排名（总体误差）
1. Full second-order SH-2（最低总体误差）
2. 五参数 MaxEnt（第二）
3. SH-2 在高方向性场景不如 MaxEnt

## 局限性
- Coaxial 子族在非 coaxial 多光源场景有系统性闭合误差

## 可行性分析
- 实现难度：中
- 性能预期：存储效率高，重建质量好
- 适用场景：全局光照、辐照度缓存、光场压缩、环境光照编码

## 相关工作
- [[球谐函数]]
- [[辐射缓存]]
- [[全局光照]]
- [[光照估计]]

## 笔记
本文是关于角能量信号（辐照度）压缩与重建的理论工作。使用最大熵方法处理球面矩，比传统球谐函数在方向性场景有更好表现。提供解析公式和 LUT 方案，对实时渲染中的光照编码有参考价值。
