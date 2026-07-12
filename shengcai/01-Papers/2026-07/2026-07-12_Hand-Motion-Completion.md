---
title: Prior-First, Condition-Second Scalable and Controllable Hand Motion Completion
authors: Mingyi Shi, et al.
date: 2026-07-07
source: Computer Graphics Forum (CGF)
url: https://arxiv.org/abs/2607.05938
pdf: https://arxiv.org/pdf/2607.05938
tags: [rendering, animation, hand-motion, motion-completion, body-hand-prior, 2026]
status: unread
---

# Prior-First, Condition-Second: Scalable and Controllable Hand Motion Completion

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Prior-First, Condition-Second: Scalable and Controllable Hand Motion Completion |
| 作者 | Mingyi Shi, et al. |
| 来源 | Computer Graphics Forum (CGF) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2607.05938) |
| PDF | [下载](https://arxiv.org/pdf/2607.05938) |

## 核心贡献
1. 提出"先验优先，条件第二"框架用于身体条件手部运动补全
2. 从大规模非结构化和无标签运动数据中学习通用身体-手部运动先验
3. 通过轻量级适配器引入语义控制，避免为每个控制界面重新学习运动结构
4. 支持实时推理和交互式创作工作流

## 技术方案
核心框架：
- **流式自回归身体-手部先验**：从身体动力学实时生成连贯、动力学一致的手部运动
- **结构化运动建模**：维持机械身体-手部耦合
- **语义分层适配器**：在适当运动层级注入条件信号
  - 自监督属性控制
  - 弱监督文本驱动控制

## 实验结论
在低资源和跨数据集设置下，相比端到端条件基线，提高了运动可信度、鲁棒性和可控性。

## 可行性分析
- 实现难度：中
- 性能预期：支持实时推理
- 适用场景：生产动画管线、角色动画、手势控制

## 相关工作
- [[Hand Motion]]
- [[Motion Completion]]
- [[Character Animation]]

## 笔记
**项目主页**：https://AIGAnimation.github.io/HandPrior/
**DOI**：10.1111/cgf.70568
