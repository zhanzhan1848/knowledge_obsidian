# Schrödinger-Navier-Stokes Equation for Capillary Fluids

> **元数据**
> - **论文标题**: Schrödinger-Navier-Stokes equation for capillary fluids
> - **arXiv ID**: 2604.11747
> - **作者**: L. Salasnich, S. Succi, A. Tiribocchi
> - **机构**: Università di Padova, IIT, CNR
> - **发表时间**: 2026-04
> - **类别**: Physics / Fluid Dynamics / Quantum-Fluid Connection
> - **标签**: #Quantum-Fluid #Navier-Stokes #Capillary-Fluids #Schrödinger
> - **领域**: 理论流体力学

---

## 核心内容

### Schrödinger-Navier-Stokes (SNS) 方程

将非线性薛定谔方程映射到粘性不可压缩纳维叶-斯托克斯方程：

$$\psi(\mathbf{r},t) = \sqrt{n(\mathbf{r},t)} \, e^{i\theta(\mathbf{r},t)}$$

其中：
- $n(\mathbf{r},t) = |\psi(\mathbf{r},t)|^{2}$ 是粒子数密度
- $\mathbf{v} = D\nabla\theta$ 是速度场
- $D = \hbar/m$ 是量子扩散系数

### SNS 方程完整形式

$$i\hbar\partial_t\psi = \left[ -\frac{\hbar^2}{2m}\nabla^2 + \mu(|\psi|^2) + \kappa\frac{\hbar^2}{2m}\frac{\nabla^2|\psi|}{|\psi|} + i\gamma(|\psi|^2)\frac{\hbar^2}{m}\nabla^2\ln\left(\frac{\psi}{|\psi|}\right) \right] \psi$$

### 关键参数

| 参数 | 控制 | 物理意义 |
|------|------|---------|
| $\kappa$ | 量子和经典过渡 | $\kappa=0$: Gross-Pitaevskii; $\kappa=1$: Navier-Stokes |
| $\gamma$ | 粘性耗散 | 控制粘性阻尼 |

---

## 与纳维叶-克尔特维格方程的联系

SNS方程与**毛细流体纳维叶-克尔特维格 (Navier-Stokes-Korteweg) 方程**形式等价：

- **Korteweg 守恒分量** - 描述毛细效应
- **Rayleigh 耗散分量** - 描述粘性

### 声模色散关系

证明色散参数 $\kappa$ 控制毛细刚度，耗散参数 $\gamma$ 控制粘性阻尼。
在量子极限下恢复 Bogoliubov 色散关系。

---

## 与流体渲染的关联

| 理论 | 渲染应用 |
|------|---------|
| 量子-经典对偶 | 宏观流体行为的简化模型 |
| Korteweg 毛细效应 | 表面张力可视化 |
| 色散关系 | 波浪动画的物理基础 |
| 微观到宏观映射 | 泡沫/飞溅的多尺度模拟 |

---

## 来源

- **arXiv**: https://arxiv.org/abs/2604.11747
- **HTML**: https://arxiv.org/html/2604.11747