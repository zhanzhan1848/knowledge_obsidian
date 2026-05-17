---
title: "FA-QEM: Fast and Robust Mesh Simplification for Generated and Real-World 3D Assets"
authors: (from arXiv:2605.14029)
date: 2026-05-15
source: arXiv cs.GR
url: https://arxiv.org/abs/2605.14029
pdf: https://arxiv.org/pdf/2605.14029
tags: [geometry, mesh-simplification, QEM, feature-preserving, 3D, 2026]
status: unread
---

# FA-QEM: Fast and Robust Mesh Simplification for Generated and Real-World 3D Assets

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | FA-QEM: Fast and Robust Mesh Simplification for Generated and Real-World 3D Assets |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2605.14029) |
| PDF | [下载](https://arxiv.org/pdf/2605.14029) |
| 获奖 | CVPR 2026 3D4S Workshop Best Paper Award Runner-up |

## 核心贡献
1. 提出**特征感知Quadric Error Metric (FA-QEM)**，联合编码几何偏差、边界曲率和表面法线一致性
2. 即使在激进简化下也能保留锐利特征的最优顶点放置
3. 几何简化改善下游外观迁移，作为纹理映射的优越前端

## 技术方案

### 多项Quadric Error公式
- 几何偏差
- 边界曲率
- 表面法线一致性

### 与3DGS的协同
- 高保真几何简化 → 改善外观迁移
- 连续映射纹理映射的优越前端

## 实验结论
- AI生成网格和大规模真实数据集（Thingi10K, Real-World Textured Things）
- 更低几何误差、更好视觉保真度、显著更快运行时间
- 对各种挑战性输入保持鲁棒

## 可行性分析
- 实现难度：**低-中**
- 性能预期：快速、鲁棒
- 适用场景：3D生成管道、仿真、AR/VR、科学计算

## 标签
#网格简化 #QEM #几何处理 #3D资产生成 #CVPR2026