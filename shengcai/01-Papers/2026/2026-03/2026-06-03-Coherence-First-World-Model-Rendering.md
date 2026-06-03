---
tags: [渲染, 帧生成, AI, 世界模型, 2026]
date: 2026-06-03
status: 待读
---

# Coherence-First World-Model Rendering with Model-Guided FSR4 Frame Generation

## 元信息
| 标题 | 值 |
|------|-----|
| 作者 | Paweł Katarzyński |
| 链接 | [arXiv:2606.02586](https://arxiv.org/abs/2606.02586) |
| 分类 | cs.GR (Graphics) |
| 日期 | 2026-05-11 |

## 核心贡献

1. **Coherence-first 渲染策略**: 在受限推理预算下生成更高质量的世界模型帧
2. **15 FPS 锚帧生成**: 以 15 FPS 生成高上下文锚帧
3. **FSR4 重建**: 使用 latent-delta 运动引导和合成深度将帧率重建至 30 FPS
4. **与 Overworld 集成**: 使用 Overworld's Waypoint-1.5 和 WorldEngine 运行时

## 技术方案

### 问题
世界模型通常按原生帧率评估，但更高的标称帧率可能牺牲长期场景稳定性。

### 方法对比
| 方法 | 帧率 | 质量 |
|------|------|------|
| Coherence-first | 15 FPS 锚帧 → 30 FPS | 保持路径几何、物体一致性、大轮廓、深度层次 |
| Cadence-first | ~30 FPS 原生 | 较早退化，出现亮度漂移和几何失真 |

### 关键指标
- LPIPS: Coherence-first 在所有测试场景中更优
- 计算归一化: 相同 GPU、相同时间尺度的操作点

### 局限性
- 剑击场景探测显示局部非单调性: 更多上下文和去噪并不自动改善质量
- 这是概念验证，不是成熟的实时渲染器

## 实用性评估

- **实现难度**: 中 (需要 FSR4 集成)
- **性能表现**: 在受限预算下质量更稳定
- **适用场景**: 游戏世界模型、虚拟环境生成

## 标签
#帧生成 #FSR4 #世界模型 #实时渲染 #AMD #AI
