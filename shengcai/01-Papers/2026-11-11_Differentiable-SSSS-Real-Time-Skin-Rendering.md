---
type: paper
created: 2026-11-11
updated: 2026-11-11
tags: [paper, subsurface-scattering, PBR, inverse-rendering, real-time-rendering, differentiable-rendering, SSSS, skin-rendering, 2026-11]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2611.14451
---

# A Lightweight Differentiable Method for Real-Time Skin Rendering and Digitization

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | A Lightweight Differentiable Method for Real-Time Skin Rendering and Digitization |
| **作者** | Mario Marquez-Balduque, Carlos Rodriguez-Pardo, Jorge Lopez-Moreno |
| **单位** | Universidad Rey Juan Carlos (URJC) · Politecnico di Milano · CMCC 意大利 |
| **发表** | arXiv preprint 2026-11-11（cs.CV cross-list → cs.GR） |
| **链接** | [原文](https://arxiv.org/abs/2611.14451) · [PDF](https://arxiv.org/pdf/2611.14451v1) · [HTML](https://arxiv.org/html/2611.14451v1) |
| **DOI** | 10.48550/arXiv.2611.14451 |
| **代码** | 未提供链接（论文提及补充材料含 GPU shader 与张量化实现细节） |

> **注意**：该论文在 cs.GR 为 **cross-list**（主分类 cs.CV），但内容与本领域高度相关（可微渲染 + 次表面散射 + PBR）。

---

## 核心贡献

> **离线路径追踪得到的物理参数（如消光系数）无法直接映射到游戏引擎的近似着色器** —— 本文直接**优化实时管线真正使用的参数**（Burley 15 的散射距离），并用**单光源、单视图**的低成本采集实现。

1. **可微 SSSS（SSSS）框架**：实现带 **Burley Normalized Diffusion** profile 的**可微屏幕空间次表面散射**，使**空间变化的基础贴图**与**散射距离**可**联合优化**。
2. **低成本采集装置**：**单光源 + 单视图**（投影仪 + 单反相机，近同轴），每个皮肤块拍 **4 张**二值光照图；无需超光谱/偏振/Light Stage 等实验室级设备。
3. **遮蔽感知损失（masked loss）**：把监督**限制在阴影区**——那里**多重散射**在物理上占主导，从而**隔离并稳定地优化散射参数**。
4. **按面部区域分块 + Profile blending**：先为每个皮肤块优化**均匀散射距离**，再按解剖区域 + 厚度纹理混合成**空间变化的散射距离贴图**，可直接投产到运行时引擎。
5. **数据集**：**45 名被试**（覆盖 **Monk Skin Tone Scale** 全色调）+ 合成数据 + 多光验证 + 斜视角验证。

---

## 技术方案

### 核心思想

**问题的本质**：离线路径追踪估计的是 $\sigma_s$（内禀散射系数）等物理量；实时引擎用的是「散射距离 $d$」这一**有效参数**。二者之间没有直接映射。

本文的策略：**绕开路径追踪中介，直接把实时着色器的参数作为优化变量**。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Burley 15 (Disney 2015 BSSRDF)** | 相比 Burley 12 增加了**物理导出的散射距离参数**，保证能量守恒且支持各向异性扩散。业界实时 PBR 皮肤着色的事实标准 |
| **屏幕空间扩散 + 3D 欧氏距离** | **关键细节**：不像常规屏幕空间近似用投影像素距离，而是用**深度缓冲重建真实 3D 欧氏距离** → 扩散剖面**与相机距离/FOV 无关**，物理上一致 |
| **重要性采样** | **Fibonacci 角度** + **分层 Burley 逆 CCDF 归一化半径**；角度加随机抖动（把结构化混叠转为高频时间噪声） |
| **单散射（translucency）** | 用 **Beer-Lambert 定律 + 厚度贴图**近似（薄几何如耳朵）；仅用于最终渲染的视觉完整性，**不参与优化** |
| **厚度贴图** | 无实测数据时用**反法线 SSAO** 自动近似（翻转法线使 AO 半球朝向物体内部） |
| **多阶段优化** | Stage 1 拟合全局反射 → Stage 2 解冻 albedo 吸收漫反射细节 → Stage 3 **只在阴影掩码区**优化散射距离（表面图冻结） |
| **残差高光张量 $\boldsymbol{\Delta}_{\text{spec},T}$** | **辅助缓冲区**，吸收高光差异，**防止镜面能量污染 albedo**（因为 Burley 扩散剖面直接随 $\mathbf{A}$ 缩放，任何烘焙进 albedo 的镜面能量都会人为偏移其色度）。收敛后丢弃 |
| **物理先验初始化** | IOR 图初始化为 0.145（线性映射到物理 IOR ≈ 1.44）；散射距离图初始化为 0.5；albedo 用 **CIE LAB 的 a\*/b\* 做 k=2 k-means** + 排除最亮 10%/最暗 5% 像素 + **2σ Sigma Clipping** 求稳健均值 |
| **粗糙度 L2 先验** | $\lambda_{\text{prior}}\|\boldsymbol{\rho}_T-0.6\|_2^2$ —— 锚定 0.6（业界实时引擎默认皮肤粗糙度基线），**防止高频 albedo 细节迁移到粗糙度图**（单视图约束下不可避免的退化） |
| **可微张量化实现** | 屏幕空间扩散 pass 被翻译成**向量化 PyTorch 广播操作**（跨 NN 重要性采样坐标广播成统一高维张量），**消除逐像素 Python 循环** |
| **标定** | RAW（.ARW）经 `rawpy` 解码（绕过非线性 ISP，强制 γ=1.0 线性）；**Ridge Regression 3×3 CCM**（X-Rite ColorChecker）标定到线性 sRGB |

### 采集装置

| 组件 | 配置 |
|---|---|
| **光源** | 投影仪，距被摄者约 **20 cm**，相对表面平面**上仰 30°**（低角度 → 强方向性照明 → 最大化 SSS 可见性，同时允许二值照明） |
| **成像** | 高分辨率 RGB 相机（DSLR）装在投影仪**后方约 50 cm**，**近同轴**（最小化几何畸变） |
| **几何** | 依赖**单目深度估计**（避免复杂的投影仪-相机标定与结构光三角化）；归一化输出（近平面 0 / 远平面 1）映射到 **2 cm** 物理深度范围，锚定在实测相机-被摄距离 **47 cm** |
| **拍摄** | 每块皮肤拍 **4 张**，**垂直对齐的线状图案**（减少投影仪色差与彩色条纹；SSS 有波长依赖，复杂图案会引入光谱干扰） |
| **相机** | Sony α6100（ILCE-6100L）；**6020×4024**，ISO 100，1/20 s，f/20，白平衡 6000 K，50 mm；中心裁剪到 **480×360**（GPU 显存约束） |

---

## 公式

**Burley 扩散剖面（指数近似）**（式 1）：

```math
R(r,d)=A\ \frac{e^{-r/d}+e^{-r/3d}}{8\pi dr}
```

其中 $A$ = 漫反射体色（volume albedo），$r$ = **3D 欧氏距离**，$d$ = 缩放后的散射距离。
> 因不建模表皮/真皮分层，恢复出的 $d$ 是**实时着色器的有效参数**，而非内禀 $\sigma_s$。

**重要性采样 PDF 与 CCDF**（式 2）：

```math
p(r)=\frac{rR(r,d)}{A},\quad \bar{P}(r)=\frac{1}{4}e^{-r/d}+\frac{3}{4}e^{-r/3d}
```

（$p(r)$ 建模径向射线上的线性剖面形状；整圈 $2\pi$ 积分因子在数值 CCDF 反演时显式处理，并在最终漫反射辐照度估计器 $2\pi/N$ 中体现）

**双侧权重（双边形式）**（式 3）：

```math
k_{i,c}=\frac{s_{i}\cdot R(s_{i},d_{c})}{r_{i}\cdot R(r_{i},r_{\text{max}})}
```

其中 $s_i=\|\mathbf{x}-\mathbf{x}_i\|_2$（真实 3D 距离），$d_c$ = 对应光谱通道的散射距离，$r_{\max}$ = 全局边界域上限。

**散射漫反射辐照度**（式 4）：

```math
I_{c}(\mathbf{x})=A_{c}\left(\frac{\sum_{i=1}^{N}k_{i,c}L_{c}(\mathbf{u}_{i})}{\sum_{i=1}^{N}k_{i,c}}\right)
```

**屏幕空间重建（式 5–7）**：从投影矩阵与深度图恢复采样点的 3D 视空间坐标

```math
\mathbf{z}=\frac{P_{23}}{(2\cdot\mathbf{D}_{T}-1)-P_{22}},\quad
\mathbf{x}_{v}=\frac{\mathbf{U}\odot\mathbf{z}}{P_{00}},\quad
\mathbf{y}_{v}=\frac{\mathbf{V}\odot\mathbf{z}}{P_{11}}
```

```math
\mathbf{U}_{s}=\frac{(\mathbf{x}_{v}+\mathbf{x}_{o})\cdot P_{00}}{\mathbf{z}},\quad
\mathbf{V}_{s}=\frac{(\mathbf{y}_{v}+\mathbf{y}_{o})\cdot P_{11}}{\mathbf{z}}
```

**总损失（式 8）**：

```math
\mathcal{L}=\frac{1}{|\Omega|}\left\|\hat{\mathbf{I}}\odot\mathcal{M}_{\text{opt}}-\mathbf{I}\odot\mathcal{M}_{\text{opt}}\right\|_{1}+\lambda_{\text{prior}}\frac{1}{|\Omega|}\left\|\boldsymbol{\rho}_{T}-0.6\right\|_{2}^{2}
```

---

## 代码片段

```python
# 多阶段优化调度（Table 1）
STAGES = [
    dict(name="Stage 1", params=["delta_spec", "rho"], frozen=["albedo", "scattering"],
         iters=700, lr=5e-3, mask=FULL_IMAGE,   lam_prior=1e-2),
    dict(name="Stage 2", params=["albedo", "rho", "delta_spec"], frozen=["scattering"],
         iters=500, lr=5e-3, mask=FULL_IMAGE,   lam_prior=1e-2),
    dict(name="Stage 3", params=["scattering"], frozen=["albedo", "rho", "delta_spec"],
         iters=600, lr=1e-3, mask=SHADOW_MASK,  lam_prior=None),
]
```

```python
# 散射距离的单位换算：遵循 Unreal Engine 5 约定
# 归一化纹理域 [0,1] 线性映射到 [0, 1.0] cm；引擎世界空间用米
SCATTERING_SCALE = 0.01          # 1.0 cm = 0.01 m
d_opt = scattering_map * SCATTERING_SCALE

# 重要：使用真实 3D 欧氏距离，而非投影像素距离
s_i = torch.linalg.norm(x - x_i, dim=-1)   # x_i 由深度缓冲经逆透视投影重建
```

```python
# 可微 SSSS：向量化广播（替代逐像素循环）
# s_i: (N,), L_c(u_i): (N,), k_i,c: (N,)
k = (s[:, None] * R(s[:, None], d_c[None, :])) / \
    (r_i[:, None] * R(r_i[:, None], r_max))
I_scattered = A_c * ((k * L_c_samples).sum(0) / k.sum(0))
```

---

## 实验结论

- **数据集**: 真实面部皮肤块 **45 名被试**，覆盖 **Monk Skin Tone Scale** 全 10 级；另有合成数据（已知 Burley 参数）、多光配置、斜视角配置
- **基线**: 无（本文为绝对精度评估）；合成实验中以 GT 参数为参照
- **硬件**: NVIDIA GeForce RTX 4070 Ti (12 GB) + AMD Ryzen 9 7900 (12 核 24 线程)

### Table 2 — Monk Scale 分组的重建误差（掩码区域上计算）

| Monk 分组 | FLIP ↓ | LPIPS ↓ | SSIM ↑ | PSNR ↑ |
|---|---|---|---|---|
| Monk 1-3 | 0.093 ± 0.026 | 0.086 ± 0.020 | 0.615 ± 0.066 | 28.61 ± 1.68 |
| Monk 4-6 | 0.093 ± 0.031 | 0.088 ± 0.018 | 0.614 ± 0.066 | 28.67 ± 1.89 |
| **Monk 7-10** | **0.077 ± 0.021** | 0.115 ± 0.015 | 0.503 ± 0.072 | **29.65 ± 1.35** |

> **SSIM 在阴影区对亮度变化敏感**，故分数偏低；而 **FLIP 与 LPIPS 一致地给出低误差** → 支持全色调范围内的**感知合理性**。

### Table 3 — 每块皮肤的算力成本（480×360 px，N=128 散射采样）

| 指标 | Stage 1 | Stage 2 | Stage 3 | Overall |
|---|---|---|---|---|
| **执行时间 (s)** | 51.1 | 38.3 | 109.0 | **198.4** |
| **迭代数** | 700 | 500 | 600 | **1800** |
| **每迭代耗时 (ms)** | 72.9 | 76.6 | 181.7 | 110.2 |
| **峰值显存 (GB)** | 2.5 | 2.6 | **9.4** | **9.4** |

> **单块皮肤 3.5 分钟内收敛（198.4 s）**，峰值显存 9.4 GB（Stage 3 集成阶段）→ 消费级桌面硬件即可完成**快速、可及的**数字化。

### 物理合理性验证

- **散射距离随肤色变深而单调变短**，符合**黑色素含量高 → 皮下光传输减少**的物理预期 → 说明**仅用 RGB 的优化**即可得到物理合理的参数，**无需超光谱数据**
- 径向散射剖面 $R(r)$ 在对数空间下分通道（RGB）衰减，**深色肤质的有效范围更短**

### 消融与验证结论

| 实验 | 结论 |
|---|---|
| **遮蔽损失消融**（Stage 3：$\mathcal{M}_{\text{opt}}=\mathbf{1}$ vs $=\mathcal{M}$） | 未遮蔽时，直射条纹区域的辐照度比阴影区**高数个数量级** → 反传梯度被**表面反射分量**（漫反射 albedo + 镜面高光）主导，与低频的**次表面扩散晕**产生**严重梯度竞争** → 优化器通过扭曲 $d_{\text{opt}}$ 来补偿直接光误差。**遮蔽监督可防止此偏置**，并降低全图与阴影区的 FLIP 误差 |
| **多光验证**（四阶段多光配置 vs 单光） | 单光法与多光法的散射距离**平均 L1 差异 < 2%**；多光只改善**粗糙度与表面属性**（尤其鼻、耳），**散射距离几乎相同** → 证明**单光单视图对估计 SSS 足够且稳健** |
| **斜视角验证** | 合成与真实数据上 $d_{\text{opt}}$ 在不同视角下**保持不变** → 证明 **3D 深度感知计算防止了透视缩短导致的参数收缩**，结果非视角过拟合 |
| **残差高光验证** | 优化后的残差图与 GT 镜面贡献**高度相似** → 证实稳健均值 albedo 计算有效屏蔽漫反射分量 |
| **合成验证** | 固定全部表面属性只优化散射距离 → $d_{\text{opt}}$ 与 $d_{\text{ref}}$ **几乎完全一致**，渲染重建**视觉上无法区分** |
| **Monk 全 10 级合成验证** | 固定散射距离、变化 albedo（Monk 01/05/10）→ FLIP 低、参数恢复一致 → **对 albedo 变化稳健** |

### 引擎实现

- 自建**实时渲染引擎：WebGL + Babylon.js**（跨平台、可跑在资源受限/低端设备）
- 引擎同时充当**合成数据生成器**（已知 GT 参数的参考图），用于验证优化流程
- 着色模型输入：**厚度贴图** + **空间变化散射距离贴图**；三者纹理附件：厚度、区域（红通道编码离散区域标签，绿通道存散射距离混合因子）、混合后的散射距离

---

## 局限性

1. **局部均匀散射假设** + **单目深度先验**（低保真近似，缺毛孔级细节 → 粗糙度图偏平滑）
2. **薄/高透光结构**（鼻软骨、耳廓）省略显式单散射优化 → **估计的散射距离略偏大**（模型用现有参数解释缺失的透射性）；区域混合方案把这些估计约束在合理范围内
3. **非局部可见性未处理** → 陡峭起伏处（如耳折）的**残余自阴影会被部分吸收进 albedo**
4. **单视图下的 albedo/散射歧义** → 靠多阶段优化策略（残差高光 + 冻结/解冻调度）稳定参数恢复
5. **屏幕空间着色的固有局限**：陡峭起伏处自阴影被烘焙进 albedo（论文承认）
6. **未建模表皮/真皮分层**，$d$ 是有效参数而非 $\sigma_s$
7. **需要约 9.4 GB 显存**（Stage 3），消费级 12 GB 卡可跑，但**更高分辨率/更高采样数需重新评估**
8. 论文未提供公开代码链接

---

## 相关工作

- **Disney 2015 BSSRDF / Burley 15** — 本文参数化基础；**Burley 12**（Disney BRDF）缺乏体积散射控制
- **Jimenez et al. 2015**（GPU Pro, *Separable Subsurface Scattering*）— 屏幕空间扩散 + 重要性采样（式 1–4 的直接来源）
- **d'Eon / Jimenez 2011** — 反法线 SSAO 厚度近似
- **Penner & Zhang 2013** — 面部区域 profile blending
- **Feng et al. 2023** — 单视图可动画细节人脸
- **[[2026-07-06_Subsurface_Dipole_Thin_Geometry]]** / **[[2026-06-25-Spectral-Subsurface-Scattering-Skin]]** / **[[2026-07-06_Spectral-Subsurface-Skin_RGB]]** — 知识库已有的 SSSS 相关工作（分别是偶极子近似、光谱 SSSS、RGB 光谱 SSSS）
- **[[2026-11-07_PRep-IR-Prior-Space-Reparameterization-Inverse-Rendering]]** — 同样做可微逆渲染的**先验空间重参数化**（物理参数 → 引擎参数的映射思路可对照）
- **Monk Skin Tone Scale**（Google）— 感知均衡的肤色量表，区别于面向皮肤科的 Fitzpatrick 量表

---

## 实现建议

- **实现难度**: **中**。核心工作是：① 一个可微的屏幕空间 SSSS（PyTorch 张量化 + 深度缓冲 3D 重建）；② 三阶段优化调度 + 阴影掩码；③ 采集装置与标定流程（RAW → 线性 sRGB 的 CCM 标定是关键）
- **预期性能**:
  - 精度：FLIP **0.077–0.093**，LPIPS **0.086–0.115**，PSNR **28.6–29.7 dB**，SSIM **0.50–0.62**
  - 速度：单块皮肤 **198.4 s** 收敛（RTX 4070 Ti），峰值 **9.4 GB** VRAM
  - 泛化：单光 vs 多光的散射距离差异 **< 2%**
- **适用场景**:
  - ✅ **游戏/引擎的数字人皮肤资产生产**（参数直接是 Unreal 风格的「散射距离」，无需转换）
  - ✅ **低成本、无实验室设备**的皮肤采集（投影仪 + 消费级单反）
  - ✅ **肤色多样性/包容性**要求（Monk 全 10 级验证）
  - ✅ 与其他可微渲染工作组合（[[2026-11-07_PRep-IR-...]] 的先验重参数化）
  - ⚠️ 需要内禀物理参数（$\sigma_s$、消光系数）用于体积渲染/离线渲染 —— **本文不提供**
  - ⚠️ 高分辨率（>480×360）或高采样数（N>128）场景 —— 显存与时间需重新评估
- **建议动作**:
  1. 传递给 **@墨鱼丸**：重点是「**直接优化引擎参数而非物理参数**」这一思想 + **遮蔽损失**技巧（可迁移到任何「在强直接光下反推次表面/软阴影参数」的问题）
  2. **遮蔽损失 + 残差高光缓冲** 两个技巧可**独立移植**到既有的可微渲染管线，无需整套重做
  3. 与知识库既有的三篇 SSSS 笔记（[[2026-06-25-Spectral-Subsurface-Scattering-Skin]] 等）对照 —— 本文是**屏幕空间 + 实时导向**，那三篇是**光谱/体积导向**，互补
- **优先级**: **中-高**（工程落地性强；但属于「应用/资产生产」而非「渲染理论突破」）
