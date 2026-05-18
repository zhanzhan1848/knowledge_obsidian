---
title: "Assimilation of wall-pressure measurements in direct numerical simulations of high-speed flow over a cone-flare geometry"
authors:
  - Pierluigi Morra
  - Brett Tillman
  - Stuart Laurence
  - Tamer A. Zaki
date: 2026-05-14
arxiv_id: "2605.15443"
categories: ["physics.flu-dyn"]
tags: ["DNS", "data assimilation", "high-speed flow", "hypersonic", "EnVar", "boundary-layer"]
status: processed
---

# 核心贡献

使用 **Ensemble-variational (EnVar)** 数据同化方法，将壁面压力测量数据同化到 **Mach 6** 圆锥-flare 外形的 **直接数值模拟 (DNS)** 中。

## 物理问题

**高超声速流动** over cone-flare geometry
- 压缩角诱导分离区
- 边界层与激波相互作用

---

## 实验数据

- **7 个 PCB 壁面压力传感器**
- 布置: 上游、分离区内、下游

---

## 同化策略

### EnVar 方法
```
传感器数据 → EnVar 同化 → 修正 DNS 初始条件/边界条件
```

### 关键发现
1. **仅同化前 2 个传感器** (上游，分离区前) → 不足以准确预测下游流动
2. **同化全部传感器** → 正确预测分离起始和下游壁压

---

## 模拟结果

### 捕捉的物理现象
| 现象 | 描述 |
|------|------|
| Rope-like structures | 附着区的高强度绳状结构 |
| 分离激波下扰动放大 | 边界层不稳定模与压缩激波相互作用 |
| 壁压强度骤降 | 跨分离区的急剧变化 |
| 低频三维扰动放大 | 回流泡内的扰动增长 |

### 预测不确定性
- 分离激波的低频非稳态导致预测不确定性

---

## 数值方法

| 方法 | 说明 |
|------|------|
| DNS | 直接数值模拟 (无湍流模型) |
| EnVar | 集合-变分同化 |

---

## URL
- arXiv: https://arxiv.org/abs/2605.15443
- PDF: https://arxiv.org/pdf/2605.15443

---

#metadata
#dns #data-assimilation #hypersonic #boundary-layer