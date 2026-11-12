---
type: paper
created: 2026-11-12
updated: 2026-11-12
tags: [paper, free-surface, moving-contact-line, ALE, SAV, finite-element, energy-stable, volume-conservation, ngsolve, two-phase-flow]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2611.10828
---

# A high-order structure-preserving ALE–SAV finite element method for moving contact line flows

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | A high-order structure-preserving ALE–SAV finite element method for moving contact line flows |
| **作者** | Shu Ma（香港浸会大学数学系） |
| **发表** | arXiv preprint (math.NA), 2026-11-07；MSC 65M12, 65M60, 76D05, 76T10 |
| **链接** | [arXiv:2611.10828](https://arxiv.org/abs/2611.10828) |
| **DOI** | — |
| **代码** | 数值实验使用 NGSolve（https://ngsolve.org）；本文代码未声明 |
| **资助** | 国家自然科学基金青年基金（Category C, 1260010446）+ 广东省基础与应用基础研究基金（2026A1515012472） |
| **分类** | 自由表面 Navier–Stokes / 移动接触线 / 能量稳定有限元 |

---

## 核心贡献

> **一句话点题：把"高阶空间 + 移动网格"和"能量稳定 + 精确体积守恒"这两件在自由表面流中长期互斥的事，用 SAV 改造 + 等距速度传递 + 保体积边界映射三件套同时做到了，而且每步只需求解线性方程组。**

1. **首个高阶、线性隐式的 ALE–SAV 有限元格式**，同时满足：离散修正能量耗散律 + 最终网格上的**精确**面积/体积守恒。这一组合此前在文献中无法兼得——高阶 ALE 方法需要非线性求解才能保体积，而一阶能量稳定 ALE 方法（Hu et al.、Garcke–Hu–Lei）虽能保体积但必须走非线性求解。
2. **构建 $L^2$-等距速度传递算子**（isometric velocity transfer）及其配套的**斜对称（skew-symmetric）修正项**，用于离散 ALE 时间导数项 $\partial_t^\circ \mathbf{u} + \tfrac12(\nabla\cdot\mathbf{w})\mathbf{u}$。网格运动会改变动能内积，此项保证几何更新后动能平衡仍然成立。
3. **构建仅用线性求解的保体积边界映射**（volume-preserving boundary map）：从保二次不变量的中点子步出发、冻结斜对称算子，2D 中面积是二次不变量，3D 中对称组合使体积对活跃变量至多二次，故每个子步线性且精确保面积/体积。
4. **完整离散 SAV 能量耗散恒等式**（exact discrete SAV energy-dissipation identity）被严格建立。
5. 2D/3D 数值实验验证：空间高阶收敛、时间二阶收敛、SAV 能量耗散、面积/体积**机器精度**守恒。

---

## 技术方案

### 核心思想

自由表面 Navier–Stokes 方程带重力与移动接触线（moving contact line）。难点在于三者的耦合：

- **自由表面几何** $\Gamma_F(t)$ 随时间演化 → 需要 ALE（任意拉格朗日–欧拉）网格；
- **移动接触线**带来壁面滑移 $\beta_s$ 与接触线摩擦 $\beta_c$，且接触角条件 $\beta_c U_c = \gamma(\cos\theta_Y - \cos\theta_c)$ 是**非线性**的；
- **能量稳定性**要求总能量单调耗散。

ALE 格式中网格速度 $\mathbf{w}$ 与流体速度 $\mathbf{u}$ 独立，导致动能内积随几何变化；若不做兼容处理，能量平衡被破坏。另一方面，预测网格上的离散不可压缩性与壁面不穿透性只给出零通量条件，**并不自动保证最终网格上的体积守恒**。

本文的解法是三步走：

1. **SAV 改造**——把几何能量写成辅助变量的二次型，从而让毛细力、润湿力、重力全部以**线性**方式进入离散；
2. **等距速度传递**——解决动网格上的动能平衡；
3. **保体积边界映射**——解决最终网格的体积约束，且全程只用线性求解。

### 关键技术

| 技术 | 说明 |
|------|------|
| **SAV 重构** | $r=\sqrt{\mathcal{E}_G(\mathbf{X})+C_0}$，使几何能量 $\mathcal{E}_G = r^2 - C_0$ 二次化 |
| **ALE 调和扩展** | $\mathbf{w}=\mathcal{M}_{\mathbf{X}}[\mathbf{u}]$，对称梯度形式下的广义调和扩展 |
| **斜对称对流形式** | $b(t;\mathbf{a},\mathbf{u},\mathbf{v}) = \tfrac12([\mathbf{a}\cdot\nabla]\mathbf{u},\mathbf{v}) - \tfrac12([\mathbf{a}\cdot\nabla]\mathbf{v},\mathbf{u})$ |
| **$L^2$-等距速度传递** | 在演化有限元空间之间构造等距映射 + 斜对称修正项 |
| **保体积边界映射** | 基于 McLachlan–Quispel–Robidoux 几何积分框架（Sato et al. 保二次不变量子步） |
| **线隐式 Crank–Nicolson** | 时间二阶，每步仅线性求解 |
| **二阶几何外推** | 提供预测几何与线性 fluid–SAV 系统的已知系数 |
| **等参高阶单元** | 高阶空间逼近，二次几何 |

### 控制方程

不可压缩 Navier–Stokes 带重力与移动接触线边界条件：

$$\partial_t \mathbf{u} + (\mathbf{u}\cdot\nabla)\mathbf{u} - \nabla\cdot\boldsymbol{\sigma} = -g\mathbf{e}_y \quad \text{in } \Omega(t), \qquad \nabla\cdot\mathbf{u}=0$$

自由表面（曲率约定 $\kappa \mathbf{n}_F = -\Delta_{\Gamma_F}\mathrm{id}$）：

$$\boldsymbol{\sigma}\mathbf{n}_F = -\gamma\kappa\mathbf{n}_F, \qquad V_F = \mathbf{u}\cdot\mathbf{n}_F$$

壁面（$\mathbf{n}_s = -\mathbf{e}_y$，$P_s = I - \mathbf{n}_s\otimes\mathbf{n}_s$）：

$$\mathbf{u}\cdot\mathbf{n}_s = 0, \qquad P_s(\boldsymbol{\sigma}\mathbf{n}_s + \beta_s\mathbf{u}) = 0$$

接触线：

$$\beta_c U_c = \gamma(\cos\theta_Y - \cos\theta_c), \qquad \cos\theta_c = \boldsymbol{\mu}_F\cdot\boldsymbol{\mu}_s$$

### 几何能量与耗散律

几何能量：

$$\mathcal{E}_G(\mathbf{X}) = \gamma|\Gamma_F(t)| - \gamma\cos\theta_Y|\Gamma_s(t)| + g\int_{\Omega(t)} y\,\mathrm{d}x$$

总物理能量 $\mathcal{E}(t) = \tfrac12\|\mathbf{u}\|_{L^2(\Omega(t))}^2 + \mathcal{E}_G(\mathbf{X}(t))$，连续耗散律：

$$\frac{\mathrm{d}}{\mathrm{d}t}\mathcal{E}(t) + 2\mu\|\mathbf{D}\mathbf{u}\|_{L^2(\Omega(t))}^2 + \beta_s\|P_s\mathbf{u}\|_{L^2(\Gamma_s(t))}^2 + \beta_c\int_{\Gamma_c(t)}|\mathbf{u}\cdot\boldsymbol{\mu}_s|^2\,\mathrm{d}\ell = 0$$

体积守恒 $\frac{\mathrm{d}}{\mathrm{d}t}\mathcal{V}(\mathbf{X}(t)) = \int_{\Gamma_F}V_F\,\mathrm{d}s = \int_{\Omega}\nabla\cdot\mathbf{u}\,\mathrm{d}x = 0$。

### SAV 耦合系统

引入移位压力 $\pi = p_{\rm phys} + gy$ 与应力 $\boldsymbol{\sigma}_\pi = 2\mu\mathbf{D}\mathbf{u} - \pi\mathbf{I} = \boldsymbol{\sigma} - gy\mathbf{I}$，定义归一化一阶变分

$$\mathcal{G}(\mathbf{X})[\mathbf{v}] = \frac{D\mathcal{E}_G(\mathbf{X})[\mathbf{v}]}{\sqrt{\mathcal{E}_G(\mathbf{X})+C_0}}$$

则耦合系统为：

$$\partial_t^\circ \mathbf{u} + ((\mathbf{u}-\mathbf{w})\cdot\nabla)\mathbf{u} = \nabla\cdot\boldsymbol{\sigma}_\pi, \qquad \nabla\cdot\mathbf{u}=0$$

$$\dot{r} = \tfrac12\mathcal{G}(\mathbf{X})[\mathbf{u}]$$

$$\boldsymbol{\sigma}_\pi\mathbf{n}_F = -\frac{r}{\sqrt{\mathcal{E}_G(\mathbf{X})+C_0}}(\gamma\kappa+gy)\mathbf{n}_F, \qquad \partial_t\mathbf{X} = \mathbf{u}\circ\mathbf{X}$$

壁面与接触线：

$$P_s(\boldsymbol{\sigma}_\pi\mathbf{n}_s + \beta_s\mathbf{u}) = 0, \qquad \beta_c U_c = \frac{r}{\sqrt{\mathcal{E}_G(\mathbf{X})+C_0}}\gamma(\cos\theta_Y - \cos\theta_c)$$

一致性由 $\frac{\mathrm{d}}{\mathrm{d}t}\left(r - \sqrt{\mathcal{E}_G(\mathbf{X})+C_0}\right)=0$ 保证。

---

## 实验结论

- **算例**: 2D 上半椭圆液滴（$a=1.5, b=1$，$\mu=0.1$，$g=\beta_s=\beta_c=0$，$\theta_Y=\pi/2$，$T=0.1$）；3D 上半椭球（半轴 $(1.5,1,1)$），润湿 $\theta_Y=60^\circ$ / 去润湿 $\theta_Y=120^\circ$。
- **基线**: 参考解用 4 阶有限元、$h_{\rm ref}=0.1$；对照的同类方法为 Hu et al. 与 Garcke–Hu–Lei 的一阶 ALE–MDR / ALE–BGN–MDR（均需非线性求解保体积）。
- **结果**:
  - 2D 空间收敛率：对 $\mathbf{u}, \mathbf{X}, \Phi, \mathbf{w}, r$ 约为 **$2,3,4,2,3$**（$k=1,2,3$）；时间收敛为**二阶**。
  - 3D：$\mathbf{u},\Phi,\mathbf{w}$ 空间收敛率约 **3**，压力约 **2**；时间二阶自收敛。
  - **体积守恒**：2D 相对体积误差量级 $10^{-16}$，3D 低于 $2.7\times10^{-15}$ → **机器精度**。
  - **SAV 能量**：物理能量与 SAV 能量在全尺度上几乎重合，插图分辨出后期的微小分离；SAV 能量在润湿与去润湿两种情形下均单调下降。
  - **网格质量**：即使 $g=10$ 的强重力下，接触点附近仍保持良好网格质量（2D）/ 二次几何（3D）。
  - 接触角渐近收敛到平衡角 $\theta_Y$。

---

## 局限性

- 自由表面用**等参单元 + 参数化几何**描述，本质上是"贴体"（fitted）方法：无法处理拓扑变化（液滴合并/分裂），也无法处理与固体壁面的分离接触线。
- 接触线摩擦模型 $\beta_c U_c$ 为**线性化（动力学）接触角**形式，不是完整的 Hoffman 摩擦律。
- 数值实验仅在 2D/3D 的液滴-壁面配置上验证，未涉及多液滴、多相或湍流。
- 无开源代码声明；使用商业/开源有限元框架 NGSolve。
- 收敛实验采用固定参数（无接触线摩擦、无壁面滑移），与润湿/去润湿的物理情形分开验证。

---

## 相关工作

- [[2026-11-04-Wang-Xia-Xu-Volume-Conserving-ALE-CG-Free-Surface-Waves]] — 同组的保体积 ALE 自由表面工作
- [[2026-11-09-Leonard-Westermann-Real-Time-Volumetric-Light-Transport-Inference]] — 体积渲染侧
- [[2026-11-05-Sifakis-Williams-Horvath-Dynamic-GPU-Voxel-Grids-NanoVDB]] — 稀疏体素 GPU 流体基础设施
- [[ALE-BGN-MDR-Moving-Contact-Line]] — Garcke–Hu–Lei 的直接前身（arXiv:2608.03115）
- [[2026-10-19-SplashSplat-Multi-View-Liquid-Reconstruction]]

---

## 实现建议

- **实现难度**: ⚠️ 高。需要同时掌握 ALE 有限元、SAV 重构、几何积分（保二次不变量子步）与斜对称算子；工程量大。若只求"能跑"可退化为已有 ALE-MDR + SAV 的组合，但会失去高阶与精确体积守恒。
- **预期性能**: ✅ 每步仅线性求解（相对于非线性 CG/牛顿迭代是数量级优势）；2D/3D 收敛阶达 3~4 阶。计算全部在 NGSolve 上完成，说明该格式在工程上可落地。
- **适用场景**:
  - ✅ **离线高质量自由表面流体渲染**（水膜、液滴铺展、飞溅前的形态演化）：能量稳定保证无体积漂移与无假能量注入，机器精度体积守恒尤其适合需要与几何碰撞/布尔运算配合的场景。
  - ✅ 作为**表面渲染的可信模拟后端**：若渲染管线需要几何精确的液面（而非视觉近似），此格式的体积守恒是刚需。
  - ✅ **接触线驱动的润湿行为建模**（涂层、玻璃、织物）——壁面滑移 + 接触线摩擦参数 $\beta_s,\beta_c$ 可直接标定。
  - ⚠️ 实时渲染（60fps）：**不推荐**。等参高阶 + 每步线性求解 + 二阶几何外推的成本远高于生产级实时流体管线所用的 FLIP/PIC 或屏幕空间方法。
  - ❌ 不适合拓扑变化、体积分数大的多相流体、或需要严格守恒动量与能量的湍流燃烧场景。
