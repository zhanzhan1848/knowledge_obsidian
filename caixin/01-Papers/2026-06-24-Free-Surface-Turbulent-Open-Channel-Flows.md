---
type: paper
created: 2026-06-24
updated: 2026-06-24
tags: [paper, turbulence, DNS, open-channel-flow, free-surface, TKE-budget, VLSM]
status: processed
domain: fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2606.24630
---

# How is the free surface influence transported in turbulent open channel flows?

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | How is the free surface influence transported in turbulent open channel flows? |
| **作者** | Christian Bauer et al. (TUM, DLR) |
| **发表** | arXiv physics.flu-dyn |
| **链接** | [原文](https://arxiv.org/abs/2606.24630) |
| **DOI** | 10.48550/arXiv.2606.24630 |

---

## 核心贡献

> 通过匹配的开闭通道DNS研究自由表面影响的传输机制，揭示湍动能预算中的多尺度耦合过程

1. **TKE输运机制**: 表面影响主要通过输运项在通道内传播
2. **能量平衡**: 近表面压力输运向界面供能，湍流输运和耗散降低，剩余能量通过粘性扩散输出
3. **尺度依赖相似性**: 不同预算项具有不同的相似性标度（粘性尺度、Kolmogorov子层尺度、混合速度尺度）
4. **VLSM耦合**: 压力-应变重分布受超大尺度运动（VLSM）组织

---

## 技术方案

### 研究方法

- **直接数值模拟(DNS)**: $Re_\tau \approx 900$
- **匹配开/闭通道**: OCF vs CCF对比
- **大域计算**: 可容纳VLSM的数值域

### 关键发现

#### 自由表面四层结构

| 层级 | 特征 | 标度 |
|------|------|------|
| 层1 | 粘性底层 | $\ell_V$ |
| 层2 | Kolmogorov子层 | $\ell_K$ |
| 层3 | 缓冲层 | 混合 |
| 层4 | 对数层 | 外尺度 |

#### TKE预算输运

```math
\frac{\partial k}{\partial t} = P + T + \Pi + \epsilon + D
```

其中 $P$: 生成, $T$: 湍流输运, $\Pi$: 压力输运, $\epsilon$: 耗散, $D$: 粘性扩散

**关键发现**:
- 压力输运向自由面供能
- 粘性扩散主导能量远离表面
- 各预算项无统一相似性标度

---

## 公式

### 关键方程

**雷诺应力输运方程中的压力-应变项**:
```math
\Pi_{ij} = \overline{p' \left( \frac{\partial u_i'}{\partial x_j} + \frac{\partial u_j'}{\partial x_i} \right)}
```

**近表面标度关系**:
- 粘性扩散: $\ell_V = \nu / u_\tau$
- Kolmogorov尺度: $\ell_K = (\nu^3 / \epsilon)^{1/4}$
- 混合速度尺度: $u_b u_\tau^2 / h$

---

## 实验结论

- **Reynolds数**: $Re_\tau \approx 900$
- **域尺寸**: 足以容纳VLSM
- **主要结论**:
  1. 表面影响通过输运项（而非局部项）传播
  2. 近表面预算项无统一相似性标度
  3. 压力-应变事件虽为小尺度，但受VLSM组织

---

## 局限性

- Reynolds数范围有限（需更高Re验证）
- 数值域虽大，但仍可能限制超长VLSM

---

## 对湍流建模的启示

1. **RANS湍流模型**: 需要考虑多尺度耦合
2. **LES亚网格模型**: 应区分不同预算项的尺度组织
3. **自由面湍流封闭**: 需要显式建模压力驱动重分布

---

## 实现建议

- **数据来源**: TUM-DLR 匹配OCF/CCF DNS数据库
- **适用场景**: 河流、河口、工程明渠CFD模拟
- **建模启示**: 自由面闭合模型应考虑Reynolds数依赖性
