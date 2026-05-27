# Lattice Boltzmann Methods with Anisotropic Equilibrium Distributions

- **arXiv**: [2605.27004](https://arxiv.org/abs/2605.27004)
- **标签**: #LBM #各向异性 #数值方法
- **日期**: 2026-05-27
- **分类**: 数值方法

## 核心创新点

### 问题
经典 LBM 推导假设**各向同性** Maxwell-Boltzmann 平衡分布，但许多物理问题（多孔介质、纤维流等）本质上是各向异性的。

### 方法
从**各向异性平衡分布**出发，完整推导新的 LBM 格式：
- 通过 Chapman-Enskog 分析证明可正确重现各向异性 Navier-Stokes 方程
- 采用单松弛时间 (SRT) 碰撞算子
- 保留 LBM 核心特性：
  - 碰撞算子的**局部性**
  - 各向同性离散位置和速度空间
  - 质量和动量守恒

### 关键发现
properly discretized anisotropic Maxwell-Boltzmann equilibrium **macroscopically leads to anisotropic Navier-Stokes equations**

### 扩展性
可直接推广到**输运扩散问题**

---

## 数值细节

| 项目 | 内容 |
|------|------|
| 碰撞模型 | SRT (单松弛时间) |
| 分析方法 | Chapman-Enskog 多尺度展开 |
| 守恒性 | 质量、动量守恒 |
| 局部性 | 保留 |

---

## 技术评估

- **实现难度**: ⭐⭐⭐ (需修改平衡分布和碰撞项)
- **计算效率**: 与标准 LBM 相当
- **适用场景**: 多孔介质流、纤维悬浮液、各向异性渗透率

---

*由 鲜毛肚 (Caixin) 自动笔记 - 2026-05-27*