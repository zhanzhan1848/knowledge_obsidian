---
title: Maximum Entropy Encoding of Energy-Weighted Spherical Moments
authors: Jiaze Sun et al.
date: 2026-08-20
source: arXiv cs.GR
url: https://arxiv.org/abs/2608.20429
pdf: https://arxiv.org/pdf/2608.20429
tags: [rendering, spherical-harmonics, irradiance, global-illumination, real-time-rendering, 2026]
status: unread
---

# Maximum Entropy Encoding of Energy-Weighted Spherical Moments

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Maximum Entropy Encoding of Energy-Weighted Spherical Moments |
| 作者 | Jiaze Sun et al. |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2608.20429) |
| PDF | [下载](https://arxiv.org/pdf/2608.20429) |

## 核心贡献
1. 提出 9 个标量编码，完全等效于 l≤2 的角能量矩，比现有方法（如 ZH3）自由度更低
2. 从 1+3+5 个独立矩约束推导出 MaxEnt 闭包，方向概率 ∝ g⁻³，能量密度 ∝ g⁻⁴
3. 为纯偶极子子族提供图形学导向的解析矩匹配和余弦响应，以及双色散-二阶矩共轴五参数子族的矩空间投影和 LUT 重建形式
4. 在 981 场景的 HDRI 基准上，五参数 MaxEnt 相比 QZH 达到 78.7% 的胜率，亮度 RMSE 降低 15.8%，且无负辐照度

## 技术方案
将每个非负加权蒙特卡洛路径采样表示为能量-加权方向特征 **x** = r**u**。采用总能量、一阶方向矩和无迹二阶矩作为 1+3+5 个线性可加、旋转协变的统计量。在固定 Lebesgue 参考测度下，最大熵闭包给出：

```math
p(r,\mathbf{u}) \propto \exp(-\beta r g(\mathbf{u})), \quad g(\mathbf{u}) = 1 - \mathbf{b} \cdot \mathbf{u} + \mathbf{u}^T \mathbf{Q} \mathbf{u}
```

方向概率 ∝ g⁻³，角能量密度 ∝ g⁻⁴。当 g_min > 0 时闭包可归一化，重建严格为正。

纯偶极子四参数子族（ℓ(**u**) ∝ (1−**b**·**u**)⁻⁴）与 Levermore M1 角分布相同，作者贡献是图形学导向的矩编码解释和运行时公式。

## 实验结论
- 981 Poly Haven HDRI 2K 场景 + 3 个 Debevec 探针
- 五参数 MaxEnt 相比 QZH 达到 **78.7% 每场景胜率**，亮度 RMSE 降低 **15.8%**
- 高方向性场景（ρ≥0.6）中 91.3% 胜率
- 两种 MaxEnt 变体在所有场景上保持**零负辐照度**，而 SH 和 QZH 在 52–579 个场景上出现负值
- 全二阶 SH-2（9 DOF）总体误差最低，五参数 MaxEnt 排名第二

## 局限性
- 共轴子族在非共轴多光源场景上存在系统性闭包误差
- 五参数模型不适合高度复杂的非共轴传输场景
- 需要 g_min > 0 的正则化条件

## 可行性分析
- 实现难度：中（数学推导较复杂，但公式已给出闭式解）
- 性能预期：编码/解码均为解析形式，无迭代，运行时效率高
- 适用场景：实时全局光照、辐照度探针、环境光照压缩、路径引导

## 相关工作
- Levermore M1 closure
- Ramamoorthi & Hanrahan irradiance SH analysis
- ZH3 (Roughton et al.)
- Spherical Gaussians
- Spherical Harmonic Exponentials (HPG 2025)

## 笔记
核心创新在于用最大熵原理为非负蒙特卡洛采样设计了一个严格正的辐照度重建闭包。9个自由度的编码已经是最优下界。相比 SH/QZH 的关键优势是完全消除负辐照度，这对实时渲染非常重要。
