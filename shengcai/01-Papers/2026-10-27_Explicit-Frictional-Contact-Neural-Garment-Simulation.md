---
type: paper
created: 2026-10-27
updated: 2026-10-27
tags: [paper, 渲染, 物理仿真, 布料, 接触力学, 摩擦, GNN, WACV2027, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.33492
---

# Explicit Frictional Contact Modeling in Neural Garment Simulation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Explicit Frictional Contact Modeling in Neural Garment Simulation |
| **作者** | Thanh-Nguyen Truong, Vu-Hoang Tran, Ching-Chun Huang（NVIDIA / 台湾大学等） |
| **发表** | arXiv preprint 2026-10-24（cs.CV / cs.GR / cs.LG），**WACV 2027** |
| **链接** | [原文](https://arxiv.org/abs/2610.33492) |
| **DOI** | 10.48550/arXiv.2610.33492（DataCite pending） |
| **代码** | 论文未给出仓库链接（待跟踪） |

---

## 核心贡献

> 神经布料模拟的 GNN 预测器把摩擦留在训练能量里，导致**推理时没有摩擦系数 $\mu$ 可调**，且按 $\mu$ 重训几乎无响应。本文提出 **Modular Contact Operator**：在**冻结**的预测器之后、**不重训、不迭代求解**的前提下，闭式地施加逐接触点的库仑摩擦条件 —— 推理时 $\mu$ 可自由调节。

1. **诊断**：GNN 预测器中的摩擦项 $E_{\mathrm{friction}}$ 只是**固定权重的滑动惩罚**，训练出的权重在推理时**不施加任何逐接触的库仑条件**；优化求解器虽然正确，但必须每步重优化。
2. **Modular Contact Operator（四个阶段）**：
   - **法向载荷估计**：从提案的加速度推断有效压缩法向载荷 $\hat\lambda_n$（运动学估计，非精确接触反力）
   - **闭式库仑修正**：把法向载荷转成**制动长度** $b$，用经典 block soft-threshold 得到切向修正
   - **几何感知接触遍历**：沿身体三角形网格**展开**滑动路径（铰链旋转展开），而非直线弦；保持表面弧长
   - **摩擦诱导运动传播**：用**线性化膜波**把切向修正传播到周围布料，并施加应变预算
3. **可迁移性**：同一算子**无需修改**即挂到 HOOD 与 ContourCraft 两个不同架构的检查点上。
4. **结果**：40 组匹配序列上，粘着随 $\mu$ **单调上升**、滑移**单调下降**，追踪参考求解器 PPF 的响应方向（而按 $\mu$ 特化重训的基线几乎持平）；平均穿透率低、拉伸与参考一致，**运行时间为求解器的 1/8**。

---

## 技术方案

### 核心思想

**问题**：物理求解器（如 PPF）每步都要重新优化布料状态来判定每个接触点的 stick-slip 状态，开销大。神经预测器（GNN）快，但摩擦是隐式的。

**关键区分**：

优化求解器的摩擦目标：
```math
x_{t+1} = \arg\min_x E_{\mathrm{phys}}(x; \bar s_t) + D_\mu(x),
\qquad
D_\mu(x) = \sum_{i\in C} \mu\lambda_{n,i}f_0(\|\Delta_{T,i}(x)\|)
```
求解器**反复更新接触反力与切向标架直到步收敛** —— 摩擦条件是「涌现」的，代价是迭代。

HOOD 类预测器的原生摩擦能量：
```math
E_{\mathrm{friction}} = \sum_{i\in C} \mu\, m_i g \cos\phi_i \,\big\|\Delta e_i^\top(\hat x_{t+1})\big\|
```
这里 $\mu m_i g\cos\phi_i$ 只是**固定训练权重**，网络从不计算真实接触反力 → 推理时无逐接触库仑条件。且**按 $\mu$ 重训也几乎不响应**（论文实测「stays flat」）。

**解法**：**预测之后再显式施加摩擦**。冻结预测器，在其输出后接一个算子，用「从提案运动学推断的法向载荷」+「闭式库仑阻断」近似求解器会算出的 stick-slip 判定 —— 无需迭代、无需重训、$\mu$ 推理时可调。

**管线位置**：
```math
\bar s_t \;\longrightarrow\; G_{\theta^*} \;\longrightarrow\; \hat x_{t+1}
\;\longrightarrow\; P_\mu \;\longrightarrow\; x_{t+1} \;\longrightarrow\; \bar s_{t+1}
```
算子插在 **GNN 与自回归 rollout 之间**。$\mu=0$ 时算子为**严格恒等**（包括传播阶段）。

### 关键技术

| 技术 | 说明 |
|------|------|
| **接触集** | $C_\epsilon=\{i\mid d_i<\epsilon\}$，$d_i$ 为服装顶点 $i$ 到身体的有符号距离，$\epsilon$ 为固定接触壳宽度。每个接触取最近身体面提供局部法向-切向标架与身体运动 |
| **法向载荷估计** | $\hat\lambda_n=[n^\top b_{\mathrm{res}}]_+=m\big[g\,n^\top e_{\mathrm{up}}+n^\top a_b\big]_+$。$g n^\top e_{\mathrm{up}}$ 提供重力静态支撑估计，$n^\top a_b$ 提供法向速度突变的冲击估计。**弹道自由落体会抵消重力项** |
| **制动长度** | $b=\frac{\mu\hat\lambda_n h}{2m}=\mu h^2\big[n^\top(a_b+g e_{\mathrm{up}})\big]_+$。**集总质量 $m$ 抵消** —— $b$ 只由 $\mu$、时间步、提案相对自由落地的压缩偏离决定 |
| **闭式库仑修正** | 经典 block soft-threshold：$\Delta_T^+=\max\!\big(0, 1-\frac{b}{\sqrt{\|\Delta_T\|_2^2+(\epsilon_v h)^2}}\big)\Delta_T$，$\epsilon_v=2\times10^{-3}\ \mathrm{m/s}$。静态带 $(\epsilon_v h)$ 正则化 stick/slip 过渡 |
| **接触遍历** | 把两个端点投影到各自支撑面（保持有符号面间隙）；从身体承载足点出发，瞄准展开到当前三角形的暂定端点；推进到第一个被跨越的面边界；沿铰链旋转**展开**剩余目标；沿两面法向的角平分线把交界点抬离折痕。展开是等距的 → 路径穿过面带时是直线且保持表面弧长 |
| **分段制动长度** | 每个跨越面 $k$ 有自己的 $b_k$（把残余力投影到该面法向）。落点 $\sigma_*$ 满足 $L-\sigma_*=b_{k(\sigma_*)}(\sigma_*)$，用静态带正则化，从暂定端点选最近的可行落点 |
| **运动传播** | 线性化膜波 $M\ddot w=-K_0w$，$\tau\in(0,h]$。每个修正接触走平滑斜坡 $w_i(\tau)=s(\tau/h)c_{T,i}$，$s(r)=3r^2-2r^3$（起止静止）。应变预算 $\|w_i-w_j\|\le\gamma_{\max}\ell_{ij}$，按逆质量分摊裁剪 |
| **非穿透** | 落点后刷新载荷与法向；normal-completion 步骤恢复修正前的局部间隙（受非穿透钳制）；传播可能把自由顶点推向身体 → 最终钳制恢复间隙 |

### 公式

**法向载荷估计**：
```math
a_b = \frac{\hat x_{t+1}-2x_t+x_{t-1}}{h^2},
\qquad
b_{\mathrm{res}} = m\big(a_b + g e_{\mathrm{up}}\big)
```
```math
\hat\lambda_n = \big[n^\top b_{\mathrm{res}}\big]_+
= m\Big[g\, n^\top e_{\mathrm{up}} + n^\top a_b\Big]_+
```
（$[q]_+=\max(q,0)$ 保留压缩、排除粘附。）

**制动长度与闭式库仑修正**：
```math
b = \frac{\mu\hat\lambda_n h}{2m}
= \mu h^2\Big[n^\top\big(a_b + g e_{\mathrm{up}}\big)\Big]_+
```
```math
\Delta_T^+ = \max\!\left(0,\; 1 - \frac{b}{\sqrt{\|\Delta_T\|_2^2 + (\epsilon_v h)^2}}\right)\Delta_T,
\qquad \epsilon_v = 2\times10^{-3}\ \mathrm{m\,s^{-1}}
```

**分段落点求解**：
```math
L - \sigma_* = b_{k(\sigma_*)}(\sigma_*),
\qquad
\sigma\in[0,L]
```

**线性化膜波传播**：
```math
M\ddot w = -K_0 w, \qquad \tau\in(0,h]
```
```math
w_i(\tau) = s(\tau/h)\,c_{T,i},
\qquad s(r) = 3r^2 - 2r^3
```
```math
\|w_i - w_j\| \le \gamma_{\max}\,\ell_{ij}
```

---

## 实验结论

- **数据集 / 设置**：
  - 两个神经布料预测器：**HOOD**、**ContourCraft**
  - 每个预测器两种配置：**(a) + 本文算子**（骨干在**无摩擦项**下重训，推理时挂算子 → 摩擦响应不可能来自训练）；**(b) + 原生 $E_{\mathrm{friction}}$**（同架构带继承的摩擦能量重训，**每个 $\mu$ 一个检查点**）
  - 参考求解器：**PPF**
  - 摩擦系数 $\mu\in[0,0.6]$；**4 个 HOOD 服装模板** × **10 个 AMASS CMU 动作** = **40 组**匹配序列（5 个来自 SNUG/HOOD 评测集，5 个来自含持续载荷与预测低载荷空例的预注册扩展；仅保留 PPF 在所有系数下都完成的序列）
  - 指标：**Stick fraction**（接触布料中处于或低于算子静态带 $\epsilon_v=2\ \mathrm{mm/s}$ 的比例）；**相对滑移速度** $S(\mu)/S(0)$（$S(0)$ 为同一候选的 $\mu=0$ rollout 的平均切向布料-身体速度）
- **结果**：
  - **PPF**：stick 随 $\mu$ 上升，滑移下降
  - **ContourCraft + 本文算子**：stick **单调上升**、滑移**单调下降**
  - **HOOD + 本文算子**：同样单调
  - **ContourCraft + 原生 $E_{\mathrm{friction}}$**：几乎**持平**
  - **HOOD + 原生 $E_{\mathrm{friction}}$**：几乎**持平**
  - 算子方向与参考求解器一致，但**响应斜率较缓**
  - 两个架构上共享同一趋势 → 显式摩擦响应**跨架构可迁移**
  - 按 $\mu$ 特化重训原生摩擦能量模型**几乎无变化** → 印证「固定训练惩罚无法建立逐接触库仑条件」
  - 质量：平均穿透率低、拉伸与参考一致，**运行时间为求解器的 1/8**
- **实现设置**：时间步 $h=\frac{1}{30}\,\mathrm{s}$；GNN 每帧运行一次且保持冻结；算子每帧运行一次；无迭代布料求解

---

## 局限性

1. **法向载荷是运动学估计，不是精确接触反力**：论文明确说明 $\hat\lambda_n$ **不是**耦合布料-身体系统的真实反力，只是用来设定可用摩擦预算的估计。因此响应对参考求解器**偏缓**（斜率较平）。
2. **接触遍历不是全局最短路径**：其离散化由跨越的三角形决定（论文明确声明）。
3. **参数细节在补充材料**：接触壳宽度 $\epsilon$、膜刚度具体值、$\gamma_{\max}$ 数值未在正文中给出。
4. **传播是线性化的**：用线性化膜波（$M\ddot w=-K_0w$）近似布料对切向修正的响应，不含非线性布料力学。
5. **退化情形回退到弦落点**：模糊或退化的遍历回退到直线弦 landing（精度下降）。
6. **不含自碰撞/层间碰撞**：接触集只针对身体。
7. **代码未开源**。

---

## 相关工作

- [[HOOD]] — 神经布料模拟骨干之一
- [[ContourCraft]] — 另一神经布料模拟骨干
- [[PPF]] — 物理参考求解器
- [[AMASS]] — 动作数据集
- [[Cloth-Simulation]] / [[Neural-Garment-Simulation]] — 相关概念

---

## 实现建议

- **实现难度**：**中**。四个阶段都是标准的数值方法（运动学载荷估计、soft-threshold、网格展开遍历、线性膜波），无学习组件。难点在于：(a) 身体三角网格上的稳健遍历与退化处理；(b) 膜波传播的稳定性与应变预算裁剪；(c) 接触区域/非接触区域之间的位移连续性（否则会过度拉伸邻边）。
- **预期性能**：运行时间为参考求解器的 **1/8**；stick/slip 对 $\mu$ 的响应单调且方向正确，但斜率较平；平均穿透率低、拉伸与参考一致。
- **适用场景**：
  - ✅ 需要**推理时可调摩擦系数**的神经布料模拟（$\mu=0$ 严格退化为基线）
  - ✅ 想把物理修正「模块化」嫁接到已有学习式求解器（冻结骨干，零重训）
  - ✅ 跨架构迁移（同一算子挂到 HOOD / ContourCraft）
  - ⚠️ 高精度接触力学（真实反力求解）
  - ❌ 自碰撞 / 层间碰撞主导的场景
- **推荐度**：**⭐⭐⭐⭐ 推荐** —— 范式非常值得学习：**「把物理约束从训练目标里拆出来，作为后处理算子显式施加」**。这个思路可以迁移到我们的其他学习式物理/渲染模块 —— 例如在神经渲染器训练后加一个「显式能量守恒/一致性修正算子」，让关键物理参数在推理时可调，而无需重训。

---

## 原始链接

- 论文：https://arxiv.org/abs/2610.33492
- PDF：https://arxiv.org/pdf/2610.33492
