---
type: paper
created: 2026-07-03
updated: 2026-07-03
tags: [physics.flu-dyn, turbulence, stratified-flow, DNS, shear-flow, mixing]
status: processed
domain: fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2607.01981
---

# Energy transfer, Intermittency and Mixing in Shear-Driven Stratified Turbulence

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Energy transfer, Intermittency and Mixing in Shear-Driven Stratified Turbulence |
| **作者** | Chandra Shekhar Lohani, Vishwanath Shukla |
| **发表** | arXiv 2607.01981, 2026-07-02 |
| **链接** | [原文](https://arxiv.org/abs/2607.01981) / [PDF](https://arxiv.org/pdf/2607.01981) |
| **DOI** | 10.48550/arXiv.2607.01981 |
| **代码** | N/A |
| **subjects** | Fluid Dynamics (physics.flu-dyn); Chaotic Dynamics (nlin.CD) |

---

## 核心贡献

> 通过直接数值模拟（DNS）研究剪切驱动的稳定分层湍流中的能量传输、间歇性和混合

1. **分层流 regime 转变**: 随着分层减弱，流动经历三个regime：浮力主导的强分层regime → Kelvin-Helmholtz不稳定性regime → 近各向同性湍流regime
2. **VSHF 机制**: 发现垂直剪切水平流（VSHF）在中等分层强度下具有重要能量贡献，伴随垂直方向动能耗谱的急剧变陡
3. **间歇性与混合**: 强分层增强间歇性，垂直速度波动呈高度非高斯分布，混合系数约 $10^{-1}$ 量级

---

## 技术方案

### 研究方法

- **直接数值模拟 (DNS)**: Kolmogorov forcing 驱动水平剪切
- **参数范围**: 广泛的弗劳德数 $Fr$ 范围
- **分析工具**: 能谱分析、能量传输、间歇性统计

### 核心物理

| 现象 | 描述 |
|------|------|
| 强分层regime | 浮力主导，流动呈层状 |
| 中等分层regime | KH不稳定性和增强混合 |
| 弱分层regime | 近各向同性湍流 |

---

## 关键发现

### 1. 谱特性
- 中等分层时，垂直方向一维垂直动能谱 $E_{perp}(k)$ 急剧变陡
- 谱能量传输以正向为主（大尺度→小尺度）
- 大 horizontal scales 出现反向垂直磁通（各向异性能量重分布，非真正逆级串）

### 2. VSHF 特征
- 垂直剪切水平流（Vertically Sheared Horizontal Flows）
- 在中等 $Fr$ 下具有显著能量
- 与 KH 不稳定性密切相关

### 3. 间歇性
- 强分层下，垂直速度波动呈非高斯分布
- 存在大 kurtosis，与局部垂直burst相关
- 表征：$Kurtosis \gg 3$（高斯为3）

### 4. 混合系数
- 基于能量学的混合系数：$\sim 10^{-1}$
- 在 KH 不稳定性regime略有增强

---

## 公式

### 弗劳德数定义
$$Fr = \frac{U}{NH}$$
其中 $U$ 为特征速度，$N$ 为 Brunt-Väisälä 频率，$H$ 为特征尺度

### 能量传输
- 正向传输：$k^{-3/2}$ 或更陡的能谱
- 垂直磁通在 $k$ 大时变负

---

## DNS 参数

| 参数 | 典型值 |
|------|------|
| $Re$ | 高雷诺数（充分湍流）|
| $Fr$ | $10^{-3}$ 到 $10^{0}$ |
| 网格 | $512^3$ 或更高 |

---

## 实验结论

- **基线**: 无分层湍流、各向同性湍流
- **结果**: 三regime转变清晰；混合系数与 $Fr$ 的弱依赖关系
- **主要创新**: VSHF 机制、间歇性量化

---

## 局限性

- Deterministic forcing（可能缺少随机性）
- 未使用超粘性耗散（standard dissipation）
- 二维或准二维 aspects 未深入讨论

---

## 相关概念

- [[直接数值模拟 (DNS)]]
- [[分层湍流]]
- [[Kelvin-Helmholtz 不稳定性]]
- [[间歇性]]
- [[混合系数]]
- [[VSHF]]
- [[湍流能谱]]

---

## 实现建议

- **实现难度**: ⭐⭐⭐⭐（需大规模DNS）
- **数值方法**: 伪谱法或高阶有限差分，$512^3+$ 网格
- **适用场景**: 大气/海洋分层流、污染物扩散、燃烧室混合
