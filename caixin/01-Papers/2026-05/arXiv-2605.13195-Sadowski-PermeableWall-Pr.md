# Influence of Prandtl Number on Heat Transfer over a Permeable Wall

- **arXiv**: [2605.13195](https://arxiv.org/abs/2605.13195)
- **Authors**: Wojciech Sadowski
- **Date**: 2026-05-13
- **Subjects**: physics.flu-dyn
- **URL**: https://arxiv.org/pdf/2605.13195

## 研究背景

- 完全湍流流动（含传热）
- 通道半填充立方体阵列（基于 Breugem & Boersma 2005, Chandesris et al. 2013）
- Re_bulk = 5485
- Pr 数: 0.71, 0.1, 0.05

## 研究内容

1. **被动标量温度建模**
2. **两种边界条件配置**
3. **多孔-流体界面分析**

## 温度预算分析

分析了以下项的分布和相对重要性：
- 湍流热传递
- 分子扩散
- 曲折度（tortuosity）
- Brinkman 项

## 关键发现

1. **高 Pr 数**: 曲折度和 Brinkman 项可忽略
2. **低 Pr 数**: 上尺度化过程中通常忽略的项（与过滤变量的 Taylor 展开相关）首次被发现显著
3. **滤波核影响**: 使用三种不同核（cellular average, linear/tent, quadratic, cubic）评估上尺度场

## 滤波核

| 核类型 | 描述 |
|--------|------|
| Cellular average | 细胞平均 |
| Tent (linear) | 帐篷核（线性） |
| Quadratic | 二次 |
| Cubic | 三次 |

## 标签

#多孔介质 #湍流热传递 #Prandtl数 #低Pr #上尺度化 #滤波