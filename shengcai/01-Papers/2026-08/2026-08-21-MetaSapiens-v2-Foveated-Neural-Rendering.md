---
title: MetaSapiens v2: Real-Time Foveated Neural Rendering
authors: Weikai Lin, Jiamin Wu, Yinda Zhang, Chenfeng Xu, Zann Liu, Yiro Kwon, Lingjie Liu, Chengfei Lv, Xin Jin, Yong-Jin Liu
date: 2026-08-18
source: arXiv
url: https://arxiv.org/abs/2608.17969
pdf: https://arxiv.org/pdf/2608.17969
tags: [rendering, neural-rendering, foveated-rendering, VR, AR, real-time]
status: unread
---

# MetaSapiens v2: Real-Time Foveated Neural Rendering

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Advancing Real-Time Foveated Neural Rendering via Foveation-Aware Pruning and Stereo Warping |
| 作者 | Weikai Lin, Jiamin Wu, Yinda Zhang, Chenfeng Xu, Zann Liu, Yiro Kwon, Lingjie Liu, Chengfei Lv, Xin Jin, Yong-Jin Liu |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2608.17969) |
| PDF | [下载](https://arxiv.org/pdf/2608.17969) |

## 核心贡献
1. **效率感知剪枝技术**: 优化渲染速度
2. **foveated rendering方法**: 针对PBNR的高效基元，利用人眼周边视觉低敏感度特性
3. **选择性warping方法**: 利用双眼冗余减少AR/VR双目渲染计算开销
4. **双目foveated rendering加速器设计**: 解决PBNR负载不平衡问题

## 技术方案
**背景**: Point-Based Neural Rendering (PBNR)是AR/VR和数字孪生实时照片级渲染的有前景技术，但在VR/AR设备上实现实时渲染仍具挑战。

**方法**:
1. 效率感知剪枝优化渲染速度
2. 针对PBNR的foveated rendering方法，利用周边视觉低敏感度放松渲染质量提高速度
3. 利用双眼冗余提出选择性warping方法
4. 加速器设计解决负载不平衡问题，支持高效双目渲染

## 实验结论
- 在保持视觉质量的同时实现数量级加速
- 可应用于VR/AR实时渲染

## 局限性
- 针对特定PBNR系统
- 依赖于foveated rendering精度

## 可行性分析
- 实现难度：中
- 性能预期：数量级加速
- 适用场景：VR/AR实时神经渲染、数字孪生

## 相关工作
- Point-Based Neural Rendering (PBNR)
- Foveated Rendering
- MetaSapiens

## 笔记
**重要**: 对于VR/AR应用场景的实时渲染有重要参考价值。foveated rendering结合神经渲染是未来趋势。
