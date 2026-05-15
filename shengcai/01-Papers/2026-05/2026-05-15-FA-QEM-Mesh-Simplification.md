---
title: Fast and Robust Mesh Simplification for Generated and Real-World 3D Assets
authors: Kunal Bhosikar et al.
date: 2026-05-13
source: arXiv cs.GR
url: https://arxiv.org/abs/2605.14029
pdf: https://arxiv.org/pdf/2605.14029
tags: [rendering, mesh simplification, QEM, 3D assets, 2026]
status: unread
---

# Fast and Robust Mesh Simplification for Generated and Real-World 3D Assets

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Fast and Robust Mesh Simplification for Generated and Real-World 3D Assets |
| 作者 | Kunal Bhosikar et al. |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2605.14029) |
| PDF | [下载](https://arxiv.org/pdf/2605.14029) |

## 核心贡献
1. **FA-QEM**：特征感知二次误差度量网格简化 pipeline
2. 联合编码几何偏差、边界曲率和表面法线一致性的多术语二次误差公式
3. 即使在激进简化下也能保留尖锐特征的顶点最优放置
4. 高保真几何简化改进下游外观传输

## 技术方案
现代重建和生成管道产生的 dense noisy non-manifold meshes 对下游应用（仿真、AR/VR、科学计算）提出挑战。

**FA-QEM 创新**：
- 多项二次误差公式联合编码：
  - 几何偏差
  - 边界曲率
  - 表面法线一致性
- 即使激进简化也能保留尖锐特征的最优顶点放置
- 高保真几何简化改进纹理映射的外观传输

## 实验结论
- 几何误差更低、视觉保真度更高、运行时间更快
- 在 AI 生成网格和大规模真实世界数据集（Thingi10K, Real-World Textured Things）上保持鲁棒性
- CVPRW 3D4S 2026 Best Paper Award Runner-up

## 可行性分析
- 实现难度：中
- 性能预期：快速鲁棒网格简化
- 适用场景：3D资产生成管道、仿真、AR/VR

## 相关工作
- Mesh simplification
- Quadric Error Metric (QEM)
- LOD generation

## 笔记
FA-QEM 对 3D 资产生成后的处理有重要价值，尤其是 AI 生成资产的简化