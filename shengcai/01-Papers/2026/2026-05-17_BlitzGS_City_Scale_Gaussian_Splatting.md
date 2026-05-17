---
title: "BlitzGS: City-Scale Gaussian Splatting at Lightning Speed"
authors: Zhongtao Wang et al.
date: 2026-05-13
source: arXiv cs.GR
url: https://arxiv.org/abs/2605.13794
pdf: https://arxiv.org/pdf/2605.13794
tags: [rendering, 3DGS, city-scale, distributed, acceleration, 2026]
status: unread
---

# BlitzGS: City-Scale Gaussian Splatting at Lightning Speed

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | BlitzGS: City-Scale Gaussian Splatting at Lightning Speed |
| 作者 | Zhongtao Wang et al. |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2605.13794) |
| PDF | [下载](https://arxiv.org/pdf/2605.13794) |
| 代码 | https://github.com/AkierRaee/BlitzGS |

## 核心贡献
1. 提出**BlitzGS**：分布式3DGS框架，减少城市级重建的活跃高斯工作负载
2. 三层耦合管理：系统层、模型层、视图层
3. 城市规模场景训练时间从数小时降到**数十分钟**，加速一个数量级

## 技术方案

### 系统层
- 按索引奇偶性分片高斯（而非空间块），减少跨块可见性冗余
- 单次跨GPU交换分配渲染步骤，将投影高斯路由到其tile所有者

### 模型层
- 调度重要性评分传递缩减全局高斯种群
- per-Gaussian可见性权重 → 偏向贡献图元的密度控制更新
- per-view重要性掩码 → 视图级渲染器

### 视图层
- 基于距离的LOD门控排除过细图元
- 重要性基础剔除跳过贡献可忽略的高斯

## 实验结论
- 大规模基准测试：匹配最新大规模基线的渲染质量
- 训练城市级场景仅需**数十分钟**
- 一个数量级加速
- 开源可用

## 可行性分析
- 实现难度：**中**（有GitHub代码）
- 性能预期：城市规模分钟级训练，实时渲染
- 适用场景：自动驾驶数据集、城市建模、数字孪生、VR城市导航

## 相关工作
- 3D Gaussian Splatting
- 大规模场景渲染
- 分布式GPU渲染

## 标签
#3DGS #城市规模 #分布式渲染 #加速 #开源