---
tags: [几何, 3D重建, 图像到3D, 生成模型]
date: 2026-06-30
source: arXiv (cs.CV)
---

# World Tracing: Generative Pixel-Aligned Geometry Beyond the Visible

## 核心方法

提出 **World Tracing**，一种生成式像素对齐几何表示。

### 问题背景

- 现有Image-to-3D方法在忠实度（faithfulness）和完整性（completeness）之间存在权衡：
  - **深度估计器**：与输入像素对齐，但止于可见表面
  - **图像到3D模型**：生成完整形状，但常与输入不对齐

### 关键创新点

1. **像素对齐几何表示**
   - 每个输入像素预测有序3D点堆栈
   - 第一层：可见表面
   - 后续层：遮挡表面的前向交叉（由近及远）

2. **WT-DiT (World-Tracing Diffusion Transformer)**
   - 将多层几何作为分离的去噪token
   - 通过分解注意力和全局注意力耦合
   - 像素空间流匹配训练
   - 混合噪声调度：平衡可见表面重建与遮挡几何生成

## 核心公式

- 像素对齐约束：$p(\text{point}_k | \text{pixel}_i)$
- 多层表示：可见层 + 遮挡层（由近及远排序）

## 实验结果

在物体、场景和动态基准上：
- 可见表面重建性能强
- 完整几何生成效果优
- 优于深度预测和图像到3D生成器

## 应用场景

- 文本驱动的3D场景编辑
- 几何条件的新视角视频合成
- 与纹理网格生成器的免训练集成

## 可行性评估

| 维度 | 评分 |
|------|------|
| 算法复杂度 | 高 |
| 数值稳定性 | 中 |
| 实现难度 | 高（扩散Transformer） |
| 工程可行性 | ⚠️ 谨慎评估 |

## 相关笔记

[[2026-06-30-PCDiff-Point-Cloud-Diffusion-3D-Anomaly-Detection]]
