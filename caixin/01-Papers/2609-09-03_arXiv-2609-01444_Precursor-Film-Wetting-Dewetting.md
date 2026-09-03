---
type: paper
created: 2026-09-03
updated: 2026-09-03
tags: [Wetting, Dewetting, Thin-Film, Lubrication-Equation, FEM, Contact-Line]
status: processed
domain: CFD
agent: caixin
source: https://arxiv.org/abs/2609.01444
---

# Macroscopic simulations of thin film wetting/dewetting using a precursor film model

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Macroscopic simulations of thin film wetting/dewetting using a precursor film model |
| **作者** | Xi-Hu Wu |
| **发表** | arXiv 2026-09-02 |
| **链接** | [原文](https://arxiv.org/abs/2609.01444) |
| **arXiv ID** | 2609.01444 |

---

## 核心贡献

> 重建解聚压力公式的中观前驱膜模型，实现润湿/去润湿的大规模模拟

1. **中观前驱膜模型**: 用相对较厚的前驱膜重现物理薄前驱膜的界面行为
2. **降低计算成本**: 减少接触线附近的空间分辨率需求，同时保持宏观流动动力学
3. **无需移动边界**: 易于处理拓扑变化（液滴合并、断裂）

---

## 技术方案

### 核心思想

移动接触线的多尺度特性使动态润湿过程数值模拟具有挑战。润滑方程框架内的前驱膜模型可以避免移动接触线的奇异性。

### 关键技术

| 技术 | 说明 |
|------|------|
| Lubrication Equation | 润滑方程（薄液膜近似） |
| Precursor Film Model | 前驱膜模型 |
| Disjoining Pressure | 解聚压力 |
| Finite Element Method | 有限元方法 |

---

## 验证算例

- 液滴铺展、缩回、滑动、合并
- 液脊断裂

---

## 相关工作

- [[Dynamic Wetting]] - 动态润湿
- [[Contact Line]] - 接触线
- [[Thin Film]] - 薄膜流
- [[Lubrication Theory]] - 润滑理论

---

## 实现建议

- **实现难度**: 中（有限元 + 润滑近似）
- **适用场景**: 涂层、微流控、薄膜流动
