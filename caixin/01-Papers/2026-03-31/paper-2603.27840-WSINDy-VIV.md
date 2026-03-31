# Weak Form SINDy for Vortex-Induced Vibrations (VIV)

**arXiv**: [2603.27840](https://arxiv.org/abs/2603.27840)  
**日期**: 2026-03-31  
**分类**: physics.flu-dyn  
**链接**: [[PDF]](https://arxiv.org/pdf/2603.27840) | [[HTML]](https://arxiv.org/html/2603.27840v1)

---

## 核心贡献

使用**弱形式稀疏非线性动力学识别（WSINDy）**从数据中自动发现**涡激振动（VIV）**的支配方程，结合 POD 降维，实现了数据驱动的流固耦合建模。

## 背景

VIV 是流固相互作用的典型问题，传统方法依赖经验公式或振子模型，在复杂流动环境下精度不足。

## 方法论

### 弱形式 SINDy (WSINDy)

**标准 SINDy**：通过数值微分构造 libray matrix → 稀疏回归
$$\dot{\mathbf{x}} = \mathbf{\Theta}(\mathbf{x})\mathbf{\Xi}$$

**弱形式 WSINDy**：
- 用积分形式替代数值微分
- 避免高阶导数的噪声放大
- 对非周期动力学特别鲁棒

$$\int \phi_i \dot{x}_j d t = \int \phi_i \cdot \Theta_j(\mathbf{x}) d t \cdot \Xi$$

### Proper Orthogonal Decomposition (POD)

- 从高保真模拟/实验数据中提取主导时空结构
- 评估尾流时空演化是否可表示在低维流形上

### 数据来源

1. 降阶模型生成的合成数据
2. 高保真模拟结果（验证）

### 关键发现

- WSINDy 可恢复**可解释的、定量可靠**的 VIV 模型
- 对非周期动力学（如锁定区外的 aperiodic VIV）鲁棒性显著优于标准 SINDy
- POD 揭示尾流相干结构与 VIV 响应的耦合关系

## 评估

🥢 可行性分析：**数据驱动 VIV 建模**

### 控制方程
VIV 系统（圆柱 + 横向振动）：
- 流体力：$F_L(t) = \frac{1}{2}\rho U^2 D C_L(t)$
- 结构运动：$m\ddot{y} + c\dot{y} + ky = F_L(t)$

### 数值方法
- **SINDy / WSINDy**：稀疏回归
- **POD**：降维（时空分解）
- 高保真模拟验证（LES/DNS）

### 计算成本
- WSINDy 训练：低计算成本
- 相比实时 CFD：数据驱动方法成本极低

### 推荐结论
✅ **推荐实现** — WSINDy 是 VIV 数据驱动建模的有效工具，弱形式对非周期流动的鲁棒性是关键优势。可用于实时预测和在线控制。

---

*标签*: #SINDy #WSINDy #vortex-induced-vibration #data-driven #fluid-structure-interaction #POD #reduced-order
