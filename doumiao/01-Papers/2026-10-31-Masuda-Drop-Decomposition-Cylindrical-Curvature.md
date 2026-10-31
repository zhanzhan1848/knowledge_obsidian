---
type: paper
created: 2026-10-31
updated: 2026-10-31
tags: [paper, fluid-rendering, vof, interface-reconstruction, drop-breakup, shear-flow, surface-rendering]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2610.39154
---

# Numerical analysis of geometrical effect on drop deformation and breakup between rotating cylinders

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Numerical analysis of geometrical effect on drop deformation and breakup between rotating cylinders |
| **作者** | Hayato Masuda, Mitsuhiro Ohta, Tomislav Marić, Dieter Bothe (TU Darmstadt) |
| **发表** | arXiv preprint (physics.flu-dyn) 2026-10-29，18 页 / 16 图 |
| **链接** | [原文](https://arxiv.org/abs/2610.39154) |
| **DOI** | — |
| **代码** | OpenFOAM-based (作者自研代码，基于 plicRDF / isoAdvector) |

---

## 核心贡献

> **几何曲率不仅平移了液滴破碎的临界条件，更彻底改写了破碎路径本身**——在相同名义 $Re$/$Ca$ 下，平面剪流的对称二分断裂会演变为强曲率下的丝状介导碎裂（多卫星滴）。

1. 首次系统量化**非无量纲几何曲率** $\kappa_{\mathrm{F}} = d/R_{\mathrm{i}}$ 对剪流中液滴变形与破碎形态的影响，覆盖 $\kappa_{\mathrm{F}} \in [0, 1.04]$。
2. 给出**破裂形态的定性分类学**：平面近对称颈缩二分断裂 → Type 1 弱非对称 + 单卫星滴 → Type 3 高度拉长丝状介导碎裂 + 多卫星滴。
3. 建立临界 Reynolds 数与曲率的定量关系：$Re_{\mathrm{cr}}$ 随 $\kappa_{\mathrm{F}}$ **单调下降**（曲率促进破碎），但临界时刻的最大无量纲伸长长度 $L_{\mathrm{a}}/(2R_{\mathrm{d}})$ 随 $\kappa_{\mathrm{F}}$ **单调上升**。

---

## 技术方案

### 核心思想

把**几何曲率**作为独立的无量纲控制参数引入液滴破碎问题。此前文献（Li 2000、Renardy & Cristini 2001b）均基于平面剪流，隐含假设"曲率只影响临界 $Re$"。本文证明曲率同时改变**内部流场结构**与**变形场**，因此破碎形态本身发生质变。

关键的流体力学机制是：**圆形 Couette 流的剪切率沿半径变化，而平面剪流剪切率空间均匀**：

$$\dot{\gamma}(r)/\dot{\gamma}_{\mathrm{R}} = (r_0/r)^{2}$$

这导致液滴在曲率几何中**沿周向（azimuthal）被优先拉长**。

### 关键技术

| 技术 | 说明 |
|------|------|
| **plicRDF 界面重构** | 基于重构距离函数（RDF）的几何 VOF 界面重构，避免质量不守恒 |
| **isoAdvector 界面输运** | 拉格朗日界面平流，精确追踪相位体积输运 $V_f^\alpha$ |
| **几何 VOF 总体框架** | 相指示函数 $\chi$ 的控制体积分形式 + 面分解输运通量 |
| **单场两相流格式** | 密度/黏度按 $\alpha_c$ 线性混合；压力为扣除静水压的修正压力 |
| **AMR 两级自适应网格** | $\ell=0$ / $\ell=1$ 双层细化以解析界面；网格无关性测试（$R_d/4$ ~ $R_d/8$） |
| **Taylor 变形参数** | $D = (L_d - B_d)/(L_d + B_d)$，$D=0$ 为球形，$D\to 1$ 为临界破碎 |
| **变形率张量分析** | 归一化 $\sqrt{2\mathbf{D}:\mathbf{D}}/\dot{\gamma}_{\mathrm{R}}$ 揭示变形场空间结构 |
| **OpenFOAM multiphaseInterFoam** | 用于 Taylor 气泡-液滴组合体研究（姊妹篇） |

### 几何配置

三组同心反向旋转圆柱（Type 1/2/3）：

| 类型 | $R_{\mathrm{i}}$ (m) | $R_{\mathrm{o}}$ (m) | $\kappa_{\mathrm{F}} = d/R_{\mathrm{i}}$ |
|------|---------|---------|---------|
| Type 1 | 0.025 | 0.038 | 0.52 |
| Type 2 | 0.018 | 0.031 | ~0.72 |
| Type 3 | 0.0125 | 0.0255 | 1.04 |
| 平面 | — | — | 0（对照） |

液滴初始半径 $R_{\mathrm{d}} = 0.0025$ m，置于 Couette 环量速度为零处（$u_\theta(r_0)=0$）。密度比与黏度比均设为 1（简化）。

### 关键公式

**有效量纲数**（基于初始液滴半径）：
$$Re = \frac{\rho_s U R_d}{\mu_s}, \qquad Ca = \frac{\mu_s U}{\sigma}$$

**几何曲率**：
$$\kappa_{\mathrm{F}} = \frac{d}{R_{\mathrm{i}}}, \qquad d = R_{\mathrm{o}} - R_{\mathrm{i}}$$

**圆形 Couette 速度分布**（双圆柱反向旋转，等切向壁速 $|R_i\omega_i| = |R_o\omega_o|$）：
$$u_\theta = \left(\frac{\omega_{\mathrm{o}}R_{\mathrm{o}}^{2}-\omega_{\mathrm{i}}R_{\mathrm{i}}^{2}}{R_{\mathrm{o}}^{2}-R_{\mathrm{i}}^{2}}\right)r + \frac{(\omega_{\mathrm{i}}R_{\mathrm{i}}^{2}-\omega_{\mathrm{o}}R_{\mathrm{o}}^{2})}{R_{\mathrm{o}}^{2}-R_{\mathrm{i}}^{2}}\frac{1}{r}$$

**表面张力源项**（CSF 型）：
$$\mathbf{f}_\Sigma = \sigma \kappa\,\delta_\Sigma\,\mathbf{n}$$

**Taylor 变形参数**：
$$D = \frac{L_d - B_d}{L_d + B_d}$$

**局部剪切率**：
$$\dot{\gamma}(r) = \left|\frac{d u_\theta}{dr} - \frac{u_\theta}{r}\right|$$

---

## 实验结论

- **数据集**: 三组同心圆柱几何 + 平面对照，共 4 套工况系统
- **基线**: Li et al. (2000) VOF 法、Ohta et al. (2025) CLSVOF 法的平面剪流破碎结果
- **结果**:
  - **平面系统**：倾斜长椭球 → 中央颈缩 → 近对称二分断裂（子滴尺寸相近）
  - **Type 1 (κ=0.52)**：非对称断裂，出现单个卫星滴
  - **Type 3 (κ=1.04)**：高度拉长形成细丝 → 碎裂 → **多个卫星滴**
  - **$Re_{\mathrm{cr}}$ 随 $\kappa_{\mathrm{F}}$ 下降**（$Ca=0.2$ 与 $0.3$ 均成立）；破碎时间无明显 $\kappa_{\mathrm{F}}$ 依赖
  - **$Re=Re_{\mathrm{cr}}$ 时 $L_a/(2R_d)$ 随 $\kappa_{\mathrm{F}}$ 上升**（尽管固定 $Re$ 下伸长更明显部分源于 $Re_{\mathrm{cr}}$ 下降造成的"接近程度"差异）
  - 网格无关性：$R_d/8$ 网格会低估变形（变形参数趋于饱和），需 $R_d/4$ 或更细

---

## 局限性

- 密度比与黏度比均简化为 1，真实液-液体系需重做
- 仅双圆柱反向旋转等壁速配置；单缸旋转、差速配置未覆盖
- 仅单液滴，无多滴相互作用
- 无实验验证（纯数值），几何参数与实验件匹配性依赖文献外部数据

---

## 相关工作

- [[2026-10-30-DAVOF-Interface-Normal-Position-VOF]] — 几何 VOF 的界面法向/位置闭式恢复（界面输入契约）
- [[2026-10-19-SplashSplat-Multi-View-Liquid-Reconstruction]] — 飞溅液体多视图重建
- [[2026-10-30-Flamelet-Closure-2D-Combustion]] — 燃烧代理模型输入特征下限
- [[2026-10-30-Capillary-Turbulence-Anisotropic-Kinetic]] — 各向异性终态谱构造（法线贴图频谱斜率）

---

## 实现建议

- **实现难度**: 中（几何 VOF + AMR + 界面重构，需 OpenFOAM 级别工程能力）
- **预期性能**: 单相场 VOF + 两级 AMR，单滴工况可实时；多滴场景需 GPU 化
- **适用场景**:
  - ✅ **液体表面破碎（破碎/飞溅/喷射）** 的形态学参考基准——是"液滴碎裂"渲染的物理约束来源
  - ✅ 湿表面/涂层/液滴碰撞特效的破碎形态库（平面 → 强曲率渐变）
  - ✅ **曲面容器内液体**（杯/瓶/管壁）的破碎渲染：本文证明曲率不可忽略，直接套用平面剪流参数会出错
  - ⚠️ 直接用于实时渲染成本高；建议将其结论**转写为离线破碎形态查表**或**参数化破碎模型**

### 对渲染的转译建议

1. **破碎形态查表**：以 $(\kappa_{\mathrm{F}}, Re, Ca)$ 为索引，预渲染破碎序列（形变 → 颈缩 → 丝状 → 卫星滴），实时端做形变匹配 + 插值。
2. **曲率感知参数化**：液体渲染器若支持曲面容器（如杯中液体），破碎触发阈值应按 $\kappa_{\mathrm{F}}$ 修正，而非套用平面 $Re_{\mathrm{cr}}$。
3. **卫星滴生成规则**：强曲率 → 丝状 + 多卫星滴，弱曲率 → 对称二分。这一形态切换可用于**程序化破碎生成器**的分支条件。
4. **网格精度下限**：要正确解析颈缩与丝化，液滴直径方向至少 32–64 单元（$R_d/4$ 半径分辨率 → 直径约 8 单元为下限，实测 $R_d/8$ 不足）。
