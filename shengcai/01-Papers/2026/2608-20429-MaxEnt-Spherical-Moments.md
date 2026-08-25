---
title: "Maximum Entropy Encoding of Energy-Weighted Spherical Moments"
authors: []
date: 2026-08-20
status: 待读
tags: [渲染, 全局光照, 球谐函数, 辐照度]
keywords: [global illumination, irradiance, spherical harmonics, Monte Carlo, moment encoding]
links:
  arXiv: https://arxiv.org/abs/2608.20429
  PDF: https://arxiv.org/pdf/2608.20429
reviewDate: 2026-08-25
---

# Maximum Entropy Encoding of Energy-Weighted Spherical Moments

## 元信息
| 项目 | 内容 |
|------|------|
| 作者 | (待补充) |
| 发表 | arXiv cs.GR, 2026-08-20 |
| 链接 | [arXiv](https://arxiv.org/abs/2608.20429) |

## 核心贡献

1. **最大熵闭包**：将非负蒙特卡洛路径样本的角能量信号压缩和重建为有限矩表示
2. **能量加权方向特征**：将每个样本表示为 $x = ru$，采用总能量、第一方向矩和无迹二阶矩作为 $1+3+5$ 个线性可加的旋转协变统计量
3. **解析推导**：提供解析矩匹配、方差、逆采样和纯偶极子四参数子族的漫反射响应

## 技术方案

在固定 Lebesgue 参考测度下，最大熵闭包给出：

```math
p(r,u) \propto \exp(-\beta r g(u)), \quad g(u) = 1 - b \cdot u + u^T Q u
```

其中方向概率和角能量密度分别与 $g^{-3}$ 和 $g^{-4}$ 成正比。当 $g_{\min} > 0$ 时闭包可归一化，重建严格为正。

### 关键公式

- **总能量 + 第一方向矩 + 无迹二阶矩** = $1+3+5$ 个线性可加统计量
- **纯偶极子四参数子族**：提供解析矩匹配、方差、逆采样和漫反射响应
- **同轴五参数子族**：包含可实现域、配分函数、方位角代数积分和 LUT 导向重建形式

## 实验结论

- 981 个 Poly Haven HDRI 2K 场景 + 3 个 Debevec 探针
- 五参数 MaxEnt 在 78.7% 的场景中优于存储 QZH
- 平均亮度 RMSE 降低 15.8%
- 在高方向性场景中优势更明显
- 两个 MaxEnt 变体在所有场景中均保持零负辐照度

## 实用性评估

- **创新性**：⭐⭐⭐⭐⭐ 新矩编码方法
- **实用性**：⭐⭐⭐⭐⭐ 提升辐照度压缩质量
- **实现难度**：中（需要理解最大熵原理和球谐变换）

## 相关工作

- Spherical Harmonics (SH) 编码
- Quadratic Zonal Harmonics (QZH)
- Monte Carlo Path Tracing 重要性采样

## 备注

- 五参数 MaxEnt 在高方向性场景中优于 SH-2
- 同轴子族在非同轴多光源场景中显示系统性闭包误差
- Full second-order SH-2 总体误差最低
