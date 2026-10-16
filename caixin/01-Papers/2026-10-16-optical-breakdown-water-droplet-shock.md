---
type: paper
created: 2026-10-16
updated: 2026-10-16
tags: [paper, multiphase, droplet-breakup, shock-wave, plasma, blast-wave]
status: processed
domain: fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2610.21831
arXiv: 2610.21831
---

# Ambient-pressure effects on shock emission and liquid-shell expansion following optical breakdown inside water droplets

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Ambient-pressure effects on shock emission and liquid-shell expansion following optical breakdown inside water droplets |
| **作者** | M. Brugge, S. van Belois, S. S. Ade, O. O. Versolato, M. Kharbedia |
| **发表** | arXiv (physics.flu-dyn), 2026-10-15 |
| **链接** | [arXiv:2610.21831](https://arxiv.org/abs/2610.21831) |
| **DOI** | 10.48550/arXiv.2610.21831 |
| **代码** | — |

---

## 核心贡献

> 跨环境压力扫描，量化纳秒激光诱导击穿（LIB）水滴内部的液滴形变、冲击波发射与液壳膨胀相互独立的机制。

1. 在 D₀/D_b ≈ 2 有限光束工况下同步测量液滴形变与冲击波
2. 区分低能（E_l<1 mJ）界面气泡→薄膜塌缩 vs 高能（E_l>1 mJ）液壳爆炸膨胀两类机制
3. 用强爆炸波理论描述冲击波动力学；等离子体膨胀压驱动液壳膨胀
4. 揭示环境气体密度显著改变冲击波传播，但几乎不影响液滴形变与膨胀速率

---

## 技术方案

### 核心思想

弯曲液滴界面在固定外部聚焦下聚焦并内反射入射光，在液相内瞬态产生等离子体，施加压力载荷驱动液滴形变。低能模式下等离子体局域于后界面，形成界面气泡→不稳定薄膜→表面张力塌缩；高能模式下等离子体驱动液壳爆发膨胀与多冲击波前。扫描环境压力，分离冲击波传播与液滴形变动力学。

### 关键技术

| 技术 | 说明 |
|------|------|
| **纳秒激光诱导击穿 (LIB)** | 液相内等离子体生成 |
| **同步高速诊断** | 液滴形变 + 冲击波发射 |
| **强爆炸波理论** | Sedov-Taylor 类解描述冲击波 |
| **环境压力扫描** | 分离气体密度对冲击波的影响 |

---

## 公式

无量纲参数
```math
D_0/D_b \approx 2
```

激光能量阈值
```math
E_l \approx 1\,\mathrm{mJ}
```

---

## 实验结论

- **数据集**: 自有实验（微米级水滴 + 纳秒激光 + 环境压力扫描）
- **基线**: 单环境压力下的液滴击穿
- **结果**:
  - 低能 (E_l<1 mJ)：界面气泡→薄膜→水动力学不稳定→表面张力塌缩
  - 高能 (E_l>1 mJ)：液壳爆发膨胀，超音速扩展，多冲击波前
  - 冲击波动力学符合强爆炸波理论
  - 环境气体密度显著影响冲击波，但几乎不影响液滴形变与液壳膨胀速率（由内部等离子体压主导）

---

## 局限性

- 仅有限光束比 D₀/D_b ≈ 2 工况
- 微米级水滴，与宏观喷射雾化尺度差距大
- 实验为主，CFD 模拟对照未给出

---

## 相关工作

- 强爆炸波理论：Sedov (1946), Taylor (1950)
- LIB 与液滴相互作用：相关 EUV 光刻液滴靶研究

---

## 实现建议

- **实现难度**: ⚠️ 中-高（实验设计要求严；数值模拟需考虑等离子体-流体耦合）
- **预期性能**: 概念性结论——液滴爆炸内驱动压力可独立于外环境建模
- **适用场景**: EUV 光刻液滴靶诊断、激光推进、激光诱导液体微推进、喷雾蒸发基础研究
