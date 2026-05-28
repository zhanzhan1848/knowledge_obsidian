---
title: ReSTIR PT Enhanced: Algorithmic Advances for Faster and Robust ReSTIR Path Tracing
authors: Zhimin Lin et al. (NVIDIA)
date: 2026
source: Symposium on Interactive 3D Graphics and Games (Proc. ACM Comput. Graph. Interact. Tech.) 2026
url: https://research.nvidia.com/labs/rtr/publication/lin2026restirptenhanced/
tags: [rendering, path-tracing, ReSTIR, I3D2026]
status: unread
---

# ReSTIR PT Enhanced: Algorithmic Advances for Faster and Robust ReSTIR Path Tracing

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | ReSTIR PT Enhanced: Algorithmic Advances for Faster and Robust ReSTIR Path Tracing |
| 作者 | Zhimin Lin et al. (NVIDIA) |
| 来源 | I3D 2026 (Proc. ACM Comput. Graph. Interact. Tech.) |
| 年份 | 2026 |
| 链接 | [原文](https://research.nvidia.com/labs/rtr/publication/lin2026restirptenhanced/) |

## 核心贡献
1. **2-3× 加速**: 通过多重算法改进和工程优化实现
2. ** reciprocal neighbor selection**: 将空间复用成本减半
3. **新 footprint-based reconnection criteria**: 使 shift mapping 更鲁棒
4. **duplication maps**: 减少时空相关性
5. **统一 direct/global illumination**: 合并到同一 reservoirs

## 技术方案
- ReSTIR PT 工程化改进集大成
- 结合 color noise 和 disocclusion noise reduction 技术
- 更接近 production-ready

## 实验结论
- 速度 2-3× 提升
- 视觉和数值误差均降低
- 更鲁棒，适用于实际生产

## 可行性分析
- 实现难度：低（纯算法改进，已在 Falcor 中实现）
- 性能预期：2-3× 提升，适合生产部署
- 适用场景：实时全局光照、游戏渲染引擎

## 相关工作
- [[ReSTIR]] [[Generalized ReSTIR]] [[Stochastic Pairwise MIS]]