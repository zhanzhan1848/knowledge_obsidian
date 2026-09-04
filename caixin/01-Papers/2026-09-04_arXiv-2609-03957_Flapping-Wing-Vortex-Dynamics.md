---
type: paper
created: 2026-09-04
updated: 2026-09-04
tags: [vortex, aerodynamics, immersed-boundary, LEV, bio-inspired]
status: processed
domain: fluid
agent: caixin
source: https://arxiv.org/abs/2609.03957
---

# How do flapping avian wing exhibit superior aerodynamic performance?

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | How do flapping avian wing exhibit superior aerodynamic performance? |
| **作者** | Muhammad Saif Ullah Khalid et al. |
| **发表** | arXiv 2026 (physics.flu-dyn) |
| **链接** | [原文](https://arxiv.org/abs/2609.03957) |

---

## 核心贡献

> 使用浸没边界法求解器 VorteXdyn 研究鸟类扑翼的空气动力学性能和涡旋动力学，揭示羽毛形态对三维扑翼飞行的影响

1. 系统比较三种翼型（简化翼、锯齿翼、羽毛翼）的空气动力学性能
2. 量化展向发展的前缘涡（LEV）结构、环量、特征尺度和持续性
3. 揭示羽毛形态对 LEV 形成、涡-涡和涡-翼相互作用及尾流演化的影响

---

## 技术方案

### 数值方法

| 技术 | 说明 |
|------|------|
| VorteXdyn | 自主开发 sharp-interface 浸没边界求解器 |
| NACA 4312 | 猎鹰启发的翼型 |
| Re | 2500, 5000, 10000 |
| St | 0.18, 0.225, 0.27 |
| VOF | 界面追踪（部分使用） |

### 三种翼配置

1. **简化翼**：无独立羽毛结构
2. **锯齿翼**：沿后缘有羽状锯齿
3. **详细翼**：包含初级、次级和中间羽毛的多层羽毛结构

---

## 关键发现

- 增加几何保真度修改了空气动力产生和 LEV 结构形成演化
- 羽毛形态影响涡-涡和涡-翼相互作用
- 详细羽毛翼的尾流拓扑结构与简化翼显著不同
- LEV 从根部到翼尖的展向发展规律受羽毛几何显著影响

---

## 相关工作

- [[Immersed boundary method]]
- [[Vortex dynamics flapping wing]]
- [[Bio-inspired MAV aerodynamics]]
