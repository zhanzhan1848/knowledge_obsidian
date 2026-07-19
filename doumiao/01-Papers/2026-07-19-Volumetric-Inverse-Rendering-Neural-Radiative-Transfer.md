# Volumetric Inverse Rendering via Neural Radiative Transfer
**日期**: 2026-07-19
**arXiv**: [2607.13695](https://arxiv.org/abs/2607.13695)
**领域**: 体积渲染 / 参与介质

## 基本信息
- **作者**: Ntumba Elie Nsampi et al.
- **发表**: 2026-07-15
- **来源**: arXiv cs.GR
- **DOI**: 10.1111/cgf.70541

## 摘要
Volumetric inverse rendering seeks to recover the optical properties of participating media from images. Existing approaches either rely on differentiable stochastic light transport simulation, which require substantial algorithmic effort, or use simplified models that fail to capture global illumination.

本文提出一种将物理完整光传输与通用神经优化结合的方法。介质的光学特性和完整光场被表示为神经场，通过联合优化过程估计。全局光照通过从辐射传输方程局部微分形式推导的残差目标强制执行，并沿主视线补充体积渲染项以减轻低频偏差。

## 核心技术

### 1. 神经场表示
- 光学特性（散射、吸收、相函数）用神经场表示
- 完整光场也用神经场编码
- 支持空间变化的颜色解析参数

### 2. 物理约束
- 辐射传输方程 (Radiative Transfer Equation, RTE) 作为硬约束
- 残差目标确保全局光照效果
- 体积渲染项沿初级视线补充

### 3. 优化框架
- 联合优化光学特性和光场
- 从多视角图像重建参数
- 支持学习参与介质的生成模型

## 渲染类型
**体积渲染 (Volume Rendering)** - 参与介质重建

## 创新点
1. 首次将物理完整的 RTE 与神经优化结合
2. 支持空间变化的颜色解析光学参数
3. 可学习具有物理光学特性的参与介质生成模型

## 视觉质量预期
- **逼真度**: ⭐⭐⭐⭐⭐ (基于物理的全局光照)
- **风格化支持**: 是

## 性能预期
- 优化过程计算密集
- 适合离线渲染/重建任务

## 实现建议
- **着色器复杂度**: 高
- **管线要求**: 可微渲染管线
- **推荐度**: ✅ 强烈推荐

## 相关工作
- 可微随机光传输模拟
- 简化参与介质模型
- 神经渲染方法

## 链接
- arXiv: https://arxiv.org/abs/2607.13695
- PDF: https://arxiv.org/pdf/2607.13695

---
*由豆苗自动整理 | [[doumiao]] | [[体积渲染]] | [[神经渲染]] | [[参与介质]]*
