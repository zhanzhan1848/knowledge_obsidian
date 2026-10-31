---
type: paper
created: 2026-10-31
updated: 2026-10-31
tags: [paper, fluid-rendering, water-surface, capillary-gravity-wave, vortex, bifurcation, free-surface, surface-rendering]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2610.39163
---

# Capillary-gravity water waves with compactly supported vorticity II. Continuation and folds of the solution curve

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Capillary-gravity water waves with compactly supported vorticity II. Continuation and folds of the solution curve |
| **作者** | Lili Du, Changjun Zou |
| **发表** | arXiv preprint (math.AP) 2026-10-29，75 页 / 3 图（五部曲系列第二篇） |
| **链接** | [原文](https://arxiv.org/abs/2610.39163) |
| **DOI** | — |
| **代码** | — |

> 系列第一篇：[[2026-10-31-Du-Zou-Capillary-Gravity-Vorticity-I-Local-Constructions]]

---

## 核心贡献

> **给出"涡 + 自由液面"耦合系统的全局解曲线理论**：要么几何控制量发散，要么沿解序列保持有界；并在**简单速度折叠点**证明两支等速波的**静态能量-动量 Hessian 负指数差恰为 1**。

1. 应用 **Haziot–Wheeler 解析延拓定理**，将 Part I 构造的小波速点涡分支**延拓为全局耦合平衡曲线**。
2. 建立**两种全局备择（global alternatives）**：
   - **备择一**：几何控制量**发散**；
   - **备择二**：沿一列解保持**有界**，但**不存在强收敛子列**。
3. 在备择二下，用**集中紧性（concentration–compactness）**得到**有限剖面分解**——**无需假设自由液面单调性**：一个非平凡中心涡波 + 有限对反射的无旋波 + 强收敛趋零的余项。
4. 在任意**简单速度折叠点**，用物理涡坐标下的 **Schur 补约化**证明：两条相邻等速波的静态能量-动量 Hessian 在对称类中**负指数相差恰为 1**。
5. 用**联合双参数 Lyapunov–Schmidt 约化**把 Part I 的正则化推广到全局解曲线的紧弧，携带正则光滑核分支穿越指定简单速度折叠。

---

## 技术方案

### 核心思想

全局延拓会遇到两种"病态"：

- **紧致性丧失（loss of compactness）**：强收敛失败 → 需备择分析；
- **简单折叠（simple folds）**：曲线仍正则，但波速发生非退化转折 → 一侧存在**两条不同但等速**的邻近波。

"备择"（alternatives）的措辞是全篇的骨架：不做单一断言，而是穷尽所有可能。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Haziot–Wheeler 解析延拓定理** | 把局部隐函数分支延拓为全局曲线 |
| **集中紧性** | 在无单调性假设下提取有限剖面分解 |
| **Schur 补约化** | 在物理涡坐标下分析耦合系统的 Hessian 谱结构 |
| **联合双参数 Lyapunov–Schmidt 约化** | 同时处理液面与质量约束内方程 |
| **归一化漂移残差** | 漂移残差以 $O(\varepsilon)$ 误差收敛到点涡正则漂移残差（$C^2$ 意义） |
| **变分/Hamiltonian 视角** | 能量-动量 Hessian 与稳定性、多重性问题 |
| **共形参数化** | $Z_Y(x)=\Xi_Y(x)+iY(x)$，$c_Y:=\inf_{\mathbb{R}}\Xi_Y'>0$ 保证映射有效 |

### 关键公式

**流场与自由液面**：
$$\Omega=\{(\xi,y)\in\mathbb{R}^2:y<\eta(\xi)\},\quad \omega=\operatorname{curl}v_{\rm rel},\quad (v_{\rm rel}\cdot\nabla)\omega=0$$

**Bernoulli 边界条件**：
$$\frac{1}{2}|v_{\rm rel}(\xi,\eta(\xi))|^2+g\eta(\xi)+\sigma\kappa(\xi)=\frac{W^2}{2}$$

**正则漂移条件**（涡位置选择）：
$$v_{\rm reg}(p_0):=\lim_{q\to p_0}\left[v_{\rm rel}(q)-\frac{\Gamma}{2\pi}\frac{(q-p_0)^\perp}{|q-p_0|^2}\right]=0,\qquad r^\perp:=(-r_2,r_1)$$

**色散关系**：
$$W=c_{\rm ph}(|k|):=(g/|k|+\sigma|k|)^{1/2}$$

**共形 Jacobian 与曲率**：
$$J(Y):=|Z_Y'|^2=(1+|D|Y)^2+(Y')^2,\qquad \kappa(Y)=-\frac{(1+|D|Y)Y''-Y'(|D|Y)'}{J(Y)^{3/2}}$$

**涡诱导速度剖面（对称情形）**：
$$q_{a,W}(x):=W-\frac{\Gamma a}{\pi(x^{2}+a^{2})}$$

