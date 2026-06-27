# pyDOF: Python Library for Discrete Filter Design in CFD

## 论文信息
- **arXiv**: [2606.26830](https://arxiv.org/abs/2606.26830)
- **作者**: Z. Nikolaou, P. Domingo, L. Vervisch, D. Drikakis
- **提交日期**: 2025年6月25日
- **分类**: Computational Physics, Mathematical Software, Fluid Dynamics

## 核心贡献
pyDOF 是一个 Python 库，用于设计对称、物理空间的前向和逆离散滤波器。

### 主要特性
1. **约束优化框架**: 基于用户定义的约束条件（如单调性、正性、值固定、梯度平滑等）自动计算滤波器系数
2. **自适应滤波器模板选择**: 提供自适应滤波器模板选择选项
3. **van Cittert 逆滤波器设计**: 支持用户控制重建阶数的 van Cittert 逆滤波器设计
4. **通用滤波器设计**: 可设计低通、高通、多带通/带阻等多种离散滤波器

### 应用场景
- 计算流体动力学 (CFD) 模拟
- 大涡模拟 (LES) 中的离散滤波器设计
- 燃烧模型中的滤波操作
- 通用信号处理应用

## 技术细节

### 滤波器类型
- 对称物理空间滤波器
- 前向和逆滤波器
- 低通/高通/多带通/带阻滤波器

### 设计方法
- 约束优化框架
- van Cittert 迭代方法
- 自动系数计算并保存为纯文本文件

## 代码可用性
- 开源 Python 库
- 滤波器系数可被任何编程语言解析

## 关键词
#CFD #LES #filter-design #Python #discrete-filter #turbulence-modeling

---
*📅 2026-06-27 每日论文搜索收录*