---
tags: [渲染, 3DGS, 网格提取, 曲面重建, 自监督, 2026]
date: [[2026-04-02]]
status: 待读
---

# Confidence-Based Mesh Extraction from 3D Gaussians

## 基本信息
| 项目 | 内容 |
|------|------|
| 作者 | Lukas Radl et al. |
| 发表 | arXiv:2603.24725 [cs.CV/cs.GR] |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2603.24725) |
| 项目页 | [CoMe](https://r4dl.github.io/CoMe/) |

## 核心贡献
1. 提出**自监督置信度框架**（self-supervised confidence framework）应用于 3DGS：可学习置信度值动态平衡光度学和几何监督
2. 提出**置信度驱动的损失函数**：惩罚每基元颜色和法线方差，改善曲面提取
3. 改进**外观模型**：解耦 D-SSIM 损失的各个项
4. 在无界网格上达到 SOTA，同时保持高效

## 技术方案

### 问题
3DGS 显著加速了从图像集提取网格，但丰富视角相关效果的场景中网格提取仍困难。先前方法依赖多视角、迭代提取或大预训练模型，牺牲了 3DGS 的效率。

### 置信度框架
```math
\mathcal{L}_{confidence} = \sum_i c_i \cdot \mathcal{L}_{geo}(i)
```
可学习置信度 $c_i$ 动态平衡不同监督信号。

### 颜色和法线方差损失
惩罚同一基元在不同视角的颜色和法线差异，改善表面一致性。

### D-SSIM 解耦
将 D-SSIM 分解为各独立项，改善外观模型。

## 实验结论
- 无界网格上达到 SOTA
- 保持 3DGS 效率优势

## 标签
#3DGS #网格提取 #自监督 #曲面重建
