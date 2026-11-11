---
type: paper
created: 2026-11-11
updated: 2026-11-11
tags: [paper, neural-texture, PBR, real-time-rendering, cloth-simulation, BRDF, SIGGRAPH-Asia-2026, 2026-11]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2611.13677
---

# Deformable Texture Maps: Compiling Dynamic Microgeometry into Neural Textures

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Deformable Texture Maps: Compiling Dynamic Microgeometry into Neural Textures |
| **作者** | Antonio Arian Silaghi, Zhen Chen, Danny Kaufman, Elie Michel, Jean-Marc Thiery, Jorge Lopez-Moreno, Elena Garces |
| **单位** | Inria Grenoble (MorphCG) 等；SIGGRAPH Asia 2026 论文集（CGF Vol. 46, Issue 2） |
| **发表** | **EUROGRAPHICS CGF 46(2), 2027**（SIGGRAPH Asia 2026 周期）· arXiv 2026-11-11 |
| **链接** | [原文](https://arxiv.org/abs/2611.13677) · [PDF](https://arxiv.org/pdf/2611.13677v1) · [HTML](https://arxiv.org/html/2611.13677v1) |
| **DOI** | 10.48550/arXiv.2611.13677 |
| **代码** | 论文称「将在发表后公开数据集与模型」；渲染器为 **Three.js WebGPU** 实现 |

---

## 核心贡献

> **当微观几何由局部形变决定时，它的「渲染相关属性」可以直接在材质空间中表示为形变的函数** —— 于是「动态微观几何渲染」被转化为「形变条件化的纹理求值」。

1. **Deformable Texture Maps (DTM)**：一个连续、紧凑的**神经纹理**表示，把形变驱动的微观几何编译成**材质空间中的固有（intrinsic）场** $\mathcal{T}:[0,1]^2\times\mathcal{D}\to\mathbb{R}^8$，输出 **opacity $\alpha$、法线 $\mathbf{n}$、深度 $h$、材质 ID $\mathbf{c}$（3 通道）**。
2. **数据生成管线**：对 **yarn-based 织物**采样可平铺的纱线块 → 在形变空间中扫掠（sweep）→ 用 **MADYPG** 均质化纱线模型做物理松弛 → **canonicalization** 拉回 rest 空间 → 渲染出可平铺的固有图用于学习。
3. **持久化纹理空间渲染框架**：利用「固有图与光照/视角无关」这一性质，把神经求值结果**缓存在 UV 空间**，按**形变触发**选择性更新，从而**把神经求值与逐帧渲染解耦**。
4. **可编辑性**：因为编码的是**几何属性而非辐射度（radiance）**，因此**重打光、换 BRDF、替换材质调色板都无需重训**。

---

## 技术方案

### 核心思想

对比现有路线的取舍：

| 路线 | 代表工作 | 优点 | 缺点 |
|------|---------|------|------|
| 显式纱线几何 | Yuksel et al. 2012、CLM 2014、MLBS 2019 | 物理精确 | 运行时重建 + 渲染昂贵 |
| 均质化 + 形变几何 | Sperl et al. 2020/2021 (MADYPG) | 可高效恢复 | 仍需显式几何 |
| **形变依赖的交互式重建** | HSW\*25（SIGGRAPH'25, TOG 44(4)） | **30 ms/帧 @ FullHD** | **运行时仍保留微观几何**，重建与渲染耦合 |
| 表面式外观模型 | Zhu et al. 2024 (SIGGRAPH'24)、KAYM26 (CGF'26) | 无显式几何 | 只表示静态状态 |
| 物理启发过程纹理 | Kalinov et al. 2026 (TOG 45(4)) | 形变依赖 | **规定**纹理行为类别，而非从底层形变导出 |
| **DTM（本文）** | — | 紧凑 + 形变驱动 + 可编辑 | 无 3D 微观几何 / 无体积传输 |

**DTM 的取舍**：放弃「显式 3D 微观几何」的通用性，换取紧凑的、附着于表面的表示。

### 关键技术

| 技术 | 说明 |
|------|------|
| **形变描述子 $\mathbf{d}$** | $\mathcal{D}\simeq\mathbb{R}^3$：$(s_x,s_y,s_a)$ = 两轴拉伸 + 剪切（$s_a=\sin\alpha$） |
| **形变梯度 $\mathbf{F}(\mathbf{d})$** | 由 $(s_x,s_y,s_a)$ 构造的面内形变梯度，**第二列范数恒为 $1+s_y$** → 剪切只改变方向、不引入额外拉伸 |
| **MADYPG 均质化** | Sperl et al. 2021；给定 $\mathbf{F}(\mathbf{d})$ 求出松弛后的纱线中心线 |
| **Meshing** | 沿 rest 姿态中心线构造**定半径圆截面**的广义柱面；使用「最小扭矩」适应标架，并**在 tile 边界强制标架一致**以保证周期可平铺 |
| **3×3 复制渲染** | 把纱线 tile 复制到 **3×3 邻域**再正交渲染，**只保留中心 tile** —— 保留跨越边界的纱线几何，确保无缝 |
| **Canonicalization** | 对形变后几何施加 $\mathbf{F}(\mathbf{d})^{-1}$ **拉回 rest 空间** → 统一空间域，**但不撤销**已模拟的纱线重排（因此保留间距/遮挡/可见性的形变依赖变化） |
| **法线的"双重空间"处理** | 位置在 canonical 域光栅化，但法线须描述**形变后**构型：把 $\widetilde{\mathbf{F}}=\mathrm{diag}(\mathbf{F},1)$ 作用到 canonical 网格顶点后重算平滑顶点法线，再插值到光栅点 |
| **Fourier-SIREN** | $\gamma(\mathbf{p})=(\mathbf{p},\sin(2^\ell\pi\mathbf{p}),\cos(2^\ell\pi\mathbf{p}))_{\ell=0}^{L-1}$（固定 Fourier 编码）+ SIREN 周期激活，联合预测 8 通道 |
| **Persistent texture-space caching** | UV 空间分 page，每 page 分配**恒定 LoD**；按「纹理 texel ↔ 视口像素足迹」切换 5 级 LoD，虚拟纹理最大 4k |
| **形变触发失效** | 逐顶点比较 $\lVert\mathbf{d}_v-\widehat{\mathbf{d}}_v\rVert_\infty>\tau$；越过阈值则推进参考值并标记相关区域待更新 |
| **行交错更新调度** | 目标更新频率 $f_u$ 独立于帧率；$G=2$ 时奇偶行交替更新，每组更新机会间隔 $G/f_u$ 秒 |
| **渲染效果叠加** | 缓存图当作**普通材质贴图**使用：视差映射（用 depth）、fuzz 薄壳、flyaway fibers（锥形缎带，alpha 选根、depth 定位置、normal 定朝向，参考 LPFH01）；透明度用**前向渲染**处理 |

---

## 公式

神经纹理的形式化定义（式 1）：

```math
\mathcal{T}:[0,1]^{2}\times\mathcal{D}\to\mathbb{R}^{8},\qquad(\mathbf{u},\mathbf{d})\mapsto(\alpha,\mathbf{n},h,\mathbf{c})
```

面内形变梯度（式 2）：

```math
\mathbf{F}(\mathbf{d})=\begin{pmatrix}
1+s_{x} & s_{a}\,(1+s_{y})\\
0 & (1+s_{y})\sqrt{1-s_{a}^{2}}
\end{pmatrix}
```

Fourier-SIREN（式 3–4）：

```math
\mathcal{T}=S\circ\gamma,\qquad(\alpha,\mathbf{n},h,\mathbf{c})=S\bigl(\gamma(\mathbf{p})\bigr),\quad \mathbf{p}=(\mathbf{u},\mathbf{d})
```

```math
\gamma(\mathbf{p})=\bigl(\mathbf{p},\;\sin(2^{\ell}\pi\mathbf{p}),\;\cos(2^{\ell}\pi\mathbf{p})\bigr)_{\ell=0}^{L-1}
```

联合训练损失（式 5，四张图等权重）：

```math
\mathcal{L}=\sum_{f\in\{\alpha,\mathbf{n},h,\mathbf{c}\}}\mathrm{MSE}\bigl(\hat{f},f\bigr)
```

形变触发失效判据：

```math
\lVert\mathbf{d}_{v}-\widehat{\mathbf{d}}_{v}\rVert_{\infty}>\tau
```

---

## 代码片段

论文给出的是概念性结构，核心是「神经求值 → 材质贴图 → 常规着色」的三段式：

```glsl
// --- 1. 形变参数烘焙到 UV 空间（每帧一次） ---
// 粗网格在 UV 空间光栅化，插值逐顶点 (sx, sy, sa) 得到形变贴图
deformTex = rasterizeUV(coarseMesh, perVertexDeformationParams);

// --- 2. 神经求值（仅对被标记的 texel，BGPU 批量） ---
// 输入: p = (u, d)；d 由 deformTex 双线性采样得到
vec4  pred = FourierSIREN_eval(concat(texCoord, deformSample));

// 写入 4 张材质贴图（持久缓存）
alphaTex[u,v]  = pred.x;      // 纱线覆盖率
normalTex[u,v] = pred.yzw;    // 形变后表面朝向
depthTex[u,v]  = pred.w;      // 视差起伏
materialTex[u,v]= pred2.xyz;  // 材质 ID 码（3 通道连续码）
```

```glsl
// --- 3. 常规着色（零额外神经求值） ---
// alpha 决定纱线覆盖率；normal 提供局部朝向；material ID 选择 shader 参数
vec3 albedo = palette[decodeMaterialID(materialTex)];
vec3 color  = albedo * lambert(N, L) + ggx_specular(N, V, L, roughness);
// 视差：用 depth 做视差偏移
vec2 uvParallax = parallaxOffset(depthTex, viewDirUV);
```

---

## 实验结论

- **数据结构**: 5 种纱线结构 —— **rib（罗纹）、basket（篮纹）、stockinette（平针）、honeycomb（蜂窝）、satin（缎纹）**；每种结构**独立训练**一个 Fourier-SIREN
- **训练设置**: 宽度 128，训练 **30,000 步**；形变状态采样 **8×8×8 = 512** 个格点，$s_x,s_y\in[-0.2,1.0]$，$s_a\in[-0.7,0.7]$
- **基线**: Ground-truth 固有图（由原始几何导出）；ASTC 块压缩；无损 PNG / 原始像素；线性纹理混合（naïve）

### Table 2 — 五种纱线结构的重建保真度（宽度 128）

| 结构 | Alpha PSNR↑(dB) | Normal PSNR↑(dB) | Depth PSNR↑(dB) | Material ID 准确率↑(%) |
|---|---|---|---|---|
| Rib | 23.34 | 21.11 | 32.13 | 96.52 |
| **Basket** | **29.67** | **28.20** | **41.48** | **98.80** |
| Stockinette | 24.77 | 23.37 | 32.46 | 98.58 |
| Honeycomb | 24.01 | 22.26 | 31.46 | 97.61 |
| Satin | 27.22 | 26.42 | 37.40 | 97.75 |

> **深度与材质 ID 精度最高，alpha 与法线精度较低**；法线误差集中在**边界与开口处**。

### Table 3 — 存储成本 vs 重建质量（rib）

| 表示 | 存储 (MiB)↓ | Alpha (dB)↑ | Normals (dB)↑ | Depth (dB)↑ | Material ID (%)↑ |
|---|---|---|---|---|---|
| Neural 32 | 0.04 | 15.97 | 15.20 | 24.00 | 88.18 |
| Neural 64 | 0.09 | 18.45 | 18.38 | 26.46 | 93.08 |
| Neural 128 | 0.26 | 20.88 | 21.03 | 29.68 | 96.18 |
| **Neural 256** | **0.88** | **22.60** | **23.49** | **32.86** | **97.45** |
| ASTC 12×12 | 11.02 | 18.42 | 18.68 | 24.28 | 94.67 |
| ASTC 8×8 | 24.77 | 22.63 | 21.65 | 28.73 | 98.76 |
| ASTC 6×6 | 43.02 | 26.44 | 24.74 | 34.58 | 99.79 |
| ASTC 4×4 | 97.52 | 34.03 | 30.75 | 43.54 | 99.99 |
| PNG lossless | 187.11 | Exact | Exact | Exact | Exact |
| Raw pixels | 387.00 | Exact | Exact | Exact | Exact |

> **论文选定的工作点（Neural 128, 0.26 MiB）**：质量介于 ASTC 8×8 与 12×12 之间，**存储降低 42×–94×**。
> 论文正文表述为「42× 到 94× 的存储内存削减」（对应 ASTC 12×12 与 ASTC 8×8 两个参照点）。

### Table 4 — 六种神经架构对比（rib，参数各约 64k）

| 架构 | 参数量 | Alpha (dB)↑ | Normals (dB)↑ | Depth (dB)↑ | ID (%)↑ |
|---|---|---|---|---|---|
| SIREN | 63,786 | 22.43 | 20.43 | 30.75 | 96.33 |
| H-SIREN | 63,786 | 22.77 | 20.57 | 31.28 | 96.10 |
| FM-SIREN | 63,786 | 22.66 | 20.14 | 31.01 | 96.24 |
| **Fourier SIREN** | 64,194 | **23.48** | **21.25** | **32.40** | **96.69** |

> 在**参数量相当**的前提下，**Fourier-SIREN 质量最高**。训练预算超过 30k 步后收益递减（Fig. 10）。

### 端到端实时渲染性能（1920×1080，Three.js WebGPU）

| 方法 | 平均 FPS |
|---|---|
| 逐 fragment 屏幕空间延迟求值 | 459.6 |
| **纹理空间持久缓存（本文）** | **969.8** |

> **2.1× 加速**。基准场景：四角固定的布片，先静止 → 拉伸压缩 → 静止 → 拉伸中缩放 → 回到初始态。
> - **静止段**：纹理空间方法帧率大幅领先（算过一次可一直复用）
> - **拉伸段**：两者都掉帧（需要缓存更新）
> - **缩放段**：屏幕空间方法掉帧（整个视口都要网络求值）；纹理空间方法短暂掉帧（切换到更高 LoD 并写入缓存），完成后**帧率回弹**
> 测量条件：GPU 完成的应用帧率、浏览器调度、关闭 vsync、最多 3 帧在飞；启用更新调度 + 选择性更新 + 自适应虚拟纹理，最大 4k 虚拟纹理，共 5 级 LoD。

### 两条渲染路径的能力对比（Table 1）

| 能力 | 本文（纹理空间） | 屏幕空间延迟 |
|---|---|---|
| 跨帧复用 | **持久 UV 条目** | 每帧重新求值 |
| 局部形变更新 | **只刷新受影响区域** | 评估覆盖像素 |
| 独立更新速率 | **可跨更新复用** | 与帧评估耦合 |
| 材质空间效果 | **重复纹理查找** | 缺失采样需再求值 |
| 透明层 | **每层一次纹理查找** | 每层需独立预测 |

### 其他定性结论

- **形变依赖覆盖度**：拉伸改变纱线排布与开口，**背光下可见光透出的孔隙随之改变** —— 固定纹理只会随 UV 拉伸（naïve），DTM 捕捉到了真实结构变化
- **优于朴素基线**：线性纹理混合会把相邻状态的纱线边界**叠加出鬼影（ghosting）**；DTM 产生更连贯的中间构型
- **编辑性**：预测的材质 ID 支持**跨服装一致跟随纱线组的调色板编辑**；视差、fuzz、flyaway 可叠加在同一神经服装上而**不修改已学习表示**
- **实时重打光与调色板编辑**（固定模型，多种动画场景）

---

## 局限性

1. **继承训练用微观几何的保真度限制**：使用 MADYPG 中心线 + 定半径圆柱，**省略**横截面压扁、多股重排、接触压缩等效应。表示本身不绑定该几何模型（可换更丰富的微观几何，只要能生成形变条件化训练图）
2. **泛化受限**：每个 DTM 只针对**单一微观结构 + 有界形变域**训练。演示了形变状态间的**插值**，但**未演示外推**，也**未演示跨纱线结构迁移**
3. **形变描述子不完备**：只捕捉面内拉伸与剪切，**不含弯曲（bending）与局部压缩**
4. **表面表示的固有局限**：opacity/normal/depth/material-ID 只描述局部纱线结构与起伏，**无法表达需要完整 3D 几何或体积光传输的效果** —— 复杂轮廓、深可见性、透射、多重散射均不可复现
5. **着色模型简化**：仅用通用 **Cook–Torrance BRDF**，**不建模纱线方向相关的反射率**
6. **尺度相关滤波未解决**：对连续量、方向量、类别量（材质 ID）需要不同的滤波处理方式
7. **精度分布不均**：alpha 与法线 PSNR 明显低于 depth（见 Table 2），法线误差集中在边界/开口
8. **只验证了 yarn-based 织物**，论文指出同样公式可适用于皮肤等其他「微观几何可由局部形变参数化」的材料

---

## 相关工作

- **HSW\*25**（Sperl, Huang et al., *Real-time knit deformation and rendering*, TOG 44(4) 2025）— 30 ms/帧 @FullHD，但运行时保留微观几何
- **Kalinov et al. 2026**（*Physics-inspired procedural texturing of extremely deformable surfaces*, TOG 45(4)）— 形变依赖但为「规定」而非「导出」
- **Zhu et al. 2024**（SIGGRAPH'24, *A realistic multi-scale surface-based cloth appearance model*）
- **Khattar et al. 2026**（CGF, *A texture-free multi-scale model for surface-based rendering of knitted fabrics*）
- **Sperl et al. 2020/2021** — MADYPG / Homogenized yarn-level cloth（本文的数据生成基础）
- **Soh & Montazeri 2024** — *Neural appearance model for cloth rendering*
- **Weinreich et al. 2024** — *Real-time neural materials using block-compressed features*
- **Baker & Jarzynski 2022**（EGSR）— Decoupled shading（本文持久缓存的思路来源）
- **Laurent 2026** — Neural texture compression using hypernetworks；**Laurent & Anis 2025** — 硬件加速神经块纹理压缩
- **[[2026-11-10_HaloRT-Real-Time-Volumetric-Light-Transport-Inference]]** — 同样走「神经推理替代物理采样」路线，但针对体积介质
- **[[2026-11-10_AF-NTC-LOD-Conditioned-Anisotropic-Filtering]]** — LOD 条件化滤波，与本文的 5 级 LoD 机制相关
- **[[2026-11-08_X-Splat-Unified-Gaussian-RGB-Xray]]** — 另一种「压缩神经表示」的思路

---

## 实现建议

- **实现难度**: **中**。核心三件套：① 离线数据生成（需要 MADYPG 或等价的纱线级均质化模拟 —— **这是最难的部分**）；② Fourier-SIREN 训练（8×8×8 形变格点 × 30k 步，单结构独立训练）；③ 运行时纹理缓存（Three.js WebGPU 实现已由作者给出思路）。**不含 3D 微观几何重建**，比 HSW\*25 简单
- **预期性能**:
  - 质量：alpha/normal **21–25 dB**（128 宽度下），depth **30–33 dB**，材质 ID **~96–98%**
  - 速度：**1920×1080 @ ~970 FPS**（纹理空间）vs 460 FPS（屏幕空间）—— **2.1×**
  - 存储：0.26 MiB/结构（对比 ASTC 8×8 的 24.77 MiB，**~94× 压缩**）
- **适用场景**:
  - ✅ **实时布料/服装渲染**（游戏、XR、数字人服装）
  - ✅ 需要**运行时可编辑外观**（换色、换 BRDF、重打光）的生产管线
  - ✅ 表面附属的微观细节（皮肤微结构是论文点名的潜在扩展方向）
  - ⚠️ 需要体积透射/深可见性/多重散射的场景 —— **不适用**
  - ⚠️ 需要弯曲主导形变（而非面内拉伸剪切）的场景 —— 描述子需扩展
- **建议动作**:
  1. 传递给 **@墨鱼丸**：重点评估「形变条件化神经纹理 + UV 持久缓存」这一架构在自有布料管线中的可行性
  2. **优先复用其 LoD/缓存调度设计**（形变触发失效 + 行交错 + 5 级 LoD + 自适应虚拟纹理）—— 这套机制与表示本身解耦，可独立移植到其他材质系统
  3. 关注「数据集与模型将在发表后公开」的承诺 —— 目前需自行实现 MADYPG 数据生成
- **优先级**: **高**（SIGGRAPH Asia 2026 周期论文；「神经表示 + 几何/材质解耦」的设计思想可迁移到远超织物的场景）
