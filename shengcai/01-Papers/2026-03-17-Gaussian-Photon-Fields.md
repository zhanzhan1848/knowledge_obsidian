---
title: From Particles to Fields: Reframing Photon Mapping with Continuous Gaussian Photon Fields
authors: Jiachen Tao, Benjamin Planche, Van Nguyen Nguyen, et al.
date: 2026-03-16
source: arXiv
url: https://arxiv.org/abs/2512.12459
pdf: https://arxiv.org/pdf/2512.12459
tags: [rendering, paper, 2026, photon-mapping, gaussian-splatting, global-illumination, neural-rendering]
status: unread
priority: high
---

# From Particles to Fields: Reframing Photon Mapping with Continuous Gaussian Photon Fields

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | From Particles to Fields: Reframing Photon Mapping with Continuous Gaussian Photon Fields |
| 作者 | Jiachen Tao, Benjamin Planche, Van Nguyen Nguyen, Junyi Wu, Yuchun Liu, Haoxuan Wang, et al. |
| 来源 | arXiv (cs.CV, cs.GR) |
| 年份 | 2025/2026 |
| 链接 | [原文](https://arxiv.org/abs/2512.12459) |
| PDF | [下载](https://arxiv.org/pdf/2512.12459) |
| 版本 | v2 (2026-03-16 更新) |

## 核心贡献
1. **Gaussian Photon Field (GPF)**: 将光子映射重构为连续可复用的辐射场，使用各向异性 3D Gaussian 原语编码光子分布
2. **多视图渲染加速**: 一次训练后支持可微分辐射度评估，无需重复光子追踪或迭代细化
3. **物理精度保持**: 在复杂光传输场景（焦散、镜面-漫反射交互）中达到光子级精度，同时减少数个数量级的计算量

## 技术方案
- **输入**: SPPM 第一次迭代中物理追踪的光子
- **表示**: 各向异性 3D Gaussian 原语（位置、旋转、缩放、光谱）
- **优化**: 多视图监督下的最终辐射度优化
- **输出**: 连续光子场，支持沿相机射线的可微分辐射度评估

### 关键创新
- 将传统光子映射的离散光子点转换为连续场表示
- 结合物理光线追踪的严谨性与神经场景表示的效率
- 支持复杂全局光照效果：焦散、镜面-漫反射交互

## 公式
```math
# 光子场表示（推测）
GPF(x) = \sum_i w_i \cdot G_i(x; \mu_i, \Sigma_i, \lambda_i)

# 其中：
# G_i: 各向异性高斯核
# \mu_i: 位置
# \Sigma_i: 协方差矩阵（旋转+缩放）
# \lambda_i: 光谱信息
```

## 实验结论
- 在复杂光传输场景中达到光子级精度
- 计算量减少数个数量级
- 统一了基于光子渲染的物理严谨性与神经场景表示的效率

## 局限性
- 需要第一次 SPPM 迭代进行光子追踪初始化
- 依赖多视图监督进行优化

## 可行性分析
- **实现难度**: 高（需要理解光子映射 + 3D Gaussian Splatting + 神经优化）
- **性能预期**: 多视图渲染场景显著加速
- **适用场景**: 需要高质量全局光照的多视图渲染、NeRF 类应用

## 推荐结论
✅ **强烈推荐实现**

**理由**:
- 结合两个热门研究方向（光子映射 + 3DGS）
- 解决多视图渲染的效率瓶颈
- 物理正确的全局光照

## 行动建议
- 传递给 @墨鱼丸 进行算法设计
- 需要进一步研究论文细节（PDF）获取实现细节
- 考虑与现有 3DGS 代码库集成

## 相关工作
- [[Photon Mapping]]
- [[3D Gaussian Splatting]]
- [[Global Illumination]]
- [[Neural Radiance Fields]]

## 笔记
- 这是 2026-03-16 的更新版本，需要关注 v1 到 v2 的变化
- 16 位作者的大型合作项目
- 与 NVIDIA 研究方向一致（神经渲染 + 物理渲染结合）
