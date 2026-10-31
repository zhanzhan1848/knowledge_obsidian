---
type: paper
created: 2026-10-31
updated: 2026-10-31
tags: [paper, fluid-rendering, water-surface, capillary-gravity-wave, vortex, point-vortex, free-surface, surface-rendering]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2610.39149
---

# Capillary-gravity water waves with compactly supported vorticity I: Local constructions and regular drift

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Capillary-gravity water waves with compactly supported vorticity I: Local constructions and regular drift |
| **作者** | Lili Du, Changjun Zou |
| **发表** | arXiv preprint (math.AP) 2026-10-29，76 页 / 2 图 / 1 表（五部曲系列第一篇） |
| **链接** | [原文](https://arxiv.org/abs/2610.39149) |
| **DOI** | — |
| **代码** | — |

> 系列第二篇：[[2026-10-31-Du-Zou-Capillary-Gravity-Vorticity-II-Continuation-Folds]]

---

## 核心贡献

> **首次建立"紧支撑涡量 + 自由液面"耦合系统的系统理论**：把点涡通过 Lyapunov–Schmidt 约化**正则化为光滑紧支撑涡核**，且保持环量与涡量律不变——这是自由液面涡流渲染的参数化基础。

1. 在**无穷深、无粘、不可压**二维流体中，构造携带**固定正环量**点涡的**毛细-重力孤立行波**（small-speed 极限 $W \to 0^+$），通过同时求解自由液面 Bernoulli 方程与**正则化漂移（regular drift）**条件。
2. 自由液面展开至**四阶**，包含**首个毛细修正项**；共形涡深与物理涡深给出**二阶修正**。
3. 在给定域中用 **Kirchhoff–Routh 函数**刻画涡平衡，**证明存在性与一致局部化（uniform localization）**。
4. 联合 Lyapunov–Schmidt 约化将点涡**正则化为光滑紧支撑涡核**，保持环量 $\Gamma$ 与指定涡量律。
5. 周期情形：在**非共振条件**下构造局部分支，并证明当波速趋近正极限时**涡深呈对数发散**（与孤立波情形的 $1/W$ 增长形成对比）。

---

## 技术方案

### 核心思想

**双向耦合**是整个理论的骨架：

- 涡诱导速度 → 通过 Bernoulli 条件决定自由液面响应；
- 自由液面几何 → 通过 Kirchhoff–Routh 函数中的**共形因子**反馈回涡平衡条件。

关键概念是**正则漂移（regular drift）**：减去奇异自诱导速度后的残余项，包含 Kirchhoff–Routh 函数与自由液面几何带来的共形修正。其**消失**即给出涡的位置选择条件。

### 关键技术

| 技术 | 说明 |
|------|------|
| **正则漂移（regular drift）** | $v_{\rm reg}(p_0)=\lim_{q\to p_0}\left[v_{\rm rel}(q)-\frac{\Gamma}{2\pi}\frac{(q-p_0)^\perp}{|q-p_0|^2}\right]=0$，位置选择条件 |
| **共形映射（conformal reduction）** | 把带自由液面的域映射到参考下半平面 $\Pi_-$，液面用 $Z_Y(x)=\Xi_Y(x)+iY(x)$ 参数化 |
| **Kirchhoff–Routh 函数** | 多涡平衡的势能函数 $\mathscr{K}^{(N)}_{Z,W}$，$\nabla_{z_j}\mathscr{K}=0$ 为平衡条件 |
| **Lyapunov–Schmidt 约化** | 联合参数化约化，把点涡正则化为光滑涡核 |
| **Bernoulli 条件线性化** | 算子 $g-\sigma\partial_\xi^2$，Fourier 符号 $g+\sigma k^2$ |
| **共形不变量 $J(Y)$** | $J=|Z_Y'|^2=(1+|D|Y)^2+(Y')^2$，用于变分结构 |
| **Hölder-Sobolev 空间 $\mathcal{O}^s$** | $\mathcal{O}^s=\{Y\in H_{\rm e}^{s+2}(\mathbb{R}): c_Y>0\}$，$c_Y:=\inf_{\mathbb{R}}(1+|D|Y)>0$ |

### 关键公式

**Euler 方程 + 自由液面边界条件**：
$$\begin{cases}(v_{\rm rel}\cdot\nabla)v_{\rm rel}+\nabla P+g e_2=0,\ \nabla\cdot v_{\rm rel}=0\\ \omega=\operatorname{curl}v_{\rm rel},\quad (v_{\rm rel}\cdot\nabla)\omega=0\\ v_{\rm rel}\cdot n=0,\qquad P=\sigma\kappa \quad\text{on } \partial\Omega\end{cases}$$

