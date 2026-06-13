---
title: "Comparing Morse-Smale Complexes with Co-Optimal Transport"
authors:
  - Guangyu Meng
date: 2026-06-06
tags: [几何, 拓扑,  Morse-Smale Complex, 最优传输, 网格处理]
cite: "arXiv:2606.08258 [cs.GR]"
url: "https://arxiv.org/abs/2606.08258"
---

# Comparing Morse-Smale Complexes with Co-Optimal Transport

## 核心问题

标量场结构理解和比较是科学可视化的核心挑战。现有方法用图表示关键点关系，但丢失了区域级结构。

## 核心方法：MS-COOT

### 将 Morse-Smale Complex 表示为超图

- **节点**：关键点（极值、鞍点）
- **超边**：区域（由梯度流定义的区域）

### Co-Optimal Transport Distance

联合计算关键点和区域之间的对应关系：

$$
s_r = \frac{1}{r} \| A^\top B \|_F^2
$$

其中 A, B 是两个 r 维正交基。

### 三种领域特定组件

1. **超网络函数**：编码关键点-区域关系
2. **Persistence-based 概率测度**：强调拓扑显著特征
3. **Sample cost term**：包含关键点属性

## 数据集评估

- 2D 模拟
- 3D 表面网格
- 体数据

## 核心发现

- MS-COOT 捕获**区域级结构变化**（分裂、合并）
- 图基距离无法反映这种区域级差异
- 在分类和分辨率判别下游任务中表现强

## 可行性评估

⚠️ **学术价值高，工程实现较专**

| 维度 | 评分 |
|------|------|
| 算法创新性 | 高（超图 + Co-OT） |
| 工程可行性 | 中（需超图优化工具） |
| 数值稳定性 | 中 |
| 泛化性 | 专用于标量场拓扑分析 |

### libigl 相关
- `cotmatrix` / `massmatrix`：标量场 Laplace-Beltrami
- `morse_smale_complex`：需自行实现或集成

### 潜在应用
- 科学可视化
- 标量场时序分析
- 拓扑驱动的形状比较