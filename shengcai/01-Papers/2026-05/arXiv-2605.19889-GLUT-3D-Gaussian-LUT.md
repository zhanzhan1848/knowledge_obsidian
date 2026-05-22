---
tags: [渲染, 颜色变换, 3D Gaussian, LUT, 神经表示, 2026]
date: 2026-05-22
status: 待读
---

# 3D Gaussian Lookup Table for Continuous Color Transformation

## 基本信息

| 标题 | 值 |
|------|-----|
| 作者 | Danna Xue et al. |
| 发表 | cs.GR (2026-05-19) |
| 链接 | [arXiv:2605.19889](https://arxiv.org/abs/2605.19889) |
| 项目页 | [GLUT Project](https://color.cvc.uab.cat/glut/) |

## 核心贡献

1. **Gaussian LUT (GLUT)**: 使用可学习 3D Gaussian 基元建模连续颜色变换
2. **无网格分辨率限制**: 避免固定分辨率网格的容量-内存权衡
3. **显式且可解释**: 空间局部化公式，便于直观编辑
4. **条件生成器 (CGLUT)**: 预测多 LUT 实例参数，支持平滑风格混合

## 技术方案

### 传统 3D LUT 问题
```
离散网格 → 高分辨率 = 大内存
         → 低分辨率 = 质量损失
```

### GLUT 解决方案
- 使用 3D Gaussian 基元代替网格
- 灵活的表示能力
- 紧凑的内存占用

### 核心思想

```math
\text{GLUT}(x) = \sum_{i=1}^{N} w_i \cdot G(x; \mu_i, \Sigma_i)
```

其中:
- $w_i$: 第 i 个 Gaussian 的权重
- $\mu_i$: 均值（中心位置）
- $\Sigma_i$: 协方差矩阵（形状）
- $G$: 3D Gaussian 函数

### CGLUT 条件生成器

```math
\text{CGLUT}(\text{style}) \rightarrow \{w_i, \mu_i, \Sigma_i\}_{i=1}^{N}
```

支持:
- 多 LUT 风格编码
- 平滑风格混合
- 局部区域调整（无需全局重训练）

## 实现细节

### Gaussian 基元
- 每个基元由位置、形状、权重定义
- 通过优化学习基元参数
- 支持高效查询和编辑

### 优势对比

| 特性 | 传统 3D LUT | 隐式神经表示 | GLUT |
|------|-------------|--------------|------|
| 连续性 | 离散 | 连续 | 连续 |
| 可解释性 | 高 | 低 | 高 |
| 编辑性 | 困难 | 困难 | 容易 |
| 内存效率 | 中 | 高 | 高 |
| 精度 | 受限于网格 | 高 | 高 |

## 应用场景

- 图像颜色映射
- 风格转换
- 颜色编辑
- LUT 混合

## 局限性

- 需要训练
- 基元数量影响效果

## 标签

#颜色变换 #3D-LUT #Gaussian #神经表示 #图像处理 #渲染