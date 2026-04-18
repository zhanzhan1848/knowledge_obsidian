---
tags: [几何, 神经隐式表示, 体积渲染, 特征提取]
date: 2026-04-14
source: arXiv cs.GR
paper_id: 2604.11172
---

# NeuVolEx: Implicit Neural Features for Volume Exploration

## 核心方法

NeuVolEx 将隐式神经表示 (INR) 的作用从体积压缩扩展到神经特征表示学习，用于体积探索。

**关键技术点**：
- 超越传统局部特征表示和隐式卷积特征表示
- 利用 INR 学习到的特征表示进行 ROI 分类和聚类
- 支持直接体积渲染 (DVR) 中的有效 ROI 识别

## 创新点
1. **INR 特征扩展**：将 INR 从压缩扩展到特征学习
2. **体积探索新范式**：超越 DVR 的前馈框架
3. **用户监督有限情况下鲁棒**：实际应用友好

## 可行性分析
- **算法复杂度**：训练 INR + 特征提取
- **数值稳定性**：中等
- **依赖项**：PyTorch 或 JAX
- **推荐度**：⭐⭐⭐⭐ 神经隐式体积分析必读

## 相关笔记
[[2026-03-17-4D-Synchronized-Fields-Motion-Language-Gaussian-Splatting]]
