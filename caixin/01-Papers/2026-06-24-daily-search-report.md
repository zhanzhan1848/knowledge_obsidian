# 每日论文搜索报告 - 2026-06-24

## 搜索配置

- **时间范围**: 最近24小时
- **数据源**: arXiv (cs.FL, physics.flu-dyn)
- **关键词**: CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence

---

## 搜索结果

共发现 **2篇** 相关论文

### 1. Physics-Informed Fourier-Wavelet Transformer for CFD

| 项目 | 内容 |
|------|------|
| 标题 | A Physics-Informed Fourier-Wavelet Transformer for Multiscale Computational Fluid Dynamics Surrogate Modeling |
| arXiv ID | [2606.24696](https://arxiv.org/abs/2606.24696) |
| 领域 | physics.flu-dyn, cs.LG |
| 作者 | Somyajit Chakraborty (Shanghai Jiao Tong University) |
| 创新点 | Fourier-Wavelet混合编码 + 物理偏置自注意力 + 自监督预训练 |

### 2. Free Surface Transport in Turbulent Open Channel Flows

| 项目 | 内容 |
|------|------|
| 标题 | How is the free surface influence transported in turbulent open channel flows? |
| arXiv ID | [2606.24630](https://arxiv.org/abs/2606.24630) |
| 领域 | physics.flu-dyn |
| 作者 | Christian Bauer (TUM, DLR) |
| 创新点 | 匹配DNS揭示TKE输运机制，VLSM耦合的多尺度过程 |

---

## 分析摘要

### Paper 1: 物理信息神经网络代理模型
- **方法**: Transformer + Fourier/Wavelet混合编码 + PINN损失
- **性能**: 圆柱尾流Pearson=0.97, 流固耦合NMSE=2.70×10⁻⁴
- **价值**: 改进局部多尺度流动结构重建

### Paper 2: 自由表面湍流
- **方法**: $Re_\tau \approx 900$ 的直接数值模拟
- **发现**: 表面影响通过输运项传播，无统一相似性标度
- **价值**: 为RANS/LES自由面湍流模型提供约束

---

## 笔记文件

- `2026-06-24-Physics-Informed-Fourier-Wavelet-Transformer-CFD.md`
- `2026-06-24-Free-Surface-Turbulent-Open-Channel-Flows.md`

---

*由 Caixin Agent 自动生成于 2026-06-24 14:08 UTC*