其中 $n=(-\eta',1)/\sqrt{1+(\eta')^2}$，$\kappa=-\eta''/(1+(\eta')^2)^{3/2}$。

**Bernoulli 条件**（局部化行波，$C=W^2/2$）：
$$\frac{1}{2}|v_{\rm rel}(\xi,\eta(\xi))|^2 + g\eta(\xi) + \sigma\kappa(\xi) = \frac{W^2}{2}$$

**点涡平衡条件**（下半平面 Euler 流）：
$$W-\frac{\Gamma}{4\pi a}+\frac{i\Gamma}{4\pi}\frac{Z''(z_a)}{Z'(z_a)}=0, \qquad z_a \in \Pi_-$$

**涡深渐近**（$W\to 0^+$）：$a_0(W) = \dfrac{\Gamma}{4\pi W}$，即涡深 $\propto 1/W$ 发散。

**毛细数尺度比**：$\beta_W = \sigma/(g\,a_0(W)^2)$ —— 衡量毛细效应相对于重力的强弱；随 $W\to 0$ 趋于 0（远场处毛细效应相对不重要）。

**色散关系**（Part II 中出现）：$W=c_{\rm ph}(|k|):=(g/|k|+\sigma|k|)^{1/2}$ —— 重力波与毛细波的色散叠加，**最小相速在 $k_{\rm min}=(g/\sigma)^{1/2}$**。

**共形曲率**：$\kappa(Y) = -\dfrac{(1+|D|Y)Y''-Y'(|D|Y)'}{J(Y)^{3/2}}$

**Kirchhoff–Routh 函数**：
$$\mathscr{K}_{Z,W}^{(N)}=\sum_{j=1}^{N}\frac{\Gamma_j^2}{4\pi}\log\!\bigl(2|\Im z_j|\,|Z'(z_j)|\bigr)+\sum_{1\leq j<\ell\leq N}\frac{\Gamma_j\Gamma_\ell}{2\pi}\log\frac{|z_j-z_\ell|}{...}$$

---

## 实验结论

- **数据集**: 纯理论（解析构造，无数值实验）
- **基线**: Hur & Wheeler（常涡量重力波存在性）、Ehrnström–Walsh–Zeng（尖峰层方法构造有限深度毛细-重力波）、Chen–Varholm–Walsh–Wheeler（深水孤立点涡波全局分支）、Slease–Walsh–Zhong（局部隐函数论证）
- **结果**:
  - **自由液面四阶展开**，含首个毛细修正
  - **Kirchhoff–Routh 平衡存在性 + 一致局部化**证明
  - **点涡 → 光滑紧支撑涡核正则化**保持环量与涡量律
  - **周期情形**：非共振条件下局部分支；波速 $\to$ 正极限时**涡深对数发散** $\propto \log(1/W)$，与孤立波的 $1/W$ 增长形成鲜明对比

---

## 局限性

- 二维、无粘、无穷深、不可压 —— 不含三维涡结构、不含粘性耗散、不含有限深度边界效应
- 仅孤波与周期波，不含行进波列与波-波相互作用
- Part I 只给局部构造，全局性由 Part II 处理
- 无渲染/可视化输出，纯分析数学

---

## 相关工作

- [[2026-10-31-Du-Zou-Capillary-Gravity-Vorticity-II-Continuation-Folds]] — 全局延拓、紧致性备择、速度折叠
- [[2026-10-30-Capillary-Turbulence-Anisotropic-Kinetic]] — 各向异性毛细波终态谱
- [[2026-10-30-Capillary-Wave-Turbulence-Finite-Systems]] — 毛细波级联动态范围 $\propto \mu^{8/3}$
- [[2026-10-30-Broadband-Water-Wave-NLS]] — 宽频带 NLS 推广形式
- [[2026-10-25-Divisor-Dynamics-Surface-Fluid]] — 任意拓扑曲面点涡 + 因子类不变量

---

## 实现建议

- **实现难度**: 高（分析数学；工程落地需自建共形映射与涡核参数化）
- **预期性能**: N/A（理论）；工程实现为解析参数化，可实时评估
- **适用场景**:
  - ✅ **水面涡旋渲染的解析模型库**：给出"涡 + 自由液面"的低维参数族，可替代昂贵 FLIP 模拟，用于美术可控的水面
  - ✅ **毛细-重力双尺度建模**：$g+\sigma k^2$ 算子分离重力波与毛细波 → **法线贴图频谱可直接按此构造**
  - ✅ **点涡 → 涡核正则化** = 渲染中"点涡视觉尖刺/奇异性"的技术解法：把 $1/r$ 奇异核平滑为紧支撑涡核，消除数值爆炸
  - ✅ **涡深随波速对数发散**（周期情形）→ 渲染"周期波中涡陷深度"参数曲线的依据
  - ⚠️ 不适用于破碎、飞溅、多相、湍流

### 对渲染的转译建议

1. **点涡视觉正则化模板**：渲染中点涡在 $\varepsilon \to 0$ 时速度 $\sim \Gamma/(2\pi r)$ 发散（着色法线不稳定）。本文的紧支撑涡核正则化（保持环量与涡量律）给出**守恒的平滑替代方案**，可直接实现为涡核剖面函数。
2. **水面频谱分离**：$g+\sigma k^2$ 意味着重力波主导低频（$k<k_{\min}$），毛细波主导高频（$k>k_{\min}$），$k_{\min}=(g/\sigma)^{1/2}$。**法线贴图频谱斜率**应在此处换斜率，勿用单一幂律。
3. **涡深-波速关系**：孤立波 $\propto 1/W$、周期波 $\propto \log(1/W)$，两种曲线可作为"涡陷深度 vs 波速"的插值查找表。
4. **共形映射工具箱**：$Z_Y(x)=\Xi_Y(x)+iY(x)$ 参数化 + $J=|Z_Y'|^2$ 是"从参考域到物理域"的映射框架，可用于任意拓扑水域的解析波面生成。
