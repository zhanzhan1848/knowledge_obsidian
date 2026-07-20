---
type: paper
created: 2026-07-20
updated: 2026-07-20
tags: [paper, ray-marching, Gaussian-Process, implicit-surfaces, rendering, SIGGRAPH-2026]
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
| **机构** | Nanjing University, UC Santa Barbara, MBZAI, Shandong University, Zhejiang University |
| **发表** | SIGGRAPH 2026 |
| **链接** | [项目页面](https://zhiminfan.work/) |

---

## 核心贡献

> 为高斯过程隐式曲面(GPIS)的光线步进提出分层伯努利冲激边界，显著加速GPIS的光线求交

1. 提出分层伯努利冲激(Stratified Bernoulli Impulses)用于GPIS的光线求交加速
2. 利用GPIS的统计特性构建更紧的包围体
3. 实现GPIS的高效光线步进

---

## 技术方案

### 核心思想

Gaussian Process Implicit Surfaces (GPIS) 是一种基于高斯过程的隐式曲面表示。与传统SDF不同，GPIS具有不确定性估计，可以利用统计特性加速光线步进。

### 关键技术

| 技术 | 说明 |
|------|------|
| Gaussian Process | 高斯过程建模 |
| Implicit Surface | 隐式曲面表示 |
| Ray Marching | 光线步进求交 |
| Bernoulli Impulses | 伯努利冲激边界 |

### 优势

- 利用GPIS的不确定性估计
- 分层策略提高效率
- 更紧的包围体减少步进次数

---

## 实现建议

- **实现难度**: 高
- **适用场景**: 不确定性感知渲染、科学可视化、机器人感知
- **推荐度**: ⭐⭐⭐⭐ GPIS渲染的重要突破

---

## 相关工作

- Gaussian Process Implicit Surfaces
- 隐式曲面光线步进
- 基于概率的渲染加速技术
