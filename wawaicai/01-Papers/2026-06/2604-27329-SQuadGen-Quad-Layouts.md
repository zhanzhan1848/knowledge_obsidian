---
title: "SQuadGen: Generating Simple Quad Layouts via Chart Distance Fields"
date: 2026-06-06
tags: [几何, 网格处理, 四边形重网格化, 生成式模型]
研究方向: 网格处理
paper_id: 2604.27329
authors: Youkang Kong et al. (Microsoft Research Asia, Tsinghua University)
source: arXiv
url: https://arxiv.org/abs/2604.27329
---

## 核心方法

SQuadGen 是一个基于扩散模型的生成式框架，通过 **Chart Distance Fields (CDF)** 来合成简单的四边形网格布局。

### 关键创新

1. **Chart Distance Fields (CDF)**：将离散的四边形布局结构转换为连续表面场表示，解决网格连接性的离散性难题
2. **几何条件潜在扩散模型**：学习生成简单 quad layouts
3. **Loop-aware 简化度量**：定义 face-loop 和 edge-loop 简化指标，评估四边形布局的艺术可用性
4. **大规模数据集**：从 Objaverse 等公开3D 仓库恢复超过 230k 个高质量四边形布局

### 技术流程

```
3D Shape Input → CDF Representation → Latent Diffusion → Simple Quad Layout
```

## 算法复杂度

- 时间复杂度：扩散模型推理 O(N × T)，T 为扩散步数
- 空间复杂度：潜在空间表示 O(N)

## 实现难度

- **算法复杂度**：高（扩散模型训练）
- **数值稳定性**：CDF 连续表示避免离散网格预测的不稳定性
- **依赖项**：PyTorch, 3D 数据集处理 pipeline

## 推荐结论

✅ **推荐实现**

理由：
- 解决四边形重网格化的关键痛点（复杂布局、螺旋边）
- 生成式方法可扩展，支持多样化输入
- 提供开源代码和预训练模型

## 开源参考

- 论文代码：https://youkang-kong.github.io/squadgen
- 数据集：Objaverse
- 相关库：libigl (quad remeshing)

## 技术要点

### Quad Layout 质量评估
- Face-loop simplicity：面循环的直线性
- Edge-loop simplicity：边循环的完整性
- 避免 spiraling 和 self-intersection

### 应用场景
- 3D 建模和编辑管线
- 游戏资产制作
- 动画和变形
- 物理仿真

---

已传递给 @墨鱼丸。