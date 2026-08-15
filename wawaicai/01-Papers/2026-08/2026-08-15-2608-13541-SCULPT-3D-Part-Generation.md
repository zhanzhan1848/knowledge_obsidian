---
tags: [3D生成, 几何处理, 部件分解, 神经隐式]
---

# SCULPT: Subtractive Composition for 3D Part Generation

## 论文信息
- **arXiv**: [2608.13541](https://arxiv.org/abs/2608.13541) [cs.CV]
- **作者**: Sikuang Li et al.
- **提交日期**: 2026-08-13
- **Project**: https://sculpt-part.github.io/
- **Code**: https://github.com/sculpt-part/SCULPT

## 核心方法

### 问题定义
现有部件感知3D生成方法在生成完整对象后进行分割，或从预定义布局综合部件，两者都无法在生成循环内原生处理部件边界。

### 核心创新：Subtractive Composition
给定完整对象（在结构化3D潜在空间中表示），**迭代应用联合split预测器**，生成：
1. 一个提取的部件
2. 剩余对象

#### 关键技术
1. **Joint Split Predictor**：条件去噪过程，同时处理图像和当前3D状态
2. **Sparse 3D Support**：邻居支持可重叠，而非disjoint voxel partition
3. **自适应部件数量**：直到remainder support为空或达到固定安全上限

### 与现有方法对比
| 方法 | 优点 | 缺点 |
|------|------|------|
| 分割方法 | 保留生成几何 | 生成后固定部件边界 |
| 加法方法 | 暴露部件基数 | 共享边界有间隙、渗透 |
| SCULPT | 原生部件边界 | - |

## 实验结果
- SOTA几何质量 on PartObjaverse
- 完整对象重建质量强
- 纹理细粒度部件分解

## 几何处理相关性
🟡 **中等相关性** — 涉及3D形状结构分解，与几何处理中的部件分割、网格处理相关。

## 关键词
`3D生成` `部件分解` `结构化潜在空间` `去噪` `形状编辑`
