---
tags: [几何, 3D生成, Tokenization, 自回归, Transformer]
created: 2026-05-30
---

# SuperVoxelGPT: Adaptive and Ordered 3D Tokenization for Autoregressive Shape Generation

## 论文信息
- **arXiv**: [2605.29655](https://arxiv.org/abs/2605.29655)
- **日期**: 2026-05-28
- **主题**: 3D 形状生成 Tokenization

## 核心方法

### 问题定义
自回归多模态大语言模型 (MLLMs) 能进行 3D 生成，但难以扩展到高分辨率形状，原因在于：
- 紧凑集合表示丢弃确定性空间排序 → 序列预测歧义
- 均匀/八叉树体素网格保留排序但严重冗余

### 核心创新
- **SuperVoxelGPT**：representation-first 框架
- **Adaptive and Deterministically Ordered SuperVoxel**
- 解决紧凑性与排序的矛盾

### 技术要点
```
SuperVoxel 设计：
- 自适应分辨率（不同区域不同精度）
- 确定性排序（消除歧义）
- 避免过度冗余

框架：Autoregressive 3D shape generation
```

## 算法复杂度
- 序列化效率：显著优于均匀体素
- Token 数量：大幅减少

## 实现难度
- **算法复杂度**：中
- **依赖项**：可能基于 Octree/DOT 等
- **数值稳定性**：良好

## 推荐结论
✅ **推荐关注** - 3D 生成 Tokenization 的重要进展

## 相关工作
- Octree-based: Octree Transformer, DOT
- Set-based: PointGPT, LiDAR-LLM

## 备注
为高分辨率 3D 生成提供新范式