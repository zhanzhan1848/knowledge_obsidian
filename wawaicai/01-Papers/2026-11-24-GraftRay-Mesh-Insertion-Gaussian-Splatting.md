---
type: paper
created: 2026-11-24
updated: 2026-11-24
tags: [paper, 高斯泼溅, 网格, 逆向渲染, 路径追踪, 物理一致, 室内场景]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2610.37036
---

# GraftRay: Physically Based Mesh Insertion into Gaussian Splatting Scenes via Path Tracing

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | GraftRay: Physically Based Mesh Insertion into Gaussian Splatting Scenes via Path Tracing |
| **作者** | Jinxin Ai, Matthias Nießner |
| **发表** | arXiv cs.GR (v3, 2026-11-24) |
| **链接** | [原文](https://arxiv.org/abs/2610.37036) |
| **DOI** | — |
| **代码** | 未公开 |

---

## 核心贡献

> 在 2DGS/3DGS 场景中插入网格物体时，通过"反投影外观 + 解析面光源 + 路径追踪"实现**物理一致**的光照交互（阴影、互反射）。

1. **外观提升（appearance lifting）**：把扩散模型 2D 先验中的 albedo、roughness、metallic 与法线**反投影**到高斯（Gaussians）上。
2. **解析面光源建模**：把窗户与灯具建模为**解析面积发射器（analytic area emitters）**。
3. **从 LDR 图像恢复绝对辐射度**：在单位辐射度基（unit-radiance bases）上做**低维拟合**，恢复光源的绝对亮度。
4. **高斯+网格混合路径追踪**：产生视角一致的着色、互反射与软阴影，再通过**微分渲染（differential rendering）**合成到原重建上，**保留未触碰的背景**。

---

## 技术方案

### 核心思想

3DGS 场景重建质量高但**缺乏物理材质**，因此往场景里"嫁接"（graft）一个网格物体时，通常做法是给网格一个简单的 albedo 贴图 → 阴影、间接光都不对，视觉上明显"贴上去"。

GraftRay 的做法是**让整个场景进入物理渲染管线**：

$$
\underbrace{\text{2D diffusion priors}}_{\text{albedo, roughness, metallic, normal}}
\xrightarrow{\text{back-projection}}
\underbrace{\text{Gaussians with material}}_{\text{3DGS}}
\;\;\text{+}\;\;
\underbrace{\text{mesh}}_{\text{inserted object}}
\xrightarrow{\text{path tracing}}
\text{view-consistent shading + interreflection + soft shadows}
\xrightarrow{\text{diff. rendering}}
\text{composite onto original reconstruction}
$$

**为什么路径追踪是关键**：只有路径追踪才能正确处理
- 网格投到高斯上的**软阴影**（面积光源 → penumbra）；
- 网格与高斯之间的**互反射**（间接光）；
- 多次弹射的**全局光照**。

**绝对辐射度的恢复**：仅从 LDR 图像无法直接得到光源的绝对亮度（曝光未知）。作者用**低维单位辐射度基**做拟合——即假设光源形状已知、只拟合强度标量（低维），从而在曝光未知的情况下仍能恢复合理的绝对辐射度。

**微分渲染合成**：最终图像 = 原始 3DGS 重建 + 路径追踪产生的增量（网格相关的那部分），用 differential rendering 只替换被网格影响的像素，从而保留背景的高保真度（3DGS 重建本身往往比路径追踪的间接光更锐利）。

### 关键技术

| 技术 | 说明 |
|------|------|
| **2D 先验反投影** | 用扩散模型（albedo / roughness / metallic / normal 估计）反投影到 3DGS 位置与协方差，得到 per-Gaussian 材质 |
| **解析面积发射器** | 窗户、灯具建模为面积光源 → 软阴影；比点光源更物理 |
| **单位辐射度基 + 低维拟合** | 已知光源几何、拟合强度，解决 LDR → 绝对辐射度的病态性 |
| **混合路径追踪（Gaussians + Mesh）** | 统一在路径追踪器中处理两种基元，材质一致 → 互反射正确 |
| **微分渲染合成** | 只把网格影响区域的增量叠加回原重建，背景零损失 |
| **法线提升** | 从 2D 先验的 normal 反投影，纠正 3DGS 球形高斯的光滑法线 → 阴影边缘更锐利 |

### 关键公式

微分渲染合成：

$$
I_{\text{final}} = I_{\text{3DGS}} + \big( I_{\text{path}} - I_{\text{path, no-mesh}} \big)
$$

即"有网格"与"无网格"两次路径追踪之差，只保留网格造成的改变量。

光源辐射度恢复（低维拟合）：

$$
\min_{\alpha} \; \big\| I_{\text{LDR}} - \mathcal{P}(\text{Render}(\alpha \cdot L_{\text{unit}})) \big\|^2
$$

路径追踪的渲染方程（单次散射段）：

$$
L_o(x, \omega_o) = L_e(x, \omega_o) + \int_{S} f_r(x, \omega_i, \omega_o) \, L_i(x, \omega_i) \, (\omega_i \cdot n)\, d\omega_i
$$

---

## 代码片段

```python
# 概念性伪代码：GraftRay 流程
def graft_ray(gaussians, mesh, lights_ldr_images):
    # 1) 2D 先验反投影：albedo / roughness / metallic / normal
    material = backproject_priors(gaussians, priors_2d)

    # 2) 解析面积发射器（窗、灯）
    emitters = build_area_emitters(scene, known_geometry=True)

    # 3) 低维拟合恢复绝对辐射度
    scale = fit_radiance_scale(render=path_trace,
                               material=material, emitters=emitters,
                               observations=lights_ldr_images, param_dim=1)

    # 4) 带网格的路径追踪（含互反射与软阴影）
    with_mesh = path_trace(gaussians + mesh, material, emitters, scale)

    # 5) 微分渲染合成
    no_mesh = path_trace(gaussians, material, emitters, scale)
    delta = with_mesh - no_mesh
    return composite_onto_original(I_3dgs, delta, mask=mesh_affected)
```

---

## 实验结论

- **数据**：合成场景、真实场景、生成场景
- **基线**：近期的插入（insertion）与逆向渲染（inverse-rendering）方法
- **结果**：
  - 图像保真度与**阴影精度**均优于基线；
  - 计算成本具有竞争力（competitive cost）；
  - **用户研究**显示其光照与阴影效果优于基线。

---

## 局限性

- 需要**已知光源几何**（窗户/灯具位置）作为解析面光源的先验；
- 绝对辐射度恢复依赖"光源形状已知 + 强度低维"的假设；复杂/多色光源下退化；
- 路径追踪比 3DGS 渲染慢很多（虽然只对增量做，但仍是主要开销）；
- 2D 先验质量直接决定材质质量；扩散模型先验对镜面/金属材质不可靠；
- 代码未开源。

---

## 相关工作

- [[Gaussian-Splatting]] · [[Inverse-Rendering]] · [[Path-Tracing]] · [[Differential-Rendering]]
- [[Mesh-Insertion]] · [[Neural-Prior]] · [[Diffusion-Prior]] · [[Relighting]]
- [[Area-Light]] · [[Global-Illumination]] · [[Normal-Field]]

---

## 实现建议

- **实现难度**：高（需完整路径追踪器 + 3DGS 材质化 + 微分渲染合成）
- **预期性能**：路径追踪为主要瓶颈（每帧数十至数百 spp）；增量合成可局部化，但间接光需要全局采样
- **适用场景**：室内场景重建的资产编辑（把新家具/网格"嫁接"进 3DGS 场景）、虚拟装修、场景资产合成
- **落地建议**：几何处理侧最有价值的是**从 2D 先验反投影 normal 到网格/高斯**这一步——它可以直接提升 3DGS 场景中网格的法线质量，作为独立的网格法线精化模块使用；不建议直接实现整套路径追踪管线

## 开源参考

- 3DGS: `graphdeco-inria/gaussian-splatting`（参考材质化扩展）
- 路径追踪: `mitsuba-renderer/mitsuba3`（多场景光线追踪）或 `google-research/google-research` 的 ReSTIR
- 微分渲染: nvdiffrast (`NVlabs/nvdiffrast`) 的 differential rendering 模式
- 2D 先验: `TencentARC/PhotoMaker` 类材质扩散先验 / `apple/ml-stable-diffusion` 微调管线
