---
type: paper
created: 2026-11-11
updated: 2026-11-11
tags: [paper, inverse-rendering, BRDF, PBR, 3DGS, neural-rendering, ray-tracing, diffusion-model, 2026-11]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2511.21098
---

# Pygmalion Effect in Vision: Image-to-Clay Translation for Reflective Geometry Reconstruction

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Pygmalion Effect in Vision: Image-to-Clay Translation for Reflective Geometry Reconstruction |
| **作者** | Gayoung Lee, Junho Kim, Jin-Hwa Kim（通讯）, Junmo Kim |
| **单位** | NAVER AI Lab · SNU AIIS · KAIST |
| **发表** | arXiv 2511.21098 **v2**（2026-11-11 更新），主分类 cs.CV（cross-list cs.GR / cs.AI）· DOI 10.1109/TVCG.2026.3750350（配套的流体论文见另一条笔记） |
| **链接** | [原文](https://arxiv.org/abs/2511.21098) · [PDF](https://arxiv.org/pdf/2511.21098v2) · [HTML](https://arxiv.org/html/2511.21098v2) |
| **DOI** | 10.48550/arXiv.2511.21098 |
| **代码** | 论文基于 MaterialRefGS 官方代码库构建 |

> **注意**：这是 **v2 更新**（本轮 RSS 中标为 `replace-cross`），首版发表于 2025-11。本轮按「24 小时内更新」收录。

---

## 核心贡献

> **与其为反射物体构建越来越复杂的模型，不如把问题重构为「把反射外观转换成非反射外观」** —— 用图像到图像翻译把反射图「雕刻」成黏土样式的无反射渲染，再把它当作**无反射的几何监督信号**。

1. **新框架**：把反射图像翻译成**黏土样（clay-like）渲染**，作为**反射无关的几何引导**。
2. **多视角一致的黏土翻译模型**：基于**预训练视频扩散模型 LTX-2** + **LoRA** 轻量微调，**把视频模型的「时间轴」重新解释为「视角轴」**，从而把「时间连贯性先验」转为「跨视角一致性先验」。
3. **双分支反射高斯泼溅（dual-branch reflective Gaussian Splatting）**：BRDF 分支与 **clay 分支共享同一套高斯几何**、但走**完全独立的渲染路径**；clay 分支提供与镜面评估解耦的无反射几何监督。
4. **实证**：在合成与真实数据集上，**网格精度**与**光度质量**均一致提升；且 clay 监督**可独立于单目法向先验**工作。

---

## 技术方案

### 核心思想

**问题根源**：NeRF / 3DGS 隐式依赖**视角不变的光度一致性**，而反射面违反了这一假设（外观随视角变化的环境反射而变）。已有的逆渲染方法显式建模 BRDF，但**外观与形状通过反射纠缠**，难以把观测到的颜色变化归因于几何还是反射率。

**本文的转念**（引言中的表述）：
> 此前工作都在为反射物体**构建越来越复杂的模型**；我们则把问题重构为**用图像到图像翻译模型把反射外观转换为非反射外观**。转换目标选用**白黏土** —— 黏土渲染在 Blender 等管线中广泛使用，能有效传达几何结构而不受材质外观干扰。

**类比**：即视觉中的「**皮格马利翁效应**」—— 模型按自己学到的预期重塑视觉世界，把反射的复杂性转成自洽、可解释的形式。

### 关键技术

| 技术 | 说明 |
|------|------|
| **视频扩散模型作为多视角翻译器** | LTX-2 原生通过 temporal attention 强制跨帧连贯；**关键洞察**：视频模型的时间轴可**重新解释为视角轴**，帧间连贯性先验自然迁移到多视角输入，仅需轻量 LoRA 微调 |
| **多视角序列构造** | 每个视角用 LTX-2 的 **video VAE encoder** 独立编码 → 沿时间轴拼接为 N 个单帧 latent token |
| **IC-LoRA 条件 token 设计** | 单一序列 = `[干净条件 token] | [噪声目标 token]`；按 token 分配时间步（条件 token = 0，目标 token = $\sigma$） |
| **随机视角排序** | 伪视频序列内**按随机顺序**（而非相机角度邻近）排列视角 —— 实验发现随机排序**跨数据集泛化更好** |
| **Anchor 机制** | 训练时以 **p=0.5** 把 $n_{\text{anchor}}=4$ 个随机目标槽替换为**干净的 GT 黏土 latent** → 一个模型同时支持「anchor-free 生成」与「inpainting 式生成」。推理时 $M\gg N$ 的场景被切成 N 大小的 chunk，**首 chunk 的 anchor 视图及其黏土翻译注入后续所有 chunk** |
| **Flow-matching 损失** | $\mathcal{L}_{\text{flow}}=\mathbb{E}_{\sigma,\epsilon}[\sum_{i:m_i=0}\|\mathbf{v}_\theta(\mathbf{Z}_\sigma;t)_i-(\epsilon_i-\mathbf{Z}_i^{tgt})\|_2^2]$，**只在噪声目标 token 上施加**（参考与 anchor token 被 mask） |
| **双分支共享几何** | 两分支共享 $\mathbf{p}_i$（位置）、$\mathbf{t}_i$（切向）、$\mathbf{s}_i$（缩放）、$\alpha_i$（不透明度）、$\mathbf{n}_i$（法线）；**外观参数独立**：BRDF 分支用 $[\lambda_i,m_i,r_i,\mathbf{n}_i]$，clay 分支用 $\hat{\mathbf{c}}_i$ |
| **选择性梯度路由（Selective Gradient Routing）** | 解决共享参数上的**梯度冲突**：RGB 损失把几何绑到视角相关的镜面评估，clay 损失偏好解释漫反射着色的几何。旋转 $\mathbf{t}_i$ 与缩放 $\mathbf{s}_i$ **接受双方全强度梯度**（法线由旋转导出，决定反射方向，必须能被 BRDF 分支继续精修）；位置 $\mathbf{p}_i$ 与不透明度 $\alpha_i$ **主要由 $\mathcal{L}_{\text{clay}}$ 优化**，RGB 只留**弱残差梯度**（$\beta=0.1$），用 stop-gradient + 残差缩放实现 |
| **锁定期（lock duration）** | 早期训练几何主要从 clay 损失学习。消融显示**锁定约 40% 总迭代数**最有利；过长则 BRDF 路径没有足够时间精修几何，导致性能下降 |
| **合成/真实的不同策略** | 合成数据：初始阶段后**完全关闭 clay 分支**，只用 RGB 损失继续训练。真实数据：**两个损失同时保持激活**，联合优化但不再做梯度路由 —— 真实场景反射更复杂更难解耦，持续的无反射监督有益 |

### MaterialRefGS 基线的关键公式

**材质图的 alpha 混合**（式 4）：

```math
\mathbf{B}({\bm{x}})=\sum_{i=1}^{N}{\bm{b}}_{i}\,\alpha_{i}\,\hat{\mathcal{G}}_{i}({\bm{u}({\bm{x}}))\prod_{j=1}^{i-1}\left(1-\alpha_{j}\,\hat{\mathcal{G}}_{j}({\bm{u}({\bm{x}}))\right)
```

其中 ${\bm{b}}_i=[\lambda_i,m_i,r_i,\mathbf{n}_i]$（albedo、metallic、roughness、法线）；镜面项用 **split-sum** 分解为「视角相关的 BRDF 查表 + 预滤波环境贴图」。

**基线总损失**（式 5）：

```math
\mathcal{L}_{\text{base}}=\mathcal{L}_{rgb}+\lambda_{n\text{-}d}\mathcal{L}_{n\text{-}d}+\lambda_{n}\mathcal{L}_{n}+\lambda_{mv}\mathcal{L}_{mv}+\lambda_{\text{ref}}\mathcal{L}_{ref}
```

（光度 + 深度-法向一致性 + 单目法向先验 + 多视角材质一致性 + 反射强度正则）

**Clay 分支渲染**（式 6）：

```math
\hat{{\bm{c}}}({\bm{x}})=\sum_{i=1}^{N}\hat{{\bm{c}}}_{i}\,\alpha_{i}\,\hat{\mathcal{G}}_{i}({\bm{u}({\bm{x}}))\prod_{j=1}^{i-1}\left(1-\alpha_{j}\,\hat{\mathcal{G}}_{j}({\bm{u}({\bm{x}}))\right)
```

> 与镜面分支不同，$\hat{\mathbf{c}}(\mathbf{x})$ **按设计是视角无关的**（黏土表面只有漫反射着色变化）。

**Clay 损失**（式 7）：

```math
\mathcal{L}_{\text{clay}}=(1-\lambda_{\text{dssim}})\,\|\hat{\mathbf{I}}_{\text{clay}}-\mathbf{I}_{\text{clay}}\|_{1}+\lambda_{\text{dssim}}\,\big(1-\text{SSIM}(\hat{\mathbf{I}}_{\text{clay}},\mathbf{I}_{\text{clay}})\big)
```

$\lambda_{\text{dssim}}=0.2$（沿用 2DGS 系方法的标准光度权重）。

**总损失与梯度路由**（式 8–9）：

```math
\tilde{\nabla}_{\theta}=\nabla_{\theta}\mathcal{L}_{\text{clay}}+\beta\,\nabla_{\theta}\mathcal{L}_{\text{rgb}},\quad\theta\in\{{\bm{p}}_i,\alpha_i\},\quad\beta=0.1
```

```math
\mathcal{L}_{\text{total}}=\mathcal{L}_{\text{base}}+\lambda_{\text{clay}}\mathcal{L}_{\text{clay}},\qquad \lambda_{\text{clay}}=1.0
```

---

## 代码片段

```python
# 多视角序列构造：沿"时间轴"排列视角
# [clean conditioning views] | [noisy target views]
z_cond = [ltx2_vae.encode(view) for view in reflective_views]   # N 个单帧 latent
z_tgt  = [ltx2_vae.encode(view) for view in clay_views]
seq = torch.cat([torch.stack(z_cond), torch.stack(z_tgt)], dim=0)  # 时间轴 = 视角轴

# IC-LoRA: 按 token 分配时间步
timesteps = torch.cat([
    torch.zeros(N),                      # 条件 token：完全已观测
    sigma.expand(N),                     # 目标 token：shifted logit-normal 噪声水平
])

# 随机排序（而非按相机角度邻近）→ 跨数据集泛化更好
perm = torch.randperm(N)
```

```python
# Anchor 机制（训练时 p=0.5，推理时跨 chunk 注入）
if random() < 0.5:
    idx = torch.randperm(N)[:4]
    seq_tgt[idx] = gt_clay_latents[idx]    # 干净 anchor（inpainting 式生成）
# 推理：首 chunk 生成后，把 anchors 及其黏土输出注入每个后续 chunk
```

```python
# 选择性梯度路由（位置/不透明度：clay 主导 + RGB 弱残差）
loss_rgb = L_rgb(I_hat, I_gt)
loss_clay = (1-0.2)*L1(I_hat_clay, I_clay) + 0.2*(1 - SSIM(I_hat_clay, I_clay))

# 旋转/缩放：双方全强度
loss = loss_rgb + loss_clay
loss.backward()

# 位置/不透明度：只让 clay 全强度 + rgb 以 β=0.1 残差进入
with torch.no_grad():
    grad_pos = grad_pos_clay + 0.1 * grad_pos_rgb_detached
```

---

## 实验结论

- **翻译模型训练**: LTX-2 + **LoRA rank 32**，训练 **50,000 iterations**，**8× NVIDIA H100**，batch size 1/GPU，每个样本 = 单物体的 **24 个多视角图像**；p=0.5 暴露 4 个干净 anchor
- **重建模型**: 基于 **MaterialRefGS** 官方代码库；单目法向用 **Metric3Dv2** 估计（法向先验损失）
- **数据集**: 合成 —— Shiny Blender、Glossy Synthetic；真实 —— Ref-Real、Glossy-Real、NeRF-casting
- **指标**: Chamfer-L1（几何）、平均角误差（法线）、PSNR / SSIM / LPIPS（光度）

### Table 1 — 黏土图像一致性分析

| 指标 | 数值 |
|---|---|
| 前景 MSE（RGB vs 黏土） | 0.1407 |
| 背景 MSE（RGB vs 黏土） | **0.0001** |
| 掩码 IoU（黏土 vs GT mask） | **0.9915** |

**跨视角颜色方差**（同一 3D 点在不同视角的颜色方差 vs 整体方差）：

| 类型 | 跨视角方差 | 全局方差 | 方差比 $R_R$ ↓ |
|---|---|---|---|
| RGB | 0.0575 | 0.1318 | 0.4109 |
| **Clay** | **0.0163** | **0.0436** | **0.3661** |

> 黏土翻译**产生视角无关的外观**，为几何学习提供理想监督信号。差异仅出现在**细边界**处（与近乎零的背景 MSE、近乎 1 的掩码 IoU 一致）。

### Table 2 — Chamfer-L1 几何精度（Glossy Synthetic，↓ 越好）

| 方法 | Angel | Bell | Cat | Horse | Luyu | Potion | Tbell | Teapot | **Average** |
|---|---|---|---|---|---|---|---|---|---|
| GShader | 0.0060 | 0.0078 | 0.0175 | 0.0072 | 0.0101 | 0.0382 | 0.0308 | 0.0178 | 0.0169 |
| GS-IR | 0.0110 | 0.1097 | 0.0566 | 0.0149 | 0.0224 | 0.0593 | 0.0989 | 0.0693 | 0.0553 |
| R3DG | 0.0090 | 0.0403 | 0.0326 | 0.0117 | 0.0151 | 0.0380 | 0.0472 | 0.0488 | 0.0303 |
| Ref-GS | 0.0049 | 0.0084 | 0.0170 | 0.0060 | 0.0098 | 0.0090 | 0.0064 | 0.0084 | 0.0087 |
| GS-2DGS | 0.0061 | 0.0037 | 0.0074 | 0.0050 | 0.0076 | 0.0088 | 0.0078 | 0.0083 | 0.0068 |
| RGS | 0.0050 | 0.0071 | 0.0161 | 0.0069 | 0.0093 | 0.0081 | 0.0065 | 0.0090 | 0.0085 |
| MaterialRefGS (baseline) | 0.0038 | 0.0087 | 0.0130 | 0.0047 | 0.0061 | 0.0067 | 0.0049 | 0.0059 | 0.0067 |
| **Ours** | **0.0035** | 0.0069 | **0.0057** | 0.0047 | **0.0057** | **0.0064** | **0.0046** | **0.0057** | **0.0054** |

> **平均 Chamfer-L1 从 0.0067 → 0.0054（降低 19%）**；**Cat 场景从 0.0130 → 0.0057（降低 56%）** —— 提升最大的正是反射最强、最难的场景。
> 在 Shiny Blender 上，本文也取得**最低的平均角误差**。

### Table 3 — 跨骨干泛化性与法向先验的作用（Glossy Synthetic，Chamfer-L1 ↓）

| 方法 | Angel | Bell | Cat | Horse | Luyu | Potion | Tbell | Teapot | Average |
|---|---|---|---|---|---|---|---|---|---|
| RGS | 0.0050 | 0.0071 | 0.0161 | 0.0069 | 0.0093 | 0.0081 | 0.0065 | 0.0090 | 0.0085 |
| **RGS + Clay** | **0.0032** | 0.0067 | 0.0142 | **0.0042** | 0.0066 | 0.0077 | 0.0061 | 0.0110 | **0.0074** |
| MaterialRefGS | 0.0038 | 0.0087 | 0.0130 | 0.0047 | 0.0061 | 0.0067 | 0.0049 | 0.0059 | 0.0067 |
| **MaterialRefGS + Clay** | 0.0035 | 0.0069 | 0.0057 | 0.0047 | 0.0057 | 0.0064 | 0.0046 | 0.0057 | **0.0054** |
| MaterialRefGS + Clay − Normal | 0.0035 | **0.0047** | 0.0087 | 0.0044 | 0.0063 | 0.0064 | **0.0034** | 0.0060 | **0.0054** |

> **两个关键结论**：
> ① **clay 分支可插拔到任意骨干**（RGS 0.0085 → 0.0074；MaterialRefGS 0.0067 → 0.0054），效果**不依赖特定骨干**；
> ② **去掉单目法向先验后，clay 监督单独仍够用**（平均 0.0054 不变）。在曲率大的表面（如 Bell）法向估计噪声大时，clay 分支反而更好 —— 因为它走**独立渲染路径**，**不影响环境贴图与 BRDF 参数**。
> 另一优势：**黏土物体仍处于视频骨干的预训练 RGB 域内**，而法向/深度图需要**学习一种新的输出模态**。

### Table 4 — 五个基准数据集上的平均图像质量

| 方法 | Shiny Blender<br>PSNR/SSIM/LPIPS | Glossy Synthetic<br>PSNR/SSIM/LPIPS | Ref-Real<br>PSNR/SSIM/LPIPS | Glossy-Real<br>PSNR/SSIM/LPIPS | NeRF-casting<br>PSNR/SSIM/LPIPS |
|---|---|---|---|---|---|
| 2DGS | 29.58 / 0.946 / 0.084 | 26.07 / 0.918 / 0.088 | 24.15 / 0.661 / 0.292 | 21.20 / 0.804 / 0.243 | 24.66 / 0.822 / 0.225 |
| Ref-GS | 34.80 / 0.973 / 0.056 | 30.16 / 0.956 / 0.055 | 24.44 / 0.682 / 0.225 | 22.33 / 0.814 / 0.228 | 28.09 / 0.855 / 0.185 |
| RGS | 35.04 / 0.973 / 0.056 | 30.37 / 0.958 / 0.049 | 24.61 / 0.685 / 0.252 | 22.00 / 0.802 / 0.254 | 28.35 / 0.849 / 0.211 |
| MaterialRefGS | 34.68 / 0.975 / 0.054 | 30.60 / 0.960 / 0.048 | 24.73 / 0.698 / 0.183 | 22.65 / 0.818 / 0.186 | 28.07 / 0.845 / 0.148 |
| **Ours** | **35.12** / **0.976** / **0.053** | **30.68** / **0.961** / **0.047** | **24.74** / **0.699** / **0.183** | **23.04** / **0.824** / **0.184** | **28.69** / 0.853 / **0.137** |

> 光度质量提升**温和但一致**（主收益在几何）；NeRF-casting 上 LPIPS 从 0.148 → 0.137。

### 其他消融

- **梯度路由消融**（Table A6）：不加路由直接施加 clay 损失**已有帮助**，但**路由到位置与不透明度两者**给出最佳 PSNR。保留 RGB 的**弱残差梯度**也有益 —— 在**无纹理或平坦区域**，clay 图像提供的线索有限。
- **锁定期消融**：锁定 **~40% 总迭代数**最有利。

---

## 局限性

1. **依赖预训练视频扩散模型（LTX-2）** → 翻译模型训练成本高（**8×H100，50k 迭代**），虽 LoRA 轻量但仍需多卡算力
2. **黏土翻译是近似的**：背景 MSE 0.0001、掩码 IoU 0.9915 很好，但**细边界仍有差异**；翻译质量依赖输入反射是否被视频骨干的预训练域覆盖
3. **视角轴重解释的假设**：多视角图像**并非严格的连续视频**，跨视角一致性只是「迁移」而非「原生保证」；场景相机轨迹差异大时可能退化
4. **合成与真实需不同策略**（合成后期关掉 clay 分支，真实全程双损失）→ **策略需人工选择，缺少自动判据**
5. **梯度路由的 β=0.1 与锁定 40% 是超参**，未给出自适应方案
6. **Clay 域外泛化未验证**：只测了「黏土」这一种目标材质，未验证其他无反射目标（如「石膏」「素模」）
7. 依赖 MaterialRefGS 的 BRDF 管线，**未验证在 NeRF/其他表示上的通用性**

---

## 相关工作

- **MaterialRefGS**（Zhang et al. 2025a）— 主骨干（延迟着色 + BRDF 反射高斯泼溅）
- **2DGS**（Huang et al. 2024a）— 骨干基础；**Ref-GS / RGS / GS-IR / GShader / R3DG / GS-2DGS** — 对比方法
- **S2Dnet**（Wu et al. 2018）— **最早的「把镜面图翻译成漫反射对应物」思路**，但依赖局部对应一致性 + 用作经典 MVS 的预处理，**无 BRDF 学习**、网格精度有限；本文用视频扩散先验 + anchor 机制保证跨视角一致性，并与反射高斯泼溅优化集成
- **TensoSDF / NeRO** — 早期体渲染 + 显式反射率建模
- **3DGUT**（Wu et al. 2025）— 用无迹变换改善非线性相机下的高斯投影
- **Xie et al. 2025** — 可微高斯光追（间接光照）
- **LTX-2**（HaCohen et al. 2026）+ **LoRA**（Hu et al. 2022）+ **IC-LoRA**（Huang et al. 2024b）
- **[[2026-11-11_FastGRT-Vulkan-Gaussian-Ray-Tracing]]** — 同为 3DGS/光追方向的系统优化工作
- **[[2026-11-07_PRep-IR-Prior-Space-Reparameterization-Inverse-Rendering]]** — 逆渲染 + 先验空间重参数化
- **[[2026-11-10_X-Splat-Unified-Gaussian-RGB-Xray]]** — 3DGS 方向的另一种表示设计

---

## 实现建议

- **实现难度**: **高**。主要成本在翻译模型：需要 LTX-2 + LoRA（**8×H100 / 50k 迭代**）；重建侧则是在 MaterialRefGS 上加一个分支 + 梯度路由，**改造量中等**
- **预期性能**:
  - 几何：Chamfer-L1 **0.0054**（vs MaterialRefGS 0.0067，**−19%**；Cat 场景 **−56%**）
  - 光度：PSNR/SSIM/LPIPS **温和一致提升**（如 NeRF-casting LPIPS 0.148 → 0.137）
  - 跨骨干：RGS 0.0085 → 0.0074，MaterialRefGS 0.0067 → 0.0054
  - **可独立于法向先验工作**（去掉法向先验仍达 0.0054）
- **适用场景**:
  - ✅ **反射/镜面物体的 3D 重建与网格提取**（汽车、珠宝、消费电子、玻璃器皿）
  - ✅ 需要**高几何精度**的反射场景（Chamfer 提升最大的恰是最难的 Cat 等强反射场景）
  - ✅ 已有 3DGS 逆渲染管线（MaterialRefGS / RGS）—— **clay 分支可插拔**，改造门槛低
  - ⚠️ 无多卡算力（8×H100 级翻译模型训练）—— **需评估预算**
  - ⚠️ 需要内禀 BRDF 参数的高精度 —— 光度提升有限，主要价值在几何
- **建议动作**:
  1. 传递给 **@墨鱼丸**：核心可迁移项是「**用视频扩散先验生成无反射伪监督**」+「**选择性梯度路由**」两个机制。前者适用于**任何**外观-几何纠缠问题（不止反射）
  2. **选择性梯度路由**（共享参数上的多损失冲突消解）是一个**通用技巧**，可移植到其他双分支/双损失架构
  3. 若团队已有 MaterialRefGS 或 RGS 分支，**clay 分支可作为增量模块接入** —— 建议优先做此路径（避开 8×H100 的翻译模型成本）
  4. 关注 **LTX-2 权重可用性与许可**
- **优先级**: **中**（想法优雅且几何收益显著，但算力门槛高；增量接入路径的性价比更值得先评估）
