---
type: paper
created: 2026-10-31
updated: 2026-10-31
tags: [paper, fluid-rendering, multiphase, vof, openfoam, bubble, droplet, riser]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2610.39586
---

# On the rise of a Taylor bubble–drop assembly in a vertical tube

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | On the rise of a Taylor bubble–drop assembly in a vertical tube |
| **作者** | Quan Yao, Guangzhao Zhou |
| **发表** | arXiv preprint (physics.flu-dyn) 2026-10-29 |
| **链接** | [原文](https://arxiv.org/abs/2610.39586) |
| **DOI** | — |
| **代码** | 开源求解器 **OpenFOAM `multiphaseInterFoam`**（PIMPLE 算法 + VOF 界面捕获） |

---

## 核心贡献

> **反直觉发现：Taylor 气泡-液滴组合体（TBDA）的上升速度与孤立 Taylor 气泡（ITB）完全相同，而非被液滴拖慢** —— 附着液滴反而使液滴本身以气泡速度快速上升。

1. 实验 + DNS 双重验证：TBDA 上升速度**与液滴长度无关**，等于 ITB 速度，且**显著快于**孤立 Taylor 液滴（ITD）。
2. 给出**解析模型**预测组合体内的液滴半径。
3. 机制解释：气相形成的"滑移/润滑层"使油滴几乎不增加系统的黏性负载。
4. 应用价值：**气泡辅助快速输运**不相溶液相（受限环境气举系统）。

---

## 技术方案

### 核心思想

Taylor 气泡（长子弹形气泡）以"几乎无壁面摩擦"的速度上升。液滴密度与黏度远大于气体，理论上会**拖慢**气泡；但实验显示附着液滴几乎不影响气泡速度——液滴被夹带在气泡尾部的液膜/尾流中，形成"液滴-气泡组合体"整体运动。

### 关键技术

| 技术 | 说明 |
|------|------|
| **实验 + DNS 交叉验证** | 10 mm 直径亚克力管，80% 甘油-水溶液，硅油液滴 |
| **OpenFOAM `multiphaseInterFoam`** | 开源多相流求解器：Navier–Stokes + PIMPLE 算法 + VOF 界面捕获 |
| **Crank–Nicolson 时间离散** | 对流项与相分数方程的对流格式 |
| **轴对称 3° 楔形域** | 因轴对称性仅保留单层周向网格；笛卡尔网格平面与周向对齐 |
| **无量纲群** | Galileo 数 $Ga$、Bond 数 $Bo_{ij}$、密度比 $\eta_\rho$、黏度比 $\eta_\mu$、界面张力 Spf |
| **环形动量通量平衡** | 解析模型基础：$\int_{R_o}^{R}2\pi r(u_w-U_b)\,dr = -\pi R^2 U_b$ |
| **实验标定** | ITB / ITD / 三相情形分别验证，$Fr=U/\sqrt{gD}$ 对 $Ga$ 的依赖 |

### 关键公式

**无量纲数**：
$$Ga=\rho_w\sqrt{gD^3}/\mu_w, \qquad Bo_{ij}=\frac{\rho_w g D^2}{\sigma_{ij}}, \qquad \eta_\rho=\frac{\rho_o}{\rho_w}, \qquad \eta_\mu=\frac{\mu_o}{\mu_w}$$

**界面张力 Spf 数**（三相）：
$$S_i=\sigma_{jk}-(\sigma_{ij}+\sigma_{ik}), \qquad S_w=\sigma_{og}-(\sigma_{ow}+\sigma_{gw})<0$$
$$\frac{1}{Bo_{og}} < \frac{1}{Bo_{ow}}+\frac{1}{Bo_{wg}}$$

**轴对称动量方程（分段解析速度剖面）**：
$$\frac{\partial p_k}{\partial z}=-\rho_k g+\frac{1}{r}\frac{\partial}{\partial r}\left(\mu_k r\frac{\partial u_k}{\partial r}\right), \qquad \partial_z p_o=\partial_z p_w=G$$

$$u_w(r)=\frac{(G+\rho_w g)(r^2-R^2)}{4\mu_w}+\frac{R_o^2(\rho_o-\rho_w)g}{2\mu_w}\ln\!\left(\frac{r}{R}\right),\qquad R_o\le r\le R$$
$$u_o(r)=u_w(R_o)+\frac{(G+\rho_o g)(r^2-R_o^2)}{4\mu_o},\qquad 0\le r<R_o$$

**环量（动量通量）守恒**：
$$\int_{R_o}^{R}2\pi r\left(u_w-U_b\right)\,dr=-\pi R^2 U_b$$

**时间步长约束**：$\Delta t\sqrt{g/d}\approx 1.6$

---

## 实验结论

- **数据集**: 10 mm 直径封闭竖直管，80% 甘油-水（$\mu_w$ 高），硅油液滴（$\mu_o = 0.01$ Pa·s）；DNS 域为 $R$ 半径 × $40R$ 长度
- **基线**: 文献中 ITB/ITD 的 $Fr$–$Ga$ 关系；Yang (2025) 报告中未加讨论的相近现象
- **结果**:
  - **ITB 与 TBDA 同步上升**（$t^*=t\sqrt{g/D}=0$ 时鼻端等高释放），**ITD 显著更慢**
  - TBDA 上升速度**与液滴长度无关**
  - 解析模型可预测组合体内的液滴半径
  - 三相界面张力满足 $S_w<0$ 与 Bond 数不等式

---

## 局限性

- 竖直管内的特定构型（气举场景），非通用
- 数值域为 $40R$ 长轴对称楔形，未包含真实管壁粗糙度与多泡效应
- 液滴为单一大液滴（可形成 Taylor 液滴），未覆盖小液滴弥散
- 无表面活性剂/界面流变性考虑

---

## 相关工作

- [[2026-10-31-Masuda-Drop-Decomposition-Cylindrical-Curvature]] — 几何 VOF（plicRDF/isoAdvector）液滴破碎
- [[2026-10-30-DAVOF-Interface-Normal-Position-VOF]] — 几何 VOF 界面法向/位置恢复
- [[2026-10-19-SplashSplat-Multi-View-Liquid-Reconstruction]] — 飞溅液体多视图重建

---

## 实现建议

- **实现难度**: 中（OpenFOAM 现成求解器；渲染端只需几何动画）
- **预期性能**: 3° 楔形域 + 笛卡尔网格，单泡组合体可秒级求解；可离线生成运动轨迹
- **适用场景**:
  - ✅ **气液混合/气泡输运特效**：油井气举、化工气浮、废水处理的气泡-液滴组合体
  - ✅ **液体在气泡尾部的"夹带"动画**：液滴被气泡尾流裹挟上行的视觉表现
  - ✅ **管内上升流体的速度继承规则**：气泡速度 ≈ 组合体速度 → 渲染端可复用气泡的速度曲线驱动液滴
  - ⚠️ 不适用于破碎/破碎泡沫/自由液面

### 对渲染的转译建议

1. **速度继承规则（重要且反直觉）**：渲染气泡-液滴组合体时，**液滴速度直接取气泡速度**，不要按密度比/黏度比做加权减速。这是本文最可落地的结论。
2. **液滴形态保持**：组合体内的液滴保持 Taylor 液滴形态（长子弹形），而非球形——渲染端应使用拉长胶囊/子弹体代理，而非球体。
3. **环形速度剖面可解析**：给出的 $u_w(r)$、$u_o(r)$ 分段解析式可作为**管内流动着色器**的解析速度场（无需模拟）。
4. **三相界面张力判据**：$S_w<0$ 是三相体系能形成稳定组合体的必要条件，可作为**特效参数合理性检查器**。
