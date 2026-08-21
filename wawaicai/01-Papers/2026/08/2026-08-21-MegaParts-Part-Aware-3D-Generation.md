---
title: "Scaling Part-Aware 3D Object Generation to 300 Parts via Token-Efficient Autoregressive Modeling"
authors: [Manwen Liao et al.]
date: 2026-08-10
tags: [几何, 3D生成, 部件感知, 分块建模, 自回归]
arxiv: "2608.14783"
doi: "10.48550/arXiv.2608.14783"
subjects: [cs.CV, cs.GR]
---

# MegaParts: 大规模部件感知 3D 物体生成

## 核心方法

提出 **MegaParts**，可扩展的自回归 3D 生成框架，通过**token 高效的向量量化形状分词器**处理最多 300 个部件的物体。

### 核心问题
现有部件感知生成方法在高度复杂物体上扩展性差——部件数量增加时，生成细节几何的 token 长度和内存成本变得不可承受。

### 核心技术

1. **Token 高效向量量化形状分词器**
   - 学习部件级几何的离散潜表示
   - 最小化 token 使用同时保持高保真重建
   - 基于几何复杂度自适应 token 长度

2. **统一结构化序列生成**
   - LLM 生成物体边界框、部件边界框和部件 shape tokens
   - 统一框架处理部件级结构

3. **高效长上下文训练策略**
   - 扩展到 300 个部件
   - 序列长度最高 256k tokens

### 性能
- 超越基线自回归和扩散模型
- 压缩离散部件 tokens 同时提高可扩展性和生成几何保真度

## 项目页面
https://expmaster.github.io/megaparts_webpage

## 相关技术
- Part-Aware 3D Generation
- Vector Quantized Shape Tokenizer
- Autoregressive Modeling
- Mesh Generation

## 可行性评估

**推荐度：✅ 推荐实现（分块网格处理参考）**

- 部件级几何处理方法有参考价值
- token 效率优化策略值得学习
- 分块建模对网格分块处理有参考

## 会议信息
arXiv Submission, 2026-08-10
