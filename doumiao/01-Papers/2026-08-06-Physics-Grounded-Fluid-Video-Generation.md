---
type: paper
created: 2026-08-06
updated: 2026-08-06
tags: [paper, video-generation, fluid-simulation, diffusion, physics]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2607.25321
---

# Physics-Grounded Fluid Video Generation with a Simulation Dataset and Dual-Stream Optical-Flow Supervision

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Physics-Grounded Fluid Video Generation with a Simulation Dataset and Dual-Stream Optical-Flow Supervision |
| **作者** | Ruijie Su 等 |
| **发表** | arXiv cs.AI (2026-07-28) |
| **链接** | [原文](https://arxiv.org/abs/2607.25321) |
| **DOI** | https://doi.org/10.48550/arXiv.2607.25321 |
| **代码** | - |

---

## 核心贡献

> 解决视频扩散模型生成流体时违反基本物理规律的问题

1. **物理仿真流体数据集**：1,638 个 MPM 仿真 pouring/sloshing 视频 + 2,320 个真实 pouring 视频
2. **双流图像到视频架构**：RGB 解码器 + 光流解码器分支
3. **端点误差和光滑性损失**：显式物理监督
4. **零初始化卷积融合**：保持预训练 backbone 不受干扰

---

## 技术方案

### 问题

视频扩散模型生成流体时经常违反基本物理规律：
- 液柱在空中断链
- 容器水位不随灌注上升
- 飞溅不考虑动量或重力

原因：大规模视频文本语料几乎不包含显式运动监督。

### 解决方案

**数据集构建**：
- MPM（物质点法）仿真生成 1,638 个 pouring/sloshing 视频
- 从库存素材挖掘 2,320 个真实灌注视频
- 测试集：1,515 真实视频基准 + 18 提示文本到首帧泛化基准

**双流架构**：
- 标准 RGB 解码器 + 轻量级光流解码器分支
- 通过零初始化卷积融合到 RGB 流
- 仅更新两个解码器，编码器/时序 transformer/文本编码器冻结

### 性能

- VideoPhy-2 物理常识分数提升 8.75 分
- 视频质量分数提升 4.65 分
- 人为主观偏好更高
- 光流端点误差低至 0.54 像素

---

## 相关工作

- [[fluid-simulation]]
- [[video-diffusion]]
- [[optical-flow]]

---

## 实现建议

- **实现难度**: 高（需扩散模型 + 流动物理知识）
- **预期性能**: 需 GPU 资源
- **适用场景**: 物理一致流体视频生成、数据增强
