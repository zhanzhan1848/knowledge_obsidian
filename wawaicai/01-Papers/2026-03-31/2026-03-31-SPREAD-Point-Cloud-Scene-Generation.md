---
title: "SPREAD: Spatial-Physical REasoning via geometry Aware Diffusion"
arXiv: 2603.27573
date: 2026-03-31
tags: [几何, 点云, 场景生成, 神经隐式, 物理推理]
authors: ["Minzhang Li", "Kuixiang Shao", "Xuebing Li", "Yuyang Jiao", "Yinuo Bai", "Hengan Zhou", "Sixian Shen", "Jiayuan Gu", "Jingyi Yu"]
affiliation: ["ShanghaiTech University"]
venue: arXiv cs.GR
---

# SPREAD: Spatial-Physical REasoning via geometry Aware Diffusion

## 核心方法

基于扩散模型的 3D 场景生成框架，通过图 transformer 联合学习空间和物理关系，明确以带姿态的点云为条件实现几何感知。

### 核心创新

1. **几何感知扩散** - 通过图 transformer 联合建模空间关系和物理约束
2. **可微分物理引导** - 集成碰撞避免、关系约束、重力的可微分引导，确保物理合理
3. **点云条件** - 使用posed scene point clouds作为几何条件输入
4. **生成仿真就绪环境** - 可直接用于 Embodied AI 的物理仿真

### 技术路线

- **输入**: 带姿态的点云 + 空间/物理关系图先验 G
- **骨干**: 扩散模型 + 图 transformer
- **引导**: 可微分物理损失（碰撞、关系、重力）
- **数据集**: 3D-FRONT, ProcTHOR

## 几何相关性

- **点云处理**: 核心输入表示
- **几何感知**: 通过点云编码器提取全局形状语义
- **物理仿真**: 场景生成后进行物理仿真验证

## 算法复杂度

- **时间**: 扩散模型迭代去噪 + 图 transformer O(n²) 自注意力
- **空间**: 点云编码 + 图特征存储
- **训练数据**: 需要大量 3D 场景数据

## 实现难度

- **算法复杂度**: 高
- **数值稳定性**: 良好 - 可微分引导提供梯度信号
- **依赖项**: 扩散模型框架, 图神经网络, 物理仿真器

## 推荐结论

✅ **推荐关注**

SPREAD 展示了几何感知在物理场景生成中的价值，其点云条件机制和可微分物理引导对点云处理工具链有参考意义。

## 开源参考

- GitHub: https://github.com/L-avenir/SPREAD

## 相关笔记

[[2026-03-17-TreeON-3D-Tree-Point-Cloud-Reconstruction]]
