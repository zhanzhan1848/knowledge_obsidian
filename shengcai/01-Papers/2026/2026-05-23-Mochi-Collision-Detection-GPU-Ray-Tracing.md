---
title: Mochi: Rethinking Collision Detection on GPU Ray Tracing Architecture
authors: Durga Mandarapu, Isaac Fuksman, Artem Pelenitsyn, Gilbert Bernstein, Milind Kulkarni
date: 2026-04
source: arXiv / ICS 2026
url: https://arxiv.org/abs/2604.23520
pdf: https://arxiv.org/pdf/2604.23520.pdf
tags: [rendering, collision-detection, BVH, GPU, ray-tracing, 2026]
status: unread
---

# Mochi: Rethinking Collision Detection on GPU Ray Tracing Architecture

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Mochi: Rethinking Collision Detection on GPU Ray Tracing Architecture |
| 作者 | Durga Mandarapu, Isaac Fuksman, Artem Pelenitsyn, Gilbert Bernstein, Milind Kulkarni |
| 来源 | arXiv / ICS 2026 |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2604.23520) |
| PDF | [下载](https://arxiv.org/pdf/2604.23520.pdf) |

## 核心贡献
1. **利用碰撞对称性**: 碰撞关系是对称的，只需一个物体检测碰撞（而非两个）
2. **Per-object Proxy Spheres**: 解耦 BVH 包围盒与碰撞搜索半径，实现更紧致的包围盒
3. **统一支持均匀/非均匀球体**: 避免为非均匀球体构建过大的保守包围盒

## 技术方案

### 背景
- 离散碰撞检测 (DCD) 是粒子物理模拟、计算机图形等的基础任务
- 传统方法使用 BVH 索引，但 GPU shader core 加速面临 irregular control flow 和 memory access patterns 挑战
- 现代 GPU 配备专用射线追踪 (RT) 架构，可加速 BVH 遍历

### 现有方法局限
- 之前工作将 DCD 归约为固定半径邻居搜索
- 适用于均匀球体，但不适用于非均匀球体
- 需要将非均匀球体近似为大"足够"的均匀球体 → 质量差 + 性能低

### Mochi 方法
```cpp
// 关键思想：per-object proxy sphere
proxy_radius = collision_search_radius - object_radius;
// 这样 BVH 包围盒与实际碰撞搜索半径解耦
```

- 利用碰撞对称性：只需一个物体检测碰撞
- Per-object proxy spheres 提供更紧致包围盒
- 数学可证明正确性：保证检测所有真实碰撞

## 实验结论
- 在大规模粒子工作负载上持续加速
- 超越 SOTA BVH-based 和 RT-based DCD 实现
- 统一支持均匀和非均匀球体

## 局限性
- 针对球体粒子系统设计
- 需要 GPU RT 硬件支持

## 可行性分析
- 实现难度：中 (需要理解 GPU RT 架构)
- 性能预期：显著加速碰撞检测
- 适用场景：粒子模拟，物理仿真，实时渲染

## 相关工作
- [[BVH]]
- [[GPU Ray Tracing]]
- [[Particle Simulation]]

## 笔记
**来源机构**: Purdue University, University of Washington
**会议**: ICS 2026 (International Conference on Supercomputing)
**应用领域**: GPU 计算，粒子系统，物理模拟