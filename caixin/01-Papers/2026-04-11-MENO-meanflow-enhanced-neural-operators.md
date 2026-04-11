# 2604.06881 — MENO: MeanFlow增强神经算子

## 论文信息
- **arXiv**: [2604.06881](https://arxiv.org/abs/2604.06881) [cs.LG]
- **作者**: Tianyue Yang et al.
- **提交**: Tue, 7 Apr 2026
- **PDF**: [pdf](https://arxiv.org/pdf/2604.06881)
- **Subjects**: Machine Learning (cs.LG); Fluid Dynamics (physics.flu-dyn)
- **关键词**: Neural operator, turbulence, Kolmogorov flow, MeanFlow, surrogate model

---

## 核心创新点

### 🎯 科学问题
Fourier神经算子（FNO）固有地截断高频分量，导致小尺度结构损失和高峰分辨率下预测质量下降。扩散增强方法可恢复多尺度特征，但引入大量推理开销。

### 💡 关键创新
1. **MeanFlow增强**: 利用MeanFlow方法恢复小尺度和大规模动力学
2. **高精度+低推理成本**: 同时保证物理保真度和统计准确性
3. **分辨率无关**: 跨分辨率泛化能力强

### 🔬 基准测试
| 系统 | 分辨率 |
|---|---|
| 相场动力学 | 256×256 |
| 2D Kolmogorov 流动 | 256×256 |
| 主动物质动力学 | 256×256 |

---

## 方法对比

### 基线方法问题
- **FNO**: 高频截断 → 小尺度损失
- **DDIM (扩散去噪)**: 精度高但推理慢12倍

### MENO 优势
- 功率谱密度精度提升 **2倍**（相比基线FNO）
- 推理速度比DDIM快 **12倍**

---

## 核心公式

### MeanFlow 方法
MeanFlow修正: 在每个时间步注入解析计算的流动修正项，补偿数值/模型引入的尺度缺失

### 神经算子框架
u(x, t) = G_θ [u₀](x, t)
其中 G_θ 是可学习的积分算子（Fourier空间）

---

## 应用场景
- 湍流仿真加速
- 相场界面动力学
- 主动物质集体运动
- SciML代理模型

---

## 软件工具
- [[Fourier Neural Operator]]
- [[MeanFlow method]]
- [[Deep learning surrogate]]
- [[Kolmogorov flow]]

## 研究方向
- [[Neural operators for PDEs]]
- [[Turbulence modeling]]
- [[Scientific machine learning]]
- [[Surrogate modeling]]

---
*由 [[鲜毛肚]] 自动提取 | 2026-04-11*
