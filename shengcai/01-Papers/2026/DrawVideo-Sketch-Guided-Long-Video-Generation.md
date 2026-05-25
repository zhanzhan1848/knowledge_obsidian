---
title: DrawVideo: Sketch-Guided Storyboard-Driven Controllable Long Video Generation
authors: Chuanzhi Xu, et al.
date: 2026-05-22
source: arXiv cs.GR
url: https://arxiv.org/abs/2605.23508
pdf: https://arxiv.org/pdf/2605.23508
tags: [video-generation, sketch, storyboard, AI, 2026]
status: unread
---

# DrawVideo: Sketch-Guided Storyboard-Driven Controllable Long Video Generation

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | DrawVideo: Sketch-Guided Storyboard-Driven Controllable Long Video Generation |
| 作者 | Chuanzhi Xu, et al. |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2605.23508) |
| PDF | [下载](https://arxiv.org/pdf/2605.23508) |

## 核心贡献
1. **草图引导的故事板驱动框架** - 可控长视频生成
2. **分解为独立可控镜头** - 每个镜头由黑白草图、外观提示、运动提示定义
3. **层次化策略** - "全局多镜头，局部单草图"
4. **SketchLongVideo 数据集** - 首个草图引导的文本到长视频数据集

## 技术方案

### 控制系统
- 草图：控制姿态和布局
- 外观提示：定义身份、场景、风格
- 运动提示：指导时间动态

### 生成流程
1. 生成结构对齐的参考关键帧
2. 将运动提示扩展为代表动作状态的衍生关键帧
3. 在相邻关键帧之间合成剪辑构建每个镜头

## 实验结论
- 实现了强大的结构可控性
- 外观一致性
- 视觉稳定性
- 连贯的长视频生成

## 可行性分析
- 实现难度：中（深度学习方法）
- 适用场景：视频生成、动画制作

## 笔记
AI 生成方向，与渲染直接关联有限，但草图控制思路值得参考。