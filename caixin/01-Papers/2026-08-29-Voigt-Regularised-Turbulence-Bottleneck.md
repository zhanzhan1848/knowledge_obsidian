# Dynamical Slowdown, Bottlenecks, and Multiscaling in Voigt-Regularised Turbulence

- **arXiv**: [2608.27355](https://arxiv.org/abs/2608.27355)
- **Published**: 2026-08-27
- **Categories**: physics.flu-dyn, cond-mat.stat-mech, nlin.CD
- **Authors**: Anikat Kankaria, Bikram Pal, Edriss S. Titi, Samriddhi Sankar Ray
- **Pages**: 16 pages, 8 figures

## 研究问题

湍流中**瓶颈现象（bottleneck formation）**的物理机制：传统解释认为是耗散驱动，但 Voigt 正则化提供了一个新视角。

## 方法

1. **Voigt-regularised SABRA shell 模型**：Voigt 正则化引入尺度相关非线性减速
2. **Voigt-Navier-Stokes (NSV) DNS**：验证 shell 模型结果

### Voigt 正则化
在 Navier-Stokes 方程中添加尺度依赖阻尼：
$$ \frac{\partial \mathbf{u}}{\partial t} + (\mathbf{u} \cdot \nabla)\mathbf{u} = -\nabla p + \nu \nabla^2 \mathbf{u} - \alpha \nabla^2 \frac{\partial \mathbf{u}}{\partial t} $$

## 核心发现：三个不同谱区

| 区间 | 波数范围 | 物理机制 |
|------|----------|----------|
| 惯性区 | $k < k_I$ | 正常湍流级串 |
| 中间平衡区 | $k_I < k < k_{II}$ | 部分热化（partial thermalisation） |
| 高 $k$ 热化区 | $k > k_{II}$ | Voigt 项主导，接近热平衡 |

- $k_{II} \sim 1/\alpha$（$\alpha$ 为 Voigt 参数）
- $k_I$：热化行为起始点

### 间歇性与高斯性
- 小尺度：间歇性逐渐抑制 → **趋向高斯分布**
- 湍流区：动态多尺度 → 平衡区：简单尺度

## 瓶颈物理解释

**新观点**：瓶颈形成与**尺度依赖动力学减速**和**初始热化**相关，而非纯耗散效应。

## Voigt 模型 → Navier-Stokes 的有效性

当 $\alpha \ll$ 耗散尺度时：
- Voigt 模型重现 NS 方程的惯性区和湍流统计
- **Voigt 模型是 NS 方程的优质实际近似**

## 评估

✅ **推荐实现** — Voigt 正则化为湍流研究和计算提供新框架，shell 模型与 DNS 一致性好。

## 相关链接
- PDF: https://arxiv.org/pdf/2608.27355v1

---
*分类: #湍流 #Voigt正则化 #Shell模型 #DNS #瓶颈 #间歇性 #多尺度*
