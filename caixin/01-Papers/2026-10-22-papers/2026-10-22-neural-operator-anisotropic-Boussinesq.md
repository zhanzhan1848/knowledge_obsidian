---
type: paper
arxiv_id: 2610.29938
title: "A PDE-theory-guided neural operator and the long-time relaxation of the two-dimensional anisotropic Boussinesq system"
date: 2026-10-21
cats: [math.AP, math.NA]
tags: [neural-operator, Boussinesq, anisotropic-dissipation, PDE-guided, long-time-relaxation]
agent: caixin
status: processed
---

# PDE 理论引导的神经算子：二维各向异性 Boussinesq 长时间弛豫

- **arXiv**: [2610.29938](https://arxiv.org/abs/2610.29938) (v1, 2026-10-21 16:08 UTC)
- **作者**: Akram Moustafa, Jiahong Wu, Xiaoming Zheng
- **链接**: https://arxiv.org/abs/2610.29938

## 理论结果

二维 Boussinesq（周期盒，**各向异性耗散**）：流最终弛豫到**层结剪切流**。

- 水平平均涡量保持在初始值 $\bar\omega_0$ 的 $O(\varepsilon^2)$ 内
- 其上振荡量级为 $O(\varepsilon)$（$\varepsilon$ = 静力平衡扰动幅度）

## 网络设计（关键在于"匹配理论"）

网络输出**显式拆成三部分**：

$$\hat\omega \approx \bar\omega_0 \;+\; \underbrace{O(\varepsilon)}_{\text{oscillation}} \;+\; \underbrace{O(\varepsilon^2)}_{\text{secular}}$$

两部分各自按其真实量级缩放。网络把静力平衡附近的小扰动映射到晚时刻涡量。

## 结果

- **若无理论引导**：训练要么不收敛，要么**漏掉 $\varepsilon^2$ 的长期增长**
- **有引导**：单一网络在 $2\times10^3$ 次测试运行（振幅跨 **23 倍**）上，对理论界定的量给出中位误差 **2.2%**
- 网络对初始数据可微 → 用于**搜索初始数据空间**，每个候选由求解器校验，找到该量达测试集最大值 **4.4 倍** 的初值，**把定理常数下界提高了这一倍数**

## 🥢 流体力学视角评述

- 这是"PDE 理论引导 ML"的**教科书级示范**：理论不仅提供损失项，而是**决定网络输出架构的分解方式**（$\bar\omega_0$ / $O(\varepsilon)$ / $O(\varepsilon^2)$ 三段式）。凡是渐近展开有明确多尺度结构的 PDE，这个套路都可复用。
- 网络可微 + 可搜索初值 = 反向问题（最优初值/敏感性）的新工具；"用 PDE 求解器校验每个候选"是关键的正确性兜底，避免纯 ML 搜索失控。
- 各向异性耗散的 Boussinesq 与真实海洋/大气环流的各向异性粘性接近，理论有现实意义。
- ⚠️ 2.2% 中位误差需与所用时间积分器的数值耗散区分。

## 关联

- [[2026-10-22-DEScover-agentic-AI-subgrid]]
- [[neural-operator]] [[Boussinesq-convection]]
