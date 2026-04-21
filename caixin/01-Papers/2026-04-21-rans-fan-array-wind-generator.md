# Assessment of RANS Modeling of Jet Interaction in Fan-Array Wind Generator Flows

- **arXiv**: [2604.17352](https://arxiv.org/abs/2604.17352)
- **作者**: M. Hosein Niroomand, Utku Şentürk
- **分类**: physics.flu-dyn
- **发表**: 2026-04-20 (v1)
- **链接**: [PDF](https://arxiv.org/pdf/2604.17352)

---

## 研究背景

**Fan-Array Wind Generators (FAWGs)** 提供受控湍流 inflow 条件，无法在传统风洞中复现。数值模拟研究尚少。

## 方法

### RANS 建模
- **湍流模型**: 待确认 (k-ε 或 SST k-ω 等 eddy-viscosity 闭包)
- **风扇表示**: 压力跳跃边界条件 (pressure-jump BC)，基于制造商标定性能曲线重建

### 几何配置
- **阵列**: 10×10 风扇
- **对比**: 实验测量的轴向速度和湍流强度

---

## 关键结果

### 优势
- ✅ 捕获整体射流相互作用拓扑
- ✅ 较好预测下游速度衰减

### 局限
- ⚠️ 近场注入区和周边剪切层存在**系统性幅度偏差**
- ⚠️ 湍流强度预测偏差较大
- ⚠️ 高混合强度流动中 eddy-viscosity 闭包方法的固有局限

---

## 应用

低宽高比平板作为演示案例，说明 FAWG 产生的 inflow 对气动特性的影响。

## 核心结论

- RANS + 压力跳跃风扇表示提供**计算高效的框架**
- 适合预测 FAWG 系统平均流结构
- **不适用于局部湍流特征的高精度捕捉**

---

## 可行性分析

🥢 **可行性分析：FAWG 系统 RANS 模拟**

## 控制方程
- RANS: $\overline{u_i' u_j'} = -\nu_t \left( \frac{\partial \bar{u}_i}{\partial x_j} + \frac{\partial \bar{u}_j}{\partial x_i} \right)$
- 压力跳跃: $\Delta p = f(\text{fan curve})$

## 数值方法
- 离散化: 有限体积法
- 求解器: RANS (k-ε / SST k-ω)
- 稳定性: CFL 条件

## 计算成本
- 计算量: 中等 (相比 LES/DNS)
- 适用: 参数研究、设计迭代

## 推荐结论
⚠️ 谨慎 — 适合平均流场预测，高精度湍流特征需 LES

*标签*: #RANS #fan-array #wind-generator #CFD #turbulence-modeling