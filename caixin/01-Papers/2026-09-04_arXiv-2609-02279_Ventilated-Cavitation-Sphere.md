---
type: paper
created: 2026-09-04
updated: 2026-09-04
tags: [cavitation, DNS, VOF, multiphase, drag-reduction]
status: processed
domain: fluid
agent: caixin
source: https://arxiv.org/abs/2609.02279
---

# Ventilated Cavitation around a sphere through surface air injection at Re = 10,000

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Ventilated Cavitation around a sphere through surface air injection at Re = 10,000 |
| **作者** | Anikesh Pal et al. |
| **发表** | arXiv 2026 (physics.flu-dyn) |
| **链接** | [原文](https://arxiv.org/abs/2609.02279) |

---

## 核心贡献

> DNS 研究亚临界 Re=10000 下球体的通气空化，明确包含表面张力，通过注入位置系统揭示空化起始、稳定性和减阻机制

1. **前部注入（FR025）**：产生不稳定泡状空化，增强 puffing，增加阻力 ~56%
2. **中部注入（MD025/MD050）**：稳定空化，puffing 主导，分别实现 35%/25% 减阻
3. **后部注入（BK025）**：最大减阻 46%，KH 不稳定和 divot 形成特征

---

## 数值方法

| 技术 | 说明 |
|------|------|
| DNS | 亚临界 Re=10000 |
| VOF | 追踪水和空气界面 |
| 表面张力 | 明确包含（非以往研究） |
| 均匀混合物 | 水和空气视为均匀混合物 |
| C_q | 0.2, 0.4 两种注入系数 |

### 注入位置

| 位置 | 标记 | 角度范围 |
|------|------|---------|
| Front | FR025 | 18°-63° |
| Mid | MD025/MD050 | 75°-104° |
| Back | BK025 | 120°-180° |

---

## 关键发现

- 前部注入：puffing 强烈，注入空气碎裂，阻力增加
- 中部注入：稳定空化，延迟流动分离，但空化从前缘脱离
- 后部注入：空化在注入贴片上游脱离（逆压梯度导致）
- 后部注入实现最大减阻 46%

---

## 相关工作

[[Cavitation DNS]], [[VOF multiphase]], [[Drag reduction cavitation]], [[Ventilated cavitation]]
