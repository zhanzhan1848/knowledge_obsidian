---
tags: [网格, 四边形网格, 参数化, 生成式模型, SIGGRAPH]
date: 2026-05-01
source: arXiv cs.GR (2604.27329)
review_status: 初筛
---

# SQuadGen: Generating Simple Quad Layouts via Chart Distance Fields

## 核心方法

SQuadGen 是一个基于扩散模型的四边形网格布局生成框架，使用 **Chart Distance Fields (CDF)** 作为连续表面表示来合成简单四边形布局。

**核心创新点：**
1. **CDF (Chart Distance Fields)**：将离散的网格连通性问题转化为连续表面表示，使扩散模型能有效学习和合成四边形布局
2. **Loop-aware simplicity metrics**：定义了一套基于 loop 的简单性度量指标
3. **Robust quad-recovery pipeline**：从公开 3D 资源库中恢复高质量四边形布局，构建大规模数据集

**技术框架：**
- 输入：任意 3D mesh（扫描、重建或 AI 生成）
- 输出：简洁的四边形布局（quad layout），便于后续编辑和建模
- 方法：扩散模型学习 CDF 表示，然后转换为四边形网格

## 算法复杂度
- 时间复杂度：O(n) 其中 n 为网格面数
- 空间复杂度：O(n) 用于存储 CDF 和网络参数

## 实现难度
- 算法复杂度：中
- 数值稳定性：✅ CDF 作为连续表示，数值稳定
- 依赖项：PyTorch, 扩散模型训练框架
- 数据需求：需要大规模四边形布局数据集（论文已构建）

## 推荐结论
✅ **推荐实现**

四边形网格布局是几何处理的核心问题。SQuadGen 通过 CDF 连续表示解决了离散网格连通性的学习难题，具有很强的实用价值。Microsoft Research Asia 出品，品质有保证。

## 开源参考
- 论文：arXiv:2604.27329
- 主页：待补充

## 相关技术
[[Quad Remeshing]] [[Mesh Parameterization]] [[Chart Decomposition]]