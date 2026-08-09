---
tags: [几何, 网格生成, 流匹配, 生成式AI, 图像到网格]
---

# Fast Native Mesh Generation with Flow Matching

## 论文信息
- **arXiv ID**: [2607.28675](https://arxiv.org/abs/2607.28675)
- **作者**: Rendong Lian et al.
- **日期**: 2026-07-31
- **会议**: -
- **主题**: 网格生成、流匹配、图像到网格、快速推理

## 核心方法

### 问题定义
主流方法将网格序列化为token序列并自回归解码，推理速度慢且对误差累积敏感，不适合交互式资产生成。

### 核心创新
1. **Meshy T2**: 基于流匹配的快速原生网格生成框架
2. **Vertex-set Mesh VAE**: 
   - 每个顶点一个连续隐token
   - 单次前向传递解码顶点、边连接和面绕序
   - 保留高精度几何和艺术家创作拓扑
3. **Coarse-to-fine 级联**: 
   - Image-conditioned voxel flow: 勾勒整体形状
   - Mesh flow: 用每顶点隐token填充骨架

### 算法流程
```
输入图像 → Voxel Flow (粗略占用支架) → Mesh Flow (每顶点隐token) → 网格
```

## 技术细节

### 关键优势
- **并行流式合成**: 交互式生成速度
- **面数控制**: 通过顶点预算请求
- **多部件支持**: 组件直接从生成的连接中出现

### 性能
- 中位数 6 秒完成端到端图像到网格生成
- 比自回归基线快一个数量级

## 复杂度分析
- **时间**: O(1) 并行生成 vs O(n) 自回归
- **空间**: 隐向量维度 d << 顶点数

## 开源实现
- GitHub: [meshy-dev/meshy-t2](https://github.com/meshy-dev/meshy-t2)

## 相关笔记
[[几何, 网格生成, 流匹配]]
[[几何, 深度学习, 图像到3D]]
