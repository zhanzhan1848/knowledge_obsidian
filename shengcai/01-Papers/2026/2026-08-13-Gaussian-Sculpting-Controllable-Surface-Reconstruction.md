---
title: Gaussian Sculpting: End-to-End Controllable Surface Reconstruction via Field Optimization
authors: Ke Jiaxin, Juncheng Liu, Yi Wang, Zhouhui Lian, Bin Liu, Shengfa Wang, Xiangjia He
date: 2026-08-11
source: arXiv cs.GR
url: https://arxiv.org/abs/2608.10602
pdf: https://arxiv.org/pdf/2608.10602.pdf
tags: [rendering, 3DGS, surface reconstruction, SDF, Gaussian splatting, neural rendering, 2026]
status: unread
---

# Gaussian Sculpting: End-to-End Controllable Surface Reconstruction via Field Optimization

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Gaussian Sculpting: End-to-End Controllable Surface Reconstruction via Field Optimization |
| 作者 | Ke Jiaxin, Juncheng Liu, Yi Wang, Zhouhui Lian, Bin Liu, Shengfa Wang, Xiangjia He |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2608.10602) |
| PDF | [下载](https://arxiv.org/pdf/2608.10602.pdf) |

## 核心贡献
1. **高斯锚定到可微表面**：将高斯锚定到演化的可微表面，让高斯引导 SDF 优化，而非仅在后处理中提取表面
2. **双层训练策略**：外循环优化 SDF 几何，内循环固定几何后更新高斯，实现稳定的梯度隔离
3. **多分辨率细分**：基于八叉树分区的多分辨率细分方案，保持细节同时降低内存消耗
4. **端到端可微分**：几何和外观联合优化，相互约束

## 技术方案

### 核心洞察
- 3DGS 在有限视角下难以恢复准确表面
- 高斯基元的固有不规则性导致难以手动校正几何错误
- 解决思路：让高斯在优化过程中主动引导 SDF，而非被动提取

### 双层训练
```
外循环：优化 SDF 几何（几何固定时的高斯梯度）
内循环：固定几何更新高斯参数
```

### 高斯参数约束
- 强制高斯参数与底层表面一致
- 提高几何和外观保真度

### 多分辨率细分
- 八叉树式分区
- 保留细节 + 降低内存

## 实验结论
- 有效去除冗余表面
- 恢复有限视角导致的缺失结构
- 低分辨率下仍保持强重建质量

## 局限性
- 计算成本高于标准 3DGS（双层训练）
- 对 SDF 和高斯的联合优化可能收敛困难
- 多分辨率细分增加实现复杂度

## 可行性分析
- 实现难度：高（双层优化、SDF 集成、八叉树）
- 性能预期：质量提升明显，但速度可能低于实时
- 适用场景：离线重建、高质量资产生成、文物保护

## 相关工作
- [[3D Gaussian Splatting]]
- [[NeuS - Neural Implicit Surface]]
- [[Surface Reconstruction from Gaussians]]

## 笔记
虽然核心是重建，但涉及渲染表示（3DGS + SDF 联合优化），对渲染管线有参考价值。关键技术点：端到端联合优化、Bi-level training。
