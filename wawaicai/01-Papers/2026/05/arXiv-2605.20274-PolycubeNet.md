---
title: "A Dual-latent Diffusion Model for Polycube-Based Hexahedral Mesh Generation"
authors: ["T. Kuai et al."]
date: 2026-05-21
venue: arXiv cs.GR
tags: [几何, 网格生成, 六面体网格, Diffusion Model]
---

# A Dual-latent Diffusion Model for Polycube-Based Hexahedral Mesh Generation

## 核心方法

提出了 **PolycubeNet**，一个基于条件扩散模型的端到端多立方体生成框架。

### 技术要点

1. **输入**: 点云表示的几何形状
2. **输出**: 对应的多立方体点云（无需显式表面分割或预定义多立方体模板）
3. **核心架构**: 双隐变量条件扩散架构
   - 将计算密集的自注意力操作限制在固定容量、低维隐空间中
   - 解耦了输入几何分辨率与输出多立方体分辨率的计算复杂度

### Pipeline

1. 条件扩散模型从点云直接生成多立方体点云
2. 通过刚性和非刚性点云配准对齐生成的多立方体与输入形状
3. 多立方体到六面体网格的转换 pipeline

## 创新点

- 避免了点云自注意力的二次复杂度
- 支持灵活的输入和输出分辨率
- 发布配对的 CAD 网格与其多立方体网格数据集

## 算法复杂度

- 时间: 生成过程秒级完成
- 空间: 隐空间操作降低内存开销

## 实现难度

- 算法复杂度: **中**
- 依赖: PyTorch, 点云处理库
- 数值稳定性: 扩散模型训练需调参

## 推荐结论

✅ **推荐实现** - 六面体网格生成在 CAD 和仿真中有重要应用

## 开源参考

- GitHub: https://github.com/xinzhang007/TelePhysics (对应项目)
- 核心算法基于点云扩散模型

## 相关技术

- libigl: 网格处理相关函数
- CGAL: 网格生成模块
- 关联笔记: [[Hexahedral Meshing]], [[Polycube Mapping]]