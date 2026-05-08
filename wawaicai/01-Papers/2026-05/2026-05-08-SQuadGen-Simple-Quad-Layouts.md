---
title: "SQuadGen: Generating Simple Quad Layouts via Chart Distance Fields"
authors: ["Yang Liu", "Yue Dong", "Xin Tong", "Heung-Yeung Shum"]
institution: "Microsoft Research Asia, Tsinghua University"
date: 2026-04-30
conference: "SIGGRAPH 2026 (Journal Track)"
arXiv: "2604.27329"
tags: [重网格化, 四边形网格, 生成模型, 扩散模型]
---

# 核心方法

## 问题定义
将3D形状（三角形网格/NeRF/3DGS输出）转换为简单四边形布局，支持标准loop建模操作。

## 创新点

### 1. Chart Distance Fields (CDF)
- **连续表示**：将离散的四边形布局结构转换为连续标量场
- **Dual CDF (DCDF)**：编码四边形布局的拓扑结构
- 将四边形布局生成问题转化为连续场合成问题

### 2. Loop Simplicity Metrics
- **Self-intersection (SI)**：循环中重复面/边的数量
- **Rotation Index**：螺旋度度量
- **Simple Loop定义**：SI=0 且 Ind≤1

### 3. 数据集构建
- 从Objaverse等公开3D仓库提取四边形布局
- 超过230k简单四边形布局
- Loop感知的质量度量

## 算法流程
1. 输入3D形状 → 提取几何特征
2. Geometry-conditioned Latent Diffusion 生成CDF
3. 从CDF提取简单四边形布局

## 复杂度分析
- 时间：端到端扩散模型推理
- 空间：大型四边形布局数据集

## 开源参考
- Project: https://youkang-kong.github.io/squadgen/
- Microsoft Research

## 可行性评估
✅ **推荐实现**

理由：
- SIGGRAPH 2026接收，质量有保证
- CDF表示可直接用于重网格化流程
- 开源代码将发布

建议：
- 可集成到重网格化工具链
- Loop simplicity metrics可用于评估现有方法

---
**提炼**: 黄喉 (2026-05-08)
