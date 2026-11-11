---
type: paper
created: 2026-11-11
updated: 2026-11-11
tags: [paper, fluid-rendering, turbulence, cfd, dns, heat-transfer, water, physics-flu-dyn]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2611.14276
---

# Direct numerical simulation of turbulent heat transfer in water with temperature-dependent viscosity and conductivity

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Direct numerical simulation of turbulent heat transfer in water with temperature-dependent viscosity and conductivity |
| **作者** | Davide Modesti, Alessandro Ceci |
| **发表** | arXiv preprint (physics.flu-dyn), 2026-11-10 |
| **链接** | [arXiv:2611.14276](https://arxiv.org/abs/2611.14276) |
| **DOI** | — |
| **代码** | 摘要未声明 |
| **分类** | 湍流 / 热传递 / DNS / 变物性流体 |

---

## 核心贡献

> **液态水的"导热率不与粘性成正比"，导致 Prandtl 数沿程变化** → 常物性假设失效。本工作把源自空气的"逆变换 + 经验修正"方法**推广到液体**，用 DNS 标定修正项：**摩擦系数与换热系数预测误差 < 2%**（最低 Re 除外），并**把 Spalart–Allmaras 模型的摩擦误差减半**。

1. **问题：常物性流体模型的适用范围**
   - 多数湍流换热研究用**空气**（导热率 ∝ 粘性）建立"常物性流"映射关系；
   - **液体（水）不满足该比例关系**，且 **Prandtl 数沿程变化** → 现有方法不能直接套用。

2. **算例设置**：平面通道内液态水的**湍流强制对流** DNS；
   - 壁加热与壁冷却；
   - **平均-壁温比 0.83–1.3**；
   - **壁温 277–360 K**；
   - **壁面 Prandtl 数 2–12**。

3. **与常物性流的对比（关键量化结果）**
   - **摩擦系数变化 −39% ~ +32%**；
   - **以壁面 Prandtl 数归一的换热系数变化最高达 2.3 倍**；
   - **经验关联式与 DNS 偏差最高 26%**。

4. **微观机理发现**
   - **壁面摩擦雷诺数会误判湍流尺度范围**；
   - 但**近壁速度与温度条带在用局部粘性长度缩放后具有共同的间距** → 这是映射成立的几何基础。

5. **方法与精度**
   - 通过**平均动量与能量平衡导出的积分变换**，把平均剖面映射到常物性流剖面；
   - **涡粘性与涡扩散率的经验修正**在 DNS 上标定；
   - **逆变换预测摩擦与换热，误差 < 2%**（最低 Re 除外）；
   - 同样的修正引入 **Spalart–Allmaras 模型，摩擦误差减半**。

---

## 技术方案

### 核心思想

**变物性 → 常物性**的映射思路（源自空气的方法，推广到液体）：

1. DNS 变物性流 → 得到平均剖面与标量场；
2. 通过**积分变换**把平均剖面映射到"等效常物性流"的剖面；
3. 用常物性流的已知关联式预测摩擦/换热；
4. 再用**逆变换**映射回来；
5. **关键修正**：涡粘性与涡扩散率的修正项在 DNS 上标定（因为水的 Prandtl 数沿程变化，标定不能是常数）。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Direct numerical simulation** | 全 DNS 解析壁面与温度场 |
| **Integral transformations** | 由平均动量/能量平衡导出（不是拟合的经验变换） |
| **Eddy viscosity / diffusivity correction** | 在 DNS 上标定的经验修正项 |
| **Local viscous length scaling** | 发现速度/温度条带在局部粘性长度下共享间距 → 几何相似性 |
| **Variable property coupling** | 粘性与导热率均随温度变化 |
| **Spalart–Allmaras correction** | 修正项移植到工程湍流模型，摩擦误差减半 |

---

## 公式

```math
% 变物性（水的 Prandtl 数沿程变化）
\mu(T) = \mu(T_{\text{wall}})\,f_\mu(T), \qquad
k(T) = k(T_{\text{wall}})\,f_k(T), \qquad
Pr(T) = \frac{\mu(T)\,c_p(T)}{k(T)} \ \neq \ \text{const}

% 平均动量/能量平衡 → 积分变换
\int_0^\delta U\,dy = u_*\,\frac{\delta}{f_\mu}\cdots,
\qquad
\int_0^\delta \Theta\,dy \ \text{由}\ \int_0^\delta (T-T_{\text{wall}})\,dy \ \text{导出}

% 涡粘性/涡扩散率修正
\nu_t^{\text{corr}} = \nu_t \cdot \chi_\mu, \qquad
\alpha_t^{\text{corr}} = \alpha_t \cdot \chi_k

% 摩擦与换热预测
C_f = f\!\left(\tfrac{1}{2}\ln Re_\tau\right), \qquad
Nu = h\,\delta/k \;\Longrightarrow\; h = \frac{Nu\,k}{\delta}
```

---

## 代码片段

```python
# 概念伪代码：变物性 → 常物性 的积分变换映射
def map_to_constant_property(dns, wall_T, fluid="water"):
    # 1) 局部物性（随温度变化）→ 局部 Prandtl 数
    mu = mu_of_T(dns.T, fluid)
    k  = k_of_T(dns.T, fluid)
    Pr = mu * cp_of_T(dns.T) / k

    # 2) 平均动量与能量平衡 → 积分变换（由平衡导出，非经验拟合）
    M = integrate_momentum(dns.U, mu)      # ∫U dy 加权
    E = integrate_energy(dns.theta, k)     # ∫(T-Twall) dy 加权

    # 3) 等效常物性剖面（局部粘性长度缩放）
    y_plus = dns.y / viscous_length(mu, dns.tau_wall)
    U_eq = equivalent_profile(dns.U, y_plus)     # 速度/温度条带共享间距

    # 4) 涡粘性/涡扩散率经验修正（在 DNS 上标定）
    nu_t_c  = eddy_viscosity(dns) * chi_mu(Pr)
    alpha_t = eddy_diffusivity(dns) * chi_k(Pr)

    # 5) 常物性关联式 → 逆变换 → 摩擦/换热
    Cf = friction_correlation(U_eq, nu_t_c)
    Nu = heat_transfer_correlation(U_eq, alpha_t)
    h  = Nu * k.mean() / delta
    return Cf, h
```

---

## 实验结论

- **算例**：平面通道内液态水湍流强制对流 DNS（壁加热/壁冷却；平均-壁温比 0.83–1.3；壁温 277–360 K；壁面 Pr 2–12）；
- **基线**：**常物性流**同 Re 结果；**经验关联式**；
- **结果**：
  - 常物性假设下：摩擦系数 **−39% ~ +32%** 偏差；以壁面 Pr 归一的换热系数**最高 2.3 倍**偏差；经验关联式**最高 26%** 偏差；
  - **壁面摩擦雷诺数误判湍流尺度范围**，但速度/温度条带在局部粘性长度下**共享间距**；
  - **逆变换预测摩擦与换热误差 < 2%**（最低 Re 除外）；
  - **修正项使 Spalart–Allmaras 摩擦误差减半**；
  - 密度常数 → 核心区的平均速度与温度亏损与常物性流相同。

---

## 局限性

- **DNS 级算力**，不可用于实时渲染管线；
- **平面通道**几何，不可直接推广到复杂几何；
- 修正项是**经验标定**（在 DNS 上标定）→ 外推需谨慎；
- **最低 Re 下预测失效**（>2% 误差）；
- 液态水专用（未涵盖其他液体/相变）。

---

## 相关工作

- [[2026-11-11-Zheng-Shen-Xie-Velocity-Gradient-Invariants-Lundgren]] — 湍流统计
- [[2026-11-11-Wang-Bao-Wang-Cardiac-Cycle-Pulsatile-Pipe-Flow]] — 壁湍流时序
- [[2026-10-30-Capillary-Wave-Turbulence-Finite-Systems]] — 毛细波级联
- [[2026-11-05-Zhang-Cai-Huang-Ren-GauSmoke-Hybrid-Physics-Optical-Gaussian-Splatting]] — 烟雾渲染

---

## 实现建议

- **实现难度**：🟡 中（DNS 数据 + 变换映射）
- **预期性能**：离线；**误差 < 2%**
- **适用场景**：
  - ✅ **水/液体加热冷却过程的可视化**（工业换热器、水冷系统视觉）
  - ✅ **"变物性 → 常物性"映射这一通用工程手法**（可直接复用到其他物性变化场景）
  - ✅ **工程湍流模型修正**（Spalart–Allmaras 摩擦误差减半）
  - ⚠️ 直接用于渲染速度场 ❌（需降阶）
  - ❌ 非液体介质（空气可套用原方法）
