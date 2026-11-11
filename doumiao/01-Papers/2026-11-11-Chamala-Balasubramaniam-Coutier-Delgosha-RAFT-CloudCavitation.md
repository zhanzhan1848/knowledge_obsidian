---
type: paper
created: 2026-11-11
updated: 2026-11-11
tags: [paper, fluid-rendering, multiphase-flow, cavitation, optical-flow, piv, raft, experimental, physics-flu-dyn]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2611.09116
---

# Domain-Adapted Deep Optical Flow for Multiphase Velocimetry in Unsteady Cloud Cavitation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Domain-Adapted Deep Optical Flow for Multiphase Velocimetry in Unsteady Cloud Cavitation |
| **作者** | Naga Nitish Chamala, Sanjay Vasanth Kethanur Balasubramaniam, Olivier Coutier-Delgosha — **Institut de Mécanique de Paris / ENSTA** |
| **发表** | arXiv preprint (physics.flu-dyn, physics.data-an), 2026-11-06；**39 页 / 17 图 / 6 表**；**投稿 Experiments in Fluids** |
| **链接** | [arXiv:2611.09116](https://arxiv.org/abs/2611.09116) |
| **DOI** | — |
| **代码** | 摘要未声明 |
| **分类** | 多相流 / 空化 / 实验测量 / 深度学习光流 |

---

## 核心贡献

> **在空化这种"示踪粒子进不去、折射率还乱跳"的极端场景，用"从 OpenFOAM 多相模拟渲染的合成图像对微调 RAFT"实现了免示踪粒子的两相测速**：流量恢复 **47.75 L/min（实测 48.0±0.5）**，四个流向测站间波动仅 **2.0%**（经典方法 6–7%），并**唯一**捕捉到 −0.71 m/s 的近壁回流。

1. **问题：空化流场测量是公认难题**
   - **PIV 需要均匀示踪播种 + 无畸变粒子图像**，而空化流**两个条件都违反**：
     - **示踪粒子进不去汽化结构**；
     - **变形界面两侧折射率失配** → 产生**虚假速度矢量**。

2. **方法：RAFT-CloudCav**
   - 基于 **RAFT (Recurrent All-Pairs Field Transforms)** 架构；
   - **域适应**：在由 **OpenFOAM 多相模拟渲染的合成图像对**上微调（避免需要真实标注粒子位置）；
   - **无需示踪粒子**恢复平均场。

3. **验证策略：无真值情况下的三种"不依赖真值"量**
   - **积分流量** vs **涡轮流量计**；
   - **液相速度散度**（质量守恒要求其为 0）；
   - **测站间流量离散度**。

4. **关键结果**
   - **流量 47.75 L/min vs 实测 48.0 ± 0.5 L/min** —— 四种方法中**最接近**；
   - **四站流量波动 2.0%**，经典方法（Farnebäck、OpenPIV）为 **6–7%**；
   - **近壁回流 −0.71 m/s**（上游传播的再入射流 (re-entrant jet) 的时间平均特征）—— **OpenPIV 完全测不到**；
   - **非空化对照**：51 μm/像素时仅 3 个网格点落在 0.68 mm 边界层内、峰值壁面法向梯度**低估超过 30 倍**；13 与 19 μm/像素则互相一致；
   - 平均场在**约 3 倍逐帧不确定度**内恢复；
   - **不确定度由图像残差后验估计并保守传播**。

---

## 技术方案

### 核心思想

经典 PIV 在空化流中失效的根因是**粒子缺失 + 光学畸变**。深度光流天然是**基于图像本身**的位移估计：
- 不需要粒子 → 直接绕过"粒子进不去"；
- 但需要**域内的运动先验** → 用 **OpenFOAM 多相模拟渲染的合成图像对**做微调，把模拟器中的多相流运动统计迁移到真实域。

### 关键技术

| 技术 | 说明 |
|------|------|
| **RAFT (Recurrent All-Pairs Field Transforms)** | 递归全对场变换，光流架构 |
| **Domain adaptation via synthetic pairs** | 用 OpenFOAM 多相模拟**渲染**的合成图像对微调 |
| **Tracer-free velocimetry** | 完全不需要示踪粒子 |
| **Residual-based a posteriori uncertainty** | 从图像残差估计不确定度并保守传播 |
| **Dual validation without ground truth** | 流量计 / 散度守恒 / 测站一致性 三重无真值校验 |
| **Spatial resolution study** | 51 / 19 / 13 μm/像素 的近壁梯度敏感性分析 |

---

## 公式

```math
% 光流（RAFT 隐式更新形式的简化）
f_{k+1} = \text{Update}\big(f_k,\; \mathcal{C}(I_1, I_2, f_k)\big),
\qquad
\mathbf{u}(\mathbf{x}) = f_{\infty}(\mathbf{x})

% 质量守恒校验（两相）：液相速度散度应为零
\nabla\cdot\mathbf{u}_{\ell} \approx 0
\quad\text{（空化区外，密度不连续处除外）}

% 连续性方程（两相，含空化源项）
\frac{\partial \rho_\ell}{\partial t} + \nabla\cdot(\rho_\ell \mathbf{u}_\ell)
= -\dot{m}_{\text{cav}}(\mathbf{x},t)
\quad\Rightarrow\quad
\nabla\cdot\mathbf{u}_\ell \ \text{非零处}\ \Leftrightarrow\ \text{空化源项}
```

---

## 代码片段

```python
# 概念伪代码：RAFT-CloudCav 训练与推理
# 1) 域适应：用 OpenFOAM 多相模拟渲染合成图像对
def synth_pairs(openfoam_case, n_pairs=50_000):
    U_l, p, alpha = of_render(openfoam_case)          # 多相场
    I1, I2, F_true = render_image_pair(alpha, p, U_l) # 体渲染 + 已知光流
    return I1, I2, F_true

# 2) 微调 RAFT
raft = build_raft()
for I1, I2, F in loader(synth_pairs(...)):
    loss = raft_loss(raft(I1, I2), F)
    loss.backward(); opt.step()

# 3) 真实推理（免示踪粒子）
def infer(I1, I2, raft):
    flow = raft(I1, I2)
    # 残差后验估计不确定度
    resid = photometric_residual(I1, I2, flow)
    sigma = propagate_conservative(resid)
    return flow, sigma

# 4) 无真值校验
def validate(flow, turbine_meter, stations):
    q    = integrate_flux(flow)                 # vs 涡轮流量计
    div  = divergence(liquid_phase(flow))      # ≈ 0（质量守恒）
    disp = station_spread(q, stations)          # 测站间离散度
    return q, div, disp
```

---

## 实验结论

- **数据**：**13 万帧**（130,000 frames/s）Venturi 测试段记录，30 与 48 L/min；由 OpenFOAM 多相模拟渲染的合成图像对用于微调；
- **基线**：**预训练通用 RAFT**、**Farnebäck**、**OpenPIV**；
- **结果**：
  - 流量 **47.75 L/min vs 实测 48.0 ± 0.5 L/min**（最接近）；
  - 四站流量波动 **2.0%** vs 经典方法 **6–7%**；
  - **近壁回流 −0.71 m/s**（re-entrant jet 特征），**OpenPIV 测不到**；
  - 非空化对照：**51 μm/像素**下近壁梯度**低估 >30 倍**；13 与 19 μm/像素一致；
  - 平均场在**约 3× 逐帧不确定度**内恢复；不确定度由图像残差后验估计并保守传播。

---

## 局限性

- **高度场景特化**：为云空化 (cloud cavitation) + Venturi 测试段专门微调，迁移到其他多相场景需重训；
- **依赖 OpenFOAM 模拟器**生成合成数据 → 需要可用的多相模拟算例；
- 论文为 **39 页实验型工作**，方法新意集中在**域适应策略**而非网络结构；
- 空化区的**两相界面识别**仍依赖模拟先验，真实界面复杂时精度未知；
- 摘要未声明代码开源。

---

## 相关工作

- [[2026-11-11-Sakib-Mychkovsky-Babaee-Low-Rank-Tensor-Manifolds-Turbulence]] — 实验 PIV 稀疏重建
- [[2026-11-11-Zhang-Kaufer-Ronglan-Triantafyllou-Bluff-Body-Wakes-Dataset]] — DNS + PIV 交叉验证数据集
- [[2026-11-11-Hydrograd-Shallow-Water-Differentiable-Model]] — 可微浅水模型
- [[2026-11-05-Zhang-Cai-Huang-Ren-GauSmoke-Hybrid-Physics-Optical-Gaussian-Splatting]] — 多相流渲染

---

## 实现建议

- **实现难度**：🟡 中（RAFT 微调 + OpenFOAM 渲染合成数据）
- **预期性能**：**免示踪粒子**；流量误差 ~0.5%；站间波动 2.0%
- **适用场景**：
  - ✅ **无法播种示踪粒子的多相流测量**（空化、沸腾、汽液两相）
  - ✅ **渲染端的"物理真值"来源**：用真实高速摄影 + 光流替代昂贵的多相渲染验证
  - ✅ **合成数据 → 真实域的域适应范式**（有模拟器即可迁移）
  - ⚠️ 需要每个新场景都做模拟 + 微调 ⚠️
  - ❌ 单相流动（直接用 PIV 即可）
