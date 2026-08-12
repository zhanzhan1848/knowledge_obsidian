---
tags: [几何, 点云, 有符号距离场, 曲面重建, 解析方法]
date: 2026-07-20
venue: ACM TOG (SIGGRAPH 2026)
type: paper
source: wawaicai-daily-paper-search
---

# Points as Tori: Fast Pointwise Signed Distance for Point Clouds

## 核心方法

**Points as Tori** 将点云中每点用环面（torus）局部逼近，利用环面具有闭合形式 SDF 的特性，实现任意空间分辨率的快速有符号距离计算。

### 核心创新点

1. **Torus SDF**：环面具有简单闭合形式的有符号距离函数，可局部逼近球面、椭球面、鞍面，以及作为极限行为逼近柱面和平面
2. **核密度估计器**：使用指数加权平均：
   $$\phi(\mathbf{x}) = \frac{\sum_{i=1}^{|P|} g_i(\mathbf{x}) \exp(-\lambda_{\mathbf{x}} \|\mathbf{x} - \mathbf{p}_i\|)}{\sum_{i=1}^{|P|} \exp(-\lambda_{\mathbf{x}} \|\mathbf{x} - \mathbf{p}_i\|)}$$
3. **神经网络拟合**：预训练网络输出每点曲率和偏移参数，无需全局优化
4. **统一理论**：将有符号距离与 winding numbers 和 Poisson 曲面重建统一
5. **无显式重建**：直接对点云做 offset、布尔运算、球追踪可视化

## 算法流程

```
输入点云 + 法向量
     ↓
预训练网络拟合环面参数（每点曲率 + 偏移）
     ↓
查询点 → 局部环面 SDF 加权平均
     ↓
输出有符号距离值
```

## 复杂度分析

- **推理时间**：单点查询 ~10⁻⁴ 秒（4096 点点云）
- **可并行化**：每点独立计算
- **无需全局求解**：feed-forward，无迭代优化

## 应用场景

- 点云 offset
- 形态学操作
- 布尔运算
- 球追踪可视化
- Photogrammetry / Mesh / 3D Gaussians / Neural Implicits

## 开源实现

- 论文：arXiv:2607.16946, TOG 2026
- DOI: 10.1145/3811385
- 作者：Nicole Feng, Ioannis Gkioulekas, Keenan Crane (CMU)

## 相关笔记

[[2026-07-Fast-Exact-Winding-Numbers-Triangle-Meshes]]
[[HD-PEA-Anisotropic-Surface-Approximation]]

## 可行性评估

✅ **强烈推荐实现**

- 环形 SDF 理论优雅，与经典方法统一
- 推理速度极快，适合实时应用
- 可直接替代 Poisson 重建等传统方法
- 已有 libigl 函数可对比

## 技术分类

- 点云处理
- 有符号距离函数
- 曲面重建
- 解析几何
- 球追踪
