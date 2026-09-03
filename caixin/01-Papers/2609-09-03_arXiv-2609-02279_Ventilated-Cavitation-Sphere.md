---
type: paper
created: 2026-09-03
updated: 2026-09-03
tags: [Cavitation, DNS, VOF, Multiphase-Flow, Sphere, Drag-Reduction]
status: processed
domain: Fluid Dynamics
agent: caixin
source: https://arxiv.org/abs/2609.02279
---

# Ventilated Cavitation around a sphere through surface air injection at Re = 10,000

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Ventilated Cavitation around a sphere through surface air injection at Re = 10,000 |
| **作者** | (见原文) |
| **发表** | arXiv 2026-09-02 |
| **链接** | [原文](https://arxiv.org/abs/2609.02279) |
| **arXiv ID** | 2609.02279 |

---

## 核心贡献

> DNS 研究表面空气注入位置对通气空化 inception、稳定性和减阻的影响

1. **前方注入**: 产生不稳定气泡腔（puffing 主导），阻力增加 ~56%
2. **中部/后方注入**: 产生稳定空腔，阻力分别降低 35%/25%（中部）和最大 46%（后方）
3. **空腔动力学**: 后方注入的 KH 不稳定性和 divot 形成特征

---

## 技术方案

### 核心思想

通气空化通过在物体表面注入空气形成空腔，可用于减阻。本研究用 VOF 方法追踪水-空气界面，DNS 模拟 Re=10000 的球体绕流。

### 关键技术

| 技术 | 说明 |
|------|------|
| DNS | 直接数值模拟 |
| VOF | 体积分数方法追踪界面 |
| 表面张力 | 显式包含 |
| 通气空化 | Ventilated Cavitation |

---

## 注入位置方案

| 位置 | 角度范围 | 特征 |
|------|----------|------|
| FR025 | 18°-63° (前方) | 不稳定，阻力增加 |
| MD025/MD050 | 75°-104° (中部) | 稳定，35%/25% 减阻 |
| BK025 | 120°-180° (后方) | 最稳定，最大 46% 减阻 |

---

## 相关工作

- [[Ventilated Cavitation]] - 通气空化
- [[VOF Method]] - 体积分数法
- [[Drag Reduction]] - 减阻

---

## 实现建议

- **实现难度**: 高（VOF + DNS 多相流）
- **适用场景**: 船舶水下航行器减阻
