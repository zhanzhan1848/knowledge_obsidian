---
type: paper
created: 2026-10-15
updated: 2026-10-15
tags: [paper, ray-tracing, BVH, PBR, real-time-rendering, inverse-rendering, 3DGS, relighting, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.19847
---

# VisibilitySplat: Ray-Traced Occlusion for Relighting with 3D Gaussian Splatting

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | VisibilitySplat: Ray-Traced Occlusion for Relighting with 3D Gaussian Splatting |
| **作者** | Sven Kluge, Oliver Staadt (University of Rostock) |
| **发表** | WSCG 2026 (arXiv cs.GR/CV 2026-10-14) |
| **链接** | [原文](https://arxiv.org/abs/2610.19847) |
| **DOI** | https://doi.org/10.48550/arXiv.2610.19847 |
| **代码** | 未公开（论文未提供项目页/代码链接） |

---

## 核心贡献

> 在 3DGS 光栅化渲染管线之外，挂载一个 **稀疏 BVH 点光线追踪可见性预言机**，仅在 inverse rendering 优化目标中查询 transmittance-weighted occlusion，从而解开 material ↔ illumination 的纠缠。

1. **稀疏 BVH 可见性预言机** — 仅在 inverse-rendering 训练目标里按采样光照方向查询，避免把整个渲染管线换成 ray tracing；保留 3DGS 训练/可视化生态。
2. **Disney principled BRDF (固定 F₀=0.04, 无金属度)** — 减小 inverse 问题自由度；使用 HDR equirectangular environment map 直接优化光照。
3. **直接、显式可见性基线** — 不依赖学习到的近似 visibility field，作为 "explicit visibility oracle" 提供量化的分解质量参考。
4. **点光线追踪代理 mesh** — 每个 Gaussian 包在一个各向异性缩放的 icosahedron 中，proxy scale 与 α、Σ 联合收紧 (受 3DGRT 启发)。

---

## 技术方案

### 核心思想

3DGS 渲染管线在逆渲染（IR）上的主要痛点：**screen-space alpha compositing 提供不了 cast shadows / mutual occlusion** → material 与 illumination 解耦欠约束。

解决思路：**不替换 rasterizer，只外挂 visibility oracle**。
- Stage 1：标准 3DGS pretrain（30k iter, ~15 min, RTX A6000）
- Stage 2：附加 PBR + BVH ray tracing，固定 Gaussian 几何，分解 material & environment（400 iter, ~10 min）

### 关键技术

| 技术 | 说明 |
|------|------|
| **BVH (OptiX)** | 每个 Gaussian 用各向异性 icosahedron proxy mesh 嵌入 BVH，scale 联合 α、Σ 计算 |
| **点光线追踪** | 从 expected-depth map 反推的 3D 点出发，沿采样光照方向发射 ray |
| **Hemisphere sampling** | 沿 normal 半球采样（替代全球面），候选方向 512 → ray 数减半 |
| **Transmittance weighting** | 沿射线累加 (1 - αᵢ) 求 visibility V ∈ [0, 1] |
| **PBR shading** | Disney BRDF (D·G·F) + 固定 dielectric F₀=0.04；no metallic |
| **HDR envmap 16×32** | equirectangular，低分辨率紧凑参数化；直接优化 |
| **Per-Gaussian normal** | 可学习单位法向，期望深度图作为伪法向监督 |

### 性能基准

| 指标 | 数值 | 备注 |
|------|------|------|
| Stage 1 时间 | ~15 min | 30k iter on RTX A6000 |
| Stage 2 时间 | ~10 min | 400 iter |
| OptiX visibility pass | ~436 ms | 16×32 envmap, 半球采样 |
| Throughput | ~127 MRays/s | 800×800 evaluation resolution |
| Stage 2 iteration | ~1.25 s/it | 总优化步时长 |
| Final PBR relighting | ~0.83 s/image | 55% 可见性 + 44% BRDF/envmap |
| 实时性 | ❌ 非实时 | 当前仅离线 relighting |

---

## 公式

### 渲染方程 (Image Formation)

```math
L_o(\mathbf{x}, \omega_o) = \int_{\Omega} f_r(\mathbf{x}, \omega_i, \omega_o)\, L_i(\mathbf{x}, \omega_i)\, V(\mathbf{x}, \omega_i)\, (\mathbf{n} \cdot \omega_i)\, d\omega_i
```

### Specular BRDF (Disney 微表面模型, 固定 F₀=0.04)

```math
f_{spec} = \frac{D(\mathbf{h})\, G(\omega_i, \omega_o)\, F(\omega_o \cdot \mathbf{h}; F_0 = 0.04)}{4 (\mathbf{n} \cdot \omega_i) (\mathbf{n} \cdot \omega_o)}
```

### Depth (Expected Depth, 3DGS 几何信号)

```math
z_E = \frac{\sum_{i \in \mathbb{N}} w_i z_i}{W},\quad W = \sum_{i \in \mathbb{N}} w_i,\quad w_i = T_i g_i \alpha_i
```

### Normal (Learnable, Per-Gaussian)

```math
\tilde{n} = \frac{\sum^N_{i=1} w_i n_i}{\sum^N_{i=1} w_i + \epsilon_n},\quad \hat{n} = \frac{\tilde{n}}{\|\tilde{n}\|_2 + \epsilon_n}
```

### Loss

```math
\mathcal{L}_n = \mathcal{L}_{n-p} + \lambda_{n\text{-}TV}\, TV_{normal}
```

---

## 代码片段

论文未提供代码。从 OptiX/GSplat 集成推断的伪代码：

```cpp
// Visibility oracle — 每次优化 step 调用一次
// 输入：当前 Gaussian 集合 + HDR envmap
// 输出：每个 Gaussian 的 V(x, ωᵢ) ∈ [0, 1]

void VisibilityOracle::query(
    const std::vector<Gaussian>& gaussians,
    const HDREnvMap& envmap,
    torch::Tensor& visibility_out) {

    // 1. 构建 BVH (用 OptiX)
    OptiXTraversable bvh = build_bvh_from_proxies(gaussians);

    // 2. 从 expected depth 重建 3D 点
    auto points3d = backproject_depth(depth_map, camera);

    // 3. 半球采样光线方向
    auto directions = hemisphere_sample(envmap.size_h, envmap.size_w, normal);

    // 4. ray tracing 收集 transmittance
    //    每个 ray 累加 (1 - αᵢ)
    OptiXRay ray{origin, dir, tmin, tmax};
    float transmittance = trace_ray(bvh, ray, gaussians);

    visibility_out[i] = transmittance;
}

// 与 3DGS rasterizer 的分工：
// - rasterizer:    NVS 训练/可视化（保留 GS 原生性能）
// - ray tracer:    IR loss 中的 visibility 项（稀疏调用）
```

```python
# Stage 2 训练 loop (伪代码, 基于 GSplat)
for iteration in range(400):
    # 标准 3DGS rasterization — 出 NVS color & expected depth
    nvs_color, depth, weights = rasterize(view, gaussians)

    # 稀疏 visibility oracle — 仅用于 IR loss
    points3d = backproject_depth(depth, view)
    directions = hemisphere_sample(envmap_h=16, envmap_w=32)
    V = visibility_oracle(points3d, directions, gaussians)  # BVH+OptiX

    # PBR shading & IR losses
    L_pbr = pbr_shading(normals, materials, envmap, V)
    L_albedo = l1(L_pbr.albedo, gt_albedo)
    L_normal = normal_loss(normals, pseudo_normals_from_depth)
    L_nvs = l1(nvs_color, gt_image)

    loss = L_nvs + λ1 * L_albedo + λ2 * L_normal + λ3 * L_pbr
    loss.backward()
```

---

## 实验结论

- **数据集**: TensoIR synthetic dataset (4 scenes: Lego, Armadillo, Ficus, Hotdog)
- **基线**: NeRF (NeRFactor, TensoIR, Ref-NeRF), 3DGS (GS-IR, GIR, GS-IR++, GaussianShader, Ref-Gaussian, RNG, BiGS, GI-GS, IRGS)
- **结果**:
  - 在 NVS PSNR、albedo 重建、relighting 上**优于多个早期基线**
  - **IRGS 仍是 SOTA**；VisibilitySplat 定位于 explicit visibility 参考基线
  - PBR-only (无 visibility oracle) 在 NVS 上外观拟合得分更高，但 relighting/分解质量更差
- **Ablations**:
  - Reintroducing visibility → 提升 relighting 指标 + 更干净的阴影
  - 误差主要源于**表面重建缺陷**（法向不准），而非 ray tracer 不稳定

---

## 局限性

| 项 | 说明 |
|----|------|
| 实时性 | PBR relighting ~0.83s/image (RTX A6000, 800×800)，**非实时** |
| 性能瓶颈 | 55% 可见性查询 + 44% BRDF/envmap 积分 → 两端加速后才有可能实时 |
| 几何精度 | 法向误差是主要误差源；curved shadow boundaries / 局部 relighting 伪影 |
| 多 bounce | 仅 transmittance（直接光照 visibility），不显式建模 indirect |
| 视场依赖 | 仍是离线 IR 流程，不能做 interactive preview |
| 开源 | ❌ 无代码发布，论文未附 project page |
| 工程复用 | 需要 OptiX + GSplat 集成能力 |

---

## 相关工作 (本知识库内)

- [[2026-10-12-H2-Ray-Hybrid-Ray-Tracing-3DGS]] — 同周（Oct 9）发表，从**架构层**优化 3DGS ray tracing (LB-SBVH + RCPR + UIE)
- [[2026-10-12-Confidence-Aware-Densification-3DGS]] — 3DGS-MCMC 优化路径
- [[2026-10-12-SplatQ-Pruning-3DGS-Quadratic-Selection]] — 3DGS 剪枝
- [[2026-10-09-NEF-Real-time-Pre-integrated-Neural-Emitters]] — 实时光源表示
- [[2026-09-02_PBR-Forecast-Copper]] — PBR 材质预测
- [[2026-06-03_Decoupling-Appearance-Geometry-in-Gaussian-Splatting]] — 外观/几何解耦

### 同期 arXiv 同主题

| 论文 | 方向 | 区别 |
|------|------|------|
| **H2-Ray** (Oct 9) | 3DGS RT 架构加速 (RTX A5000 RT Core) | 关注次级光照硬件优化 |
| **VisibilitySplat** (Oct 14) | 3DGS 稀疏 visibility oracle | 关注 inverse rendering 分解 |

---

## 实现建议

- **实现难度**: ⭐⭐⭐ (中)
  - 已有 3DGS / GSplat 基础 → 主要工程量在 OptiX BVH 构建 + proxy mesh 生成
  - BRDF + envmap 优化属于常规 IR 工程
- **预期性能**: 
  - Stage 2 训练：~10 min/场景
  - 推理：~0.83 s/image (离线)
  - **不可直接实时**，需要软硬件协同加速
- **适用场景**:
  - ✅ 离线 relighting 流水线（电影/VFX 预分解）
  - ✅ 学术 reference baseline（explicit vs implicit visibility）
  - ✅ 3DGS 生态兼容性敏感的项目
- **优先级**: 中-高
  - 与 H2-Ray 互补 (一个架构优化、一个 IR 应用)
  - 与 IRGS (SOTA) 对比可作为参考实现
- **行动**: 传递给 @墨鱼丸 (moyuwan)
  1. 评估在我们 IR 管线中集成 OptiX 可见性查询的成本
  2. 对比 IRGS 与 VisibilitySplat 的 visibility 实现差异（隐式场 vs 显式 BVH）
  3. 探索将 VisibilitySplat 思路应用于神经缓存/路径追踪中的 visibility 估计

原始链接: https://arxiv.org/abs/2610.19847