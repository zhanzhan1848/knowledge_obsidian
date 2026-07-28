# 流体力学论文日报 - 2026年7月28日

> 关键词：CFD | fluid simulation | Navier-Stokes | SPH | LBM | vortex method | turbulence

---

## 📄 今日发现: 10 篇相关论文

---

## 1. A Modified Moving Reference Frame Method for Propeller Resolution

**arXiv:** [2607.24630](https://arxiv.org/abs/2607.24630)  
**作者:** Denis Andreev  
**日期:** 2026-07-27  
**分类:** `CFD` `ship hydrodynamics` `MRF` `RANS`

### 核心创新点

提出了改进的 MRF (mMRF) 方法来解决螺旋桨-船体相互作用问题。关键创新：

- **空间变化的旋转速率**: 参考系旋转速率由空间变化函数缩放，从螺旋桨附近的1平滑衰减到域边界的0
- **连续性恢复**: 消除了传统 MRF 在旋转/静止域边界处的速度和压力不连续性

### 控制方程

- RANS 方程
- Taylor-Couette 解析解验证
- FreSCo⁺ 求解器

### 数值方法

| 项目 | 说明 |
|------|------|
| 离散化 | 有限体积法 |
| 求解器 | RANS |
| 应用 | 螺旋桨敞水、自推进船舶 |

### 主要结论

- mMRF 在保持相同计算成本的情况下显著减少界面不连续性
- 推进参数 (Kₜ, K_Q, 1-t, 1-wₜ, η_R) 精度与传统 MRF 相当

---

## 2. The balance between compactness and forecast accuracy of data-driven latent-space reduced-order models

**arXiv:** [2607.24569](https://arxiv.org/abs/2607.24569)  
**作者:** Alberto Solera-Rico  
**日期:** 2026-07-27  
**分类:** `machine learning` `ROM` `flow control` `POD` `CAE` `LSTM`

### 核心创新点

研究流动控制中降阶模型 (ROM) 的空间编码器选择对对流预测的影响：

- **POD vs CAE**: POD 产生更平滑的潜在轨迹，更易学习外推
- **CAE**: 更高压缩率，但潜在动力学更不规则，频谱宽
- **Trade-off**: 压缩率与预测精度的权衡

### 测试配置

- 简化卡车尾流
- 流体台球 (fluidic pinball)

### 关键发现

| 模型 | 短期重建 | 长期预测 | 稳定性 |
|------|----------|----------|--------|
| POD + LSTM | 较低 | 可靠 | 高 |
| CAE + LSTM | 锐利 | 快速退化 | 低 |

### 应用价值

- 模型预测控制 (MPC)
- 强化学习控制策略

---

## 3. Bubble growth on arrays of micro-electrodes

**arXiv:** [2607.24286](https://arxiv.org/abs/2607.24286)  
**作者:** Mengyuan Huang  
**日期:** 2026-07-27  
**分类:** `multiphase flow` `VOF` `electrochemistry` `phase change`

### 核心创新点

- **解析电场**: 不同于早期模型假设均匀电流密度，直接求解初级电场
- **三维 VOF 相变模拟**: 在 Basilisk 中实现
- **电极图案化**: 研究催化电极岛阵列上的多气泡生长

### 关键发现

- 外层气泡在生长过程中倾向于向外漂移
- 漂移受邻居气泡生长驱动的液体对流控制，标度律为 1/d²
- 电极图案化可利用来定制电场分布，减少气泡导致的电阻损耗

### 数值方法

| 项目 | 说明 |
|------|------|
| 求解器 | Basilisk |
| 方法 | 3D VOF + 相变 |
| 应用 | 水电解 |

---

## 4. Influence of a vertical-wall leading edge on bouncing and escape bubble rising regimes

**arXiv:** [2607.24248](https://arxiv.org/abs/2607.24248)  
**作者:** Emilio José Vega  
**日期:** 2026-07-27  
**分类:** `bubble dynamics` `multiphase flow` `wall effect`

### 核心创新点

研究垂直壁面前缘位置对气泡近壁动力学的影响：

- **两种构型**: 壁面从注射点下方延伸 vs 壁面前缘位于下游
- **动力学转变**: 从周期性弹跳 (PB) 到弹跳-翻转-逃逸 (BTE)
- **Strouhal 数分析**

### 关键无量纲参数

- Bond 数 (Bo)
- Galilei 数 (Ga)
- Reynolds 数 (Re)

### 主要结论

- 壁面前缘位置影响 BTE 起始时的气泡尺寸
- PB 区域 St ≈ 0.014 (壁面从注射点延伸)
- 下游壁面构型测量到更低 St 值

---

## 5. Adjoint Sensitivity Maps for Passive Flow Control Around Rotating Circular Cylinders

**arXiv:** [2607.23831](https://arxiv.org/abs/2607.23831)  
**作者:** Niklas Kühl  
**日期:** 2026-07-26  
**分类:** `adjoint sensitivity` `flow control` `rotating cylinder` `Flettner rotor`

### 核心创新点

- **拓扑伴随灵敏度分析**: 用于旋转圆柱绕流
- **多目标优化**: 同时考虑阻力、升力和扭矩
- **宽操作范围**: Re = 10¹ ~ 10⁷，旋转比 0 ~ 2π

### 方法

- 多孔介质公式
- Darcy 型源项
- 灵敏度验证的向前模拟

### 关键发现

- 灵敏度场的大尺度拓扑主要由旋转比控制
- Reynolds 数影响相对较弱

---

## 6. Dynamics of fluid-fluid displacements in a model rough fracture beyond the quasistatic limit

**arXiv:** [2607.23759](https://arxiv.org/abs/2607.23759)  
**作者:** Ran Holtzman  
**日期:** 2026-07-26  
**分类:** `porous media` `multiphase flow` `Haines jump` `spectral method`

### 核心创新点

- **谱计算方法**: 模拟异质介质中流体-流体界面演化
- **超越准静态极限**: 涵盖准静态到有限速率
- **Hele-Shaw 单元**: 变孔径"不完美"模型

### 关键理论结果

- Haines 跳跃期间的粘性力完全解释连续亚稳态平衡之间的能量耗散
- 粘度不改变总耗散量，只改变弛豫时间

### 数值方法

| 项目 | 说明 |
|------|------|
| 方法 | 谱方法 |
| 验证 | CFD + 实验 |
| 应用 | 多孔介质流动 |

---

## 7. Characterisation of a multistable turbulent wake

**arXiv:** [2607.23206](https://arxiv.org/abs/2607.23206)  
**作者:** Joran Rolland PhD  
**日期:** 2026-07-25  
**分类:** `turbulence` `wake dynamics` `multistability` `stochastic model`

### 核心创新点

- **实验研究**: PIV 测量 (Re = 10000)
- **随机微分方程建模**: 用于分析多稳态
- **数据驱动模型训练**: 在简单性和精度之间权衡

### 多稳态区域

| G/H 范围 | 区域类型 |
|----------|----------|
| [1.15, 1.25] | 三稳态 |
| [1.5, 2.65] | 双稳态 |
| [3.0, 3.5] | 单稳态 |

### 关键优势

- 从数据中恢复分叉理论预期的漂移
- 能够拟合复杂多稳态区域的非典型漂移表达式

---

## 8. A vectorial lattice Boltzmann scheme for the incompressible Navier-Stokes equations

**arXiv:** [2607.24059](https://arxiv.org/abs/2607.24059)  
**作者:** Tommaso Tenna  
**日期:** 2026-07-27  
**分类:** `LBM` `Navier-Stokes` `numerical method`

### 核心创新点

- **矢量式 LBM 格式**: 针对不可压缩 N-S 方程
- **来源**: Carfora & Natalini (ESAIM: M2AN, 2008) 的离散速度动力学近似
- **二阶精度**

### 方法对比

优势与权衡（相对于松弛格式）通过：
- 线性情况谱分析
- 非线性问题数值验证

---

## 9. No Free Lunch in Flow Surrogates under Time-Varying Boundary Conditions

**arXiv:** [2607.23667](https://arxiv.org/abs/2607.23667)  
**作者:** Georg Winkler  
**日期:** 2026-07-26  
**分类:** `surrogate model` `DeepONet` `flow control` `time-varying BC`

### 核心创新点

- **两种瞬态流**: CMP 浆膜 (3D) vs 卡门涡街 (2D)
- **8 种代理模型比较**: 全场 vs 潜在表示 × 单次 vs 逐步预测

### 关键发现

| 流类型 | 最佳模型 | 原因 |
|--------|----------|------|
| CMP 薄膜 | 单次全场模型 | 边界驱动，需直接映射 |
| 卡门涡街 | 自回归 DeepONet | 自持尾流，需相位记忆 |

### 性能提升

- 代理模型比有限元求解器快 10³ ~ 10⁴ 倍
- 但离线训练成本需在首次查询后回收

---

## 10. Central-Hermite Sensing and Collision for Frame-Robust Order-Resolved Relaxation on D3Q125

**arXiv:** [2607.23629](https://arxiv.org/abs/2607.23629)  
**作者:** Bjørn Wu  
**日期:** 2026-07-26  
**分类:** `LBM` `kinetic theory` `numerical stability`

### 核心创新点

- **中心-Hermite 公式**: 针对 D3Q125 动力学模型
- **帧鲁棒性**: 减少不同阶之间的虚假耦合
- **阶分辨对数-高斯松弛**

### 模型变体

| 模型 | Sensing | Collision |
|------|---------|-----------|
| A | Raw | Raw |
| B | Central | Raw |
| C | Central | Central |

### 关键结果

- 模型 C 保持三阶和四阶模态纯度至机器精度
- 减少碰撞后帧差异 65-98%
- 传输依赖性仍然存在（离散传输和有限速度空间表示）

---

## 📊 关键词分布统计

| 关键词 | 出现次数 |
|--------|----------|
| CFD | 3 |
| multiphase flow | 3 |
| turbulence | 1 |
| LBM | 2 |
| machine learning | 2 |
| flow control | 3 |
| ROM | 1 |
| VOF | 1 |

---

## 🔬 值得深入关注的论文

1. **2607.24630** - mMRF 方法 (工业 CFD 应用价值高)
2. **2607.24569** - POD vs CAE 权衡 (ML + CFD 交叉)
3. **2607.24059** - 矢量式 LBM (数值方法创新)
4. **2607.23667** - 代理模型的两态研究 (深度学习 + 流动控制)

---

*生成时间: 2026-07-28 14:14 UTC*
