---
type: paper
created: 2026-11-11
updated: 2026-11-11
tags: [paper, fluid-rendering, fluid-simulation, cfd, porous-media, openfoam, conservative-formulation, physics-flu-dyn]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2611.14348
---

# A Conservative Darcy-Brinkman-Stokes Formulation for Digital Rock Flow Simulation with Embedded Second-Brinkman Effects

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | A Conservative Darcy-Brinkman-Stokes Formulation for Digital Rock Flow Simulation with Embedded Second-Brinkman Effects |
| **作者** | Gospel E. Stewart, Hannah P. Menke, David Egya, Jacqueline Mifsud, Julien Maes — **University of Glasgow / Strathclyde** |
| **发表** | arXiv preprint (physics.flu-dyn), 2026-11-10；**22 页 / 12 图** |
| **链接** | [arXiv:2611.14348](https://arxiv.org/abs/2611.14348) |
| **DOI** | — |
| **代码** | **✅ GeoChemFoam**（基于 OpenFOAM 的开源 CFD 模拟器） |
| **分类** | 多孔介质流动 / 数值格式 / 求解器基础设施 |

---

## 核心贡献

> **"守恒形式 + 有限体积中心差分" 自动保留完整的第二 Brinkman 项 (SBT)** —— 不需要为 SBT 单独离散化，就能得到 **DBS2** 格式：渗透率误差 **1.5–3.8%**（DNS 级），而常用的简化版 DBS1 系统性高估 **14.1–37.9%**，**且计算效率完全保留**。

1. **问题：孔隙尺度 DNS 太贵**
   - 精确的孔隙尺度 DNS 需要**边界贴合网格 + 全解析几何** → **内存密集**，复杂岩石几何往往**不可行**；
   - **Darcy–Brinkman–Stokes (DBS)** 框架允许**直接在体素化的 micro-CT 图像上模拟** → 工程上极其实用。

2. **DBS1 的缺陷**
   - 常用的简化 DBS 公式 (DBS1) **忽略第二 Brinkman 项 (SBT)** 与**孔隙率梯度粘性扩散项**；
   - 导致**流场表征与渗透率预测出错**；
   - 尽管 SBT 对捕捉**粘性边界效应**至关重要，但通常被认为**需要单独离散化**（额外代价）。

3. **核心发现：DBS2**
   - 将 DBS 方程写成**守恒形式**，再套用**标准中心差分 + 有限体积离散**；
   - → **自然地保留完整 DBS 公式**（含 SBT），**无需单独离散化 SBT**；
   - → 称此格式为 **DBS2**。

4. **精度与效率**
   - **DBS2**：微通道算例中**精确复现 DNS 速度场**；微模型与 Bentheimer 砂岩算例中**渗透率误差 1.5–3.8%**（匹配空间分辨率下）；
   - **DBS1**：同离散下**系统性高估渗透率 14.1–37.9%**；
   - **保守的粘性应力处理保留了 DBS1 的计算效率**，同时达到 DNS 级精度。

5. **验证算例（3 个）**：① 微通道流；② 2D 非均质微模型；③ Bentheimer 砂岩的 3D micro-CT 图像。

---

## 技术方案

### 核心思想

在**体素化**几何上求解多孔介质流动，有两条路：
- **DBS1（简化）**：只保留 Darcy 阻力 + Brinkman 粘性项 → 快，但漏掉 SBT 与孔隙率梯度项；
- **DBS2（完整）**：保留完整 DBS（含 SBT）→ 准，但通常被认为贵。

本工作证明：**SBT 的额外代价来自"单独离散化它"这一实现选择，而非来自公式本身**。守恒形式 + 中心差分天然把它带上。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Conservative form of DBS** | 把方程写成守恒（flux）形式 |
| **Standard central differencing + finite volume** | 常规离散即可自然保留 SBT |
| **Second Brinkman term (SBT)** | 捕捉粘性边界效应；此前被忽略 |
| **Porosity-gradient viscous diffusion term** | 孔隙率梯度引起的粘性扩散，此前被忽略 |
| **Voxelized micro-CT geometry** | 直接在 CT 体素上模拟，无需边界贴合网格 |
| **GeoChemFoam (OpenFOAM)** | 开源实现 |
| **Wall-resolved DNS benchmark** | 微通道算例做精确验证 |

---

## 公式

```math
% 完整 DBS（守恒形式）
\nabla\cdot\mathbf{u} = 0
\\begin{aligned}
\rho\Big(\frac{\partial\mathbf{u}}{\partial t}
+ \mathbf{u}\cdot\nabla\mathbf{u}\Big)
= &-\nabla p \;+\;\nabla\cdot\Big(\mu_{\text{eff}}(\phi)\nabla\mathbf{u}\Big) \\
&-\frac{\mu}{K(\phi)}\,\mathbf{u}
\;+\;\underbrace{\mu\nabla^2\big(\phi\,\mathbf{u}\big)}_{\text{SBT + porosity-gradient}}
\end{aligned}

% 常用简化 (DBS1)：丢掉最后一项
\rho\Big(\frac{\partial\mathbf{u}}{\partial t}+\mathbf{u}\cdot\nabla\mathbf{u}\Big)
= -\nabla p+\nabla\cdot(\mu_{\text{eff}}\nabla\mathbf{u})-\frac{\mu}{K}\mathbf{u}
\quad\Rightarrow\quad \text{渗透率高估 } 14.1\%\sim37.9\%

% 有效粘性（含孔隙率梯度）
\mu_{\text{eff}}(\phi)=\frac{\mu}{\phi}\ \ \text{(DBS 经典形式)}
```

---

## 代码片段

```cpp
// 概念伪代码：守恒形式 DBS2 的有限体积离散（OpenFOAM 风格）
void solveDBS2(volScalarField& phi, volVectorField& U, volScalarField& p)
{
    // 1) 有效粘性（依赖孔隙率）
    volScalarField muEff = mu / max(phi, small);

    // 2) 粘性应力通量 —— 守恒形式，天然含 SBT 与孔隙率梯度扩散项
    surfaceScalarField muEffF = fvc::interpolate(muEff);
    tensorField gradU = fvc::grad(U);

    volVectorField viscFlux =
        -fvc::div(muEffF * surfaceTensorField::grad(gradU));   // ← 中心差分

    // 3) Darcy 阻力
    volVectorField darcy = -mu / K * U;

    // 4) 动量方程
    fv::VectorUEqn(U)
        == -fvc::grad(p) + viscFlux + darcy;

    // 5) 压力投影（不可压缩）
    fv::ScalarUEqn(phi) == fvc::div(U);
}
```

---

## 实验结论

- **算例**：
  1. **微通道流**（用于精确验证）；
  2. **2D 非均质微模型**；
  3. **Bentheimer 砂岩 3D micro-CT 图像**；
- **基线**：**壁面/孔隙尺度 DNS**（参考真值）；**DBS1**（同离散）；
- **结果**：
  - **DBS2 在微通道中精确复现 DNS 速度场**；
  - **DBS2 渗透率误差 1.5–3.8%**（微模型与砂岩，同空间分辨率）；
  - **DBS1 渗透率高估 14.1–37.9%**；
  - **DBS2 保留 DBS1 的计算效率**。

---

## 局限性

- 面向**孔隙介质（数字岩石）**，**非自由表面流动** → 不能直接用于水面/烟雾渲染；
- 仍需**体素化**，几何细节受 CT 分辨率限制；
- Darcy–Brinkman–Stokes 假设**低 Re**（Stokes 域），高 Re 需切换到完整 NS；
- 摘要未给出具体运行时与网格规模。

---

## 相关工作

- [[2026-11-08-HGKS-Compact-ALE-Gas-Kinetic-Unstructured-Mesh]] — 气体动理学（非结构网格）
- [[2026-11-05-Zhang-Ren-FastVEM-Fluid-Simulation]] — VEM 压力离散
- [[2026-11-11-Zhang-Kaufer-Ronglan-Triantafyllou-Bluff-Body-Wakes-Dataset]] — DNS 数据集
- [[2026-11-11-TurtLES-Turbulent-Neural-PDE-Surrogate-Benchmark]] — 湍流基准

---

## 实现建议

- **实现难度**：🟡 中（OpenFOAM 生态内修改方程与离散）
- **预期性能**：与 DBS1 同量级；渗透率精度从"高估 14–38%"提升到"误差 1.5–3.8%"
- **适用场景**：
  - ✅ **多孔介质/岩石/土壤/海绵的渗透率与流动可视化**（渲染方向：流体穿透多孔材质的视觉效果）
  - ✅ **数字岩心 (digital rock) 渲染的可信流场来源**
  - ✅ **通用教训**：把守恒形式做对，很多项会"免费"带上
  - ⚠️ 自由表面流体渲染 ❌
  - ⚠️ 高雷诺数流动 ❌（超出 DBS 假设）
