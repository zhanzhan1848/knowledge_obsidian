---
type: paper
created: 2026-10-22
updated: 2026-10-22
tags: [paper, 渲染, PBR, 材质生成, 逆渲染, 3D生成, VAE, FlowMatching, 2026, arXiv]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.22352
arxiv_id: 2610.22352
---

# SUPRA-TEX: 3D Generation with Super-Aligned Texture

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | SUPRA-TEX: 3D Generation with Super-Aligned Texture |
| **作者** | Chen Yang; Jiemin Fang; Fanpeng Meng; Zihao Huang; Jichen Pang; Guanjun Wu; Zhikuan Bao; Qi Tian |
| **单位** | Huawei Inc.; Shanghai Jiao Tong University; Huazhong University of Science and Technology（Zikuan Bao 项目负责人，Qi Tian 通讯） |
| **发表** | arXiv preprint 2026-10-15（cs.CV 主，cs.GR） |
| **链接** | [原文](https://arxiv.org/abs/2610.22352) |
| **项目页** | https://supra-3d.github.io/supratex/ |
| **代码/权重** | 项目页已发布（code & checkpoints released） |
| **DOI** | 10.48550/arXiv.2610.22352 |

---

## 核心贡献

> 把"参考图材质估计"从 3D 生成器身上卸下来，交给 2D 生成先验 + 相机投影建立**物理材质观测**，让 3D 生成器专注于"保留可见细节 + 补全不可见表面"，从而实现 super-alignment（超对齐）。

1. **Image-to-Material Translation（2D 材质翻译）**：训练 MLLM 图像编辑模型，**一次前向**从参考照片预测**去光照的 PBR 图**（albedo + metallic-roughness + 辅助 normal），在参考分辨率上解耦光照与固有材质。
2. **Native Observation Encoding（原生物观测编码）**：把 2D PBR 预测经相机投影贴到**可见表面**，用**冻结的预训练材质 VAE 编码器**编成**原生观测潜变量**，与生成目标共享潜空间 → 3D 生成器直接"读"物理材质观测，而非抽象视觉特征。
3. **Interleaved Flow Transformer（交错流 Transformer）**：观测潜变量作为**固定只读锚点**，在每个 block 提供 K/V；生成流在"仅更新无观测的单元"与"全表面"之间**交替更新**，向无观测单元倾斜算力，保证参考保真 + 补全连贯。
4. **仅用公开数据集训练**，在 geometry-conditioned texturing 与端到端资产生成上均达 SOTA，并在真实照片上匹敌或超过主流商业系统。

---

## 技术方案

### 核心思想

两种主流外观生成范式各有缺陷：

- **多视角合成（multi-view synthesis）**：跨视角差异 → 接缝与鬼影；混合冲突预测 → 参考细节被模糊。
- **原生 3D 生成（native 3D generation）**：避免融合伪影，但细节对齐困难。如 **TRELLIS.2** 用 3D 材质 VAE 压缩表面 PBR 属性，但 image cross-attention **不提供图像细节与 3D 表面位置之间的显式对应**，生成器只能"猜"细节该落在哪。CUPID / Pixal3D 等通过相机投影把高分辨率图像特征提升到 3D，建立了空间对应，但**条件仍是视觉特征，而非材质观测**——于是 3D 生成器被迫同时承担三件事：(a) 从视觉特征推断 PBR 属性、(b) 在对应表面位置重建精细细节、(c) 为未观测区域合成材质。

**论文主张**：这三件事不该压在一个 3D 生成器上。3D 训练数据稀缺，混合任务加剧学习负担。应把 (a) 卸载给 2D 生成先验，把 (b) 用相机投影显式建立对齐，只让 3D 生成器做 (c)。

论文把这一要求命名为 **super-alignment**：精确复现精细文字、logo、图案到对应的可见表面位置，同时以与可见外观一致的方式补全未观测区域。

### 关键技术

| 技术 | 说明 |
|------|------|
| **材质表示** | 基于 **TRELLIS.2 的 O-Voxel** 表示，表面属性元组 $\mathcal{T}(\mathbf{p}) = (\mathbf{a}(\mathbf{p}), m(\mathbf{p}), r(\mathbf{p}), \alpha(\mathbf{p}))$，即 **albedo $\mathbf{a}\in\mathbb{R}^3$、metallic $m\in[0,1]$、roughness $r\in[0,1]$、opacity $\alpha\in[0,1]$**。几何与材质各有独立的**稀疏 VAE** 压缩。 |
| **2D 材质翻译器 $F_{2D}$** | 改造多模态 **DiT** 主干（微调自 FireRed-Image-Edit-1.1；附录提到 Qwen-Image-2.1 的变体），用**因子化的模态轴联合注意力（factorized modality-axis joint attention）**联合预测 albedo、metallic–roughness、辅助 normal，在**对应空间位置**跨输出模态交换特征。 |
| **打包技巧** | 为复用 3 通道预训练图像 VAE，把 $\hat{m}$ 与 $\hat{r}$ 与一个**常数通道**打包成 3 通道 MR 图——同时恰好满足预训练材质编码器的输入格式。 |
| **一步推断** | 在固定最大噪声端点 $\sigma=1.0$ 用 latent flow-matching 目标训练；推断时在该端点做**单次 DiT 前向（单张 H800 上 1.2 s）**，无需迭代去噪，直接得到干净材质潜变量，VAE 解码为 $1024\times1024$ 材质图。 |
| **过滤式表面投影** | 通过相机投影 $\pi$ 把每个前景像素 $\mathbf{u}$ 关联到其**第一个可见表面命中** $\mathbf{p}$；推断时额外做**前景掩膜腐蚀（erosion）**与**局部深度不连续过滤**，剔除不可靠的边界对应。保留下来的对应集 $\mathcal{H}_{valid}$ **为所有 PBR 通道共享**。 |
| **稀疏坐标编码** | 关键技巧：零填充未观测区域会给无观测体素赋予**具体材质值（如黑色 albedo）**，这是错误的；论文改用材质 VAE 编码器的**稀疏坐标架构**直接**省略未观测体素**，只编码可见支撑集 $\mathcal{P}_o$。该编码在采样前**只跑一次并全程固定**。 |
| **空间观测元数据** | 每个潜单元聚合多个表面体素，故"被观测单元"很少被完全覆盖；论文额外编码**覆盖度与边界元数据**引导补全。 |
| **交错 Flow Transformer** | 双流：固定只读观测流 $O$ 提供 K/V，生成流 $X$ 的 block **交替**做「仅无观测单元 $\mathcal{U}$ 更新」与「全表面 $\mathcal{S}$ 更新」，把更多更新分配给无观测单元，同时保留全表面交互保证连贯性。 |
| **可扩展接口** | 观测按 3D 表面坐标索引 → **同一接口**即可接入额外视角（含 2D 生成的背视图）与交互式 2D 编辑，**无需重训 3D 主干**。 |

---

## 公式

**2D 材质翻译**（式 1）：

```math
\widehat{\mathcal{T}}_{\mathrm{2D}} = F_{\mathrm{2D}}(\mathcal{I}) = \left(\widehat{\mathbf{a}},\ \widehat{m},\ \widehat{r}\right)
```

**过滤式表面投影与体素化**（式 2）：

```math
\mathcal{P}_o = \operatorname{Voxelize}\Bigl(
   \left\{\,\left(\mathbf{p},\ \widehat{\mathcal{T}}_{\mathrm{2D}}(\mathbf{u})\right)
          \ \Big|\ (\mathbf{u},\mathbf{p})\in \mathcal{H}_{valid}\right\}\Bigr)
```

其中 $\mathbf{u}$ 是 2D 像素坐标，$\mathbf{p}$ 是其在网格 $\mathcal{M}$ 上的表面位置；$\mathcal{P}_o$ **省略**无有效观测的区域。

**原生观测潜变量编码**（式 3，取后验均值）：

```math
E_{\mathrm{mat}}(\mathcal{P}_o)
   = \left\{\,(s, z_s^{o}) \;\middle|\; s\in \mathcal{S}_o\,\right\},
   \qquad \mathcal{S}_o \subseteq \mathcal{S}
```

其中 $\mathcal{S}_o$ 是"接收到观测的潜单元"索引集合；这组 $\{z_s^{o}\}$ 即**原生观测潜变量**。

**材质元组定义**：

```math
\mathcal{T}(\mathbf{p}) = \bigl(\mathbf{a}(\mathbf{p}),\ m(\mathbf{p}),\ r(\mathbf{p}),\ \alpha(\mathbf{p})\bigr),
\qquad \mathbf{a}\in\mathbb{R}^3,\ m,r,\alpha\in[0,1]
```

---

## 实验结论

### 训练配置

- **3D 生成器**：60 个 Transformer block；self-attention 从 **TRELLIS.2** 初始化，其余组件随机初始化；预训练材质 encoder/decoder **冻结**。
- **训练**：AdamW，**64 GPU**，全局 batch size **576**。
- **推断**：**25 步 Euler**，**不用** classifier-free guidance。
- **2D 材质估计器**：FireRed-Image-Edit-1.1，$1024\times1024$ 分辨率。

### 评测数据集（与训练集无重叠）

- **DTC-Tex**：100 个纹理丰富的产品扫描，选自 Digital Twin Catalog。
- **Complex-Tex**：110 个 Sketchfab 网格，铭文更密、图案更细、形状更多样。
- **训练数据**：**仅公开 3D 数据集**。

### 结果（给定几何，§4.1）

在参考视图 + **15 个新视角**渲染，对比 **10 个基线**（原生 3D 生成 + 专用纹理化方法）；PBR 方法额外评 albedo / metallic / roughness。

| 对比 | DTC-Tex | Complex-Tex |
|------|-----------|-------------|
| vs Pixal3D⋆（特征条件） shaded PSNR | **+1.7 dB** | **+1.2 dB** |
| vs Pixal3D⋆ albedo PSNR_fg | **+2.0 dB** | **+0.9 dB** |
| vs LumiTex（多视角 PBR） shaded PSNR | **> 2 dB** 落后 | **> 2 dB** 落后 |
| vs LumiTex albedo PSNR | **> 1.5 dB** 落后 | **> 1.5 dB** 落后 |

SUPRA-Tex 在**两个数据集的全部 shaded 与 PBR 指标上领先**，且 metallic/roughness MAE 最低。

### 视图切分（§4.1，Table 2）

| 切分 | DTC-Tex 增益 | Complex-Tex 增益 |
|------|-------------|------------------|
| 参考视图 shaded PSNR_fg | **+2.56 dB**（基线 TEXGen） | **+0.95 dB**（基线 TEXGen） |
| 新视角 shaded PSNR_fg | **+1.76 dB**（基线 Pixal3D⋆） | **+1.09 dB**（基线 Pixal3D⋆） |

所有指标两个切分、两个数据集**均为最优均值**。

### 端到端单图生 3D（§4.2，Table 3）

基线：TRELLIS.2、Pixal3D⋆、**Hunyuan3D 2.1**、Step1X-3D、UniLat3D、CUPID。

| 指标 | DTC-Tex | Complex-Tex |
|------|----------|-------------|
| 四视角 PSNR（vs Pixal3D⋆） | **+1.77 dB** | **+2.49 dB** |
| PSNR_fg（vs Pixal3D⋆） | **+0.89 dB** | **+1.60 dB** |
| LPIPS 下降 | **−64.8%** | **−58.6%** |

全部 **9 个指标、2 个数据集均领先**。因与 Pixal3D⋆ **共享预测几何**，说明优势来自外观管线本身。

### 商业系统对比（§4.3，Table 4）

- 对比 **5 个商业系统**，**45 张**真实与合成图像；商业对比**仅用两视角条件**（参考图 + 由其合成的背视图）。
- 人工成对偏好：**51.1% – 84.8%** 胜率。
- VLM PBR 评分：**8.67/10 并列最高**。

---

## 局限性

- **依赖强 2D/3D 先验**：需要 TRELLIS.2 系的材质 VAE、FireRed/Qwen 系 DiT，训练资源门槛高（64 GPU），非轻量方案。
- **2D PBR 估计的固有误差会传导**：albedo/metallic/roughness 的预测误差直接进入 3D 生成器，上游 MLLM 的 intrinsic decomposition 能力成为天花板。
- **边界的"保守丢弃"策略**：前景掩膜腐蚀 + 深度不连续过滤会**丢掉一部分真实可见表面**，极端遮挡/复杂轮廓下覆盖率损失。
- **背视图依赖合成**：商业对比中背视图由参考图 2D 合成而来，并非真实多视图采集。
- **Mesh + camera 依赖**：给定几何设置需 ground-truth 网格与相机位姿；端到端设置下几何质量（继承自 Pixal3D⋆）仍是上限。

---

## 相关工作

- [[TRELLIS-2]]（材质 VAE、O-Voxel 表示基座）
- Pixal3D / CUPID（相机投影提升图像特征）
- EASI-Tex、AlignTex、TexFusion、Paint-it、DreamMat（多视角与优化式纹理化）
- NaTex / LaFiTe / TEXTRIX（潜纹理生成）
- 同期 PBR 数据集工作：[[2026-10-15-RoboCloth-Neural-Reflectance-Dataset]]
- 同方向逆渲染：[[2026-10-15-Sketch-to-Scene-Relightable-Garment]]

---

## 实现建议

- **实现难度**：**高**。训练需 64 GPU；但**推理侧可直接复用现成权重**（代码与 checkpoint 已发布）。
- **预期性能**：推断时 2D 材质估计单次 H800 前向 **1.2 s**；3D 生成 **25 步 Euler**、无 CFG。
- **适用场景**：
  - 单图 → 可重光照 3D 资产（产品数字孪生、embodied AI 场景资产）
  - 需要参考细节 100% 保真（文字/logo/图案）的贴图生成
  - 交互式材质编辑（同一观测接口可挂载 2D 编辑，无需重训 3D 主干）
- **对 @墨鱼丸 的建议**：论文中**最值得单独抽取的可复用技术有两处**——
  1. **稀疏观测编码**（§3.3）：不要零填充未观测体素，而是用稀疏坐标架构省略之。这对任何"部分观测 → 稠密补全"的神经材质/神经场任务都通用，**实现成本极低、收益明确，建议优先复用**。
  2. **交错更新策略**：把算力向"无观测单元"倾斜、同时周期性全表面交互保证连贯——这是稀疏补全任务的通用训练技巧，可迁移到我们的神经渲染缓存补全。
- **优先级**：**中**。整体框架偏生成模型应用，但上述两点是可迁移的工程技巧。