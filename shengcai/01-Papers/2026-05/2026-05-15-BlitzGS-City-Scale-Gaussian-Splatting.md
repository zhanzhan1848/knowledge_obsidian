---
title: City-Scale Gaussian Splatting at Lightning Speed
authors: Zhongtao Wang et al.
date: 2026-05-13
source: arXiv cs.GR
url: https://arxiv.org/abs/2605.13794
pdf: https://arxiv.org/pdf/2605.13794
tags: [rendering, 3DGS, large-scale, distributed, real-time rendering, 2026]
status: unread
---

# City-Scale Gaussian Splatting at Lightning Speed

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | City-Scale Gaussian Splatting at Lightning Speed |
| 作者 | Zhongtao Wang et al. |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2605.13794) |
| PDF | [下载](https://arxiv.org/pdf/2605.13794) |

## 核心贡献
1. **BlitzGS**：分布式 3DGS 框架，减少城市尺度重建的活跃高斯工作负载
2. 系统级：按索引奇偶分片高斯而非空间块，减轻跨块可见性冗余
3. 模型级：重要性评分 passes 生成 per-Gaussian 可见性权重
4. 视图级：距离 LOD gate + 重要性剔除遮罩

## 技术方案

### 系统级创新
- 按索引奇偶而非空间块分片 Gaussians
- 单次跨 GPU 交换分发投影高斯到 tile owner

### 模型级创新
- 调度重要性评分 passes 收缩全局高斯种群
- per-Gaussian 可见性权重偏置密度控制更新
- per-view 重要性遮罩用于视图级渲染器

### 视图级创新
- 距离基础 LOD gate 排除当前视锥过细图元
- 重要性基础剔除跳过跨视图贡献可忽略的高斯

## 实验结论
- 大规模基准上匹配渲染质量，同时提供数量级加速
- 城市尺度场景训练仅需数十分钟
- 代码：https://github.com/AkierRaee/BlitzGS

## 可行性分析
- 实现难度：中（需要分布式系统设计）
- 性能预期：城市尺度实时渲染
- 适用场景：城市级 3DGS、大规模场景实时渲染

## 相关工作
- 3D Gaussian Splatting
- Large-scale reconstruction
- Distributed rendering

## 笔记
城市尺度 3DGS 的重要进展，分布式策略值得参考