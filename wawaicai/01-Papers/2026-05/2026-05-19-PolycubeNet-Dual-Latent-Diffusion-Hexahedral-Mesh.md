---
title: "A Dual-latent Diffusion Model for Polycube-Based Hexahedral Mesh Generation"
citation: "arXiv:2605.20274"
date: 2026-05-19
tags: [网格生成, 六面体网格, Polycube, 扩散模型, SIGGRAPH]
---

# PolycubeNet: 多面体网格生成的端到端扩散框架

## 核心方法

给定输入点云，直接生成对应的 polycube 点云，无需显式表面分割或预定义模板。

**架构核心：双潜在条件扩散架构**
- 将计算密集的自注意力操作限制在固定容量、低维潜在空间
- 有效解耦了输入几何和输出 polycube 分辨率的计算复杂度
- 避免了点云自注意力的二次复杂度开销
- 支持灵活的输入和输出分辨率

## 技术流程

1. **输入**: 点云表示的几何
2. **生成**: 条件扩散模型直接输出 polycube 点云
3. **对齐**: 刚性和非刚性点云注册将 polycube 与输入形状对齐，建立表面对应
4. **网格化**: polycube-to-hex pipeline 生成六面体网格

## 关键创新点

- 端到端 polycube 生成，无需手动分割
- 双潜在空间设计解决点云自注意力的高计算成本
- 支持任意亏格复杂 CAD 模型的泛化
- 几秒内生成高质量 polycube 结构

## 实验结果

- 优于先前基于学习的方法的鲁棒性和效率
- 支持复杂 CAD 模型的任意亏格

## 开源资源

- 配对的 CAD 网格与 polycube 网格数据集
- 核心模型实现

## 标签

#网格生成 #六面体网格 #扩散模型 #几何处理