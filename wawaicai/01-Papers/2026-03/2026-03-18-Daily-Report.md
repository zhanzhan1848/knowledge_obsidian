---
tags: [每日报告, 几何处理, 论文收集]
date: 2026-03-18
search_scope: arXiv cs.GR, ACM DL
keywords: [mesh processing, geometry processing, point cloud, subdivision surface, parametrization, remeshing, simplification]
---

# 🥬 每日几何处理论文搜索报告

**日期**: 2026-03-18 (周三)  
**执行时间**: 14:09 UTC  
**搜索范围**: arXiv cs.GR 最新提交

---

## 📊 搜索统计

| 指标 | 数值 |
|------|------|
| 今日 cs.GR 新提交 | 15 篇 |
| 直接提交 (cs.GR 主分类) | 6 篇 |
| 跨分类提交 | 9 篇 |
| 与几何处理高度相关 | 4 篇 |
| 创建笔记 | 4 篇 |

---

## 🔥 重点推荐论文

### 1. TopGen: Learning Structural Layouts and Cross-Fields for Quad Mesh Generation
- **arXiv**: [2603.10606](https://arxiv.org/abs/2603.10606)
- **提交**: 2026-03-11
- **标签**: `mesh-generation` `quad-mesh` `cross-field` `deep-learning`
- **推荐度**: ⭐⭐⭐⭐⭐
- **笔记**: [[2026-03-18-TopGen-Quad-Mesh]]
- **核心创新**: 同时预测结构布局和交叉场，引入 TopGen-220K 数据集

### 2. Laplace-Beltrami Operator for Gaussian Splatting (v2 更新)
- **arXiv**: [2502.17531](https://arxiv.org/abs/2502.17531)
- **更新**: 2026-03-16
- **标签**: `gaussian-splatting` `laplace-beltrami` `geometry-processing`
- **推荐度**: ⭐⭐⭐⭐
- **笔记**: [[2026-03-16-Laplace-Beltrami-Gaussian-Splatting]]
- **核心创新**: 在 Gaussian Splatting 上直接计算几何处理算子

### 3. NeurFrame: Learning Continuous Frame Fields for Structured Mesh Generation
- **arXiv**: [2603.12820](https://arxiv.org/abs/2603.12820)
- **提交**: 2026-03-13
- **标签**: `frame-field` `hex-meshing` `neural-network`
- **推荐度**: ⭐⭐⭐⭐⭐
- **笔记**: [[2026-03-13-NeurFrame-Continuous-Frame-Fields]]
- **核心创新**: 连续帧场表示，支持无限分辨率评估

### 4. TreeON: 3D Tree Point Cloud Reconstruction
- **arXiv**: [2603.10996](https://arxiv.org/abs/2603.10996)
- **提交**: 2026-03-11
- **标签**: `point-cloud` `reconstruction` `neural-network`
- **推荐度**: ⭐⭐⭐⭐
- **笔记**: [[2026-03-11-TreeON-Point-Cloud-Reconstruction]]
- **核心创新**: 从俯视 2D 数据重建 3D 点云，代码已开源

---

## 📝 今日 cs.GR 直接提交列表

| arXiv ID | 标题 | 相关性 |
|----------|------|--------|
| 2603.16801 | 3D printing lithographs for microscopy | 中 |
| 2603.16612 | Retrieval-Augmented Sketch-Guided 3D Building Generation | 中 |
| 2603.16478 | Fast Gradients for Deformables Across Frictional Contact | 中 |
| 2603.16057 | Scientific Visualization Pipeline Construction | 低 |
| 2603.15796 | Low-Latency Head-Mounted Displays | 低 |
| 2603.15627 | Physics-Informed Video Diffusion for Shallow Water | 中 |

---

## 🎯 技术趋势分析

### 网格生成
- **Quad Mesh**: TopGen 提出同时学习结构布局和交叉场的新范式
- **Hex Mesh**: NeurFrame 实现连续帧场表示，避免离散化误差
- **趋势**: 学习方法逐渐替代传统优化方法

### 新表示上的几何处理
- **Gaussian Splatting**: Laplace-Beltrami 算子扩展到新表示
- **趋势**: 几何处理算法需要适应新的 3D 表示形式

### 点云重建
- **稀疏到密集**: 从 2D 数据重建 3D 点云
- **合成数据训练**: 程序化建模生成训练数据
- **趋势**: 可微分渲染 + 神经网络的组合

---

## 📦 传递给 @墨鱼丸

### 优先级排序
1. **高优先级**: TopGen (quad mesh), NeurFrame (hex mesh)
2. **中优先级**: Laplace-Beltrami for Gaussian Splatting
3. **研究参考**: TreeON (点云重建技术)

### 实现建议
- TopGen 的 TopGen-220K 数据集可用于训练评估
- NeurFrame 的连续场表示可考虑集成到现有网格管线
- Laplace-Beltrami 算子的 Mahalanobis 距离思路可借鉴

---

## 🔗 相关链接
- [arXiv cs.GR 最新](https://arxiv.org/list/cs.GR/recent)
- [TreeON 项目页面](https://angelikigram.github.io/treeON/)

---

*报告生成时间: 2026-03-18 14:12 UTC*
