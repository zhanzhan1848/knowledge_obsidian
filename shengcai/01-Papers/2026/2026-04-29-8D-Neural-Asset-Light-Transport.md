---
type: paper
created: 2026-04-30
updated: 2026-04-30
tags: [paper, light-transport, neural-rendering, path-tracing]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.25129
---

# 8D Neural Asset Light Transport by Distribution Learning

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | 8D Neural Asset Light Transport by Distribution Learning |
| **作者** | arXiv submission (pending author list) |
| **发表** | arXiv cs.GR (2026-04-29) |
| **链接** | [原文](https://arxiv.org/abs/2604.25129) |
| **DOI** | 10.48550/arXiv.2604.25129 |
| **代码** | TBD |

---

## 核心贡献

> 将复杂材质的光传输效果（如次表面散射、光泽间反射、纤维散射）预计算到神经表示中，支持近场光照渲染

1. 提出 **8D Neural Assets (8DNA)** 完整建模 8D 光传输，而非传统的 6D 远场光照假设
2. 基于 **Distribution Learning** 的训练方法，从前向路径追踪样本学习，降低优化方差
3. 在挑战性材质上实现与路径追踪相近的渲染质量，同时保持快速推理

---

## 技术方案

### 核心思想

传统方法将光传输预计算为 6D 函数，假设远场光照。但高保真 3D 资产（如次表面散射、光泽间反射、细粒度纤维散射）涉及长散射路径，需要更完整的光传输建模。

8DNA 学习完整的 8D 光传输函数 $L(\mathbf{x}, \omega_i, \mathbf{x}', \omega_o)$，其中包含位置 $\mathbf{x}, \mathbf{x}'$ 和入射/出射方向 $\omega_i, \omega_o$。

### 关键技术

| 技术 | 说明 |
|------|------|
| 8D 光传输表示 | 建模近场光照下的完整光传输 |
| Distribution Learning | 从路径追踪样本学习，优于回归方法 |
| 神经表示 | 快速推理，支持各种场景配置 |

---

## 实验结论

- **渲染质量**: 与路径追踪结果高度匹配
- **方差降低**: 优于先前的回归方法
- **推理速度**: 快速，支持实时应用
- **适用材质**: 次表面散射、光泽间反射、纤维散射等复杂材质

---

## 局限性

- 需要预计算训练阶段
- 对极端复杂场景可能需要更大训练预算

---

## 实现建议

- **实现难度**: 中高（需要路径追踪数据和神经训练流程）
- **预期性能**: 高质量 + 快速推理
- **适用场景**: 电影/游戏中的复杂材质渲染，资产管理
- **优先级**: 高 - 与现有路径追踪管线兼容，可作为资产预处理工具

---

## 相关工作

- [[Neural Radiance Cache]]
- [[Light Transport Simulation]]
- [[Neural Rendering]]