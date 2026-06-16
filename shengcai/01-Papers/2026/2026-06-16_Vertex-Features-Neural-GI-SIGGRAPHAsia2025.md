---
tags: [渲染, 全局光照, 神经渲染, 顶点特征, SIGGRAPHAsia2025]
date: 2026-06-16
status: 已读
cite: arXiv:2508.07852
---

# Vertex Features for Neural Global Illumination

## 元信息

| 标题 | Vertex Features for Neural Global Illumination |
|------|--------------------------------------|
| 作者 | Rui Su et al. (5位作者) |
| 链接 | [arXiv](https://arxiv.org/abs/2508.07852) |
| 发表 | ACM SIGGRAPH Asia 2025 |
| 领域 | cs.GR, cs.AI |

## 核心贡献

1. **神经顶点特征**：将可学习特征直接存储在 mesh 顶点上
2. **内存效率提升 5 倍**：相比网格表示，内存消耗降至 1/5
3. **保持渲染质量**的同时降低推理开销
4. **利用几何先验**：将紧凑特征与表面几何对齐

## 技术方案

### 核心问题
传统特征网格表示存在巨大的内存占用，成为现代并行计算硬件的瓶颈。

### 解决方案
不是在整个 3D 空间中均匀分布神经特征，而是在 mesh 顶点直接存储可学习特征：
- 利用底层几何作为紧凑、结构化的神经处理表示
- 优化内存效率
- 通过任务相关几何先验改善特征表示

### 应用场景
- 神经 radiosity
- 其他神经渲染任务

## 实验结论

- 内存消耗降至 **1/5 或更少**（相比网格表示）
- 保持相当渲染质量
- 降低推理开销

## 相关工作

- Learnable Neural Representations (3D reconstruction, neural rendering)
- Feature Grid Representations
- Neural Radiosity

## 标签

#全局光照 #神经渲染 #顶点特征 #内存优化 #SIGGRAPHAsia
