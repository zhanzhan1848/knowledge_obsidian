---
tags: [几何, UV参数化, 接缝生成, 图流匹配, 生成模型]
date: 2026-07-14
conference: arXiv
---

# SeamGen: Artist-Aligned UV Seam Generation via Graph Flow Matching

## 核心方法

SeamGen 是一个用于 UV 接缝生成的生成模型，学习专业艺术家的接缝布局偏好。

### 问题背景

UV 接缝放置是 3D 内容创建中的关键但耗时的步骤：
- 需要艺术家平衡图表形状、接缝隐藏
- 需要与语义和几何特征对齐

### 现有方法局限

- 基于单对象优化
- 依赖手工设计目标避免畸变
- 或使用预训练模型的语义代理
- 结果与工业生产管线的艺术家偏好不一致

### SeamGen 创新

1. **流匹配生成模型**：从大量专业接缝布局数据中学习
2. **Mesh Transformer 主干网络**：
   - 局部图注意力：跨网格边缘
   - 全局自注意力：跨顶点
   - 捕获细粒度几何线索和长程拓扑一致性

3. **训练无关的 inpainting 能力**：
   - 局部接缝细化
   - 约束引导接缝生成

## 技术架构

```
输入网格 → Mesh Transformer → Flow Matching → UV Seam Layout
                                    ↓
                          局部细化 / 约束生成
```

## 与 OT-UVGS 的关联

两者都使用最优传输理论：
- OT-UVGS：OT 用于 UV 容量分配
- SeamGen：可探索 OT 用于接缝优化的 inpainting

## 开源实现

- arXiv: https://arxiv.org/abs/2607.12379

## 相关笔记

[[OT-UVGS-Capacity-Allocation]]
[[ArtUV-Artist-UV-Unwrapping]]
[[MeshTailor-Edge-Aligned-Seams]]

## 可行性分析

✅ **推荐实现**

- 首个学习艺术家接缝偏好的生成模型
- Mesh Transformer 可作为其他网格处理任务的主干
- 对工业 3D 建模工作流有实际价值
