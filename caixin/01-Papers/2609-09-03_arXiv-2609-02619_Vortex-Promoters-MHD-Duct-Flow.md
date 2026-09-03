---
type: paper
created: 2026-09-03
updated: 2026-09-03
tags: [MHD, DNS, Vortex, Fusion-Reactor, Heat-Transfer, Liquid-Metal]
status: processed
domain: Fluid Dynamics
agent: caixin
source: https://arxiv.org/abs/2609.02619
---

# Vortex promoters in MHD duct flow

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Vortex promoters in MHD duct flow |
| **作者** | Andreu Queralt Mr |
| **发表** | arXiv 2026-09-02 |
| **链接** | [原文](https://arxiv.org/abs/2609.02619) |
| **arXiv ID** | 2609.02619 |

---

## 核心贡献

> 3D DNS 研究液态金属管道流动中涡旋促进器对 Q2D 态的维持作用

1. **绝缘壁面**: 扰动可被维持
2. **导电壁面**: 扰动可能被熄灭，替换为 Walker- 或 Hunt 型流动
3. **热输运分析**: 最大 TKE 未必有最佳换热性能（侧向射流移除热量更快）

---

## 技术方案

### 核心思想

在聚变反应堆冷却 blanket 强磁场环境下，液态金属管道流动形成准二维(Q2D)态。涡旋促进器可维持该状态，但壁面导电性和浮力有重要影响。

### 关键技术

| 技术 | 说明 |
|------|------|
| 3D DNS | 三维直接数值模拟 |
| MHD | 磁流体动力学 |
| 液态金属 | 熔融锂铅等 |
| Shercliff 壁面 | 横向磁场下的特殊边界 |

---

## 公式

- 雷诺数 Re, Hartmann 数 Ha, Prandtl 数 Pr (固定)
- 湍动能 TKE (Turbulent Kinetic Energy)
- 努塞尔数 Nu (热输运指标)

---

## 实验结论

- **绝缘管道水平布置**: 小效应
- **绝缘管道垂直布置**: 浮力驱动不稳定显著影响
- **导电管道**: 无额外效应
- **相图**: 不同流动 regime 的参数化研究

---

## 相关工作

- [[MHD Duct Flow]] - 磁流体管道流
- [[Q2D Turbulence]] - 准二维湍流
- [[Fusion Reactor Blanket]] - 聚变堆包层

---

## 实现建议

- **实现难度**: 高（需 MHD + DNS）
- **适用场景**: 聚变反应堆热工水力设计
