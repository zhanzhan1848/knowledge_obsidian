---
tags: [几何, 网格生成, Flow Matching, 深度学习]
created: 2026-07-28
subject: cs.GR
---

# Meshy T2: Fast Native Mesh Generation with Flow Matching

## 核心方法

**Meshy T2** 是一个基于 Flow Matching 的快速原生网格生成框架，直接从图像生成高质量、紧凑的三角形网格。

### 关键技术点：

1. **Vertex-Set Mesh VAE**
   - 每个顶点对应一个连续 latent token
   - 顶点坐标**不量化**，共点顶点保持独立 token
   - 联合解码顶点坐标、边连接性和面缠绕顺序
   - 保留艺术家创作的拓扑结构和 part 结构

2. **两阶段级联 Flow Matching**
   - **Voxel Flow**: 从图像预测 64³ 占用 scaffold（粗略形状骨架）
   - **Mesh Flow**: 基于图像、scaffold 和顶点预算，生成每个顶点的 latent token
   - 使用最优传输分配位置编码

3. **核心创新**
   - 并行生成所有顶点，避免序列化误差累积
   - 用户可在解码前设定顶点预算，直接控制网格复杂度
   - 多部件资产自然分解为连通分量

### 公式

**边预测** (SpaceTime Embedding):
```
A_ij = ||e_i^time - e_j^time||² - ||e_i^space - e_j^space||²
```
当时间分离超过空间分离时，预测存在边。

**边损失** (类平衡 BCE):
```
L_edge = 1/Z [Σ_{i,j}∈E softplus(-A_ij) + λ Σ_{i<j, {i,j}∉E} softplus(A_ij)]
```

## 复杂度分析
- **时间**: 端到端生成约 6 秒（交互速度）
- **空间**: 取决于顶点预算

## 实验结果
- 在 retopology 和 image-to-mesh 任务上达到 SOTA 几何保真度
- 比自回归基线快一个数量级以上

## 开源实现
- GitHub: https://github.com/meshy-dev/meshy-t2

## 相关笔记
[[LATO.2-Factorized-3D-Mesh-Generation]] - 另一种因子化网格生成方法

## 可行性评估

✅ **推荐实现**

- Flow Matching 网格生成是当前前沿方向
- Meshy T2 在速度和保真度上都有优势
- 代码将开源，便于复现

⚠️ **注意**: 需要大量训练数据和计算资源
