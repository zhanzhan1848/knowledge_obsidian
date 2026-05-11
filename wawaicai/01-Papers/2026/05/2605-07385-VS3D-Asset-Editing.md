---
type: paper
created: 2026-05-11
updated: 2026-05-11
tags: [paper, 3D-editing, generative-model, velocity-field, ODE-sampler]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2605.07385
---

# VS3D: Velocity-Space 3D Asset Editing

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Velocity-Space 3D Asset Editing |
| **作者** | Hao Liu et al. |
| **发表** | arXiv cs.GR (2026) |
| **链接** | [原文](https://arxiv.org/abs/2605.07385) |

---

## 核心贡献

> 提出 VS3D，一种在 ODE sampler 内部进行局部 3D 资产编辑的框架

1. **RASI**: 重建锚定源注入，吸收 identity leakage
2. **PMG**: 部分均值引导，放大编辑信号
3. **TAR**: 双一致性残差注入，在几何和材质阶段保留内容

---

## 技术方案

### 核心思想

对于 rectified-flow 生成器，速度场应该在编辑区域强，在保留内容上消失

三个问题：
1. Identity leakage: 编辑信号在保留区域非零
2. 缺少专门的编辑放大通道
3. 几何和材质阶段的 identity drag

解决方案：在 ODE sampler 内部进行针对性干预

### 关键技术

| 技术 | 说明 |
|------|------|
| RASI | 重建锚定源注入 |
| PMG | 部分均值引导 |
| TAR | 双一致性残差注入 |

---

## 局限性

- 适用于 rectified-flow 生成器
- 需要针对不同模型调优

---

## 实现建议

- **实现难度**: 中等
- **适用场景**: 3D 内容编辑、AI 生成资产修改

---

## 相关工作

- [[3D Asset Editing]]
- [[Generative Models]]
- [[Rectified Flow]]
