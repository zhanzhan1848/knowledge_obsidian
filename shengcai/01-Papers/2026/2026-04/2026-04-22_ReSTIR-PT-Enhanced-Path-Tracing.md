---
title: ReSTIR PT Enhanced: Algorithmic Advances for Faster and More Robust ReSTIR Path Tracing
authors: Lin, et al.
date: 2026-04-22
source: NVIDIA Research / I3D 2026
url: https://research.nvidia.com/labs/rtr/publication/lin2026restirptenhanced/
pdf: https://research.nvidia.com/labs/rtr/publication/lin2026restirptenhanced/
tags: [rendering, path tracing, real-time rendering, ReSTIR, NVIDIA, 2026]
status: unread
---

# ReSTIR PT Enhanced: Algorithmic Advances for Faster and More Robust ReSTIR Path Tracing

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | ReSTIR PT Enhanced: Algorithmic Advances for Faster and More Robust ReSTIR Path Tracing |
| 作者 | Lin, et al. (NVIDIA Research) |
| 来源 | I3D 2026 (Proc. ACM Comput. Graph. Interact. Tech.) |
| 年份 | 2026 |
| 链接 | [原文](https://research.nvidia.com/labs/rtr/publication/lin2026restirptenhanced/) |

## 核心贡献
1. **Reciprocal Neighbor Selection**: 将空间复用成本减半
2. **Adaptive Ray Footprint Thresholds**: 根据场景几何和材质属性自适应调整
3. **Duplication Maps**: 减少时空相关性伪影
4. **Unified Direct/Global Illumination**: 统一ReSTIR用于直接光和间接光

## 技术方案

### 核心算法改进

**1. Reciprocal Neighbor Selection (互惠邻域选择)**
- 将空间复用成本减半
- 通过双向邻居选择实现更高效的采样复用

**2. Robust Shift Mappings**
- 基于足迹的重新连接标准
- 提高shift mapping的鲁棒性

**3. GPU优化**
- SM warp occupancy: 22.4% → 31.1% → 34.9%
- Active threads per warp: 15.3 → 19.9 → 20.6
- Warp latency: 347k → 241k → 82k cycles

**4. 存储优化**
- 原始: 2 × (88 + 16) bytes = 431 MB (1920×1080)
- 优化后: 2 × 64 bytes = 265 MB

## 实验结论

### 性能提升
| 技术 | 加速比 |
|------|--------|
| 基础 (Lin et al. 2022) | 1.0× |
| 低层GPU优化 | 2.74× |
| + Russian roulette | 进一步提升 |
| + Decorrelation/降噪 | 2.30× |

### 测试场景
- Opera House
- Bistro
- Gallery
- Kitchen

## 局限性
- 需要下一代GPU硬件支持
- 对传统非ReSTIR路径追踪器不适用

## 可行性分析
- 实现难度：中 (有开源代码基础)
- 性能预期：2-3×加速
- 适用场景：游戏实时渲染、下一代主机

## 相关工作
- [[Lin et al. 2022 - Generalized ReSTIR]]
- [[Wang et al. 2026 - Gradient-Domain ReSTIR]]
- [[Zeng et al. 2025 - ReSTIR PG]]

## 笔记

**生产就绪度**: 接近生产就绪 (Near Production Ready)

**对渲染领域的意义**:
- 将路径追踪性能提升至可接受的游戏帧率
- 为下一代游戏主机铺平道路
- 结合DLSS/帧生成可达4K/60fps
