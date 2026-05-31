---
title: ClothTransformer: Unified Latent-Space Transformers for Scalable Cloth Simulation
authors: Yu Zhang
date: 2026-05-27
source: arXiv cs.GR
url: https://arxiv.org/abs/2605.27852
pdf: https://arxiv.org/pdf/2605.27852
tags: [rendering, simulation, cloth, transformer, neural, paper, 2026]
status: unread
---

# ClothTransformer: Unified Latent-Space Transformers for Scalable Cloth Simulation

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | ClothTransformer: Unified Latent-Space Transformers for Scalable Cloth Simulation |
| 作者 | Yu Zhang |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2605.27852) |
| PDF | [下载](https://arxiv.org/pdf/2605.27852) |

## 核心贡献
1. **统一 Transformer架构**：单一模型处理多种场景（身体驱动服装、机器人操作、自由落体碰撞）
2. **可扩展 latent-space formulation**：将任意分辨率网格压缩为固定大小 latent tokens
3. **高精度无穿透数据集**：~493.4k 帧，覆盖三种设置
4. **可微分 CCD 模块**：抑制穿透伪影
5. 错误率比 SOTA 方法低 **4-9x**

## 技术方案

### Latent-Space Formulation
- 将网格压缩为固定大小 latent tokens
- 时序动态计算与网格分辨率解耦

### 三场景统一
- 身体驱动服装
- 机器人操作
- 自由落体碰撞

### 连续碰撞检测 (CCD)
- 可微分模块
- 抑制穿透

## 实验结论
- 4-9x 更低错误率
- 统一模型处理多种场景
- ~493.4k 帧数据集

## 可行性分析
- 实现难度：高（Transformer 架构）
- 性能预期：4-9x 精度提升，适合实时布料模拟
- 适用场景：游戏引擎、电影制作、虚拟试衣

## 相关工作
- [[Cloth Simulation]]
- [[Transformer]]
- [[Neural Cloth]]