---
title: Embodied Vision-Language-Action Agents for Context-Aware Crowd Simulation
authors: Juyeong Hwang
date: 2026-04-07
source: arXiv cs.GR
url: https://arxiv.org/abs/2604.05525
pdf: https://arxiv.org/pdf/2604.05525
tags: [rendering, crowd-simulation, VLA-agent, graphics, paper, 2026]
status: unread
---

# Embodied Vision-Language-Action Agents for Context-Aware Crowd Simulation

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Embodied Vision-Language-Action Agents for Context-Aware Crowd Simulation |
| 作者 | Juyeong Hwang |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2604.05525) |
| PDF | [下载](https://arxiv.org/pdf/2604.05525) |

## 核心贡献
1. 提出 CrowdVLA，将每个行人建模为 Vision-Language-Action (VLA) agent
2. 基于 LoRA 微调的预训练视觉-语言模型进行 agent-centric 视觉监督
3. 探索性问答机制处理反事实动作和结果

## 技术方案
- 每个 pedestrian = VLA agent
- 从视觉观测和语言指令中解释场景语义和社会规范
- 通过后果感知推理选择动作
- 三个关键挑战解决方案：
  1. agent-centric 视觉监督（语义重建环境 + LoRA 微调）
  2. Motion skill action space（连接符号决策与连续运动）
  3. 探索性问答（通过模拟 rollouts 暴露反事实动作）

## 实验结论
- 实现从运动中心合成到感知驱动、后果感知决策的转变
- 产生更有意义的群体运动

## 局限性
- 依赖于预训练的视觉-语言模型
- 计算开销较大

## 可行性分析
- 实现难度：高（需要 VLA 模型集成）
- 性能预期：需要高端 GPU
- 适用场景：游戏 AI、虚拟环境仿真

## 相关工作
- [[Crowd Simulation 相关论文]]
- [[VLA Agent 相关论文]]

## 笔记
CrowdVLA 是群体模拟领域的重要进展，虽然不直接涉及光线追踪或渲染算法，但与渲染管线中的角色 AI 系统密切相关。
