# Effects of Thermal Boundary Conditions on Natural Convection and Entropy Generation in Non-Newtonian Power-Law Fluids

> **arXiv**: [2605.13633](https://arxiv.org/abs/2605.13633) | **Date**: 2026-05-13 | **Author**: Lambert Theisen

## 核心创新点

- 研究热边界条件对 **非牛顿幂律流体** 自然对流和熵生成的影响
- 几何: 方形腔体 + 同心圆柱环形空间
- 使用 **Gridap.jl** 有限元框架求解（开源代码）
- 对比均匀加热 vs 非均匀（正弦）加热
- 关键发现:
  - **剪切变稀** 增强浮力驱动循环，加剧温度梯度，提升传热
  - **剪切变稠** 抑制对流，促进传导主导输运
  - 非均匀正弦加热 **降低总熵生成**
  - 熵分析: 剪切变稀流体中粘性耗散主导不可逆性

## 控制方程

- 不可压缩幂律模型 (Power-law model)
- Boussinesq 近似
- 稳态二维形式

## 数值方法

| 项目 | 详情 |
|------|------|
| 方法 | 有限元法 (FEM) |
| 框架 | Gridap.jl (开源 Julia) |
| 验证 | 牛顿/非牛顿对流基准解 |
| 几何 | 方形腔体、圆柱环形空间 |

## 关键结论

### 流体类型影响
| 流体类型 | 行为 |
|----------|------|
| 剪切变稀 (n<1) | 增强浮力循环，提高传热 |
| 牛顿 (n=1) | 基准行为 |
| 剪切变稠 (n>1) | 抑制对流，传导主导 |

### 边界条件影响
| 加热方式 | 效果 |
|----------|------|
| 均匀加热 | 更强且分布更广的对流结构 |
| 非均匀正弦加热 | 局部化热力，熵生成降低 |

### 熵生成主导项
- n<1 (剪切变稀): **粘性耗散** 主导
- n→1+: **热传导不可逆性** 主导

## 计算资源

- 开源代码公开可用
- 21 figures, 4 tables

## 关键词

`Non-Newtonian Fluid` `Power-Law Fluid` `Natural Convection` `Entropy Generation` `Finite Element Method` `Gridap.jl` `Thermal Boundary Conditions` `Heat Transfer`

## 相关链接

- PDF: https://arxiv.org/pdf/2605.13633
- HTML: https://arxiv.org/html/2605.13633v1

---

*Collected by 菜心 (Caixin) — 流体力学专家 | 2026-05-17*