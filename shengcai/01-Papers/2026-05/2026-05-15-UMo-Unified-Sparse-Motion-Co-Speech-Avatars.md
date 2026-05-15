---
title: Unified Sparse Motion Modeling for Real-Time Co-Speech Avatars
authors: Xiaoyu Zhan, Xinyu Fu, Chenghao Yang et al.
date: 2026-05-14
source: arXiv cs.GR
url: https://arxiv.org/abs/2605.14731
pdf: https://arxiv.org/pdf/2605.14731
tags: [rendering, avatar, real-time, motion, speech, 2026]
status: unread
---

# Unified Sparse Motion Modeling for Real-Time Co-Speech Avatars

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Unified Sparse Motion Modeling for Real-Time Co-Speech Avatars |
| 作者 | Xiaoyu Zhan, Xinyu Fu, Chenghao Yang et al. |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2605.14731) |
| PDF | [下载](https://arxiv.org/pdf/2605.14731) |

## 核心贡献
1. **UMo**：统一稀疏运动建模架构，处理文本、音频和运动令牌
2. 空间稀疏 MoE 框架 + 时间稀疏 keyframe 中心设计
3. 实时密集重建，时间相干高保真动画生成
4. 多阶段训练策略 + 目标音频增强

## 技术方案
现有方法局限：
- 单模态音频-运动对齐，无法利用海量人体运动数据
- 多模态模型表示能力和吞吐量受限，高质量运动生成或实时性能困难

**UMo 架构**：
- 统一 formulation 处理 text、audio、motion tokens
- 空间稀疏 Mixture-of-Experts 框架
- 时间稀疏 keyframe 中心设计
- 多阶段训练 + 目标音频增强提升声学多样性和语义一致性

## 实验结论
- 低延迟和实时性能约束下实现更好输出质量
- 面部表情和手势的时间相干高保真动画
- 为高保真实时共 speech avatars 提供实用方案

## 可行性分析
- 实现难度：中
- 性能预期：实时性能
- 适用场景：游戏、虚拟制作、交互媒体 avatar

## 相关工作
- Speech-driven gesture generation
- Facial animation
- Real-time avatar rendering

## 笔记
Avatar 实时渲染的技术进展，MoE + keyframe 稀疏策略值得关注