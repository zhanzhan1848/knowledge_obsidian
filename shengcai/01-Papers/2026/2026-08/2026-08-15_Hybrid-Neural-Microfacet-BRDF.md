---
tags: [渲染, PBR, BRDF, 神经渲染, EGSR2026]
date: 2026-08-15
status: 待读
---

# A Hybrid Neural-Microfacet BRDF Model for Real-Time Rendering

## 元信息

| 属性 | 值 |
|------|-----|
| arXiv | [2608.09604](https://arxiv.org/abs/2608.09604) |
| PDF | [/pdf/2608.09604](https://arxiv.org/pdf/2608.09604) |
| 项目页 | [hybridrdf](https://ubisoft-laforge.github.io/world/hybridrdf) |
| 作者 | Louis De Oliveira et al. (Ubisoft La Forge) |
| 发表 | Eurographics Symposium on Rendering (EGSR) 2026 |
| DOI | [10.1111/cgf.70540](https://doi.org/10.1111/cgf.70540) |

## 核心贡献

1. **混合神经-微表面模型**: 将 GGX 微表面模型与轻量神经网络结合
2. **神经校正机制**: 用小规模神经组件校正微表面近似的视觉效果误差
3. **内存效率**: 在相同内存开销下，精度优于 SOTA 神经 BRDF 模型
4. **双重兼容性**: 保持艺术家可编辑性 + 支持重要性采样
5. **通用性**: 适用于离线路径追踪和实时渲染管线

## 问题背景

微表面 BRDF 模型是实时渲染的支柱，但存在以下局限：
- 难以复现复杂光-表面相互作用的细微外观效果
- 专用物理模型（衍射、彩虹色、多层材质）失去通用性且性能不足
- 神经模型精度高但网络大，实时渲染开销过高

## 技术方案

### 模型架构

```
BRDF = f_microfacet(θ) + f_neural(θ; W)
```

其中神经成分在微表面基础之上进行校正（residual learning 思路）。

### 关键设计

- **GGX 型微表面基础层**: 标准 Cook-Torrance 框架
- **神经校正网络**: 小型全连接网络，输入为 (θ_h, θ_d, roughness, F0) 等 BRDF 参数
- **重要性采样**: 继承微表面采样的重要性采样策略
- **Artist Editability**: 神经校正可分离，基础参数仍可直接编辑

### 采样公式

```math
p(\omega_i) = \frac{G1(\omega_o, \omega_m) |N \cdot \omega_m|}{4 |N \cdot \omega_o|}
```

其中 $G1$ 为 Smith 遮蔽函数，$\omega_m$ 为半程向量。

## 实验结果

| 指标 | 本方法 | SOTA 神经模型 |
|------|--------|---------------|
| 测量逼近精度 | 更高 | 基线 |
| 内存开销 | 相同 | 相同 |
| 评估开销 | 略高 | 高 |
| 重要性采样 | ✅ | ✅ |

## 局限性

- 校正网络仍需训练数据（测量/模拟/复杂着色网络输出）
- 对于极端光学现象（强衍射等）可能仍需专用模型

## 实用性评估

- **创新性**: ⭐⭐⭐⭐⭐
- **实用性**: ⭐⭐⭐⭐⭐ (实时渲染友好)
- **难度**: 中（需深度学习框架）

## 行动建议

> 已传递给 @墨鱼丸 进行算法评估。

---

## 相关笔记

- [[2026-08-15-daily-search-report]]
- #PBR #神经渲染 #实时渲染 #重要性采样
