---
type: paper
created: 2026-08-31
updated: 2026-08-31
tags: [droplet, surface-viscoelasticity, pinch-off, satellite-drops, BSA]
status: processed
domain: fluid
agent: caixin
source: https://arxiv.org/abs/2608.28071
---

# How Surface Viscoelasticity Eliminates Satellite Drops

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | How Surface Viscoelasticity Eliminates Satellite Drops |
| **作者** | Xiaocong Yang, Qingfei Fu, Lijun Yang, Bingqiang Ji |
| **发表** | arXiv 2026-08-28 |
| **链接** | [原文](https://arxiv.org/abs/2608.28071) |
| **DOI** | https://doi.org/10.48550/arXiv.2608.28071 |

---

## 核心贡献

> 实验发现少量牛血清白蛋白 (BSA) 引入的表面粘弹性可通过锚定颈缩位置完全抑制卫星滴形成，并提出相应的自相似变薄标度律。

1. **完全抑制卫星滴**：表面剪切粘度在后期变薄阶段平衡毛细力，锚定颈缩于两主珠中点
2. **自相似变薄标度律**：表面粘度主导的变薄动力学，不同于黏性/惯性标度
3. **表面流变学机理**：揭示了液丝断裂的表面粘弹性调控机制

---

## 技术方案

### 核心思想

液丝断裂过程中，表面活性剂 (BSA) 在气液界面形成粘弹性膜，产生剪切阻力，阻止毛细力驱动的颈缩失稳。

### 实验体系

| 参数 | 说明 |
|------|------|
| 表面活性剂 | 牛血清白蛋白 (BSA) |
| 液丝断裂阶段 | Late thinning stage |
| 标度指数 | 表面粘弹性主导 vs 黏性/惯性主导 |

---

## 核心标度律

表面粘弹性主导的颈缩变薄：
```
h(t) ~ (Γ_s / μ_s) * t  (表面粘度 Γ_s, 剪切粘度 μ_s)
```
不同于纯粘性：h ~ t (Toroidal similarity)
不同于惯性：h ~ t^(2/3) (Viscocapillary)

---

## 实验发现

- **完全抑制卫星滴**：BSA 浓度极低即可实现
- **颈缩锚定**：表面剪切粘度将颈缩稳定在中点
- **标度跨越**：表面粘弹性主导的线性变薄阶段
- **工业价值**：乳液、喷墨、喷雾中的卫星滴控制

---

## 局限性

- 实验体系为蛋白质表面活性剂，通用性待验证
- 仅报道颈缩阶段，未涉及 satellite drop 的后续演化

---

## 实现建议

- **实现难度**：实验研究（无需计算）
- **预期应用**：卫星滴控制、表面活性剂工程、液滴生成优化
- **适用场景**：喷墨打印、微流控、乳液合成

---

## 相关工作

- [[Droplet Pinch-off]]
- [[Surface Rheology]]
- [[Liquid Thread Breakup]]
