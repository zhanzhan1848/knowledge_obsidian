---
type: paper
created: 2026-10-29
updated: 2026-10-29
tags: [paper, 渲染, 光栅化, Gaussian-Splatting, 表面元, 新型图元, 效率优化, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.37668
---

# Honeycomb-Surfels: Compact Hexagonal Primitives for Efficient Scene Rendering and Reconstruction

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Honeycomb-Surfels: Compact Hexagonal Primitives for Efficient Scene Rendering and Reconstruction |
| **作者** | Prakhar Kaushik, Soumava Paul, Alan Yuille（Johns Hopkins University） |
| **发表** | arXiv 2026-10-27（cs.CV / cs.AI / cs.GR / cs.LG） |
| **链接** | [原文](https://arxiv.org/abs/2610.37668) |
| **DOI** | [10.48550/arXiv.2610.37668](https://doi.org/10.48550/arXiv.2610.37668) |
| **代码** | [honeycomb-surfels/hexels](https://github.com/honeycomb-surfels/hexels) · [项目页](https://honeycomb-surfels.github.io/) |

---

## 核心贡献

> 用**六边形平面图元（Hexel）** 替代 2DGS 的高斯 surfel：六边形支撑域在同等周长下覆盖面积最大（无缝隙铺砌），叠加**一阶局部颜色场**，让**单个图元**就能表达一块大区域的平滑外观变化，从而在不增加纹理/神经解码器的前提下同时改善质量、内存、VRAM、FPS 四个维度。

1. **紧凑自包含的 Hexel 图元**：六边形支撑 + 一阶空间颜色场，**V1 变体每个图元仅 20 个参数**（对比 2DGS 图元 58 个），V2 加线性视角相关残差共 29 个，无纹理图、无特征网格、无神经解码器、无 baking。
2. **质量-效率 Pareto 前沿大幅推进**：在**图元数匹配**下比 2DGS 高 2.08–4.74 dB，同时**学习存储少 2×**、峰值训练 VRAM 少至多 **7×**、渲染吞吐快至多 **2.31×**；在**模型内存匹配**下 PSNR 高 **4.53–7.38 dB**，峰值训练 VRAM 少至多 3.6×，渲染快至多 1.87×。
3. **一个图元家族覆盖三类任务**：同一 Hexel 表述同时用于 3D 新视角合成、3D 表面重建、2D 图像表示（无需改底层图元）；在 2D 图像上 PSNR 从 Image-GS 的 33.16 → **35.82 dB**，LPIPS 从 0.1372 → **0.0924**，训练时间 238.40 s → 157.07 s。

---

## 技术方案

### 核心思想

自然图像与场景是**高度结构化**的：大部分区域局部近似平面、外观平滑变化。3DGS / 2DGS / Triangle Splatting 的共同问题是「每个图元只能表达一个（视角相关的）颜色」，要表达一块平滑区域就必须堆大量重叠图元 → 大量 overdraw + 高存储 + 高 VRAM。

Hexels 的做法：**把结构冗余直接编码进图元几何**——
- 几何上：六边形比三角形/正方形**覆盖面积效率更高**（蜂窝定理），因此单个图元能覆盖更大连续区域；
- 外观上：一阶局部颜色场让单个图元内部就能表达平滑梯度，而不是靠多图元叠加逼近。

结果：**更少的图元 → 更少的 overdraw → 更快 + 更省内存 + 更好质量**，三赢而非取舍。

### 关键技术

| 技术 | 说明 |
|------|------|
| **局部坐标映射** | 图元中心 `pᵢ∈ℝ³` + 两个正交单位切向 `t_u, t_v` + 切向尺度 `s_u, s_v`；`Pᵢ(u,v) = pᵢ + s_u·t_u·u + s_v·t_v·v`；切向由归一化四元数得到，法向 `nᵢ = t_u × t_v` |
| **六边形支撑（软边界）** | 局部平面上的规范六边形距离场 `d(u,v) = max{|v|, |(√3/2)u + (1/2)v|, |(√3/2)u − (1/2)v|} − 1`；`d<0` 在内部、`d=0` 为边界；软化后 `Kᵢ(u,v) = σ(−βᵢ·d(u,v))`，`βᵢ` 控制边界锐度且保持 `Kᵢ=1/2` 等值线不变 |
| **一阶空间颜色场** | `cᵢ^sp(u,v) = c₀,ᵢ + u·g_u,ᵢ + v·g_v,ᵢ`，即中心基色 + 沿两个局部坐标的 RGB 梯度；视角无关（V1） |
| **视角相关变体** | V2 加线性残差 `rᵢ(dᵢ) = Aᵢdᵢ`（`dᵢ` 为相机中心到图元中心的归一化方向），共 29 参数；V3 可替换为三次球谐 |
| **光栅化与合成** | 完全沿用 2DGS：**透视校正 ray–plane 求交**恢复 `(uᵢ,vᵢ)`，按深度序前后合成；`αᵢ = min{oᵢ·Kᵢ(uᵢ,vᵢ), 0.99}`，颜色在 `(uᵢ,vᵢ)` 处由局部颜色场求值 → **仅替换高斯权重，合成逻辑不变** |
| **训练** | Adam + 光度损失 `ℒ = (1−λ)‖Î−I‖₁ + λ(1−SSIM(Î,I))`；初始化自稀疏 COLMAP 点（部分设定用 MVS 重建）；无约束训练时用标准 densify/prune（大位置梯度 → clone/split，新 Hexel 在父图元切平面内初始化） |
| **2D 图像模式** | 图像平面内的 Hexel：`uᵢ = Sᵢ⁻¹R(θᵢ)ᵀ(mᵢ−x)`，`wᵢ(x) = σ(−βᵢd(uᵢ))`；每像素保留所在 tile 中权重最大的 K=10 个 Hexel，加权平均 `c(x) = Σwᵢcᵢ / (Σwᵢ+ε)`，`ε=10⁻⁴` |
| **推理** | 预计算相机无关量，使用**仅 RGB 光栅器**；深度序与合成与训练渲染器一致 |

---

## 公式

```math
// 局部坐标 → 世界坐标
P_i(u,v)=\mathbf{p}_i+s_{u,i}\mathbf{t}_{u,i}u+s_{v,i}\mathbf{t}_{v,i}v,
// \mathbf{n}_i = \mathbf{t}_{u,i}\times\mathbf{t}_{v,i}

// 规范六边形距离场（d=0 为边界，d<0 在内部）
d(u,v)=\max\Big\{|v|,\ \big|\tfrac{\sqrt{3}}{2}u+\tfrac{1}{2}v\big|,\ 
\big|\tfrac{\sqrt{3}}{2}u-\tfrac{1}{2}v\big|\Big\}-1

// 软化支撑（σ 为 sigmoid，β 控制边缘锐度）
K_i(u,v)=\sigma(-\beta_i d(u,v)),\qquad \sigma(a)=\frac{1}{1+e^{-a}}

// 一阶空间颜色场（V1，20 参数/图元）
\mathbf{c}_i^{\mathrm{sp}}(u,v)=\mathbf{c}_{0,i}+u\,\mathbf{g}_{u,i}+v\,\mathbf{g}_{v,i}

// 视角相关残差（V2，29 参数/图元）
\mathbf{r}_i(\mathbf{d}_i)=A_i\mathbf{d}_i

// 光栅化 alpha
\alpha_i=\min\{o_i K_i(u_i,v_i),\,0.99\}

// 2D 图像模式：局部坐标 + 加权平均
\mathbf{u}_i=S_i^{-1}R(\theta_i)^{\top}(\mathbf{m}_i-\mathbf{x}),\qquad
w_i(\mathbf{x})=\sigma(-\beta_i d(\mathbf{u}_i))
\mathbf{c}(\mathbf{x})=\frac{\sum_{i\in\mathcal{S}_K(\mathbf{x})}w_i(\mathbf{x})\mathbf{c}_i(\mathbf{x})}
{\sum_{i\in\mathcal{S}_K(\mathbf{x})}w_i(\mathbf{x})+\epsilon},\quad \epsilon=10^{-4}
```

---

## 代码片段

```glsl
// 伪 GLSL：六边形软支撑 + 一阶颜色场求值（片元着色阶段）
// d 为规范六边形距离场，beta 控制边界锐度
float hex_support(vec2 uv, float beta) {
    float d = max({abs(uv.y),
                   abs(0.8660254 * uv.x + 0.5 * uv.y),
                   abs(0.8660254 * uv.x - 0.5 * uv.y)}) - 1.0;
    return 1.0 / (1.0 + exp(-beta * d));   // σ(-β d)
}

// 一阶局部颜色场：c0 + u*g_u + v*g_v
vec3 hex_color(vec2 uv, vec3 c0, vec3 gu, vec3 gv) {
    return c0 + uv.x * gu + uv.y * gv;
}

// 合成：alpha 截断 0.99，与 2DGS 合成链完全一致
float a = min(opacity * hex_support(uv, beta), 0.99);
```

---

## 实验结论

- **数据集**: Mip-NeRF360（9 场景）、DTU（15 扫描）、Tanks and Temples（10 场景）；2D 部分用 Image-GS benchmark（45 张 2048×2048 图）。共 34 个 3D 场景 + 45 张 2D 图。
- **基线**: 3DGS、3D Convex Splatting、BBSplat、Nexels、2DGS、Triangle Splatting、MeshSplatting、Image-GS。
- **结果**:
  - **模型内存匹配**：Hexels 比 2DGS **+4.53 ~ 7.38 dB** PSNR，峰值训练 VRAM 少至多 **3.6×**；比 Triangle Splatting **+1.70 ~ 2.90 dB**，FPS 高至多 **1.87×**。teaser 案例：同内存下 **+4.96 dB**，峰值 VRAM 0.88 GiB vs 4.88 GiB（**5.51×**）。
  - **图元数匹配**：比 2DGS 高至多 **+4.74 dB**，模型小 1.76–1.95×，峰值 VRAM 少至多 **7×**，渲染快至多 **2.31×**。
  - **无约束设置**：仍比 2DGS 高 0.90 dB（DTU 与 T&T 均如此），渲染快 1.37× 与 2.26×。
  - **表面重建**：15 个 DTU 扫描上 Chamfer 距离 **0.978 mm**（2DGS 1.375 mm，同内存预算）；6 个 T&T 表面场景 mean F1 **34.38%**（2DGS 31.72%），为对比方法中最高。
  - **2D 图像表示**：PSNR 33.16 → **35.82 dB**，LPIPS 0.1372 → **0.0924**，训练 5.1K 迭代 / 157.07 s（Image-GS 238.40 s）；即使改用常数颜色（共享 β）仍全面优于 Image-GS，内存 289.799 kB vs 292.175 kB。
  - 收敛速度更快；作为通用图元在 2D 上也优于 Image-GS。
- **理论支撑（Appendix G, Prop G.3）**: 在一阶近似模型下，合适取向与各向异性缩放的正六边形**比对应正方形多覆盖约 30% 面积、比对应三角形多一倍**，且在相同有界颜色误差下成立。

---

## 局限性

1. **假设局部平面 + 平滑外观**：对高曲率/高频纹理区域仍需密集小图元，六边形优势被削弱。
2. **仅支持一阶颜色场**（V1）或线性视角残差（V2）：强视角相关（镜面/各向异性）效果仍弱于完整球谐；V3（三次 SH）在文中仅作为可选变体提及。
3. **六边形光栅化的实现成本**：虽然沿用 2DGS 合成链，但支撑函数从高斯换成六边形距离场，tile 边界/裁剪逻辑需重写，且需处理 sigmoid 尾部截断。
4. 论文声明结果**未使用任何量化/压缩**（效率数字是"裸"参数量口径）。
5. 3D 表面重建的绝对精度（F1 34.38%）仍远未饱和。

---

## 相关工作

- 2DGS（surface-aligned surfel，本文的直接基线）
- Triangle Splatting、3D Convex Splatting、Deformable Beta Splatting、MeshSplatting
- BBSplat（per-primitive 纹理）、NeST / Nexels（共享神经外观场）
- Mip-Splatting（抗锯齿补偿，CTBakeGS 也引用）
- [[2026-10-29_CTBakeGS-Training-Free-Baking-CT-Volume-Rendering-3DGS]] — 同样是「3DGS 图元效率」主题
- [[2026-10-29_GraftRay-Physically-Based-Mesh-Insertion-GS-Scenes]] — 高斯场景的光追扩展

---

## 实现建议

- **实现难度**: **中**。核心是替换 2DGS 光栅器中的高斯权重为六边形支撑 + 局部颜色场求值，其余（深度序、合成、densify/prune、训练循环）可复用 2DGS 代码库。
- **预期性能**: 同等图元数下 2–5 dB PSNR 提升；训练峰值 VRAM 显著下降（最多 7×）；渲染 FPS 最高 2.31×。
- **适用场景**:
  - **资源受限设备**（移动端 AR / VR / Web）的实时新视角合成
  - 需要兼顾**表面重建精度**与**渲染速度**的管线
  - 2D 图像压缩表示（比 Image-GS 更快更准）
- **落地建议（给墨鱼丸）**:
  1. 六边形支撑函数极简单（3 项 max），**直接移植 2DGS 光栅器是最低风险路径**——只换权重函数与颜色求值。
  2. **一阶颜色场是最大的性价比点**：参数从 58 降到 20 且质量反升，说明「图元内表达梯度」比「靠更多图元逼近」更划算。建议在其他图元体系（3DGS 各向异性椭球）上做同样的实验。
  3. 注意 **β（边界锐度）与尺度 s 的耦合**：大尺度 + 高 β 时 sigmoid 尾部截断阈值需重新调，否则会出现硬边。
  4. 六边形铺砌的「面积-周长」优势在**各向异性缩放**下才成立（正方形/三角形需要同向性假设），实际场景中切向尺度差异大，需验证优势是否保持。
