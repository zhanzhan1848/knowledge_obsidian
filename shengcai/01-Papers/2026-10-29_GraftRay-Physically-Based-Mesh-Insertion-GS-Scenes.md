---
type: paper
created: 2026-10-29
updated: 2026-10-29
tags: [paper, 渲染, 路径追踪, 光线追踪, 全局光照, PBR, Gaussian-Splatting, OptiX, 光传输, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.37036
---

# GraftRay: Physically Based Mesh Insertion into Gaussian Splatting Scenes via Path Tracing

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | GraftRay: Physically Based Mesh Insertion into Gaussian Splatting Scenes via Path Tracing |
| **作者** | Jinxin Ai, Matthias Niessner（Technical University of Munich） |
| **发表** | arXiv 2026-10-27（cs.CV / cs.GR），8 pages + references, 6 figures, 2 tables |
| **链接** | [原文](https://arxiv.org/abs/2610.37036) |
| **DOI** | [10.48550/arXiv.2610.37036](https://doi.org/10.48550/arXiv.2610.37036) |
| **代码** | 论文未直接给出链接（OptiX 扩展 path tracer） |

---

## 核心贡献

> 把 **Gaussian Splatting 场景本身变成可做路径追踪的光传输介质**，并用「单位辐射基图 + 截断最小二乘」从 LDR 多视图照片中反解出**空间分布的矩形面光源**，最终用**差分合成**把物体插入的阴影与间接光精确嫁接回原 3DGS 渲染。

1. **无需联合逆渲染的材质提升**：只用 2D intrinsic diffusion 模型（RGB↔X / DiffusionRenderer）从多视图渲染图估计 albedo / roughness / metallic / normal，再按可见性测试反投影到每个 2D/3D Gaussian 上，形成场景级材质属性（多视图共识 + 跨种子中位数抑制视图特异误差）。
2. **OptiX 高斯路径追踪器**：扩展 OptiX path tracer 支持带**随机透明性**的 Gaussian 原语（3σ AABB + 峰值响应求交）与 mesh 联合遍历，支持解析面光源、MIS（power heuristic）、next-event estimation、Russian roulette，积分器遵循 Mitsuba 路径积分框架。
3. **带截断观测的光源强度估计**：利用「光传输对光源辐射线性」这一性质，预计算单位辐射基图 I(L) = Σⱼ LⱼBⱼ，把发光强度估计化为 **非负最小二乘（NNLS）+ Levenberg–Marquardt**，且对饱和像素用**单边铰链惩罚**而非等式，从而区分「真实发光体」与「高反射率表面」。
4. **差分合成（differential compositing）**：用带/不带插入物体的两次路径追踪结果求比值，把阴影（<1）与间接反弹光（>1）调制到原始 3DGS 渲染上，保留原重建的视角相关细节。

---

## 技术方案

### 核心思想

把「物体插入」这个生成式/外观协调问题，**还原成一个有明确物理语义的逆光传输问题**：不调生成模型，而是解出发光体的空间几何与绝对辐射度，然后真的跑一遍光传输。

### 关键技术

| 技术 | 说明 |
|------|------|
| **高斯求交（峰值响应）** | 把射线变换到高斯局部系 `p = S⁻¹Rᵀ(o−μ)`, `q = S⁻¹Rᵀd`；最近点参数 `t* = −(p·q)/‖q‖²`，马氏距离 `m² = ‖p‖² − (p·q)²/‖q‖²`；当 `m² < 9`（3σ）时报交点，有效不透明度 `α = o·exp(−m²/2)` |
| **随机透明性（stochastic transparency）** | 硬件光追遍历顺序任意，而 alpha 合成需深度序。采用「按概率 α 接受交点」，则高斯 i 成为首个被接受原语的概率 `wᵢ = αᵢ∏(1−αⱼ)` **恰好等于 alpha 合成权重** → 无需每射线排序缓冲区，单次硬件遍历即得单样本估计 |
| **阴影射线（确定性透射率）** | 独立 ray type，不做随机采样，累乘 `(1−αᵢ)`，透射率低于 5×10⁻³ 时终止 → 在基图渲染所需 spp 下也能得到平滑软阴影 |
| **面光源初始化** | 用户用 SAM 在 1~几个视图标注窗户/灯 → 按可见性测试反投影为 3D 点集 → RANSAC（对高亮高斯加权）拟合平面 + PCA 精修 → 平面内轴对齐（墙挂）或用 PCA 轴（其他），范围由关联高斯决定，法向指向房间 |
| **单位辐射基图** | 固定几何/材质/光源位置后，光传输对辐射度线性：`I(L) = Σⱼ LⱼBⱼ`，Bⱼ 为「仅 Eⱼ 单位辐射、其余关闭」的路径追踪图（含直接+间接）；渲染 Eⱼ 自己的基图时移除 Eⱼ 附近薄层内的亮高斯，避免重建外观与解析光源重复计数 |
| **截断观测（censored obs）** | τ=0.98 区分未饱和 U_c 与已饱和 C_c；未饱和直接匹配，饱和用单边铰链 `[τ − g(BᵀL)]₊²` 只给下界，不惩罚超亮 |
| **差分合成** | `I_out = M·k·I_with + (1−M)·I_3dgs ⊙ clip(I_with/I_without, 0, 3)`；k 为背景像素上 `I_3dgs/I_without` 的中位数（曝光补偿），比值 <1 即阴影、>1 即间接光；所有合成在线性辐射域完成后再套相机响应 |
| **色度衰减** | `r ↦ r̄(r/r̄)^η`，η 控制传递反弹光颜色的强度（可选） |

---

## 公式

```math
// 高斯-射线求交（局部系）
\mathbf{p}=S^{-1}R^{\top}(\mathbf{o}-\boldsymbol{\mu}),\quad
\mathbf{q}=S^{-1}R^{\top}\mathbf{d}

t_i^{\star}=-\frac{\mathbf{p}\cdot\mathbf{q}}{\|\mathbf{q}\|^{2}},\qquad
m_i^{2}=\|\mathbf{p}\|^{2}-\frac{(\mathbf{p}\cdot\mathbf{q})^{2}}{\|\mathbf{q}\|^{2}}

// 3σ AABB + 峰值响应有效不透明度
\alpha_i=o_i\exp\left(-\tfrac{1}{2}m_i^{2}\right),\quad \text{report if } m_i^{2}<9

// 随机透明性 ⇒ 首接受原语概率 = alpha 合成权重
w_i=\Pr(K=i)=\alpha_i\prod_{j\in\mathcal{F}_i}(1-\alpha_j)

// 沿光线的合成辐射
L_{\mathrm{ray}}=\sum_i w_i\,L_{\mathrm{o}}(\mathbf{x}_i,\mathbf{v})
// L_o 用 Cook–Torrance BRDF + GGX 微表面模型

// 光传输对光源辐射的线性性 ⇒ 单位辐射基图展开
\mathbf{I}(\mathbf{L})=\sum_{j=1}^{J}L_j\mathbf{B}_j,\qquad \mathbf{L}=(L_1,\dots,J)^{\top}\geq 0

// 截断最小二乘目标（逐通道）
\min_{\mathbf{L}_c\geq 0}
\sum_{p\in\mathcal{U}_c}\left[g(\mathbf{B}_{p,c}^{\top}\mathbf{L}_c)-y_{p,c}\right]^{2}
+\sum_{p\in\mathcal{C}_c}\left[\tau-g(\mathbf{B}_{p,c}^{\top}\mathbf{L}_c)\right]_{+}^{2}

// 差分合成
\mathbf{I}_{\mathrm{out}}
= M\,k\,\mathbf{I}_{\mathrm{with}}
+(1-M)\,\mathbf{I}_{\mathrm{3dgs}}\odot
\operatorname{clip}\!\left(\frac{\mathbf{I}_{\mathrm{with}}}{\mathbf{I}_{\mathrm{without}}},0,c\right)
```

---

## 代码片段

```cpp
// OptiX any-hit program：随机透明性接受（概念伪码）
__global__ void any_hit() {
    unsigned int pid = optixLaunchAttribute();
    unsigned int g   = gaussians[pid];
    float m2 = mahalanobis2_to_gaussian(g, ray);   // 局部系马氏距离平方
    if (m2 >= 9.0f) return;                        // 3σ AABB 外
    float alpha = g.opacity * __expf(-0.5f * m2);
    // 以概率 alpha 接受该交点 → 首接受概率恰等于 alpha 合成权重
    if (curand_uniform(&rng) < alpha) {
        optixAcceptIntersection();
        shadePayload(g);
    }
    // 否则隐式拒绝，硬件继续遍历
}

// Shadow ray：确定性透射率累乘
__global__ void shadow_any_hit() {
    unsigned int pid = optixLaunchAttribute();
    float m2 = mahalanobis2_to_gaussian(gaussians[pid], ray);
    if (m2 >= 9.0f) return;
    float alpha = gaussians[pid].opacity * __expf(-0.5f * m2);
    shadowPayload.transmittance *= (1.0f - alpha);
    if (shadowPayload.transmittance < 5e-3f) optixTerminateRay(); // 早停
}
```

---

## 实验结论

- **数据集**: 合成场景（FIPT 4 个房间 + NFINITE 2 个场景，有 path-traced GT）、真实拍摄（FIPT-Real 2 个 + ScanNet++ 5 个）、生成场景（SpAItial 平台 5 个）。物体/位置/灯光对所有方法统一，每场景 3 视图。
- **基线**: GS-IR、GI-GS、IRGS、EAG-PT、GaSLight、MV-CoLight、LumiTokens；指标 ΔPSNR（插入前后变化 vs GT 变化）、mask PSNR、shadow IoU、shadow RMSE（合成场景），无 GT 时用 LightHarmony3D 的 VQAScore 比值。
- **结果**:
  - FIPT / NFINITE 上总体 SOTA，**阴影重建提升最显著**；inverse rendering 类基线虽物理合理但缺乏近场光源空间位置，阴影不准。
  - 材质恢复：本文 albedo 对齐后比 GS-IR / GI-GS **高 6–8 dB**（本文 19.9 dB）；EAG-PT 20.2 dB 但只恢复漫反射 albedo（无 roughness/metallic）。
  - **近场面光源是关键**：用点光源或环境贴图替代矩形面光源，ΔPSNR 掉 **8–9 dB**，shadow IoU 掉约 1/3。
  - **多跳传输**：仅直接光过暗（25.7 dB）；每加一跳都有增益，4 跳已与完整追踪相差 ≤1.4 dB。
  - **双向交互**：去掉物体向房间的反弹光后，shadow IoU 掉到 0.58 或 0。
  - **材质与合成**：用灰 albedo 替代材质先验，mask PSNR 减半（15.6 dB）；直接用完整 path-traced 帧而非差分合成，ΔPSNR 掉到 24.8 dB（重渲染继承缺失镜面反射等误差，差分合成可抵消）。
  - **对发光体几何鲁棒**：窗口尺寸 ×0.8–1.5、位移 ≤20 cm，ΔPSNR 最多损失 1.3 dB，shadow IoU 保持 0.80。
- **性能**: 全部步骤在**单张 RTX 3090** 上完成。FIPT bedroom：重建 22 min，DiffusionRenderer 先验 1.5 h/seed，反投影 6 min，辐射度拟合 3.5 min。插入物体到单个 1024×576 视图需 **1.6 min**（两次 256 spp 路径追踪 + 差分合成）。对比 EAG-PT（同样做路径追踪）在其 1024 spp 下需 14.4 min/帧 → **等采样下快约 12×**。

---

## 局限性

1. **光源需人工标注**：用户必须用 SAM 在一个或少数视图里标出窗户和灯（只需粗略 mask，但仍是人工步骤）。
2. **依赖先验**：albedo / roughness / metallic / normal 来自 2D 估计器（RGB↔X 或 DiffusionRenderer），先验误差会传导到拟合出的光源与插入结果。
3. **metallic 通道溢出**到漫反射表面（Fig. 5）。
4. 依赖 OptiX 硬件光追与 Rtx 3090 级算力；2D/3D 高斯需能映射为 3σ AABB。

---

## 相关工作

- [[2026-10-26_HyperDrone-HyperLux-RayTracing-Engine]] — 同样基于 OptiX/Vulkan/Metal 的光追引擎工程
- [[2026-10-26_Ray-by-Ray-GPU-Ray-Tracing-Resource-Management]] — GPU 光追单元资源管理
- [[2026-10-26_RADIANT-Object-Centric-Feed-Forward-Global-Illumination]] — 前馈全局光照
- [[2026-10-15_Geometric-Queries-Tessellation-Free-Displaced-Surfaces]] — 无 tessellation 直接光追
- ComGS / EAG-PT / AEGIR / 3DGRT / GHPT — 高斯光追与逆渲染谱系

---

## 实现建议

- **实现难度**: **高**。需要 OptiX 自定义几何（高斯 AABB）+ any-hit 随机接受 + 独立 shadow ray type + 确定性透射率累乘；再叠加 2D diffusion 先验、NNLS+LM 求解器、差分合成。
- **预期性能**: 单视图 1024×576 @ 256 spp 约 1.6 min（RTX 3090）；等采样下比同为路径追踪的基线快 ~12×。
- **适用场景**:
  - 室内场景的**虚拟物体插入**（AR、内容创作、合成数据生成）
  - 需要**几何一致阴影 + 间接反弹光**的合成（而非外观协调）
  - 已有 3DGS/2DGS 重建 + LDR 多视图照片的场景
- **落地建议（给墨鱼丸）**:
  1. 最小可交付版本：先实现 **OptiX 高斯自定义原语 + 随机透明性 + 阴影射线**，只用**单个点光/单个矩形光**做插值，验证「光追高斯场景」这条链路跑通。
  2. 第二步加 **单位辐射基图 + 截断 NNLS**：注意这是**线性问题**（线性域下直接 NNLS），只有相机响应 sRGB/EMoR 才引入非线性。
  3. 第三步加 **差分合成**：这一步是「保留原 3DGS 视角相关细节」的关键，性价比最高——即使光追部分不完美，差分比值仍能修正阴影。
  4. 复用点：**stochastic transparency 让「首接受概率 = alpha 合成权重」** 这个结论可直接迁移到任何「硬件遍历顺序任意 + 需要 alpha 合成」的渲染器，是很值得记住的通用技巧。
