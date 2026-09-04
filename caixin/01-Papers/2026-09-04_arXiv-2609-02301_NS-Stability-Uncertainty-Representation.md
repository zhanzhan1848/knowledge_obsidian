---
type: paper
created: 2026-09-04
updated: 2026-09-04
tags: [Navier-Stokes, stability, input-output, structured-uncertainty, nonlinear-feedback]
status: processed
domain: fluid
agent: caixin
source: https://arxiv.org/abs/2609.02301
---

# Improved uncertainty representation for reducing artificial energy production in structured input-output stability analysis

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Improved uncertainty representation for reducing artificial energy production in structured input-output stability analysis |
| **作者** | Ofek Frank-Shapir et al. |
| **发表** | arXiv 2026 (physics.flu-dyn) |
| **链接** | [原文](https://arxiv.org/abs/2609.02301) |

---

## 核心贡献

> 在 Frank-Shapir & Gluzman (JFM 2026) 的结构化小增益定理框架内，通过线性变换使结构化不确定度具有重复对角结构，消除人工能量生产项

1. 通过输入输出通道的线性变换，推导重复对角结构的不确定度表示
2. 减少 Couette 和 Poiseuille 流的稳定性阈值保守性
3. 揭示过去研究中使用的常结构不确定度导致人工能量生产，违反无散度假设

---

## 方法框架

### Structured Small-Gain Theorem

N-S 方程中的非线性对流项被替换为与线性化动力学的结构化反馈不确定互联，以考虑非线性反馈的影响。

### 重复对角结构

通过线性变换使不确定度具有重复对角结构：
- 保留非线性对流项的分量式路径
- 保持结构奇异值计算的可处理性

### 人工能量生产问题

过去研究中提出的重复和非重复块结构在使用常结构不确定度时产生人工能量生产项，违反 div(ū)=0 假设。

---

## 验证案例

| 流动 | 发现 |
|------|------|
| Couette flow | 新方法稳定性阈值最接近数值和实验研究 |
| Plane Poiseuille flow | Less conservative, more accurate |

---

## 相关工作

[[Navier-Stokes stability]], [[Input-output stability]], [[Structured uncertainty]], [[Fluid mechanics theory]]
