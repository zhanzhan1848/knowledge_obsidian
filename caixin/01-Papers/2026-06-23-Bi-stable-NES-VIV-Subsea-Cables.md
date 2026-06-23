---
type: paper
created: 2026-06-23
updated: 2026-06-23
tags: [VIV, vortex, nonlinear-energy-sink, subsea-cable, drag-reduction]
status: processed
domain: offshore-engineering
agent: caixin
source: https://arxiv.org/abs/2606.22638
---

# Bi-stable Nonlinear Energy Sinks (BNESs) for VIV Mitigation and Drag Reduction of Subsea Cables

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Bi-stable Nonlinear Energy Sinks (BNESs) for Response Mitigation and Drag Reduction of Subsea Cables Undergoing Vortex-induced Vibrations |
| **arXiv ID** | 2606.22638 |
| **开源** | MoorDyn (OpenFOAM 关联) |
| **领域** | physics.flu-dyn / VIV |
| **链接** | [原文](https://arxiv.org/abs/2606.22638) \| [PDF](https://arxiv.org/pdf/2606.22638) |

---

## 核心贡献

> 首次展示被动非线性附件可同时减少**能量摄入**和**拖曳力放大**，通过非线性能量转移将大振幅低频模态能量散射到高频模态。

1. **BNES (Bi-stable NES)**: 强非线性双稳态质量-弹簧-阻尼器附件
2. **MoorDyn 集成**: 在开源多体动力学库中一致集成非线性振动控制机制
3. **3D 时域框架**: 捕获缆绳动力学、Morison 水动力、非稳态海流
4. **数据驱动优化**: 多电流配置下 BNES 参数空间采样优化
5. **疲劳效益**: 减少峰值振幅和累积能量摄入 → 提升长期疲劳寿命

---

## 物理机制

```
高振幅低频模态
      ↓ 非线性能量散射 (BNES)
低振幅高频模态
      ↓ 快速通过水动力阻尼和结构内耗散
      热能
```

### 时频分析

- **小波分析**: 揭示目标非线性能量转移
- **模态重分布**: 低频 → 高频，促进阻尼耗散

---

## 关键发现

| 指标 | 效果 |
|------|------|
| 峰值振幅 | 显著降低 |
| 累积VIV能量摄入 | 显著降低 |
| 拖曳力 | 降低（首次展示被动NES可同时降低拖曳） |
| 疲劳寿命 | 长期改善 |

---

## 推荐结论

✅ **推荐 — 海洋工程 CFD**

**理由**:
- 首次展示 VIV 抑制 + 拖曳力降低的双重效益
- 基于 OpenFOAM/MoorDyn，开源可复现
- 对海底电力电缆、海上风机系泊线等有直接工程价值

---

## 相关工作

- [[2026-06-23-Multifractal-Vortex-Structures-Turbulence|Multifractal Vortices]]
- [[2026-06-23-Interscale-Energy-Transfer-Boundaries|Interscale Energy Transfer]]
