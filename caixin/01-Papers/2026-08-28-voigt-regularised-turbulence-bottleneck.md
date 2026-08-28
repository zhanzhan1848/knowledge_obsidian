# Dynamical Slowdown, Bottlenecks, and Multiscaling in Voigt-Regularised Turbulence

## 基本信息
- **arXiv**: [2608.27355](https://arxiv.org/abs/2608.27355)
- **标题**: Dynamical slowdown, bottlenecks, and multiscaling in Voigt-regularised turbulence
- **作者**: Anikat Kankaria
- **日期**: 2026-08-27
- **分类**: physics.flu-dyn, cond-mat.stat-mech, nlin.CD
- **DOI**: https://doi.org/10.48550/arXiv.2608.27355
- **页数**: 16 pages, 8 figures

## 研究背景
研究湍流中瓶颈（bottleneck）形成的机制。Voigt正则化引入尺度相关的非线性相互作用减速而不增强耗散。

## 核心创新点
1. 使用**Voigt正则化SABRA模型**和**Voigt-Navier-Stokes（NSV）方程的DNS**
2. Voigt正则化提供了研究非线性输运与热化行为相互作用的自然框架
3. 发现三个不同的光谱区域

## 关键发现
### 三个光谱区域
1. **惯性区** ($k < k_I$): 经典湍流惯性范围
2. **中间平衡区** ($k_I < k < k_{II}$): 部分热化相关的平衡样范围
3. **高频热区** ($k > k_{II}$): Voigt贡献主导守恒不变量的区域

### 关键参数
- $k_{II} \sim 1/\alpha$: 过渡到高频区的交叉点
- $k_I$: 热化行为开始的标志

### 统计特性
- **间歇性的逐步抑制**和小尺度趋向高斯性
- 从湍流区域的**动态多标度（dynamic multiscaling）**转变到平衡区域的**简单标度（simple scaling）**
- 瓶颈形成可能与**尺度依赖的动态减速**和**初始热化**相关，而非纯粹耗散起源

### 重要结论
当正则化参数 $\alpha$ 远小于耗散长度尺度时，Voigt模型重现Navier-Stokes方程的相同惯性范围湍流和湍流统计量，证明Voigt模型是NS方程的优秀实用近似。

## 数值方法
- **壳模型（Shell Model）**: SABRA模型
- **直接数值模拟**: Voigt-Navier-Stokes（NSV）方程
- 两种方法相互验证

## 关联知识
- [[湍流瓶颈]]
- [[Voigt正则化]]
- [[SABRA模型]]
- [[NSV方程]]
- [[多标度行为]]
- [[间歇性]]

## 标签
#voigt-regularisation #turbulence-bottleneck #shell-model #DNS #multiscaling
