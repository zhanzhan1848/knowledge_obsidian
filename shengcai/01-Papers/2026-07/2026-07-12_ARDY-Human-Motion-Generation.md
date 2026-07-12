---
title: Autoregressive Diffusion with Hybrid Representation for Interactive Human Motion Generation
authors: Kaifeng Zhao, et al.
date: 2026-07-09
source: ACM Transactions on Graphics (SIGGRAPH 2026)
url: https://arxiv.org/abs/2607.08741
pdf: https://arxiv.org/pdf/2607.08741
tags: [rendering, motion-generation, diffusion, AR, interactive, humanoid, 2026]
status: unread
---

# ARDY: Autoregressive Diffusion with Hybrid Representation for Interactive Human Motion Generation

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Autoregressive Diffusion with Hybrid Representation for Interactive Human Motion Generation |
| 作者 | Kaifeng Zhao, et al. |
| 来源 | ACM Transactions on Graphics (SIGGRAPH 2026) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2607.08741) |
| PDF | [下载](https://arxiv.org/pdf/2607.08741) |

## 核心贡献
1. 提出ARDY框架：流式生成框架，通过在线文本提示和灵活运动约束实现高保真运动生成
2. 混合表示：结合显式根特征与潜在身体嵌入，平衡精确轨迹控制与高效生成学习
3. 两阶段自回归变换器去噪器：支持可变历史上下文和灵活长时运动约束条件
4. 在HumanML3D基准和Bones Rigplay数据集上验证了高运动质量和约束遵循性

## 技术方案
ARDY核心设计：
- **混合表示**：显式根特征 + 潜在身体嵌入
- **两阶段自回归去噪器**：可变历史上下文
- **灵活长时运动约束条件**：支持关键帧姿势约束、路径跟随、鼠标键盘交互

## 实验结论
在HumanML3D基准和大规模高保真Bones Rigplay数据集上验证了高运动质量和约束遵循性。

## 可行性分析
- 实现难度：中
- 性能预期：支持流式生成和在线提示
- 适用场景：动画、仿真、人形机器人、人机交互

## 相关工作
- [[Motion Generation]]
- [[Diffusion Models]]
- [[Human Motion]]

## 笔记
**项目主页**：https://research.nvidia.com/labs/sil/projects/ardy/
**DOI**：10.1145/3811284
