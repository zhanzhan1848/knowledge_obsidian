---
title: "A Geodesic Cut-Cell Prior for Neural Skinning"
authors: [Wenchao Ma et al.]
date: 2026-08-11
arXiv: "2608.11272"
tags: [几何, 网格处理, 骨骼绑定, 皮肤权重, 测地线, 神经骨骼]
conference: arXiv cs.GR (TOG 2026)
---

# A Geodesic Cut-Cell Prior for Neural Skinning

## 核心方法

本文提出 **Cut-Cell Skinning**——一种几何先验，用于增强数据驱动的骨骼蒙皮权重生成。

### 核心创新

1. **Cut-Cell Graph**：快速图逼近体积测地线距离
   - 结合输入网格顶点 + 体素网格内点 + 表面交点
   - 使用广义缠绕数判断内部体素

2. **相比传统方法的优势**：
   - 比优化求解器（如 BBW）快 **2-4 个数量级**
   - 对网格拓扑噪声鲁棒
   - 避免体素化导致的错误连接（近端区域被错误连接）

3. **与神经网络集成**：
   - 将几何先验注入神经骨骼架构
   - 保持语义理解的同时获得几何泛化能力

### Cut-Cell Graph 构建

```
图 G = (V, E)
V = (V^M mesh vertices, V^I interior grid vertices, V^S surface intersection vertices)
```

1. 创建输入网格的图结构
2. 创建包围盒体素网格
3. 用表面网格"切割"体素，保留内部单元
4. 使用广义缠绕数判断体素是否在内部
5. 连接所有顶点形成 Cut-Cell Graph
6. 在图上计算最短路径作为测地线距离逼近

### 与神经网络集成

- 修改 state-of-the-art 神经骨骼架构
- 以 Cut-Cell 距离作为额外输入特征
- 一致提升现有方法性能

## 复杂度分析

- 构建 Cut-Cell Graph：O(n) 其中 n 为面片数
- 图最短路径：O(V log V)（Dijkstra）
- 整体比 BBW 快 2-4 个数量级

## 应用场景

- 骨骼蒙皮权重自动生成
- 角色动画管道
- 大规模训练数据预处理

## 开源实现

- Project Page: https://wenchao-m.github.io/CutCell.github.io/
- GitHub: 待确认

## 相关文献

- Jacobson et al. "Bounded Biharmonic Weights (BBW)" - 经典几何方法
- Baran and Popovic "Heat Diffusion" - 早期方法
- Dionne and de Lasa "Geodesic Voxel Binding" - 体素化替代方案

## 可行性评估

| 维度 | 评分 |
|------|------|
| 算法创新 | ⭐⭐⭐⭐ (几何+学习巧妙结合) |
| 实现难度 | ⭐⭐⭐ (图算法实现较直接) |
| 实用价值 | ⭐⭐⭐⭐⭐ (工业直接可用) |
| 代码开源 | 待确认 |

## 关键公式

### Cut-Cell 距离到骨骼权重

使用类似 Dionne and de Lasa 的核函数：
$$w_j(x) = \frac{1}{Z(x)} \exp\left(-\frac{d(x, bone_j)^2}{\sigma^2}\right)$$

其中 $d(x, bone_j)$ 是 Cut-Cell Graph 上的测地线距离。

### 广义缠绕数判断内部

$$\omega(p, S) = \frac{1}{4\pi} \int_S \frac{(p - x) \cdot n}{|p - x|^3} dS$$

## 传递给 @墨鱼丸

**建议**：Cut-Cell Graph 可作为几何预处理模块集成到现有骨骼绑定流程中。重点研究：
1. 图构建的 CUDA 并行化
2. 与神经网络特征融合方式
3. 测地线核函数的形式
