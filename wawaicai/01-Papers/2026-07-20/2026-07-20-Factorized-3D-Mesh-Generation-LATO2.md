---
tags: [几何, 网格生成, 深度学习, Flow-Matching, 拓扑]
type: paper
date: 2026-07-20
source: arXiv cs.GR
---

# Factorized 3D Mesh Generation with Vertex and Topology Flow

## 论文信息

- **arXiv**: [2607.10623](https://arxiv.org/abs/2607.10623)
- **作者**: Hang Long et al.
- **会议/期刊**: cs.GR
- **日期**: 2026-07-12

## 核心方法

### 问题定义
- 现有方法将顶点和连接性联合建模在单一潜空间中
- 连续顶点几何与离散组合结构纠缠
- 导致流动学习中顶点漂移和表面断裂

### 创新点：LATO.2
**因子化流动匹配框架**，将网格生成分解为：
1. **顶点流动** (Vertex Flow) - 学习连续几何
2. **连接流动** (Connectivity Flow) - 以实现顶点为条件学习离散结构

### 关键技术
- **共享粗粒度 Voxel Scaffold**: 两个阶段都锚定在共享的粗体素脚手架上
- **专用 VAE**: 
  - 顶点 VAE：在子体素精度恢复顶点
  - 连接 VAE：将离散连接嵌入连续潜空间

## 独特优势

### (i) Part-wise Generation
- 脚手架分区，每个部分在完整潜容量下合成
- 比整体潜空间方法产生更高分辨率网格

### (ii) Topology-Adaptive Editing
- 操控第一阶段顶点诱导相应连接
- 无需重新优化

## 实验结果

- 几何保真度超越 SOTA 拓扑感知网格生成器
- 连接质量更优

## 相关技术

- [[Flow Matching]]
- [[Mesh Generation]]
- [[VAE]]
- [[Topological Analysis]]
- [[Voxel-based Representation]]

## 可行性评估

⚠️ **谨慎评估**

- 深度学习方法，需要大量训练数据
- 因子化设计具有创新性
- 适合研究用途，生产环境需考虑推理成本

## 未来方向

- 与 libigl 几何处理工具链集成
- 探索其他因子化策略
