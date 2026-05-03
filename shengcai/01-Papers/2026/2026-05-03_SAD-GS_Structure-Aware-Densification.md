---
title: Faster 3D Gaussian Splatting Convergence via Structure-Aware Densification
authors: Linjie Lyu, Walter K. B. Niu, Uday K. K. Singh, Jimei Yang, Haotian B. Qian, Ming L. W. Song, Marc Habermann, Christian Theobalt
date: 2026-05-01
source: arXiv (SIGGRAPH 2026)
url: https://arxiv.org/abs/2604.28016
pdf: https://arxiv.org/pdf/2604.28016
tags: [rendering, gaussian-splatting, 3DGS, real-time, densification, 2026]
status: unread
---

# Faster 3D Gaussian Splatting Convergence via Structure-Aware Densification

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Faster 3D Gaussian Splatting Convergence via Structure-Aware Densification |
| 作者 | Linjie Lyu et al. |
| 来源 | SIGGRAPH 2026 |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2604.28016) |
| PDF | [下载](https://arxiv.org/pdf/2604.28016) |
| 项目 | [SAD-GS](https://vcai.mpi-inf.mpg.de/projects/SAD-GS) |

## 核心贡献
1. **多尺度频率分析**: 结合结构张量 (Structure Tensors) 与拉普拉斯尺度空间分析 (Laplacian Scale Space)，估计每个像素的主频率
2. **频率违反度量 η**: 每个高斯、每个轴的频率违反指标，判断是否需要细分
3. **各向异性分裂策略**: 非均匀分裂，而非传统的均匀分裂成两个

## 技术方案

### 问题背景
3DGS 的标准自适应密度控制依赖屏幕空间位置梯度，无法区分几何错位与频率混叠，导致：
- 高频纹理过度模糊
- 或 densification 效率低下

### 核心方法

1. **多尺度频率分析**:
   - 结构张量 + 拉普拉斯尺度空间
   - 估计每个像素的主频率和方向
   - 在多个八度音阶上识别特征频率

2. **频率违反度量 η**:
   - 将3D高斯投影到屏幕空间
   - 比较投影范围与局部纹理波长
   - 当 η > 1 时，表示细分可以改善细节重建

3. **各向异性分裂**:
   ```python
   # 每个轴独立计算分裂次数
   for axis in [x, y, z]:
       n_subdivisions = ceil(log2(frequency_violation))
       generate_n_children_along_axis(axis, n_subdivisions)
   ```

4. **多视角一致性机制**:
   - 聚合多视角的 η 观测
   - 仅当大部分视角都报告一致的频率违反才触发分裂
   - 防止非表面高斯的过度密集化

### 公式

频率违反度量:
```math
\eta = \frac{\sigma_{projected}}{w_{texture}}
```

其中 $\sigma_{projected}$ 是投影高斯尺寸，$w_{texture}$ 是局部纹理波长。

## 实验结论

| 数据集 | SAD-GS | 基线 |
|--------|--------|------|
| Mip-NeRF360 | **53s** | ~10-20min |
| Deep Blending | **41s** | ~10-20min |

- 高频区域重建质量显著提升
- 跳过冗长的迭代 densification 阶段

## 局限性

- 依赖初始高斯分布质量
- 多视角一致性计算带来额外开销

## 可行性分析
- 实现难度：中等
- 性能预期：收敛速度提升显著，高频区域质量更好
- 适用场景：实时渲染、神经渲染加速、游戏、VR/AR

## 相关工作
- [[2026-05-01_D-Rex_Diffusion-Rendering-Relightable-Avatars]]
- 3DGS (Kerbl et al., 2023)
- FastGS (Ren et al., 2026)
- Taming-3DGS (Mallick et al., 2024)

## 笔记

**为何重要**: 3DGS 训练时间从 10-20分钟 降至 不到1分钟，对实时渲染应用意义重大。

**与墨鱼丸讨论要点**:
1. 结构张量计算的多尺度实现
2. 各向异性分裂的 GPU 并行化
3. 与现有 3DGS 管线的集成