**内方程（变分泛函）**：
$$gY+\sigma\kappa(Y)+\frac{q_{a,W}^{2}}{2J(Y)}-\frac{W^{2}}{2}$$

**正则漂移残差（等价的显式形式）**：
$$W-\frac{\Gamma}{4\pi a}-\frac{\Gamma}{4\pi}\frac{E_a(Y'')}{1+E_a(|D|Y)}$$

**Hilbert 变换约定**：$\widehat{Hh}(\zeta)=i\,\operatorname{sgn}(\zeta)\widehat{h}(\zeta)$

**可解性空间**：
$$\mathcal{O}^s:=\{Y\in H_{\rm e}^{s+2}(\mathbb{R}):c_Y>0\},\qquad \mathscr{U}^s:=\mathcal{O}^s\times(0,\infty)\times(0,c_{\min})$$

---

## 实验结论

- **数据集**: 纯理论（解析延拓 + 变分分析，无数值实验）
- **基线**: Buffoni–Groves–Toland（无旋毛细-重力孤波）、Constantin–Strauss–Varvaruca（常涡量周期重力波）、Chen–Varholm–Walsh–Wheeler（深水孤立点涡波全局分支）、Shatah–Walsh–Zeng（尖峰层方法）、Ehrnström–Walsh–Zeng
- **结果**:
  - **全局延拓成立**，产生全局耦合平衡曲线
  - **两备择穷尽**：几何控制量发散 / 有界但无强收敛子列
  - **有限剖面分解**：中心涡波 + 有限对反射无旋波 + 余项强收敛
  - **简单速度折叠点**：对称类内两支等速波的静态能量-动量 Hessian **负指数相差 1**
  - **正则化延拓**：漂移残差以 $O(\varepsilon)$ 误差（$C^2$）收敛到点涡残差；正则光滑核分支可穿越指定简单折叠

---

## 局限性

- 纯理论论文，无数值实验与可视化
- 二维、无粘、无穷深；不含波-波相互作用、不含湍流
- 折叠分析限于**非退化（simple）折叠点**；退化折叠未处理
- "负指数相差 1"是强结论但仅在**对称类**内成立

---

## 相关工作

- [[2026-10-31-Du-Zou-Capillary-Gravity-Vorticity-I-Local-Constructions]] — 局部构造与正则漂移（Part I）
- [[2026-10-25-Divisor-Dynamics-Surface-Fluid]] — 任意拓扑曲面点涡；因子类不变量对应本文的变分不变量
- [[2026-10-30-Capillary-Turbulence-Anisotropic-Kinetic]] — 各向异性终态谱
- [[2026-10-30-Capillary-Wave-Turbulence-Finite-Systems]] — 毛细波级联动态范围
- [[2026-10-30-Broadband-Water-Wave-NLS]] — 宽频带 NLS 推广形式
- [[2026-10-25-ML-Operator-Lexicon-PDE-Solvers]] — ML 算子化 PDE 求解器

---

## 实现建议

- **实现难度**: 高（分析数学 + 变分/分岔数值实现）
- **预期性能**: 理论解曲线可离线预计算并转为查找表，运行时实时求值
- **适用场景**:
  - ✅ **水面波解曲线的参数化生成**：全局平衡曲线 → 美术可调的"波型族"（而非单一定解）
  - ✅ **波型多重性（multiplicity）**：折叠点意味着**同一波速对应两种不同液面形态** → 渲染端可选不同解，提供视觉变化
  - ✅ **能量-动量 Hessian 判据** → 稳定性判据，可用于"哪些解是视觉上稳定/不稳定"的分类，驱动动画过渡选择
  - ✅ **Hessian 负指数差 1** → 二阶系统的"单折"行为，可用于构造波型演化中的翻转（flip）动画
  - ⚠️ 不适用于破碎/飞溅/湍流

### 对渲染的转译建议

1. **解曲线 → 形态库**：把全局解曲线离散采样为"波型查找表"，索引 $(\text{波速} W, \text{涡深} a)$，实时端插值得到液面剖面 + 涡位置。这比 FLIP 模拟便宜几个数量级，且**可控性更强**。
2. **折叠点作为"形态开关"**：跨越折叠点时液面形态发生质变（单极值 → 多极值），可作为**程序化水面动画的转场触发点**——例如水流撞击水面时液面从"平滑拱起"跳到"破碎前多峰"的那一刻。
3. **集中紧性备择 → 远场解构造**：有限剖面分解直接给出**远场尾波结构**（中心涡波 + 反射波对），可用于有限网格求解器的**人工边界条件**（吸收边界/远场解）。
4. **色散关系落地**：$W=(g/|k|+\sigma|k|)^{1/2}$ 表明最低相速在 $k_{\min}=(g/\sigma)^{1/2}$，该点相速 $c_{\min}=2\sqrt{g\sigma}$。渲染端做波包传播时应以此为**群速度零点/转向点**处理（数值色散需注意）。
