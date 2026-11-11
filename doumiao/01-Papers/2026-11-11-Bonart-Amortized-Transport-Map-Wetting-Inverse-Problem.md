---
type: paper
created: 2026-11-11
updated: 2026-11-11
tags: [paper, fluid-rendering, inverse-problem, bayesian-inference, wetting, contact-angle, transport-map, amortized-inference, physics-flu-dyn]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2611.12193
---

# Amortized Transport-Map Likelihoods for Hierarchical Inverse Problems with Application to Wetting

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Amortized Transport-Map Likelihoods for Hierarchical Inverse Problems with Application to Wetting |
| **作者** | Henning Bonart |
| **发表** | arXiv preprint (stat.AP, math.NA, physics.flu-dyn), 2026-11-09 |
| **链接** | [arXiv:2611.12193](https://arxiv.org/abs/2611.12193) |
| **DOI** | — |
| **代码** | 摘要未声明 |
| **分类** | 逆问题 / 贝叶斯推断 / 润湿 / 表面张力 |

---

## 核心贡献

> **分层贝叶斯模型的瓶颈在于：后验每求一次就要做一次前向求解**。本工作用**三角传输映射似然 (triangular transport-map likelihood)** 一次训练、供所有 cell 复用，把**单后验的前向求解次数降到几百倍以下**，在 **200 个后验的标定研究**中更是**省下约 5 个数量级**；且新照片**无需前向求解**即可直接给出后验——这是"**原位测量润湿性质而不扰动液体**"的关键一步。

1. **问题：分层模型的重复前向求解**
   - 分层贝叶斯模型会**汇聚 (pool)** 多个测量；
   - 但只要**似然里含前向模型**，**每次后验评估的代价 = 每个 cell 一次前向求解** → cell 数增长时成本爆炸。

2. **方法：模拟推断 (simulation-based inference) + 传输映射**
   - 训练一个**三角传输映射似然**，**一次训练、每个设计一次**；
   - 训练后，**所有 cell 共用**该映射 → 前向求解次数大幅下降；
   - **离线训练后，新照片 → 后验，无需前向求解**。

3. **应用：润湿 (wetting) 性质反演**
   - 薄液膜中**稳定孔洞 (stable hole)** 的半径通过**非线性的 Young–Laplace 方程**依赖于**接触角**与**毛细长度**；
   - **单张照片只给出 rank-one 信息** → 只能靠**分层模型汇聚多张照片**；
   - 每个 cell = **一个基底 + 一个体积设定**；cell 之间**共享装置几何**与**噪声尺度**。

4. **验证**
   - **合成验证设计**上，映射的后验与**直接采样前向模型**在润湿性质上**吻合**；
   - **更大的合成标度设计**上吻合度较低；
   - **仿真基标定 (simulation-based calibration)** 在验证设计上**未检测到任何参数的偏离**；
   - **真实照片**上后验与直接采样**一致**，且与**实测半径**相符。

5. **成本节省**
   - 单个后验：比"直接采样 + 无梯度集合采样器"**少几百倍**前向评估；
   - **200 个后验的标定研究**：**约 5 个数量级**。

---

## 技术方案

### 核心思想

**传输映射 (transport map)** 思路：用一系列可逆变换 $T$ 把"难采样的后验"变成"易采样的先验"，即
$$p(\theta \mid y) = p_0(T(\theta))\,|\det \nabla T(\theta)|$$

关键在于**"一次训练、到处复用"**：映射的参数只依赖于**设计 (design)**（基底数量、体积设定、每 cell 照片数），**不依赖于具体的 cell** → 一次训练即可服务整张分层模型。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Triangular transport map** | 三角结构 → 变换可按坐标序依次构造，保证可逆性 |
| **Amortized likelihood** | 似然本身被参数化/摊销 → 推理无需前向求解 |
| **Hierarchical pooling** | 跨 cell 汇聚信息，共享几何与噪声尺度超参 |
| **Simulation-based inference** | 合成数据上训练与标定（SBC） |
| **Simulation-based calibration** | 标定检验：验证设计下无参数偏离 |
| **Young–Laplace inverse problem** | 孔洞半径 → (接触角, 毛细长度) 的非线性反演 |

---

## 公式

```math
% Young–Laplace：薄液膜中稳定孔洞的半径
R_{\text{hole}} = f(\theta_c,\ \ell_c) \ \ \text{非线性依赖}
\qquad \theta_c=\text{接触角},\quad \ell_c=\text{毛细长度}=\sqrt{\gamma/(\rho g)}

% 传输映射似然
p_T(\theta \mid y) = p_0\!\big(T(\theta;y)\big)\,\big|\det \nabla_\theta T(\theta;y)\big|,
\quad T = T_K\circ\cdots\circ T_1\ \text{(三角)}

% 分层结构
p(\theta, \eta \mid y) \propto
\underbrace{\prod_{c=1}^{C} p(y_c \mid \theta_c;\,\eta)}_{\text{似然（已摊销）}}
\cdot \underbrace{p(\eta)\,p(\theta_c\mid \eta)}_{\text{超参 + 条件先验}}
\end{aligned}
```

---

## 代码片段

```python
# 概念伪代码：摊销传输映射似然
def train_map(design, sim_forward, n_train=50_000):
    """design 固定：cell 数、体积设定、每 cell 照片数。一次训练，全局复用。"""
    theta, y = [], []
    for _ in range(n_train):
        params = sample_prior()
        photos = sim_forward(params, design)   # 生成 (θ, y) 对
        theta.append(params); y.append(photos)

    # 拟合三角传输映射 T（逐坐标、条件化）
    T = build_triangular_map(n_layers=6)
    T.fit(theta, y, loss=kl_to_reference)
    return T

def posterior_for_new_photo(T, new_photo, prior):
    """新照片 → 后验，零前向求解。"""
    z = T.inverse(new_photo)                 # 映到参考空间
    return prior.transformed(z)              # 在参考空间采样/求后验

def hierarchical_posterior(T, cells):
    """所有 cell 共用同一映射 —— 前向求解次数 = 训练时的一次。"""
    per_cell = [posterior_for_new_photo(T, c.photos, prior) for c in cells]
    return pool_hierarchically(per_cell, shared=("geometry", "noise_scale"))
```

---

## 实验结论

- **算例**：
  - **合成验证设计**；
  - **更大的合成标度设计**；
  - **真实照片**（薄液膜中稳定孔洞，多基底 × 多体积设定）；
- **基线**：**直接采样前向模型**（含无梯度集合采样器）；
- **结果**：
  - 合成验证设计：映射后验与直接采样**吻合**；SBC **未检测到任何参数偏离**；
  - 更大标度设计：吻合度**较低**；
  - 真实照片：后验与直接采样**一致**，且与**实测半径相符**；
  - **成本**：单后验省**几百倍**前向评估；**200 后验标定研究省约 5 个数量级**；
  - 离线训练后，新照片**零前向求解**出后验。

---

## 局限性

- **接触角与毛细长度只能给出 rank-one 信息** → 依赖分层汇聚，单张照片不够；
- **更大标度设计上吻合度下降** → 摊销映射的外推能力有限（设计变了要重训）；
- 需**可前向模拟的物理模型**（Young–Laplace）→ 模型失配则后验失真；
- 统计方法论文，**摘要未给出代码**与具体误差数字；
- 论文偏统计，渲染关联需自行挖掘。

---

## 相关工作

- [[2026-11-11-Sakib-Mychkovsky-Babaee-Low-Rank-Tensor-Manifolds-Turbulence]] — 另一条数据驱动路线（降维 vs 贝叶斯）
- [[2026-11-11-Barman-Ray-Hankel-Neural-Operator]] — 算子学习
- [[2026-11-11-Liu-Hydrograd-Shallow-Water-Differentiable-Model]] — 可微模拟 + 反演
- [[2026-10-31-Yao-Zhou-Taylor-Bubble-Drop-Assembly-Riser]] — 液滴/气泡装配

---

## 实现建议

- **实现难度**：🟡 中（传输映射 + SBI 生态；需可前向的物理模型）
- **预期性能**：单后验前向评估**降几百倍**；标定研究**降 ~5 个数量级**；推理零前向
- **适用场景**：
  - ✅ **原位测量表面润湿性质**（接触角、毛细长度）→ 直接服务于**液体着色器的表面材质参数标定**
  - ✅ **多相机/多基底的多视角标定范式**（"一次训练、每设备复用"）
  - ✅ **反演成本成为瓶颈时的通用解法**：任何"分层贝叶斯 + 昂贵前向"的场景
  - ⚠️ 换设计（cell 数/体积设定）需重训 ⚠️
  - ❌ 强非线性前向、非光滑似然（如相变）
