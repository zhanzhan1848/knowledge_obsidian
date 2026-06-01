---
tags: [运动合成, 文本生成, SIGGRAPH2026]
created: 2026-06-01
---

# MultiAct: Text-to-Motion Generation from Composite Text via Tailored Attention Guidance

## 论文信息
- **arXiv**: [2605.30925](https://arxiv.org/abs/2605.30925)
- **作者**: Nathan Sala
- **日期**: 2026-05-29
- **分类**: cs.CV, cs.GR
- **会议**: SIGGRAPH 2026
- **PDF**: [pdf](https://arxiv.org/pdf/2605.30925)

## 核心方法

### 问题定义
当前文本到动作生成模型在处理复合描述（多个同时动作）时表现不佳，经常忽略部分动作。

### 核心创新
1. **MultiAct** - 无配对、推理时框架
2. **自适应注意力放大** - 对 underrepresented 的提示组件进行交叉注意力增强
3. **轻量级辅助决策方案** - 自动确定最有效的注意力增强参数化

### 关键特性
- 无需重训练
- 不修改预训练运动生成器架构
- 推理时运行

## 实验结果
- 在复合提示上持续优于 baseline
- 更好的语义覆盖
- 保持运动真实性

## 项目主页
https://natsala13.github.io/multiact.github.io

## 相关笔记
[[运动合成, 文本生成]]