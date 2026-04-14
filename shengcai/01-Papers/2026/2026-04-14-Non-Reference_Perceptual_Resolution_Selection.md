---
type: paper
created: 2026-04-14
updated: 2026-04-14
tags: [paper, perceptual-quality, resolution-scaling, power-efficiency, client-rendering]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.07959
---

# Non-Reference Perceptual Resolution Selection for Power-Efficient Client-Side Rendering

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | non-reference perceptual resolution selection for power-efficient client-side rendering |
| **作者** | Yaru Liu et al. |
| **发表** | arXiv cs.GR 2026 |
| **链接** | [原文](https://arxiv.org/abs/2604.07959) |

---

## 核心贡献

> 提出无需参考的非参考方法，从渲染视频预测最低感知不可区分分辨率，实现节能客户端渲染

1. 利用人类视觉系统的时空限制
2. 无需参考即可预测最低感知不可区分分辨率
3. 编解码器无关，仅需对现有基础设施进行最小修改
4. 大规模渲染内容数据集训练，标签为全参考感知视频质量指标

---

## 技术方案

### 核心思想

现有感知视频质量指标可以指示何时较低分辨率"足够好"，但它们是全参考的且计算成本高昂，不适合实际应用。本方法从渲染视频本身预测最低感知不可区分分辨率。

### 关键技术

| 技术 | 说明 |
|------|------|
| 人类视觉系统建模 | 利用时空感知限制 |
| 非参考预测 | 无需原始高分辨率参考 |
| 感知质量导向 | 显著提升感知质量同时降低计算成本 |
| 编解码器无关 | 适用于各种渲染管线 |

---

## 实验结论

- **方法**: 在大规模渲染内容上训练网络
- **标签**: 全参考感知视频质量指标
- **结果**: 显著提升感知质量，同时大幅降低计算成本
- **应用**: 感知引导的节能客户端渲染

---

## 实现建议

- **实现难度**: 中等 (需要视觉系统模型 + 神经网络)
- **适用场景**: 移动游戏、云游戏、VR/AR、低功耗设备
- **价值**: 可显著延长移动设备电池寿命

---

## 相关工作

- [[Perceptual Quality Metrics]]
- [[Adaptive Rendering]]
- [[Power Efficiency]]
- [[Client-side Rendering]]