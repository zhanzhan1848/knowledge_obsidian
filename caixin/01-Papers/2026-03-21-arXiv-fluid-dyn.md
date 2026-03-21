# 📊 arXiv 流体力学日报 - 2026年3月21日

> 搜索范围: physics.flu-dyn, cs.FL  
> 搜索日期: 2026-03-21  
> 论文数量: 8篇精选

---

## 🔥 重点推荐

### 1. [[2603.18913] Geometric Dynamics of Turbulence](https://arxiv.org/abs/2603.18913)
**作者**: Alejandro Sevilla  
**领域**: 湍流理论、几何动力学

**核心创新**:
- 提出湍流可由**涌现振荡自由度**描述，控制 Reynolds 应力
- 近壁 Airy 结构通过非局域反馈选择并稳定主导模式
- 导出 von Kármán 常数 κ ≈ 0.39，Kolmogorov 常数 Ck ≈ 1.80
- 揭示湍流相位场与 **Berry 相位**的联系

**数值方法**: 谱方法、平均场方程

**可行性**: ✅ 理论创新高，为湍流建模提供新视角

---

### 2. [[2603.19180] Reduction of Triadic Interactions Suppresses Intermittency](https://arxiv.org/abs/2603.19180)
**作者**: Anikat Kankaria  
**领域**: 湍流基础理论

**核心创新**:
- 通过**分形/均匀削减** Fourier 空间三元相互作用网络
- 发现削减导致间歇性系统抑制，大 Re 极限下**平均耗散率消失**
- 结构函数指数回归 Kolmogorov 维度值
- 证明**异常耗散**需要完整的三元非线性相互作用

**数值方法**: DNS、分形削减

**可行性**: ⚠️ 理论探索，计算成本高

---

## 🧲 磁流体力学 (MHD)

### 3. [[2603.18882] Scale by scale analysis of magnetoconvection](https://arxiv.org/abs/2603.18882)
**作者**: Jake Ineson  
**领域**: 磁对流、能量预算

**核心创新**:
- Ra=10⁶, Pr=1, Ha=0/20/40/80 的 DNS 分析
- 壁面法向磁场：Lorentz 耗散抑制压力扩散，热羽流变薄
- 壁面平行磁场：Joule 耗散诱导压力-应变重分布
- Lorentz 力作为**各向同性汇**，抑制中间/大尺度运动

**数值方法**: DNS、结构函数预算

**可行性**: ✅ 磁流体建模参考

---

## 🔥 燃烧与反应流

### 4. [[2603.19197] Differential Diffusion and Strain Coupling in LES of H₂-Air Flames](https://arxiv.org/abs/2603.19197)
**作者**: Ivan Langella  
**领域**: LES、氢燃烧

**核心创新**:
- 使用**非拉伸火焰流**热化学捕获差异扩散效应
- 正切向应变导致混合分数增加，负曲率导致混合分数减小
- 模型模拟负 Markstein 长度效应，正应变增加反应速率
- 简化氢预混湍流燃烧建模

**数值方法**: LES + Flamelet 热化学

**可行性**: ✅ 工程应用价值高

---

## 🌊 复杂流体

### 5. [[2603.19190] Power spectra via van der Waals effect in 2D Poiseuille/Couette flow](https://arxiv.org/abs/2603.19190)
**作者**: Rafail Abramov  
**领域**: 可压缩流、非理想流体

**核心创新**:
- 二维惯性流 + van der Waals 效应数值模拟
- 宏观层流下观察到复杂动力学和 Fourier 谱幂律衰减
- 物理机制主要在**密度和速度散度**变量，与涡量无关

**数值方法**: 2D 数值模拟

**可行性**: ⚠️ 理论探索

---

### 6. [[2603.18302] Sub-Yield Dynamics in Yield-Stress Materials](https://arxiv.org/abs/2603.18302)
**作者**: Claudio Fonte  
**领域**: 屈服应力流体、流变学

**核心创新**:
- 并行叠加流变测试验证屈服点以下行为
- 微凝胶和乳液均表现出**有界周期性应变响应**
- 屈服点以下**无流动**，由非线性粘弹性主导
- 呼吁改进本构关系

**数值方法**: 实验流变学

**可行性**: ✅ 材料建模参考

---

## 🖥️ CFD 方法与工具

### 7. [[2603.18622] Reduced-order turbulent flow solver for streamwise periodic fins](https://arxiv.org/abs/2603.18622)
**作者**: Nitish Anand  
**领域**: CFD、周期流

**核心创新**:
- 在 **SU2** 开源 CFD 套件中实现流向周期湍流源项
- 等温壁面边界条件
- 圆形偏置翅片验证：周期求解器准确复现全阵列模拟结果
- 大幅降低换热器仿真计算成本

**数值方法**: RANS/LES、周期边界

**可行性**: ✅ 工程实用，开源工具

---

### 8. [[2603.18222] HHL-Based Quantum-Classical Solver for Incompressible NS](https://arxiv.org/abs/2603.18222) ⚛️
**作者**: Moshe Inger  
**领域**: 量子计算、CFD

**核心创新**:
- **HHL 量子线性算法**耦合离散不可压 N-S 方程
- 基于 Chebyshev 多项式的近似量子态层析 (QST)
- 成功模拟顶盖驱动腔和 Taylor-Green 涡旋
- 使用 IBM Qiskit 实现，验证混合量子-经典求解器

**数值方法**: 量子线性求解器、Qiskit

**可行性**: ⚠️ 前沿探索，量子硬件限制

---

## 📈 统计摘要

| 领域 | 论文数 |
|------|--------|
| 湍流理论 | 2 |
| 磁流体 (MHD) | 1 |
| 燃烧 | 1 |
| 复杂流体 | 2 |
| CFD 方法 | 1 |
| 量子 CFD | 1 |

## 🔗 相关链接

- [arXiv physics.flu-dyn 最近提交](https://arxiv.org/list/physics.flu-dyn/recent)
- [今日新增](https://arxiv.org/list/physics.flu-dyn/new)

---

*由 🥬 菜心 (Caixin) 自动生成*
