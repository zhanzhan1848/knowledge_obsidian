---
title: "DiffSurFlow: Efficient and Robust Differentiable Fluid Optimization via Surrogate Strategy on Flow Map"
authors:
  - Yuhao Quan
  - Hui Wang
  - Weile Lian
  - Zhi Wang
  - Xubo Yang
venue: SIGGRAPH 2026 (Journal Paper / TOG)
doi: 10.1145/3811337
url: https://illusionarydream.github.io/DiffSurFlowPage/
subjects: cs.GR
tags:
  - differentiable fluid simulation
  - flow map
  - surrogate optimization
  - inverse fluid problem
  - SJTU
agent: doumiao
status: processed
code: https://github.com/illusionarydream/DiffSurFlow
---

## 核心创新点

**DiffSurFlow**：通过**代理策略**（surrogate strategy）在 **flow map** 上实现高效、鲁棒的**可微流体优化**，解决传统可微流体在大规模 / 长时域下内存爆炸与数值不稳定的问题。

### 关键技术

| 技术 | 说明 |
|------|------|
| Flow Map 参数化 | 用 flow map 而非 step-by-step 速度场，避免梯度回传爆炸 |
| 代理策略 | 用低阶近似代替昂贵梯度的子模块计算 |
| 鲁棒性 | 处理流体优化的常见数值病态 |

### 解决痛点

- 传统可微流体对长时域仿真内存需求巨大
- 数值梯度不稳定
- 难以用于逆流体问题（inverse fluid）

## 渲染技术分类

- **类型**: 可微流体模拟 / 流体优化
- **方法**: Flow map + 代理可微策略
- **应用**: 逆流体问题、流体控制、参数估计

## 评估

- **创新度**: ⭐⭐⭐⭐⭐ (flow map + 代理策略组合)
- **实用性**: ✅ 开源代码
- **推荐度**: ✅ 强烈推荐 — 对**可微流体渲染与控制**研究有方法论价值

## 实现建议

- **代码**: 已开源 GitHub
- **管线要求**: 流体仿真器 + PyTorch 自动微分

## 与流体渲染关联

- **可微流体 + 神经渲染** — 为神经流体重建（如 GauSmoke, LagrangianSplats）提供优化工具
- **逆问题**：从流体视频恢复控制参数
- **风格化流体**：可微性使风格迁移成为可能

## 关键词

`differentiable fluid` `flow map` `surrogate optimization` `inverse problem` `SIGGRAPH 2026`

---

## 相关链接

- 项目页: https://illusionarydream.github.io/DiffSurFlowPage/
- 代码: https://github.com/illusionarydream/DiffSurFlow
- DOI: [10.1145/3811337](https://doi.org/10.1145/3811337)