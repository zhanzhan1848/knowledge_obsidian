---
type: paper
created: 2026-07-06
updated: 2026-07-06
tags: [paper, differentiable-rendering, nurbs, gaussian-splatting, vector-graphics]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2606.31764
---

# NURBS Splatting: A Unified Differentiable Rendering Framework for Vector Graphics

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | A Unified Differentiable Rendering Framework for Vector Graphics |
| **作者** | Jingye Qiu et al. |
| **发表** | ECCV 2026 |
| **链接** | [原文](https://arxiv.org/abs/2606.31764) |
| **DOI** | 10.48550/arXiv.2606.31764 |

---

## 核心贡献

> 将平面有理曲线表示为连续高斯场，实现 NURBS 曲线的可微分渲染，支持任意节点、非均匀权重和长样条

1. **NURBS → 连续高斯场**：沿曲线参数域和闭合区域内采样高斯，将 NURBS 曲线重新定义为连续高斯场
2. **平滑累积渲染**：渲染重构为平滑累积过程，梯度稳定
3. **完整 NURBS 支持**：天然支持长样条、有理权重、非均匀节点、闭合区域填充

---

## 技术方案

### 核心思想

现有可微分矢量渲染器主要关注 Bézier 曲线，存在梯度不稳定和灵活性有限问题。该方法将 NURBS 曲线用高斯场表示，利用高斯 splatting 的平滑累积实现稳定梯度。

### 关键技术

| 技术 | 说明 |
|------|------|
| NURBS 高斯采样 | 曲线参数域 + 闭合区域双域采样 |
| 平滑累积渲染 | 稳定梯度，避免解析栅格化缺陷 |
| 书法重建 | 验证对书法笔触的有效性 |

---

## 实验结论

- **梯度稳定性**：相比现有方法改善
- **重建质量**：书法重建、图像向量化、长样条抽象任务均优于现有方法

---

## 局限性

- 目前针对 2D 平面 NURBS，3D 扩展未验证

---

## 实现建议

- **实现难度**: 中
- **预期性能**: 适合设计自动化应用
- **适用场景**: 矢量图形设计自动化、书法生成、字体渲染
