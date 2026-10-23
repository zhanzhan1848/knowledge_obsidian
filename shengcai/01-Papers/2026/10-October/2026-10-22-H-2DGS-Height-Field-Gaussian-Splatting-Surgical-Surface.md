---
type: paper
created: 2026-10-23
updated: 2026-10-23
tags: [paper, cs.GR, gaussian-splatting, surface-reconstruction, height-field, ray-surface-intersection, newton-rasterization, TSDF, deformation, medical-visualization]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.30910
arxiv_id: 2610.30910
date_added: 2026-10-23
window: 24h (2026-10-22 14:00 UTC → 2026-10-23 14:15 UTC)
---

# H-2DGS: Height-Field Gaussian Splatting for Sharp and Deformable Neurosurgical Surface Reconstruction

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | H-2DGS: Height-Field Gaussian Splatting for Sharp and Deformable Neurosurgical Surface Reconstruction |
| **作者** | Zhang Zichuan, Bart Brouwers, Rembrandt Bakker, Maud Landers, Geert-Jan Rutten, Maxime Chamberland |
| **单位** | Eindhoven University of Technology; Elisabeth-Tweesteden Hospital Tilburg |
| **发表** | arXiv 2026-10-22 (eess.IV, cs.CV, cs.GR) |
| **链接** | [原文](https://arxiv.org/abs/2610.30910) |
| **代码** | 承诺论文发表后开源 (GitHub) |
| **命中关键词** | **Gaussian Splatting + 显式曲面求交 (ray-surface intersection) + TSDF + 高度场图元 + 形变** |

> **本库相关性评级：⭐⭐⭐⭐⭐ (Tier A)**
> 24h 严格窗口内**唯一**的渲染表示类论文。虽然应用域是神经外科可视化，但**图元设计（高度场 Gaussian + Newton 曲面求交 + 光栅化）和三阶段管线对任何"3DGS → 显式曲面"需求都有直接借鉴价值**。与本库已收录的 VisibilitySplat (2610.19847)、H2-Ray (2610.13498) 同属 SIGGRAPH 2026 会后 SIGGRAPH 2026 浪潮的一部分。

---

## 核心贡献

> 把体积型 3DGS 逐步"收紧"成贴合曲面的显式高度场图元，在稀疏视角覆盖下获得锐利、可形变、且**可解析求交**的表面表示。

1. **三阶段转换管线**：Stage I 用标准 3DGS 建立外观 → Stage II 用**可微光线厚度目标**沿视线收缩密度 → Stage III 把多视角深度融合进 **TSDF** 后在其零水平集上初始化曲面图元。关键是**不**从稀疏点云直接拟合曲面图元（会崩）。
2. **高度场 Gaussian 图元**：保留 2D surfel 的薄支撑，但允许单个图元沿高斯基函数**弯曲离开切平面**；高度 / 颜色 / 不透明度用**三组独立基**表达（几何基维数刻意低于外观基维数）。
3. **深度监督的可形变表面**：用术后 MRI 深度图形变整个显式表面，同时用 **tracked-color 自监督 + 几何/外观交替优化窗口**保住原有皮层纹理不被抹花。

---

## 技术方案

### 三阶段管线总览

```text
输入: 标定的手术显微镜图像 D = {(I_v, Π_v)}_{v=1..V}   (60–80 帧)

Stage I  光度 bootstrap        标准 3DGS + 自适应致密化  →  稳健但厚重的体积模型
Stage II 密度收缩              可微分位数量化射线厚度     →  局部化的几何代理
Stage III TSDF 融合 + 曲面化    多视角深度 → TSDF 零水平集  →  稀疏曲面 charts
─────────────────────────────────────────────────────────────────────────────
Stage IV 术后形变 (可选)        深度监督 + tracked color   →  可变形保纹理表面
```

### Stage I — 光度 bootstrap

```math
\mathcal{L}_{photo} = (1-\lambda)\,\|\hat{I}_v - I_v\|_1 + \lambda\,\bigl(1 - \mathrm{SSIM}(\hat{I}_v, I_v)\bigr)
```
`λ = 0.2`。该阶段只决定"训练视角该长什么样"，**不决定不透明度该落在射线哪一段**——所以是外观 bootstrap，不是最终表面。

### Stage II — 沿光线收缩密度（本文最关键的数学贡献）

把射线代入候选 3D Gaussian 得到一维贡献并归一化：

```math
\sigma_i(t) = \beta_i \exp\!\left(-\tfrac{1}{2 a_i}(t - m_i)^2\right), \qquad
\sigma(t) = \sum_i \sigma_i(t)
```

```math
p_m = \frac{\sigma(t_m)}{\sum_n \sigma(t_n) + \epsilon}, \qquad
F_m = \sum_{n=1}^{m} p_n
```

分位数用**平滑 softmax 逼近**（τ_q 为锐度参数）：

```math
w_m(q) = \frac{\exp\!\left(-\tau_q \lvert F_m - q\rvert\right)}{\sum_n \exp\!\left(-\tau_q \lvert F_n - q\rvert\right)},
\qquad
t_q = \sum_m w_m(q)\, t_m
```

有效厚度与总损失：

```math
\Delta t = t_{q_{high}} - t_{q_{low}}
```
```math
\mathcal{L}_{thick}(r) = \frac{\max(0,\ \Delta t - \Delta t_\star)}{E}, \qquad
\mathcal{L}_{stage2} = \mathcal{L}_{photo} + \lambda_{thick}\, \mathbb{E}_r\bigl[\mathcal{L}_{thick}\bigr]
```

**超参**：`q_low = 0.01`, `q_high = 0.99`, `Δt* = 0`（零归一化目标厚度）, `λ_thick = 5.0`。
**调度**：5,000 iter warm start 后再跑 **1,000 iter**。

> **为什么用分位数而不是极值？** 极值样本对孤立低密度"浮球"(floater) 极其敏感；1%/99% 分位数更鲁棒。`L_photo` 保持激活，因此收缩不能靠把密度塌到任意深度作弊——必须同时保住观测图像。

### Stage III — TSDF 引导的曲面转换

体素中心 x 在视角 v 下的有符号距离观测与加权融合：

```math
\phi_v(x) = \mathrm{clip}\!\left(\frac{\hat{D}_v(\pi_v(x)) - d_v(x)}{\mu},\ -1,\ 1\right)
```
```math
\Phi(x) = \frac{\sum_v w_v(x)\,\phi_v(x)}{\sum_v w_v(x) + \epsilon}
```

`μ = 3 × 体素尺寸`（截断带）。符号变化的网格格 → 零水平候选点，向 `Φ(x)=0` 投影；归一化梯度 `∇Φ/‖∇Φ‖` 估计法向。
**视图一致性过滤 + 下采样后，局部二次曲面拟合 (local quadric fit)** 为每个 chart 提供：patch 中心、切向标架、曲率估计、支撑尺寸。

> **设计理由**：TSDF 这一中间层有两个作用——(a) 跨视角聚合证据成**单一**几何参考，避免各视角深度互相矛盾；(b) 零水平集同时给出曲面位置**和法向**，让新 patch 的朝向一致。

### 高度场 Gaussian 图元（核心创新）

图元 i 有中心 `c_i`、切向标架 `R_i = [t_u, t_v, n_i]`、切向尺度 `s_{x,i}, s_{y,i}`。曲面为：

```math
S_i(u,v) = c_i + R_i \begin{bmatrix} s_{x,i} u \\ s_{y,i} v \\ h_i(u,v) \end{bmatrix}^{\!\top}
```
```math
h_i(u,v) = \sum_{k=1}^{K_h} b^{h}_{i,k}\ \phi^{h}_{i,k}(u,v),
\qquad
\phi^{h}_{i,k}(u,v) = \exp\!\left(-\frac{\lVert (u,v) - \mu^{h}_{i,k} \rVert_2^2}{2(\sigma^{h}_{i,k})^2}\right)
```

颜色 `C_i(u,v)` 与不透明度 `O_i(u,v)` 用**结构相同但完全独立**的高斯基 + 常数项表达。

**基函数配置**：

| 基类型 | 数量 `K` | 作用 |
|--------|----------|------|
| 高度基 `h` | **5** | 局部曲面弯曲（几何变化最平滑，基维数刻意低） |
| 不透明度基 | **20** | patch 内部支撑与边界强度 |
| 颜色基 | **50** | 充当局部纹理图（纹理高频，基维数高） |

> **设计哲学**：几何维数 < 外观维数。这样外观可以快速变化而**不会引入对应的高频几何振荡**。

### 渲染：显式光线-曲面求交（⭐ 对本库最有价值）

世界空间光线变换到图元切空间 `y_i(t) = R_i^\top (r(t) - c_i)`，归一化 `u_i(t) = y_{x,i}(t)/s_{x,i}`, `v_i(t) = y_{y,i}(t)/s_{y,i}`，求交根：

```math
f_i(t) = y_{z,i}(t) - h_i\bigl(u_i(t), v_i(t)\bigr) = 0
```

**用固定次数的 Newton 迭代求解**。颜色和不透明度在接受的交点处取值，按深度序合成。

> **对比 3DGS 的关键差异**：这不是椭球内的体积累积 (volumetric accumulation)，而是**显式曲面求交 + 相机线性深度 (camera-linear depth)**。该深度后来被术后对齐阶段直接复用。

### 初始化与连续性

1. **高度基拟合**：把邻域 TSDF 零水平样本变换到该 patch 切空间，将它们相对切平面的有符号偏移拟合为高度系数 → 局部平面初始化变为**弯曲 chart**。
2. **外观转移**：邻近 Stage II Gaussian 把颜色/不透明度传给新 patch。
3. **丢弃**体积 Gaussian（完全移除）。

**邻接过渡目标**（防止重叠 patch 出现裂缝或法线突变）：

```math
\mathcal{L}_{trans} = \lambda_{cont}\mathcal{L}_{cont} + \lambda_{pres}\mathcal{L}_{pres} + \lambda_{curv}\mathcal{L}_{curv}
```
`λ_cont = 0.5`, `λ_pres = 2.0`, `λ_curv = 0.02`
- `L_cont`：配对重叠采样点的世界坐标位置 + 切向失配 → **闭合 patch 界面**
- `L_pres`：保持 TSDF 拟合出的高度与梯度 → **防止成对对齐漂离多视角 TSDF**
- `L_curv`：抑制振荡 → **避免把对应关系拟合成波纹**

### 术后形变：深度监督 + tracked color

**深度损失**（复用 Eq.10 的显式求交拿相机线性深度）：

```math
\mathcal{L}_{depth} = \frac{\sum_p \mathcal{M}_v \mathcal{M}^\star_v \lvert \hat{D}_v(p) - D_v(p)\rvert}{\sum_p \mathcal{M}_v \mathcal{M}^\star_v + \epsilon}
```

> **关键 trick**：该阶段不透明度被**覆写为 0.999**。否则模型会通过"把不匹配的前景 patch 变透明"来降低损失，而不是真的移动几何。

**学习率层级**（决定哪些参数主导形变）：

| 参数 | 学习率 | 角色 |
|------|--------|------|
| 中心 `c_i` | `1.6e-3 → 1.6e-5`（指数衰减） | **主导形变量** |
| 切向尺度 | `1e-3` | 主导形变量 |
| 旋转 / 高度系数 | `1e-4` | 小幅局部修正 |
| 不透明度 | `1e-8` | 实际冻结可见性 |
| 基中心与带宽 | **固定** | 保证形变中局部坐标系稳定 |

**Tracked appearance 保留**——把参考渲染的有效像素反投影并绑定到图元的局部坐标：

```math
\mathcal{Q} = \{(i_m,\ u_m,\ v_m,\ h_m,\ c^0_m)\}
```
```math
\mathcal{L}_{track} = \mathbb{E}_{m\in\mathcal{Q}} \bigl\lVert C_{cur}\bigl(\pi_v(x_m(\mathcal{G}))\bigr) - c^0_m \bigr\rVert_1
```
每个采样绑定 **8 个候选图元**，目标在图像空间聚合。

**几何/外观交替窗口**：

```math
\mathcal{L}_{depth\text{-}win} = \mathcal{L}_{depth} + \lambda_{trans}\mathcal{L}_{trans} + \lambda_{track}\mathcal{L}_{track}
```
`λ_trans = 6.0`, `λ_track = 10.0`。几何窗口在 MRI 监督下移动/重塑表面并维持局部连续性 + 弱外观锚；外观窗口**冻结几何**，只把纹理场恢复到形变后的位置。

> **动机**：同时施加深度与外观更新会得到不稳定的折中——前者必须改几何，后者抵抗渲染结果变化。分离主导效应即可。

---

## 实验结果

### 设置

- **数据**：5 例真实神经外科病例（3 术前 + 2 术后），每例连续 60–80 帧
- **硬件**：**NVIDIA RTX 3050 (4GB)** + 32GB RAM + i7-12700H ← 注意：极低功耗消费卡
- **配置**：每例 **2,400 个图元**，每图元 50 颜色基 + 20 不透明度基
- **基线**：2DGS、3D-HGS、QGS（均用作者发布的默认设置）
- **几何指标 MVDC**：多视角深度一致性（把有效深度从一视角反投影、重投影到邻视角，取深度差中位数并按场景尺度归一化）。**越低越好**。

### Table 1 — 五例定量对比

| 病例 | 方法 | PSNR↑ | SSIM↑ | LPIPS↓ | **MVDC↓** | **Size (MB)↓** | **Time (ms)↓** |
|------|------|-------|-------|--------|-----------|----------------|----------------|
| Preop 1 | **H-2DGS** | 23.84 | 0.776 | **0.218** | **4e-5** | **7.97** | 39.13 |
| Preop 1 | 2DGS | 28.54 | 0.901 | 0.109 | 7e-5 | 40.87 | **25.42** |
| Preop 1 | 3D-HGS | 28.00 | 0.887 | – | 1.18 | 32.24 | 152.81 |
| Preop 1 | QGS | **31.46** | **0.952** | – | 9e-5 | 86.04 | 120.68 |
| Preop 2 | **H-2DGS** | 23.29 | 0.810 | **0.212** | **2e-5** | **7.97** | 29.68 |
| Preop 2 | 2DGS | 27.35 | 0.906 | 0.109 | 6e-5 | 45.72 | 29.69 |
| Preop 2 | 3D-HGS | 27.46 | 0.900 | – | 1.57 | 36.39 | 178.32 |
| Preop 2 | QGS | **30.64** | **0.956** | – | 1e-4 | 107.03 | 164.09 |
| Preop 3 | **H-2DGS** | 25.20 | 0.839 | **0.161** | **1e-5** | **7.97** | 31.98 |
| Preop 3 | 2DGS | 33.33 | 0.956 | **0.048** | 3e-5 | 51.69 | **28.21** |
| Preop 3 | 3D-HGS | 31.69 | 0.941 | – | 1.41 | 36.88 | 6.16 |
| Preop 3 | QGS | **40.07** | **0.986** | – | 5e-5 | 93.64 | 152.35 |
| Postop 1 | **H-2DGS** | 21.54 | 0.745 | **0.210** | **4e-5** | **7.97** | 40.13 |

### 结果解读

**✅ 几何稳定性显著领先**
- MVDC 稳定在 `1e-5 ~ 4e-5`，比 3D-HGS（`1.18 ~ 1.57`）**低 4~5 个数量级**。
- QGS 虽然 MVDC 也不错（`5e-5 ~ 1e-4`），但要付出 **79–142 MB** 和 **120–188 ms** 的代价。

**✅ 体积效率碾压**
- 恒定 **7.97 MB**（2400 图元固定预算），vs 2DGS `40–52 MB`、3D-HGS `32–37 MB`、QGS `86–107 MB`。
- **体积优势 5–13 倍**。作者说明未对齐图元数量，因为缺乏局部纹理的体积图元本来就需要更多图元才能拟合同样的图像。

**✅ 未覆盖视角表现（论文的关键论证）**
- 在观测轨迹之外，体积或弱约束表示会**拉伸成条纹、碎裂、模糊**；H-2DGS 保持可辨识的皮层带状结构。
- 这对解剖融合至关重要：tractography 纤维是"贴在一个明确表面上"而不是"穿过一团散射的云"。

**⚠️ 光度质量明显落后（论文承认的主要缺陷）**
- Preop 3 上 PSNR `25.20` vs QGS `40.07`，**差 14.9 dB**；SSIM `0.839` vs `0.986`。
- 原因是**用薄的显式曲面替代体积支撑消除了几何歧义，但也削减了复现高频外观变化的渲染表达力**（主要损失高频高光）。
- 作者用颜色基补偿，但光度差距仍然明显。

**✅ 渲染速度**
- `29–42 ms/frame`（约 24–34 FPS），在 **RTX 3050 4GB** 上达成。
- 2DGS 略快（`25–29 ms`），但 QGS / 3D-HGS 慢 3–6 倍。
- 优化细节：共享基布局、预算的逆平方带宽、CUDA 端索引以降低光栅化开销。

---

## 局限性（作者自述）

1. **渲染保真度**：PSNR/SSIM 明显低于基线。薄显式曲面减少了表达力。未来需**既改善渲染保真度又不重新引入弥散体积不透明度**的几何保持外观模型。
2. **依赖 SfM 位姿**：管线依赖 SfM 恢复的相机位姿，其**静态场景假设**在手术视频中常被违反。有 1 例额外病例因**生理性皮层搏动**引入非刚性帧间运动，导致 SfM 把组织运动与相机运动混淆，位姿不准，进而**污染所有后续重建阶段**。
3. 建议方案：外部跟踪/标定位姿；把每个图元的几何属性表示为**时间的连续函数**；估计主搏动频率做相位感知的帧选择或运动校正。

---

## 生菜的技术评估

### 与本库已有工作的关系

| 论文 | 关注点 | 与 H-2DGS 的关系 |
|------|--------|------------------|
| **VisibilitySplat** (2610.19847) [[2026-10-14-VisibilitySplat-Ray-Traced-Occlusion-Relighting-3DGS]] | BVH + 光线追踪求 3DGS 可见性 → 解决 relighting | 同为"给 3DGS 补几何"，VisibilitySplat **保留体积**只加稀疏 oracle，H-2DGS **直接换图元类型** |
| **H2-Ray** (2610.13498) [[H2-Ray]] | 层次化光线追踪加速 3DGS | H2-Ray 仍走体积累积路线 |
| **2DGS / 3D-HGS / QGS** | 各类表面化 Gaussian 尝试 | **H-2DGS 的差异化**：先 TSDF 融合再初始化曲面 chart（而非直接从输入点云初始化） |

> **H-2DGS 的独特主张**（原文明确）：2DGS / 3D-HGS / QGS 都**直接从输入点云初始化**其设计好的图元，而在有限视角覆盖下**源几何本身就是弱约束**。H-2DGS 先集中稳健的体积重建 → 融合多视角深度成共享 TSDF → 才初始化曲面 chart。

### ⭐ 可迁移到本项目的技术点

1. **可微光线厚度惩罚（Eq.3–6）**
   与本库已收录的 Tabula Rasa (2610.11653) 属同一"控制 MC 估计统计性质"的思路，但对象是**沿射线的密度分布厚度**而非像素噪声。若需要让 3DGS 在稀疏视角下"变薄变锐"，这是一段可直接移植的损失代码。

2. **高度场图元 + Newton 求交（Eq.8–10）**
   这是**唯一给出完整可实现渲染路径**的图元定义（对比 2DGS 的 ray-splat 求交）。5 个高度基即可让 patch 跟随局部皮层曲率，比"用很多小平面逼近曲面"参数效率高得多。**值得作为自定义 surface primitive 的实现参考**。

3. **几何基维数 < 外观基维数**
   5 / 20 / 50 的基配置是一个廉价且有效的正则化先验，值得在自建图元时照搬这个比例思路。

4. **形变时的 opacity 覆写为 0.999**
   防止"通过变透明来降低损失"的经典 trick。**任何形变/对齐任务都应记住**。

5. **学习率分层 + 交替窗口**
   几何参数高 LR、外观参数低 LR；几何窗口与外观窗口交替而非同时。适用于一切"改形状但保纹理"的场景。

### 落地成本评估

| 维度 | 评估 |
|------|------|
| 算法复杂度 | **中-高**。三阶段 + TSDF 融合 + 局部二次曲面拟合 + Newton 求交光栅化器 |
| 代码工作量 | **大**。需要自研 CUDA 光栅化核（Newton 迭代求交 + 基函数求值）；Stage I/II 可复用现成 3DGS |
| 依赖项 | PyTorch + 3DGS 基线实现；自研 rasterizer；TSDF（可用 Open3D / 自写 Marching Cubes） |
| 性能预期 | 2400 图元规模在 4GB 卡上即可 30–42 ms；图元数上去后 Newton 求交成本线性增长 |
| 复用价值 | **高**——图元 + 求交 + 形变框架与医学领域无关，可直接迁移 |

---

## 行动建议

| 收件人 | 内容 | 优先级 |
|--------|------|--------|
| **墨鱼丸 (moyuwan)** | H-2DGS 的高度场图元 + Newton 求交是本库目前**唯一给出完整可实现渲染路径**的 surface primitive，建议评估移植为自定义图元类型 | **高** |
| **墨鱼丸 (moyuwan)** | 可微光线厚度惩罚（Eq.3–6）可用于让稀疏视角下的 3DGS 变锐，与本库 Tabula Rasa 同族 | **中-高** |
| **菜菜 (caicai)** | "先集中体积重建 → TSDF 融合 → 再初始化曲面"的解耦策略，是对现有 SIGGRAPH-aftermath 论文（VisibilitySplat / H2-Ray）的通用反驳框架 | 中 |
| **嫩牛肉 (nenniurou)** | 跟踪 NVIDIA/Adobe 动态表面相关工作；该文承诺开源后需入库 | 中 |

---

## 关联笔记

- [[2026-10-14-VisibilitySplat-Ray-Traced-Occlusion-Relighting-3DGS]]
- [[2026-10-15-Geometric-Queries-Tessellation-Free-Displaced-Surfaces]]
- [[2026-10-15-SUPRA-TEX-3D-Generation-Super-Aligned-Texture]]
- [[2026-10-08-Neural-Caching-Prefiltered-Radiance-Specular]]
- [[2026-10-07-Tabula-Rasa-MC-Unit-Variance-Noise]]
- [[2026-10-23-daily-search-report]]

---

**标签**: #渲染 #论文 #2026 #GaussianSplatting #surface-reconstruction #height-field #TSDF #deformation #medical-visualization #SIGGRAPH-2026