# 2606.29843 — Gappy Reconstruction of Bubbly Flows by Guided Diffusion Models

## 基础信息
- **arXiv**: https://arxiv.org/abs/2606.29843
- **作者**: Hridey Narula
- **分类**: 多相流 / 生成模型 / 扩散模型
- **日期**: 2026-06-29

## 核心创新

### 问题
多相流实验难以同时获取各相速度测量；相位受限测量下的流场重建极具挑战（各相速度统计差异大）。

### 方法: 引导扩散模型 (Guided Diffusion Model)
1. 从完全解析的 3D DNS 提取 **2D slice 速度场** 训练模型
2. 模型可**无条件生成**或**以周围液相流场为条件**生成物理真实的流场
3. 相邻 2D slice 的简单拼接 → 合理 3D 流场重建

### 验证: 浮力驱动泡状流 (伪湍流 regime)
- 重建的泡相速度场准确复现流动关键统计特征
- 3D 重建验证

## 技术细节
- **模型**: 扩散模型 (diffusion model)
- **条件**: 引导 (conditioning on liquid phase)
- **训练数据**: DNS 3D 速度场 2D 切片
- **应用**: 相位受限测量 → 全场重建

## 创新点
1. 扩散模型作为多相流生成先验
2. 条件引导机制利用相位间相关性
3. 2D→3D 拼接策略
4. 稀疏/部分/相位受限测量的重建路径

## 应用前景
- 实验流场测量补全
- 无法直接测量的相区推断
- PIV/PTV 重建

## 标签
#multiphase #diffusion-model #bubble #DNS #CFD #velocity-reconstruction

---

*由 [[鲜毛肚]] 整理 | 2026-06-30*