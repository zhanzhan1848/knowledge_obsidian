---
type: paper
created: 2026-10-28
updated: 2026-10-28
tags: [paper, 渲染, 纹理合成, 光流, 几何处理, 生成模型, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.36098
---

# Texture Consolidation of Generated Multi-View Renderings

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Texture Consolidation of Generated Multi-View Renderings |
| **作者** | Hongyi Liu¹, Yifan Wang², Vladimir G. Kim³, Misha Kazhdan¹ |
| **发表** | arXiv 2610.36098v1 [cs.GR]，2026-10-26 |
| **链接** | [原文](https://arxiv.org/abs/2610.36098) |
| **代码** | https://github.com/hliuw/TextureConsolidation |
| **单位** | ① Johns Hopkins University ② Adobe Research ③ Adobe Firefly Foundry |

---

## 核心贡献

> 把稀疏生成的视角渲染 + 已知相机参数 + 纹理图集网格，整合成单张全局一致的纹理图——把经典图像域技术推广到**曲面域**，并首次引入**逐 texel 置信度**。

1. **表面域纹理融合（consolidation）框架**：pipeline-agnostic 的通用后处理模块，把生成模型的几何流水线补上「多视角一致性」这一环。
2. **关键技术与机制**：
   - 置信度加权的**曲面光流**（optical flow on mesh）；
   - 置信度加权的**梯度域融合**（gradient-domain stitching）；
   - 底层支撑是**基于求积（quadrature）的有限元积分**，用以弥合「texel 分辨率的颜色/置信度」与「顶点分辨率的流场」两套离散化之间的鸿沟。
3. **实证揭示**：为真实 RGB-D 采集设计的既有配准方法（ColorMap / AdvIA / MVS-tex / Im2SurfTex）在**稀疏采样视球、几何-光度不一致**的生成数据上会明显退化；本方法在全部数据集 LPIPS 上最优，且对输入畸变最鲁棒，并可与 ColorMap 的相机位姿优化组合使用。

---

## 技术方案

### 三步流水线（Fig.2 / Alg.1）

```
{纹理图集网格 M, 渲染 {Y_i, C_i}}
   │
   ├─(1) 反投影 + 置信度 + 颜色归一化 ──► {I_i, w_i}, {I'_i}
   │
   ├─(2) 曲面光流域配准（层级多分辨率）──► 流场 {v_i}
   │        └─ 沿流场平流（advection）──► {Î'_i, ŵ_i}
   │
   └─(3) 梯度域拼接 (stitching) ──► I*  （无缝无鬼影）
```

> **Fig.3 说明三步缺一不可**：仅按置信度加权混合 → 鬼影（ghosting）；光流配准 + 混合 → 仍有色偏不连续；光流 + 梯度域拼接 → 无缝无鬼影。

### 关键技术

| 阶段 | 具体技术 | 关键细节 |
|------|------|------|
| 反投影 | 纹素 → 最近纹理三角形的重心坐标 → 三角形角点 3D 位置的重心加权平均 | 纹素落在纹理三角形内则权重为正（平均点在网格上），否则映射到网格上最近点 |
| 置信度 1：法向置信度 | `clamp(表面法向 · 相机视线方向)` | 只能识别轮廓线，无法识别「正面背景像素被反投影到前景」 |
| 置信度 2：深度置信度 | 渲染深度图 → 计算深度图 Laplacian → 缩放到标准差=1 → 阈值化找不连续边界 → 纹素到最近不连续点的距离 `D_disc` | 置信度 = `min(1, D_disc / r_dc)`，`r_dc = 20` 像素；低于 0.15 量化到 0；遮挡纹素置 0 |
| 置信度合成 | 深度置信度 × 法向置信度，低置信度量化为 0 | 可替换为模糊度/渲染质量等其它置信信号 |
| 颜色归一化 | 用置信度加权的局部均值/尺度做逐通道归一化 | 消除低频光照/饱和度差异，是光流稳定性的关键 |
| 配准 | 曲面光流（Prada et al. 2016 "Motion Graphs" 层级实现） | `L=4` 层，`β_blur=0.002`，`β_reg=0.2`(生成)/`0.1`(RGB-D)，`ε_n=0.001`；每层用模糊后的源/目标 + 递减正则化 → 先对齐低频再对齐高频 |
| 源/目标选择 | 用置信度覆盖度与重叠度决定 | 初始目标 = 重叠度最大的一对中覆盖度较大者；后续源 = 与当前目标重叠度最大者 |
| 拼接 | 全局梯度域拼接（Prada et al. 2018 纹理图集版本） | `α_gf=0.01`，`α_reg=1e-8`；`α_reg` 仅在零置信度区域起平滑作用，避免能量奇异 |
| 离散化 | 标量：顶点 hat 基 + texel 基；向量场：Liu et al. 2026 Phong-Rodrigues 外蕴基 | 网格做 1→4 平面细分至 ~20K 顶点，1024×1024 纹理 ≈ 700K 有效纹素；流场在网格分辨率，颜色/置信度在纹素分辨率；求积点数：光流 Q=12，拼接 Q=3 |

### 置信度的三处使用点

1. **反投影阶段**：法向置信度 × 深度置信度，逐纹素。
2. **光流阶段**：作为数据项的权重 `w`（数据项变为 `w · (residual)²`）；同时用于置信度加权的 Blur 求局部均值/尺度。
3. **拼接阶段**：同一权重机制作用在梯度域能量上。

**多权重归一化与缩放规则**（关键细节）：

```math
\text{conf} = 1-\prod_j (1-w_j) \in [0,1]
```

表示「该点被至少一个目标覆盖」的置信度；当所有权重为 0 时归一化后仍为 0。

---

## 公式

**曲面光流线性系统：**

```math
\big(M^{\nabla f_s} + \beta_{reg}\cdot S\big)\,\mathbf{x} = \mathbf{b}
```

```math
M^{\nabla f_s}_{ij} \equiv \int_M \langle \vec{\nu}_i, \nabla f_s\rangle \cdot \langle \vec{\nu}_j, \nabla f_s\rangle,
\qquad
S_{ij} \equiv \int_M \langle \nabla \vec{\nu}_i, \nabla \vec{\nu}_j\rangle
```

```math
\mathbf{b}_i \equiv \int_M \langle \vec{\nu}_i, \nabla f_s\rangle \cdot (f_t - f_s)
```

**梯度域（拼接）线性系统：**

```math
\big(M + \alpha_{gf}\cdot S\big)\,\mathbf{x} = \mathbf{b},
\qquad
M_{ij}\equiv\int_M \phi_i\phi_j,
\quad
S_{ij}\equiv\int_M\langle\nabla\phi_i,\nabla\phi_j\rangle,
\quad
b_i\equiv\int_M \phi_i h + \alpha_{gf}\langle\nabla\phi_i,\vec{v}\rangle
```

**求积积分（弥合两套分辨率的核心）**：在三角形 `τ={p0,p1,p2}` 上，用度规张量 `g_ij = ⟨p_i−p_0, p_j−p_0⟩` 与行列式 `|g|`，在单位直角三角形 `T={(s,t)∈[0,1]² | s+t≤1}` 上求积：

```math
\int_\tau w\,\phi_i f \approx \sqrt{|g|}\sum_{j=1}^{Q}\mu_j\, w(q_j)\,\phi_i(q_j)\, f(q_j)
```

```math
\int_\tau w\,\langle\vec{\nu}_i,\nabla f\rangle \approx \sqrt{|g|}\sum_{j=1}^{Q}\mu_j\, w(q_j)\,\langle\vec{\nu}_i(q_j), \nabla_g f(q_j)\rangle_g
```

内积 `⟨vec ν_i, ∇_g f⟩_g` 等价于切向量场与微分 `df` 的配对，与度规无关。

**增量式配准的合并公式：**

```math
I'_t \leftarrow \frac{\sum_{i\in\mathcal{R}} \mathrm{Adv}_{\vec{v}_i}(I'_i)\cdot \mathrm{Adv}_{\vec{v}_i}(w_i)}
                          {\sum_{i\in\mathcal{R}} \mathrm{Adv}_{\vec{v}_i}(w_i)},
\qquad
w_t \leftarrow \min\Big(1,\; w_t + \mathrm{Adv}_{\vec{v}_t}(w_t)\Big)
```

---

## 代码片段

```python
# 增量式配准的合并（沿流场平流后按置信度加权混合）
def merge_into_target(I_t, w_t, I_i, w_i, v_i):
    adv_I = advect(I_i, v_i)          # 沿流场平流颜色
    adv_w = advect(w_i, v_i)          # 沿流场平流置信度
    num = adv_I * adv_w
    den = adv_w
    I_t = (num + I_t * w_t) / (den + w_t + 1e-8)
    w_t = np.minimum(1.0, w_t + adv_w)
    return I_t, w_t

# 深度不连续置信度
def depth_discontinuity_confidence(depth_render, texel_to_pixel, r_dc=20.0, q=0.15):
    # 深度图 Laplacian -> 缩放到标准差=1 -> 阈值化找不连续边界
    lap = laplacian(depth_render)
    lap = (lap - lap.mean()) / (lap.std() + 1e-8)
    boundary = np.abs(lap) > 1.0
    # 每个 texel 到最近不连续边界的距离（像素）
    dist = distance_transform(~boundary)
    conf = np.minimum(1.0, dist[texel_to_pixel] / r_dc)
    conf[conf < q] = 0.0
    return conf

# 置信度合成
conf = normal_confidence * depth_confidence
conf[conf < 0.15] = 0.0
```

---

## 实验结论

- **数据集 / 场景**：生成式模型产出的多视角渲染 + 纹理图集网格；与真实 RGB-D 采集对照。
- **基线**：ColorMap、AdvIA、MVS-tex、Im2SurfTex（均为面向真实 RGB-D 采集的配准/融合方法）。
- **结果**：
  - 在**全部数据集上 LPIPS 最优**；
  - 对输入畸变（geometry-photometry inconsistency）**最鲁棒**；
  - 可与 ColorMap 的相机位姿优化**组合使用**（正交增益）。
- **消融**：三步缺一不可——仅加权混合出鬼影；光流+混合仍有色偏不连续；光流+梯度域拼接才无缝。

---

## 局限性

- 需要**已知相机参数**与**纹理图集网格**作为输入，无法独立解决相机估计（但可与 ColorMap 组合）。
- 依赖生成式渲染的**质量与一致性**作为输入——生成模型视角间不一致越严重，需要的对齐能越强。
- 增量式配准对**纹理图集**的 UV 布局敏感（接缝处理依赖图集质量）。
- 求积 + 有限元线性系统的求解成本随网格细分（~20K 顶点）与纹素数（~700K）增长。

---

## 相关工作

- [[Motion Graphs]]（Prada et al. 2016）
- [[Texture Optimization via Global Optimization]]（Prada et al. 2018）
- [[ColorMap]]
- [[AdvIA]]
- [[Phong-Rodrigues Extrinsic Basis]]

---

## 实现建议

- **实现难度**：**高**。需要有限元离散化（顶点 hat 基 + texel 基 + 外蕴向量场基）、求积积分、以及两个稀疏 SPD 线性系统求解；可复用 Prada et al. 的既有实现。
- **预期性能**：在生成式数据上全面超越面向真实 RGB-D 的配准方法；具体速度未在摘要中强调。
- **适用场景**：
  1. **生成模型资产管线**（textured mesh generation）的最后一步——把多视角生成结果烘成一致纹理；
  2. 任何「多视角渲染 → 单张一致纹理图」的需求；
  3. **三维生成模型的几何-光度一致性评估工具**（把生成的不一致定量化为 LPIPS）。
- **行动建议**：**推荐作为工具性参考**。若团队在做 3D 生成或纹理合成 pipeline，这是一篇「补最后一环」的现成方案（已开源）；若只是渲染引擎研发，其核心（曲面有限元光流）属于几何处理范畴，与实时渲染管线关系较弱。优先级：**中**。
