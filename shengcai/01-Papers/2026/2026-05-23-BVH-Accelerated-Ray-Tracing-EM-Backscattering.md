---
title: BVH-Accelerated Ray Tracing for High-Frequency Electromagnetic Backscattering
authors: Marco Pasquale, Andong Hu, Luca Pennati, Ivy Peng, Stefano Markidis
date: 2026-04-10
source: arXiv
url: https://arxiv.org/abs/2604.09243
pdf: https://arxiv.org/pdf/2604.09243.pdf
tags: [rendering, ray-tracing, BVH, electromagnetic, GPU, 2026]
status: unread
---

# BVH-Accelerated Ray Tracing for High-Frequency Electromagnetic Backscattering

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | BVH-Accelerated Ray Tracing for High-Frequency Electromagnetic Backscattering |
| 作者 | Marco Pasquale, Andong Hu, Luca Pennati, Ivy Peng, Stefano Markidis |
| 来源 | arXiv cs.IT (计算电磁学) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2604.09243) |
| PDF | [下载](https://arxiv.org/pdf/2604.09243.pdf) |

## 核心贡献
1. **BVH 加速光线追踪**: 将 BVH 加速结构应用于高频电磁散射计算
2. **SBR + PO 方法**: 结合几何光学 (GO) 多反射射线传输与物理光学 (PO) 面积分
3. **GPU 并行化**: 在 NVIDIA 和 AMD GPU 上加速，MPI 分布式

## 技术方案

### 方法概述
- **Shooting and Bouncing Rays (SBR)**: 发射离散化入射射线，对目标进行镜面反射，捕捉多次相互作用
- **Physical Optics (PO)**: 在有效相交处评估物理光学表面积分
- **BVH 加速**: 减少大规模射线-表面相交搜索空间

### GPU 加速
- trace–integrate pipeline 架构
- 支持 NVIDIA 和 AMD GPU
- MPI 并行化

### 验证
- PEC (完美电导体) 球体的解析 Mie 解验证精度
- 复杂飞机几何的单基地雷达截面 (RCS) 预测演示

## 实验结论
- 在 D/λ ≫ 1 的高频场景有效
- GPU 加速显著提升性能
- 精度与解析解一致

## 局限性
- 主要适用于高频/几何光学regime
- 不处理衍射和强耦合

## 可行性分析
- 实现难度：中
- 性能预期：GPU 加速效果显著
- 适用场景：雷达截面预测，天线设计，无线信道建模

## 相关工作
- [[BVH]]
- [[Ray Tracing]]
- [[GPU Acceleration]]

## 笔记
**来源机构**: KTH Royal Institute of Technology (瑞典)
**会议**: ICCS 2026 扩展论文
**应用领域**: 计算电磁学，雷达技术，GPU 并行计算