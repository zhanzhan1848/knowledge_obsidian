---
title: "Compressible solved-volatility stochastic fluid thermodynamics: source-consistent energy, finite-correlation reservoirs, entropy admissibility and boundary conditions"
authors: []
date: 2026-07-31
tags: [stochastic-fluid, compressible-flow, Navier-Stokes, thermodynamics, turbulence]
categories: [physics.flu-dyn]
arxiv_id: 2607.28333
doi: 10.48550/arXiv.2607.28333
---

# 核心创新点

## 研究背景与动机
- 变量密度热力学扩展，基于 arXiv:2607.25536 的 solved-volatility stochastic-fluid formulation
- 传统可压缩 Navier-Stokes-Fourier 方程从未从随机粒子路径角度推导

## 核心贡献

### 1. 随机传输框架
- **源包含随机传输**：将质量、动量和总能守恒分离为时间演化偏微分方程和鞅兼容性约束
- 密度和温度作为原始热力学场
- 质量守恒决定密度，内能决定温度，状态方程决定沿随机粒子路径的压力演化

### 2. 有限相关储层与 Green-Kubo 标定
- 结合有限相关储层（finite-correlation reservoir）
- 使用 Green-Kubo 标定方法
- 平衡抵消项和伴随分解的解析-未解析交换

### 3. 熵容许性分析
- 随机 Gibbs 恒等式和高斯相对熵
- 针对 Hencky 储层形式给出条件熵容许性结果
- 区分状态方程压力波动与机械应力脉冲

### 4. 低马赫数极限
- 在零波动极限下，经典可压缩 Navier-Stokes-Fourier 方程被恢复
- 识别混合双曲-抛物漂移子系统
- 耦合代数鞅约束，闭包依赖椭圆块和奇异低马赫压力极限

### 5. 边界条件
- 给出保守边界条件
- 给出完美气体特例

## 关键公式

### 控制方程形式
- 质量守恒：$\partial_t \rho + \nabla \cdot (\rho \mathbf{u}) = \text{source}$
- 动量守恒：$\partial_t (\rho \mathbf{u}) + \nabla \cdot \mathbf{P} = \text{source}$
- 能量守恒：$\partial_t E + \nabla \cdot \mathbf{Q} = \text{source}$

### 状态方程
$$p = p(\rho, T)$$
$$e = e(\rho, T)$$

### 随机粒子路径
沿随机粒子路径的压力演化由状态方程决定

## 数值验证

### 验证项目
- 压力载波（pressure carrier）
- 声学色散（acoustic dispersion）
- 粘性热能平衡（viscous-thermal energy balance）
- 低马赫数标度（low-Mach scaling）

### 计算规模
- Canonical calculations 完成验证
- 非线性适定性（nonlinear well-posedness）、激波容许性（shock admissibility）和充分发展湍流（developed turbulence）**未被声称**

## 数值方法评估

| 方面 | 评估 |
|------|------|
| 离散化 | 随机 PDE，需要特殊数值处理 |
| 稳定性 | 依赖有限相关储层设计 |
| 计算成本 | 中等，需额外处理随机项和熵条件 |
| 实现难度 | 高，需完整随机框架 |

## 关键引用
```
@article{arXiv2607.28333,
  title={Compressible solved-volatility stochastic fluid thermodynamics},
  author={},
  journal={arXiv:2607.28333},
  year={2026}
}
```

## 相关工作
- 基于 arXiv:2607.25536 的先前工作
- 关联：Gaussian covariant hydrodynamics（非相对论极限）
- 湍流、反常耗散和"wild solutions"的数学问题联系

## 开放问题
- 非线性适定性未证明
- 激波容许性未建立
- 充分发展湍流未覆盖
- 低马赫数极限的奇异行为需进一步研究

---

*来源：[arXiv:2607.28333](https://arxiv.org/abs/2607.28333)*
