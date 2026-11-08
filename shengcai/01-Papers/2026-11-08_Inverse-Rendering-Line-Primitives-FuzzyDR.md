---
type: paper
created: 2026-11-08
updated: 2026-11-08
tags: [paper, 渲染, 逆渲染, 可微光栅化, 线段图元, 随机可微渲染, 抗锯齿, Bresenham, MSAA, 毛发, 绒毛, 纤维, 实时渲染, SIGGRAPH-Asia-2026, TOG, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2609.00625
---

# Inverse Rendering for Modeling with Line Primitives：用显式线段重建绒毛/毛发，兼顾「显式几何」与「实时渲染」

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Inverse Rendering for Modeling with Line Primitives |
| **作者** | Kenji Tojo (ETH Zürich), Ariel Shamir (Reichman University), Nobuyuki Umetani (The University of Tokyo), Bernd Bickel (ETH Zürich) |
| **发表** | **ACM Transactions on Graphics 45(6), Article 200, Dec 2026**（SIGGRAPH Asia 2026 Journal Track，SIG/TOG） |
| **链接** | [TOG DOI](https://doi.org/10.1145/3842527) · [arXiv](https://arxiv.org/abs/2609.00625) · [项目页](https://kenji-tojo.github.io/sa26-line-primitives/) |
| **DOI** | 10.1145/3842527 |
| **代码** | https://github.com/kenji-tojo/inverse-line-primitives · 可微光栅器 **FuzzyDR**: https://github.com/kenji-tojo/fuzzydr · 数据集: https://huggingface.co/datasets/kenji-tojo/fuzzy_dataset |
| **会议** | SIGGRAPH Asia 2026（12/01–04，吉隆坡 KLCC，马来西亚首届） |
| **页数** | 13 页（正文）+ 补充材料 |

---

## 核心贡献

> **3DGS 这类「体素化」表示虽然能拍出毛茸茸的样子，但它是**没有拓扑的点云**——不能做深度测试、不能接反射模型、不能做物理仿真、不能进任何现成的几何管线。** 本文提出：**用显式线段（polyline）图元来重建绒毛/毛发/纤维这类「边界模糊、各向异性」结构**，并配套发明了**面向线段的随机可微光栅化器（stochastic differentiable rasterizer）**，让显式几何也能被梯度优化出来。

1. **统一的显式 1D 表示**：场景 = 顶点集 $\mathcal{V}$ + 边集 $\mathcal{E}$（每条边是顶点索引对），约束为**无分支、无汇点的 polyline**（所有顶点度数为 1 或 2）。半透明外观**由大量不透明线段在屏幕空间聚合产生**（而非体密度）。好处：直接兼容 z-buffer 深度测试、着色模型、硬件光栅化，且保留**切向方向与 polyline 连通性**这两个做毛发着色/物理仿真必需的信息。
2. **随机可微光栅化（继承 DiffSoup 的 stochastic opacity masking）**：把离散的光栅化片段选择变成可微的随机过程，用**似然比梯度估计器（likelihood-ratio gradient estimator）** 给出对**顶点位置、属性、乃至离散连通性**的梯度。
3. **Bresenham + 2×2 子像素网格 + MSAA，摆脱「线宽」参数**：亚像素宽度线段在连续线宽参数化下是**欠约束**的，优化会不稳或出现虚线（dashed lines）伪影。本文用 **1 像素宽 Bresenham 算法**在 $2\times2$ 子像素网格上光栅化，**完全不需要世界空间线宽参数**，再用 **Gaussian 重建滤波器**（σ=0.5 px，截断 1.5 px）合成抗锯齿外观。
4. **MSAA 下的不透明度梯度推导**：反锯齿后像素颜色不再由单个片段决定，需对「滤波器支撑域内多个片段的联合概率」求梯度。本文在独立性假设下得到 per-fragment 形式，并做两处**稳定性修正**：①对同一图元的片段取平均（避免梯度把线「剪短」）；②只在像素中心 $2\times2$ 邻域内的 4 个片段上评估不透明度梯度（抑制小滤波权重片段的噪声梯度）。
5. **Adaptive re-lining**：周期性离散更新拓扑——**剪枝**（低不透明度/短线）+ **合并**（端点距离小于阈值 → 连成 polyline）+ **分裂**（长边切分以达到目标顶点数），比 3DGS 的 MCMC 重定位更高效地用满顶点预算。
6. **开源 + 公开真实采集数据集**（Fuzzy，8 个场景）。

---

## 技术方案

### 核心思想

**问题**：绒毛/毛发/纤维/纺织物的**边界本质上是模糊的**，外观由「大量细元素的聚合」涌现。传统表面表示（网格+贴图）假设「局部光滑表面 + 可参数化细节」，这个假设在这里失效。

**三条路线对比**：

| 路线 | 代表 | 优点 | 缺点 |
|------|------|------|------|
| 体素化/辐射场 | NeRF、3DGS、2DGS、AdaptiveShells | 视觉保真度高、实时 | **无显式拓扑** → 不能深度测试、不能反射建模、不能物理仿真、不能进几何处理算法 |
| 表面提取 | 3DGS→mesh、Radiance Surfaces | 得到显式 mesh | **难以复现半透明/模糊外观** |
| **显式 1D 图元（本文）** | 线段/polyline | 显式几何 + 可深度测试 + 保真度接近体素法 | 需要新的可微光栅化来优化 |

**关键洞察**：RGB 与几何虽然物理机制不同，但**两者都条件于同一套几何**。因此正确做法不是给每个模态各配一套几何，而是**共享几何、只分化真正不同的属性**。（这一洞察在 [[2026-11-08_X-Splat-Unified-Gaussian-RGB-Xray]] 中被推到极致。）

### 关键技术

| 技术 | 说明 |
|------|------|
| **表示** | $\mathcal{V}=\{\mathbf{v}_v\}\subset\mathbb{R}^3$，$\mathcal{E}=\{\mathbf{e}_e=(v_1^e,v_2^e)\}$。每顶点带辅助属性 $\mathcal{A}_v$（可学习特征/切向量），每边带不透明度 $\alpha_e\in[0,1]$（存在概率 → 图元可「涌现/消失」） |
| **多段线拓扑约束** | 所有顶点度数为 1 或 2 → 无分支无汇点。**顶点按 polyline 排序后，1D 拓扑仅由「断点位置」编码** → 内存高效 |
| **不透明图元的深度测试** | 像素色 = 最前片段：$f^*=\arg\min_{f\in\mathcal{F}} d_f$。与 3DGS 的「全排序后 back-to-front alpha 混合」不同，z-buffer **无需排序** |
| **随机不透明度遮罩（DiffSoup）** | 每个片段以概率 $\alpha_f$ 被激活（$U<\alpha_f$）；可见片段概率 $p_f=\alpha_f\prod_{f':d_{f'}<d_f}(1-\alpha_{f'})$，形式与 alpha 混合的透射率项一致 |
| **似然比梯度估计器** | $\nabla\mathcal{L}=\mathbb{E}_{p_f}[\nabla\mathcal{L}_1(\mathbf{C}_f)]+\mathbb{E}_{p_f}[\mathcal{L}_1(\mathbf{C}_f)\nabla\log p_f]$ —— 第一项是常规「颜色梯度」，第二项是**不透明度梯度**（这是 DiffSoup 的核心贡献） |
| **Bresenham 光栅化** | 1 像素宽，无线宽参数；在 $2\times2$ 子像素网格上产生一致的子像素覆盖；避免连续线宽优化的不稳定与欠采样虚线 |
| **Microedge 梯度（扩展自 nvdiffrast）** | Bresenham 产生轴对齐块状片段，缺乏连续轮廓 → 把「光栅化产生的轴对齐片段边界」当作**代理轮廓边（surrogate edges）**传递位置梯度 |
| **抗锯齿** | 固定采样点在 $2\times2$ 子像素网格中心（硬件友好）；重建用 **Gaussian 滤波器** σ=0.5 px / 截断 1.5 px，作为轻量可微图像滤波层。**前向用 6×6 高斯，反向用 2×2 box**（见下） |
| **MSAA 不透明度梯度** | 独立性假设：$\nabla\log p_{\mathcal{N}}=\sum_{f\in\mathcal{N}}\nabla\log p_f$。两处修正：①**同图元片段梯度取平均**（否则不透明度梯度会把线的一端拉低 → 相当于「剪短线」，几何变化应由位置梯度负责）；②**只在像素内 $2\times2$ 片段评估**（小滤波权重的片段贡献小，单次随机光栅化无法判断该给多少更新） |
| **Adaptive re-lining** | 剪枝（低不透明度 / 短线）+ 合并（端点距离 < 阈值）+ 分裂（长边切分至目标顶点数）。顶点属性占内存大头 → 切分能更充分利用顶点预算 |
| **实现栈** | **Vulkan** 光栅化 + **nanobind** 暴露为 PyTorch 算子。随机数 $\tau_f$ 在 fragment shader 内用**基于计数器的 RNG**（Salmon et al. 2011）生成；**同一图元的所有片段共享同一计数器值** → 避免图元内部出现随机孔洞。不透明度梯度用独立 pass + 自定义 fragment shader；颜色/位置梯度用 compute shader |

### 核心流程（论文 Fig. 3）

```
① 采集
   ├─ 暗环境 + DSLR + 同轴闪光 + 偏振滤镜（抑制高光，便于几何重建）
   ├─ SfM (COLMAP) 估计相机位姿
   └─ 前景 mask：低强度阈值 → 形态学闭运算（保细结构）→ 取饱和度最高的连通分量
        ↓
② 粗代理表面
   └─ NeuS2 重建（~3 min）→ 手工用包围盒对齐 + mesh intersection 裁剪（去噪背景）
        ↓
③ 初始化
   ├─ 在表面 0.1 距离带内做分层采样 → 1M–2M 种子点
   ├─ 用最近邻距离初始化**很短的**初始边（不依赖位置更新，而靠「涌现」）
   ├─ 初始不透明度 α = 0.1（很小）
   └─ 目标顶点数 1–2M（SH 至 3 阶）
        ↓
④ 联合优化（50,000 iter，每 iter 渲染 1 张图）
   ├─ 损失：ℒ_photo = λ·ℒ_D-SSIM + (1−λ)·ℒ1，λ = 0.8
   │        颜色/位置梯度用 ℒ_photo；随机 log-prob 梯度用逐像素 ℒ1（权重 1）
   ├─ 位置：VectorAdam；其余：Adam
   ├─ re-lining 每 100 iter 执行，直到 iter 35,000
   ├─ 剪枝阈值用初值直到 iter 25,000，之后不透明度阈值线性升到测试时的 0.5
   └─ 长度正则 ℒ_len（权重 1.0e−3）
        ↓
⑤ 输出：显式线模型 → 可直接进 z-buffer 管线 / 可导出为圆柱体做离线光追
```

---

## 公式

**不透明图元的深度测试**：

```math
f^{*}=\underset{f\in\mathcal{F}}{\arg\min}\;d_{f}
```

**随机激活与可见概率**：

```math
f^{*}=\underset{f\in\mathcal{F}:\,\alpha_{f}>\tau_{f}}{\arg\min}\;d_{f},
\qquad \tau_f\sim\mathcal{U}(0,1)
```

```math
p_{f}=\alpha_{f}\prod_{f^{\prime}\in\mathcal{F}:\,d_{f^{\prime}}<d_{f}}(1-\alpha_{f^{\prime}})
```

**似然比梯度估计器（核心）**：

```math
\nabla\mathcal{L}=\mathbb{E}_{p_{f}}\big[\nabla\mathcal{L}_{1}(\mathbf{C}_{f})\big]
+\mathbb{E}_{p_{f}}\big[\mathcal{L}_{1}(\mathbf{C}_{f})\,\nabla\log p_{f}\big]
```

**MSAA 下的不透明度梯度（独立性格式 + 稳定性修正）**：

```math
\nabla_{\alpha_{f}}\mathcal{L}=\mathbb{E}_{p_{\mathcal{N}}}\Big[\mathcal{L}_{1}(\hat{\mathbf{C}})\nabla_{\alpha_{f}}\log p_{\mathcal{N}}\Big]
```

```math
\nabla\log p_{\mathcal{N}}=\nabla\log\prod_{f\in\mathcal{N}}p_{f}=\sum_{f\in\mathcal{N}}\nabla\log p_{f}
```

```math
\nabla\log p_{\mathcal{N}}\approx\sum_{f\in\mathcal{N}_{\mathrm{nearest}}}\nabla\log p_{f},
\qquad \mathcal{N}_{\mathrm{nearest}}:\;2\times2\ \text{片段（像素内）}
```

> **实现提示**：不透明度梯度用**最近邻上采样**损失图，然后在 $2\times2$ 网格上套用 (4) 式梯度公式。

**光照损失**：

```math
\mathcal{L}_{\text{photo}}=\lambda\,\mathcal{L}_{\text{D-SSIM}}+(1-\lambda)\,\mathcal{L}_{1},\qquad \lambda=0.8
```

**光照模型与片段插值**：

```math
\mathbf{C}_{v}^{t}=\mathcal{S}(\mathbf{v}_{v},\mathbf{A}_{v};\,t)
\qquad\text{（}\mathcal{S}\text{ = 用户定义的视角相关着色函数，如 SH 求值）}
```

```math
\mathbf{C}_{f}^{t}=(1-w)\,\mathbf{C}^{t}_{v_{1}^{e}}+w\,\mathbf{C}^{t}_{v_{2}^{e}},
\qquad \alpha_{f}^{t}=\alpha_{e}
```

**几何对齐（导出到 Mitsuba 3）**：线段可导出为**定半径世界空间圆柱**，用 Mitsuba 3 的 GPU 加速 ray-primitive 求交做离线路径追踪。

---

## 代码片段

**Vulkan + nanobind 的 PyTorch 算子结构（实现要点摘录）**

```
Forward:
  - vertex shader: 顶点 → 相机空间、属性插值
  - fragment shader: Bresenham 覆盖 → 片段颜色/深度/不透明度
                     τ_f 由 counter-based RNG 生成
                     同一图元的全部片段共享同一 counter 值
Backward:
  - 独立 pass + 自定义 fragment shader → 不透明度梯度 (4)(11)
  - compute shader (基于 nvdiffrast microedge) → 颜色梯度 + 位置梯度
  - Gaussian 滤波层：前向 6×6 高斯，反向 2×2 box
```

**训练脚本入口（官方仓库）**

```bash
# Shelly 数据集（合成，6 场景）
bash scripts/run_shelly.sh
# Fuzzy 真实数据集（8 场景）
bash scripts/run_fuzzy.sh
# 单场景
python scripts/train_shelly_lines.py --scene khady
python scripts/train_fuzzy.py --scene dinosaur --useall
# 消融配置
bash scripts/baselines/run_shelly_triangles.sh      # 三角形图元
bash scripts/baselines/run_shelly_mcmc_reloc.sh     # MCMC 重定位（替代 re-lining）
```

**多 GPU 环境变量（官方提示）**

```bash
export CUDA_VISIBLE_DEVICES=0
export FUZZYDR_DEVICE_INDEX=1
```

**物理仿真应用（质点弹簧动画，GPU 求解）**

```text
重建的 polyline + KNN-augmented 连通性（K=6）
→ Chebyshev-accelerated Jacobi projective-dynamics steps
→ 2M 顶点 ≈ 55 ms/frame
```

**导出到离线光追（Mitsuba 3）**

```text
显式线图元 → 定半径世界空间圆柱 → Mitsuba 3 GPU ray-primitive 求交
→ 与表面场景在复杂光照传输下联合渲染
```

---

## 实验结论

- **硬件**: Intel Core i9-14900K, 64 GB RAM, **NVIDIA RTX 4090 (24 GB)**
- **规模**: 2M 顶点 + 每顶点 3 阶 SH；**每个样例优化约 45 分钟**
- **数据集**:
  - **Shelly**（合成，6 场景：fernvase / horse / khady / kitten / pug / woolly）— 专业艺术家用曲线+贴图混合基元创作，提供路径追踪渲染图
  - **Fuzzy**（本文自采，8 场景：植物、织物、毛皮、水果）— 6720×4480 源图，优化用 4× 降采样
- **基线**: DiffSoup（表面，15K 三角形）、VolSurfs（分层半透明表面）、AdaptiveShells（体素，引用原论文数值）、3DGS（500K，MCMC）

### Tab. 1 — Shelly 数据集渲染质量（6 场景平均）

| 方法 | PSNR ↑ | SSIM ↑ | LPIPS ↓ | Mem. ↓ | Geom. ↓ |
|------|--------|---------|----------|---------|----------|
| DiffSoup（表面） | 30.63 | 0.920 | 0.112 | 68 MB | 9 |
| VolSurfs（表面） | 34.68 | 0.933 | 0.109 | 116 MB | 6.02 |
| AdaptiveShells†（体素） | 36.02 | 0.954 | 0.079 | — | — |
| 3DGS（500K 体素） | **37.73** | 0.960 | 0.057 | 118 MB | 10 |
| **Ours（2M 顶点显式线）** | 37.09 | **0.963** | **0.046** | 409 MB | **3.59** |

> **Geom. = 每图元的几何参数数（位置+拓扑+变换）**，非整数表示顶点共享。**本文每图元几何参数只有 3.59 个，是 3DGS（10）的 1/3 不到**——这是显式 polyline 表示的参数量优势。内存 409 MB 偏高是因为 SH 属性（3 阶 × 每顶点），论文明确说「未优化总内存占用」，可用更低阶 SH 降低。

### Fig. 8 — 渲染速度（Shelly 6 场景平均）

| 配置 | FPS | LPIPS |
|------|-----|-------|
| 3DGS（500K primitives） | 588 | 0.057 |
| **Ours 默认渲染** | **628** | **0.046** |
| Ours 硬件 MSAA（2×） | 814 | 0.069 |
| Ours 无抗锯齿 | 944 | 0.081 |
| Ours 全质量（4× 像素） | — | — |

> **即使渲染 4× 像素的全质量模式，仍比 3DGS 快**，同时感知质量更好。且由于表示是显式线几何，**质量/性能可按需灵活切换**（硬件 MSAA / 完全关闭抗锯齿）。

### Tab. 2 — Re-lining 消融（Shelly 平均）

| 方法 | PSNR ↑ | SSIM ↑ | LPIPS ↓ |
|------|--------|---------|----------|
| 无离散更新 | 35.48 | 0.949 | 0.065 |
| MCMC 重定位（Kheradmand et al. 2024） | 36.84 | 0.960 | 0.051 |
| **Ours（re-lining）** | **37.09** | **0.963** | **0.046** |

> **MCMC 变体与本文共享同一个可微渲染器，只差离散更新策略 → 差距 0.25 dB PSNR / 0.005 LPIPS 归功于 re-lining 本身。**

### Tab. 3 — 与传统线光栅化对比（Shelly 平均）

| 方法 | PSNR ↑ | SSIM ↑ | LPIPS ↓ |
|------|--------|---------|----------|
| 无不透明度优化 | 35.12 | 0.958 | 0.053 |
| 1 mm 宽 quad sprites | 31.62 | 0.919 | 0.111 |
| 0.2 mm 宽 quad sprites | 22.52 | 0.801 | 0.178 |
| **Ours（Bresenham + MSAA）** | **37.09** | **0.963** | **0.046** |

> **这是全文最有说服力的消融**：传统「可微线渲染」用世界空间线宽参数的 quad sprites，在亚像素宽度下**严重欠采样**（0.2 mm 甚至掉到 22.5 dB）。本文的 Bresenham + MSAA **完全不需要线宽参数**，稳定最优。

### Tab. 4 — 逐场景 LPIPS（越低越好）

| 场景 | 无离散更新 | MCMC | 无不透明度 | 1 mm quads | 0.2 mm quads | Box 滤波 | Points | Triangles | **Ours** |
|------|-----------|------|-----------|-----------|------------|----------|--------|-----------|-----------|
| Khady | 0.110 | 0.089 | 0.089 | 0.131 | 0.221 | 0.099 | 0.247 | 0.106 | **0.080** |
| Fernvase | 0.026 | 0.017 | 0.020 | 0.053 | 0.101 | 0.021 | 0.081 | 0.018 | **0.016** |
| Kitten | 0.039 | 0.026 | 0.027 | 0.071 | 0.116 | 0.035 | 0.105 | 0.029 | **0.023** |
| Pug | 0.080 | 0.064 | 0.072 | 0.147 | 0.228 | 0.071 | 0.210 | 0.071 | **0.060** |
| Woolly | 0.112 | 0.095 | 0.100 | 0.213 | 0.293 | 0.109 | 0.256 | **0.066** | 0.084 |
| Horse | 0.020 | 0.013 | 0.012 | 0.051 | 0.108 | 0.015 | 0.099 | 0.014 | **0.012** |
| **Average** | 0.065 | 0.051 | 0.053 | 0.111 | 0.178 | 0.059 | 0.166 | 0.051 | **0.046** |

> **唯一例外：Woolly 场景三角形图元（0.066）优于线图元（0.084）**。原因见下方失败案例分析。

### 其他消融

- **图元类型对比（Fig. 4，2M 顶点预算）**：Point 图元太稀疏无法复现密集纤维；Triangle 图元平滑但**难以捕获亚像素细特征（出现虚线状胡须伪影）**；线图元保住连贯方向结构与细粒度细节。LPIPS 平均：Points 0.166 / Triangles 0.051 / **Ours 0.046**
- **重建滤波器（Fig. 13）**：同样 $2\times2$ 子像素网格上，**Box 滤波**（0.059）无法复现平滑模糊边界；**Gaussian 滤波**（0.046）边界更平滑且保持更好的方向结构

### 失败案例分析（Woolly）

- 该场景**空间尺度更大、整体呈圆壳形**，难以用线图元充分覆盖 → 三角形填充表面更高效，在纹理区域产生更锐利的对比
- 本文表示的绒毛边界**比 GT 略模糊**，在视觉平坦区域**偶尔露出背景像素**，但**保留了更细的纤维纹理**
- **论文由此提出的未来方向：混合表示** —— 大面积视觉平坦区域 + 深层表面用三角形，纹理丰富区域 + 模糊前边界用线段

---

## 局限性

（论文 Sec. 6 明确列出 + 本笔记补充）

- **拓扑恢复不完整**：重度遮挡结构（如毛发内部）需要更强的先验或更丰富的采集设置
- **无法恢复完全准确的微尺度纤维朝向与连通性**（对像素尺度上勉强可见的结构）
- **亚像素线宽恢复本质困难**（论文承认这是有价值但未解决的问题）
- **跨观察距离的表示适配未解决**：近距离视图下会看到明显的线结构 → 需要 LOD 技术或三角形-线混合表示
- **不透明度梯度是独立性格式**：同图元片段共享不透明度 → 概率实际不独立。论文用「按图元取平均」缓解，并指出更根本的做法是用**控制变量法（control variates）**把 Gaussian 滤波权重与图元朝向纳入方差缩减
- **手工的连通性更新规则**：论文提出未来可用「学习的方向性连接概率」替代
- **背景移除不完美会导致边界重建错误**；黑色表面区域会被解释为孔洞（如 Textile 模型的文字区域）
- **内存占用 409 MB 偏高**（SH 属性占大头，论文未优化）
- **不保证完全连通的 polyline 结构**与真实物理连通性一致
- **可微渲染器非 bit-deterministic**（反向的 atomic reduction + PyTorch 内部随机种子）→ 逐场景波动限于最后一位有效数字
- **Bresenham 1 像素宽在大倍率放大下线条结构可见**（README 说明，提供 quad sprite 运行时选项作为替代）

---

## 相关工作

- [[2026-11-08_X-Splat-Unified-Gaussian-RGB-Xray]] — 同一 SIGGRAPH Asia 2026，共享几何 + 跨模态对齐
- **DiffSoup**（Tojo et al., 2026，同一作者）— 三角形版的随机可微光栅化，本文是其线段扩展
- **nvdiffrast**（Pidhorskyi et al., 2024）— microedge 梯度方法来源
- **3DGS**（Kerbl et al., 2023）、**2DGS**（Huang et al., 2024）、**Radiance Surfaces**（Zhang et al., 2025）、**VolSurfs**（Esposito et al., 2025）、**AdaptiveShells**（Wang et al., 2023b）
- **GroomCap**（Zhou et al., 2024）、**Takimoto et al. 2024**（头发可微渲染，0.2 mm quad 基线）
- **Marschner et al. 2003**（毛发散射模型）、**Bergou et al. 2008**（布料物理仿真）
- **Mitsuba 3**（Jakob et al., 2022）— 导出圆柱后做离线光追
- **Edge-Soup**（Li et al., 2018）、**DiffVG**（Li et al., 2020）— 可微描边渲染

---

## 实现建议

- **实现难度**: **高**。核心难点有三：
  1. **Bresenham 线光栅化的可微化**（microedge 代理边）——这是最硬的部分，需要自己写 Vulkan/光栅后端
  2. **MSAA 下的不透明度梯度推导**（独立性格式 + 图元内平均 + 邻域限制）
  3. **随机光栅化的可复现性**（counter-based RNG，同图元共享计数器）
  - 但**官方实现完全开源**（含独立可微光栅器 FuzzyDR），且提供 Vulkan + PyTorch 绑定，可直接复用而非从零实现
- **预期性能**:
  - Shelly 上 PSNR 37.09 / SSIM 0.963 / LPIPS 0.046（**LPIPS 优于 3DGS 的 0.057**，PSNR 低 0.64 dB）
  - **628 FPS**（RTX 4090，默认设置）→ **比 3DGS 快**
  - **每图元几何参数仅 3.59 个**（3DGS 为 10）→ 几何存储省 ~2.8×
  - 优化成本：45 分钟/场景（2M 顶点，50k iter）
- **适用场景**:
  - **游戏/引擎资产**：毛发、绒毛、织物、草丛、树叶——需要**同时**有高保真和「能进 z-buffer / 物理仿真」的用户
  - **需要离线光追的场景**：可导出圆柱交给 Mitsuba 3 / Cycles，与表面场景做复杂光照传输
  - **需要反射建模**：Marschner 毛发散射可直接用切向量
  - **数字孪生/文化遗产**：显式几何可分析、可编辑
- **可借鉴的通用技巧**（本文最大的价值可能在这里）:
  1. **「用离散图元做模糊外观」的思路可迁移**：不是所有模糊都要用体密度表达。**「显式几何 + 屏幕空间聚合」** 也是一条路（本文用它做绒毛，理论上可用于毛发卡片、纤维、苔藓）
  2. **「用离散算法替代连续参数」的鲁棒性设计**：**Bresenham（无宽度参数）比连续线宽参数化稳得多**。任何「亚像素级几何参数」都容易欠约束——**能不参数化就别参数化**
  3. **「离散选择」的可微化三板斧**（适用于任何 z-buffer / argmax / top-k 场景）：①给图元一个连续不透明度作为「软选择概率」；②用似然比梯度估计器而非链式法则；③对同一图元内的梯度做平均，把「形状变化」交给位置梯度、把「存在与否」交给不透明度梯度。**这个分解非常通用**
  4. **「几何代理对齐」比「优化结果对齐」更稳**：X-Splat 里也用了同样的思路（PCA+ICP 对齐干净代理而非对齐两堆带 floater 的高斯）→ **跨模态/跨数据集配准时优先用干净几何代理**
  5. **「共享骨架、差异化属性」的表示设计**：几何共用、只给真正需要的属性分配预算（X-Splat 的 surface set）→ **内存省 2.5× 而质量不降**
  6. **抗锯齿滤波器的选择有实质影响**：同样 $2\times2$ 子像素，Box vs Gaussian 差 0.013 LPIPS。**不要默认用 box filter**
  7. **子像素欠采样是隐蔽的质量杀手**：0.2 mm quad 在原像素网格上掉到 22.5 dB。**任何亚像素几何都要用 MSAA 或超采样**
- **优先级建议**: 🟢 **P1 — 推荐实现/借鉴**。对做**毛发/绒毛/纤维类渲染**的团队是直接可用的方案；对其他团队，价值主要在**第 3、6、7 条通用技巧**（离散选择可微化、亚像素欠采样、滤波器选择），这些可立刻用于现有光栅化管线
- **建议落地路径**:
  - **阶段 A（低成本，通用）**：先检查现有管线里所有「离散选择 + 亚像素几何」的地方，用本文的 microedge 代理边 + 似然比梯度思路排查梯度质量；把 box filter 换成 Gaussian 重建滤波看是否直接提升
  - **阶段 B（领域特定）**：若确实有毛发/绒毛资产需求，直接复用 FuzzyDR，不必自研
