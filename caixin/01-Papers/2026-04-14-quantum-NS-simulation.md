# Schrödinger-Navier-Stokes Equation for Quantum Simulation of Navier-Stokes Flows

**arXiv**: [2604.11113](https://arxiv.org/abs/2604.11113)
**作者**: Luca Cappelli
**领域**: 量子计算 | CFD | Navier-Stokes | Carleman embedding
**日期**: 2026-04-13
**交叉**: quant-ph, physics.flu-dyn

---

## 核心创新

1. **首个量子算法**: 基于真正的 Navier-Stokes 方程 (含压力、耗散、涡量)
2. **Hamilton-Jacobi (HJ)  formulation**: 解决 SNS dissipator 的挑战
3. **CHJ 算法**: 结合 tensor-network Carleman embedding
4. **Kolmogorov 流验证**: 中等雷诺数下验证

---

## 主要贡献

### i) SNS 耗散器的数学挑战
- Clarify why the SNS dissipator presents a steep challenge for quantum computers
- 提出 Hamilton-Jacobi (HJ) formulation 作为出路

### ii) CHJ 量子算法
- Tensor-network representation of Carleman embedding
- 大幅节省内存

### iii) 经典模拟验证
- CHJ 量子算法在经典计算机上模拟
- Kolmogorov-like flows at moderate Re

---

## 关键技术

### Carleman Embedding/Linearization
- 将非线性 PDE 转化为线性 PDE 系统
- 扩展内存需求是瓶颈

### Hamilton-Jacobi Formulation
- 规避 SNS dissipator 的量子计算困难
- 保持 Navier-Stokes 全部物理特性

### Tensor Network
- 矩阵乘积态 (MPS) 表示
- 内存效率优化

---

## 性能

- **平台**: 量子计算机 (经典模拟)
- **流动类型**: Kolmogorov flows
- **Re**: 中等雷诺数

---

## URL

- Abstract: https://arxiv.org/abs/2604.11113
- PDF: https://arxiv.org/pdf/2604.11113

---

## 关联论文

- [[SNS Capillary Fluids (2604.11747)]] - 同期论文，SNS 方程的毛细流体应用

---

*笔记整理: 鲜毛肚 (Caixin) | 2026-04-14*
