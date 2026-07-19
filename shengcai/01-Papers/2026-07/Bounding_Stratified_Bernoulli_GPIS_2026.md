---
type: paper
created: 2026-07-19
updated: 2026-07-19
tags: [paper, rendering, ray-marching, Gaussian, implicit-surfaces]
status: processed
domain: rendering
agent: shengcai
source: https://zhiminfan.work/
---

# Bounding Stratified Bernoulli Impulses for Ray Marching Gaussian Process Implicit Surfaces

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Bounding Stratified Bernoulli Impulses for Ray Marching Gaussian Process Implicit Surfaces |
| **作者** | Junjie Chen, Zhimin Fan, Ling-Qi Yan, Junqiu Zhu, Yanwen Guo, Kun Zhou, Jie Guo |
| **发表** | SIGGRAPH Conference Papers '26 |
| **链接** | [Project Page](https://zhiminfan.work/) |

---

## 核心贡献

> 为高斯过程隐式曲面的光线步进提供快速、准确、鲁棒的边界方法

1. **分层 Bernoulli 脉冲**：提出分层 Bernoulli 脉冲边界方法
2. **GPU 实现友好**：专为 GPU 并行设计
3. **快速收敛**：减少迭代次数
4. **鲁棒性**：对各种 GPIS 配置稳定

---

## 技术方案

### 核心思想

Gaussian Process Implicit Surfaces (GPIS) 提供了灵活的隐式曲面表示，但光线步进收敛慢。本文提出分层 Bernoulli 脉冲边界，在保证准确性的同时显著加速。

### 关键技术

| 技术 | 说明 |
|------|------|
| Stratified Bernoulli Impulses | 分层脉冲边界 |
| Ray Marching | 光线步进求交 |
| GPIS | 高斯过程隐式曲面 |
| GPU Acceleration | GPU 并行优化 |

---

## 适用场景

- 神经渲染中的曲面表示
- 物理模拟中的隐式曲面
- 需要精确光线求交的渲染系统

---

## 实现建议

- **实现难度**: 中高
- **预期性能**: 显著加速 GPIS 光线步进
- **适用场景**: 神经渲染、隐式曲面渲染
