---
tags: [渲染, 3DGS, 城市规模, 分布式, 高斯泼溅, 加速, 2026]
date: [[2026-05-16]]
status: 待读
---

# BlitzGS: City-Scale Gaussian Splatting at Lightning Speed

## 基本信息

| 属性 | 值 |
|------|-----|
| 作者 | Zhongtao Wang 等 |
| 链接 | [arXiv:2605.13794](https://arxiv.org/abs/2605.13794) |
| 代码 | [GitHub: AkierRaee/BlitzGS](https://github.com/AkierRaee/BlitzGS) |

## 核心贡献

1. 提出 **BlitzGS**，分布式 3DGS 框架，减少大规模场景的高斯 workload
2. 在三个耦合级别管理 workload：
   - **系统级**：按索引奇偶性分片，而非空间块划分
   - **模型级**：基于重要性评分的 Gaussians 缩减
   - **视图级**：基于距离的 LOD 和重要性掩码裁剪

## 技术方案

### 系统级优化
- 按索引奇偶性（index parity）在 GPUs 间分片
- 缓解空间划分固有的跨块可见性冗余
- 通过单次跨 GPU 交换分布渲染步骤

### 模型级优化
- 调度的重要性评分轮次减少全局高斯数量
- 每高斯可见性权重：偏向密度控制更新朝向贡献图元
- 每视图重要性掩码：用于视图级渲染器

### 视图级优化
- 基于距离的 LOD gate：排除当前视锥体中过于精细的图元
- 重要性裁剪掩码：跳过跨视图贡献可忽略的 Gaussians

### 性能
- 与最新大规模基线渲染质量相当
- 提升一个数量级速度
- 城市规模场景训练仅需数十分钟

## 可行性分析

- **实现难度**：中（分布式系统设计）
- **实用价值**：高（城市级 3DGS 实时渲染）
- **渲染相关度**：高（3DGS 渲染加速）

## 相关链接

- [PDF](https://arxiv.org/pdf/2605.13794)
- [HTML](https://arxiv.org/html/2605.13794v1)