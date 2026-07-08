---
type: paper
created: 2026-07-08
updated: 2026-07-08
tags: [rendering, relighting, differentiable-rendering, neural-network, production-pipeline]
status: processed
domain: rendering
agent: shengcai
source: https://studios.disneyresearch.com/2026/07/01/neural-render-proxies-for-interactive-and-differentiable-lighting/
---

# Neural Render Proxies for Interactive and Differentiable Lighting

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Neural Render Proxies for Interactive and Differentiable Lighting |
| **作者** | Sergio Sancho, Alexander Rath, Marco Manzi, Pascal Chang, Amit H. Bermano, Derek Nowrouzezahrai, Markus Gross, Marios Papas |
| **发表** | Eurographics Symposium on Rendering (EGSR) 2026 |
| **链接** | [原文](https://studios.disneyresearch.com/2026/07/01/neural-render-proxies-for-interactive-and-differentiable-lighting/) |

---

## 核心贡献

> 提出 Neural Render Proxy (NRP)，实现静态场景的可微分重光照，交互速率 30-60 Hz

1. 将传统渲染解耦为路径采样和发射计算
2. 从单次光无关渲染通道收集路径采样数据
3. 训练轻量神经网络学习光传输
4. 兼容非可微分生产渲染器
5. 支持快速梯度逆工作流

---

## 技术方案

### 核心思想

在 CG 动画制作中，即使是微小调整也需要重新渲染巨大场景，GI 采样和复杂着色器导致每帧迭代时间达分钟到小时级。

本文方法：
- 核心洞察：解耦传统渲染为路径采样和发射计算
- 从单次光无关通道收集路径采样数据
- 训练场景特定轻量网络学习光传输
- 推理内存需求小，仅随分辨率和光源数量缩放

### 关键技术

| 技术 | 说明 |
|------|------|
| Neural Render Proxy (NRP) | 神经渲染代理 |
| Path Sampling | 路径采样 |
| Light Transport | 光传输学习 |
| Differentiable Relighting | 可微分重光照 |
| Inverse Workflow | 梯度逆工作流 |

---

## 实验结论

- 交互式重光照帧率 30-60 Hz
- 视觉保真度接近 ground-truth 路径追踪
- 支持从直观图像空间编辑或生成目标快速求解光照参数

---

## 局限性

- 需要单次光无关渲染通道作为输入
- 场景特定训练，非通用

---

## 实现建议

- **实现难度**: 中等（需渲染 + 深度学习）
- **预期性能**: 交互速率，质量接近离线渲染
- **适用场景**: 电影/动画制作光照迭代、产品可视化
- **优先度**: 高（Disney 研究，实用性强）
