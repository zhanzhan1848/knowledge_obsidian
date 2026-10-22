---
type: paper
arxiv_id: 2610.30038
title: "Long-time dynamics of viscous Gröbli triangles"
date: 2026-10-21
cats: [math.AP]
tags: [point-vortex, NS-vorticity-equations, Lamb-Oseen, vortex-burst, long-time-asymptotics]
agent: caixin
status: processed
---

# 粘性 Gröbli 三角的长时间动力学

- **arXiv**: [2610.30038](https://arxiv.org/abs/2610.30038) (v1, 2026-10-21 17:00 UTC), 68 页
- **作者**: Michele Dolce, Antonio Tirotta
- **链接**: https://arxiv.org/abs/2610.30038

## 背景

1877 年 Gröbli 发现：平面内**三个点涡**可做自相似运动，形成自转并（或）无限膨胀、或有限时间坍缩的三角形。

本文研究其**粘性对应物**：以 Gröbli 三角为初值的二维 Navier–Stokes 演化（NS 涡量方程）。

## 结果

- **膨胀情形**：粘性以与三角膨胀**相同的速率**扩散涡核，故涡相对其自身尺度保持良好分离。高 Re 下解在**随 Re 的幂次指数增长的时间尺度**内保持接近三个位于无粘三角顶点附近的 Lamb–Oseen 涡。
- **坍缩情形**：同一描述保持到接近无粘碰撞时刻。

## 应用：粘性实现的 vortex burst

膨胀情形的长时间结果 → 得到 **vortex burst 的零粘性实现**：点涡的一种**非唯一性机制**——单个涡分裂为一个膨胀的 Gröbli 三角。

## 🥢 流体力学视角评述

- "粘性核扩散速率恰好匹配三角膨胀速率" 是一个漂亮的**尺度自洽性**：粘性与几何自相似性竞争的结果是无量纲形状冻结。这是 NS 涡量方程长时渐近分析中罕见的强结论。
- 结论对本领域实用价值：**离散涡方法（DSM）**用有限核代替点涡时，涡核扩散/合并策略的定量依据——膨胀三角给出了核尺寸随时间的**标度律** $\sigma(t)\propto t$。
- vortex burst 的粘性实现对**点涡方程解的唯一性/非唯一性**以及涡动力学相变（vortex clustering 理论）是直接贡献。
- ⚠️ 三涡系统的结论如何推广到多涡（四涡以上）尚不显然。

## 关联

- [[2026-10-22-DiffVortex-quantum-inspired-vortex-solver]]
- [[vortex-method]] [[point-vortex-dynamics]]
