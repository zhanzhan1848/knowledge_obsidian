---
type: paper
created: 2026-07-17
updated: 2026-07-17
tags: [paper, neural-rendering, differentiable, global-illumination, path-tracing, rendering]
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
| **作者** | Sergio Sancho (ETH Zurich/DisneyResearch), Alexander Rath, Marco Manzi, Pascal Chang, Amit H. Bermano, Derek Nowrouzezahrai, Markus Gross, Marios Papas |
| **发表** | Eurographics Symposium on Rendering (EGSR) 2026 |
| **链接** | [项目页面](https://studios.disneyresearch.com/2026/07/01/neural-render-proxies-for-interactive-and-differentiable-lighting/) |

---

## 核心贡献

> 神经渲染代理(NRP)实现静态场景的实时可微分重光照

1. **解耦路径采样和发射计算**: 核心洞察
2. **单次光无关渲染pass**: 收集路径样本形式的光传输数据
3. **轻量级神经网络**: 学习从任意场景位置到任意像素的光传输
4. **可微分NRP**: 支持快速梯度基逆workflow

---

## 技术方案

### 核心思想

传统渲染中，即使微小调整也需要重新渲染大场景，全局光照采样和复杂着色器导致每帧迭代时间达分钟到小时级。NRP通过**解耦**和**学习**加速这一过程。

### Pipeline

1. 从**单次光无关渲染pass**收集路径样本
2. 实时采样光照条件
3. 训练场景特定轻量级神经网络学习光传输
4. 推理时与场景复杂度无关，仅依赖分辨率、光源数和参数

### 关键技术

| 技术 | 说明 |
|------|------|
| 路径采样 | 从单次pass收集光传输数据 |
| 神经网络光传输 | 场景特定的轻量网络 |
| 可微分渲染 | 梯度基优化 |
| Split-sum近似 | 间接光照计算 |

### 性能

- **30-60 Hz** 重光照帧率
- 接近地面真值路径追踪的视觉保真度
- 推理时内存需求极小

---

## 实验结论

- 交互帧率实现可微分重光照
- 兼容非可微的生产渲染器
- 支持快速梯度基逆workflow

---

## 局限性

- 场景特定训练
- 需要预计算光传输数据

---

## 实现建议

- **实现难度**: 中
- **适用场景**: 电影/动画光照设计、交互式重光照
- **推荐度**: ⭐⭐⭐⭐⭐
