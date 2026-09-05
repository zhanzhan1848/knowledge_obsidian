---
title: Reparametrizing 3D Gaussian Splatting for Real-Time Palette-based Color and Luminance Editing
authors: Cheng-Kang Ted Chao et al.
date: 2026-09-03
source: SIGGRAPH Asia 2026
url: https://arxiv.org/abs/2609.03897
pdf: https://arxiv.org/pdf/2609.03897
tags: [rendering, 3DGS, color-editing, relighting, SIGGRAPH-Asia-2026, 2026]
status: unread
---

# Reparametrizing 3D Gaussian Splatting for Real-Time Palette-based Color and Luminance Editing

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Reparametrizing 3D Gaussian Splatting for Real-Time Palette-based Color and Luminance Editing |
| 作者 | Cheng-Kang Ted Chao et al. |
| 来源 | SIGGRAPH Asia 2026 |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2609.03897) \| [ACM](https://doi.org/10.1145/3829340.3842202) |

## 核心贡献
1. **实时交互式调色板着色框架**：支持基于调色板的重新着色、per-palette 色调曲线和像素级颜色约束
2. **球谐重参数化**：将预训练 vanilla 3DGS 的球谐函数重参数化为视图相关调色板权重
3. **视图空间稀疏性**：解决 primitive 空间方法中 alpha 混合破坏 per-Gaussian 稀疏性导致编辑渗入意外区域的核心局限
4. **独立亮度控制**：per-palette 颜色独立亮度控制 + 视图一致像素级约束

## 技术方案

**方法流程**:
1. 不从头训练新表示，而是重参数化预训练 vanilla 3DGS 的球谐函数
2. 编码视图相关调色板权重
3. 通过图像空间稀疏性损失同时求解权重和调色板颜色
4. 亮度编辑：沿消色差轴的 per-pixel 权重偏移

**等价性证明**: per-pixel 权重偏移等价于 per-pixel 调色板感知亮度编辑。

**优化器**: IRLS + 阻尼块坐标下降，tone curves 和调色板偏移在视图空间稀疏约束下耦合。

**性能**: 编辑在数十毫秒内运行；可 baked back 为 vanilla 3DGS，兼容标准 viewer。

**优势对比**:
- 比 prior palette-based 3DGS 方法更稀疏、更局部化的编辑
- 支持独立 per-palette 颜色亮度控制
- 支持视图一致像素级约束（3DGS 此前不具备）

## 可行性分析
- 实现难度：中等（需重参数化 SH 和优化器设计）
- 性能预期：实时交互（数十毫秒）
- 适用场景：专业颜色编辑、PBR 材质调整、实时光照调整

## 相关工作
- [[2026-09-05_TileGS_Tile-Local-Depth-Binning-GS]]
- [[2026-09-05_LightBridge_Feed-Forward-Relighting-3DGS]]
- [[2025-06_Stochastic-Ray-Tracing-of-Transparent-3D-Gaussians]]

## 笔记
SIGGRAPH Asia 2026 论文。调色板编辑是影视/游戏行业的强需求，视图空间稀疏性约束是关键创新点，避免了 primitive 空间方法中 alpha 混合导致的编辑渗透问题。
