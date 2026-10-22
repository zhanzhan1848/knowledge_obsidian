---
type: paper
created: 2026-10-22
updated: 2026-10-22
tags: [paper, ocean-rendering, FFT, wave-particles, hybrid, real-time, interactive]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2511.02852v1
---

# Real-Time Interactive Hybrid Ocean: Spectrum-Consistent Wave Particle-FFT Coupling

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Real-Time Interactive Hybrid Ocean: Spectrum-Consistent Wave Particle-FFT Coupling |
| **arXiv ID** | 2511.02852v1 |
| **作者** | Shengze Xue, Yu Ren, Jiacheng Hong, Run Ni, Shuangjiu Xiao, Deli Dong |
| **发表** | arXiv cs.GR 2025-10-31（eess.SP / cs.GR / cs.MM） |
| **链接** | [原文](https://arxiv.org/abs/2511.02852v1) |
| **机构** | ETH Zürich, DisneyResearch 等 |
| **渲染类别** | **表面渲染（海面）** |

---

## 核心贡献

> 全局 FFT 谱海面背景 + 交互物周围的局部波粒子（WP）patch，在**统一谱参数与色散关系**下耦合，兼顾大尺度谱一致性与近场交互真实感。

1. **混合海洋表示**：全局 FFT 背景 + 局部 WP patch，统一谱驱动。
2. **边界谱注入**：patch 边界处粒子按与 FFT **相同的方向谱**注入，使局部频率-方向分布与背景对齐、能量密度匹配，且不扰动远场。
3. **实时交互**：解决 FFT 海面对非均匀海况与近场交互（船、浮标）表现力不足的问题。

---

## 技术方案

### 核心思想

两类主流海洋表示各有明显短板：

| 表示 | 优势 | 短板 |
|------|------|------|
| **FFT 谱海面** | 高效、大尺度真实感强 | 假设**全局平稳 + 空间均匀**，难表达非均匀海况与近场交互 |
| **波粒子 (WP)** | 能捕捉局部尾流与涟漪 | 大规模维护代价高，难以匹配全局谱统计 |

本文的混合方案：

```text
        统一方向谱 S(ω,θ) + 色散关系 ω = f(k, h)
                            ↓
        ┌───────────────────┴───────────────────┐
   全局 FFT 背景                            局部 WP patch
   (大尺度、远场)                        (交互物周边、近场)
        │                                       │
        └──── 边界注入：粒子按同谱注入 ─────────┘
                    (频-向分布对齐 + 能量密度匹配)
```

### 关键技术

| 技术 | 说明 |
|------|------|
| **全局 FFT 背景** | 谱方法，高效渲染大尺度海面 |
| **局部 Wave Particle patch** | 围绕交互物（船/浮标）捕捉尾流与涟漪 |
| **统一谱参数** | FFT 与 WP 共用同一方向谱与色散关系 |
| **谱一致性边界注入** | 按 FFT 相同方向谱向 patch 注入粒子 |
| **能量密度匹配** | 消除 patch 边界处的不连续/闪光 |
| **远场不扰动** | 注入过程不影响 FFT 背景 |

---

## 公式

方向谱（Pierson-Moskowitz / JONSWAP 类）在 patch 边界注入：

```math
S(\omega, \theta) = S(\omega) \cdot D(\omega, \theta)
```

色散关系（有限水深）：

```math
\omega^2 = gk \tanh(kh)
```

频-向分布对齐使局部与背景统计一致：

```math
S_{\text{patch}}(\omega,\theta) \rightarrow S_{\text{FFT}}(\omega,\theta), \quad \text{at } \partial P
```

---

## 实验结论

- **结果**: 实时交互帧率；大尺度谱一致性 + 近场交互真实感兼得
- **基线**: 纯 FFT 海面、纯波粒子海面
- **改进**: 相较纯 FFT，近场（船体尾流、局部涟漪）显著更真实；相较纯 WP，大规模性能大幅提升

---

## 局限性

- 依赖交互物位置已知/可查询；未知交互（如远处随机扰动）未覆盖。
- patch 区域数量与复杂度可能随场景交互体增多而上升。
- 统一谱假设在真实海洋中谱会随位置/时间变化，简化处理。

---

## 相关工作

- [[Arc-Blanc-Real-Time-Ocean-Simulation]] — 完整的实时海洋模拟框架
- [[FFT-Ocean-Simulation]] — Tessendorf 谱方法
- [[SHIP-Splashes-Waves-Vast-Ocean]] — 大规模海洋中的船-浪交互
- [[Gaussian-Fluids]] — 3DGS 流体替代路线

---

## 实现建议

- **实现难度**: 🟡 中高（FFT 海面 + 粒子系统的谱耦合需要精心设计）
- **预期性能**: 实时
- **适用场景**: 船/浮标/角色涉水交互的游戏与仿真；海洋工程可视化

### 🌱 豆苗评注

这是**工程取向很强**的一篇，对做海上/涉水交互的团队可直接抄架构。最漂亮的一点是"边界谱注入"——它把"如何让两套异构表示共存"这个经典难题，通过统一谱 + 能量匹配化解了。这个思路（异构表示的边界缝合）在**烟雾+粒子混合渲染**里同样适用，值得记录为可迁移模式。