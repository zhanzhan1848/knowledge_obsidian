---
tags: [几何, SIGGRAPH Asia 2026, 体积视频, 视频扩散, 多视图, 4D一致性, 神经渲染]
date: 2026-10-24
source: arXiv
arxiv_id: 2610.30023
venue: SIGGRAPH Asia 2026 Conference Papers (arXiv cs.CV)
status: new
authors: Chenxu Zhou, Zhiyuan Yu, Yudong Jin, Yinji Shentu, Yu Zhang, Jiaming Sun
categories: [cs.CV]
arxiv_url: https://arxiv.org/abs/2610.30023
project_page: https://zju3dv.github.io/realme
---

# RealMe: Immersive Volumetric Video from Minimal Captures

## 一句话总结

**SIGGRAPH Asia 2026 会议论文**：用**高分辨率视频扩散模型**把稀疏、低分辨率的采集素材增强为 **2K、4D 一致**的多视图视频，再据此重建体积视频 —— 通过**分解时空注意力（factorized spatio-temporal attention）**适配多视图采集布局、用**潜空间频域损失**弥合生成视频与真实采集的数据差距，在 DNA-Rendering 基准与自建 RealVV 数据集上超越 SOTA。

> 本次窗口内检索到的**唯一一篇 SIGGRAPH Asia 2026 正式录用论文**，与几何处理相关在「**多视图几何一致性 + 4D 重建**」一侧。

---

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | RealMe: Immersive Volumetric Video from Minimal Captures |
| **作者** | Chenxu Zhou, Zhiyuan Yu, Yudong Jin, Yinji Shentu, Yu Zhang, Jiaming Sun (浙大 3D Vision Lab) |
| **发表** | **SIGGRAPH Asia 2026 Conference Papers**（2026-12-01~04, 吉隆坡）；arXiv cs.CV 2026-10-21 |
| **链接** | [原文](https://arxiv.org/abs/2610.30023) |
| **项目页** | [zju3dv.github.io/realme](https://zju3dv.github.io/realme) |

---

## 核心贡献

1. **统一框架**：高分辨率**视频扩散模型** → 把有限采集增强为 2K、4D 一致的视频 → 体积视频重建
2. **采集布局感知的因子化时空注意力**：让扩散模型适配**多视图采集布局**（谁在哪个视角、什么时刻），跨视角与跨时间去噪
3. **潜空间频域损失（latent frequency loss）**：在潜空间做**频域监督**，缩小"生成视频 ↔ 真实采集"的域间隙
4. **辅助数据 + 布局感知位置编码**：从采集视频构造辅助数据编码为潜变量，与位置编码一同输入
5. **两个基准**：公开的 **DNA-Rendering** + 自采 **RealVV** 数据集

---

## 技术方案

### 关键技术

| 技术 | 说明 |
|------|------|
| **视频扩散模型** | 主体是 2D 视频扩散模型（非 3D 扩散），通过多视图 + 时间维扩展 |
| **因子化时空注意力** | 把注意力分解为「空间（跨视图）」与「时间」两个方向，降低 3D 联合注意力的开销 |
| **布局感知位置编码** | 编码相机位姿/采集布局信息 → 模型知道每个潜变量属于哪个视角、哪一帧 |
| **潜空间频域损失** | 在潜空间的频域做监督，而非像素域 → 抑制高频伪影、弥合域间隙 |
| **辅助数据构造** | 从采集视频额外构造辅助信号，编码进潜变量 |
| **4D 一致性** | 生成的多视图视频在时间上保持一致 → 支撑体积视频重建 |

### 核心公式

**因子化时空注意力**（示意）：

$$\text{Attn} = \text{Attn}_{\text{spatial}}(Q, K, V; \text{view-index}) \circ \text{Attn}_{\text{temporal}}(Q, K, V; \text{frame-index})$$

**潜空间频域损失**：

$$\mathcal{L}_{\text{freq}} = \big\| \mathcal{F}(\hat{z}) - \mathcal{F}(z_{\text{gt}}) \big\|_2^2, \qquad \mathcal{F} = \mathcal{F}_{\text{FFT}}$$

（潜空间频谱而非像素频谱 → 直接约束模型已编码的语义频率结构）

**总体目标**：

$$\mathcal{L} = \mathcal{L}_{\text{video-diffusion}} + \lambda \mathcal{L}_{\text{freq}}$$

---

## 实验结论

- **基准**：**DNA-Rendering**（公开）；**RealVV**（作者自采）
- **指标**：视觉保真度（visual fidelity）、**4D 一致性**（4D consistency）
- **结果**：RealMe 在两项指标上均**超越现有 SOTA**
- **消融**：因子化时空注意力、潜空间频域损失的各自贡献
- **数据**：证明**低分辨率/稀疏采集 → 高质量体积视频**的可行性

---

## 局限性

- **依赖视频扩散模型** → 推理成本高（数十步去噪），非实时
- **4D 一致性靠生成保证**，并非几何意义上的严格一致 → 重建后仍有漂移风险
- **需要多视图采集布局**（至少若干相机），单目不适用
- 未覆盖**拓扑/几何精度**评估（论文重点是视觉与一致性，而非几何误差）
- 潜空间频域损失的**频域权重选择**敏感

---

## 相关工作

- 相关笔记：4D Gaussian Splatting、Dynamic 3DGS、Nerfies、NeRF-DS、DNA-Rendering、video diffusion model、multi-view diffusion
- [[2026-10-22-2610-30910-H-2DGS-Height-Field-Gaussian-Neurosurgical-Surface]]（同批，同实验室）
- [[2026-10-24-2610-31455-MixPT-Point-Transformer-Window-Global-Attention]]

---

## 实现建议

### 可行性分析：RealMe

**算法复杂度**
- 时间复杂度：S 步去噪 × (因子化注意力 O(N_v·N_t·N_pix) 的分摊) → 远低于全 3D 联合注意力
- 空间复杂度：O(N_pix · N_v · N_t) 的潜变量（2K 多视图 × 多帧 → 显存密集）

**实现难度**
- 算法复杂度：**高**（视频扩散 + 多视图布局编码 + 频域损失 + 训练数据构造）
- 数值稳定性：**好**（扩散模型 + 频域损失 + 因子化注意力的组合稳定）
- 依赖项：**PyTorch**、**视频扩散 backbone**（如 Stable Video Diffusion / Wan 类）、**CUDA**、**Nerfstudio / 4DGS**（下游重建）

**推荐结论**：✅ **推荐跟踪（会议论文，质量高）** / ⚠️ 全量复现成本高

### 可迁移的技术点

1. **因子化时空注意力**：即使不做体积视频，做**多视图几何任务**（多视图一致的几何生成/重建）时，"空间（视角）× 时间"分解注意力 + 布局感知位置编码 是可复用的架构
2. **潜空间频域损失**：在潜空间而非像素空间做频域约束，成本低（FFT on latents），可作为我们多视图重建的**正则项**试加
3. **"生成先增强、后重建"的两阶段范式**：用生成模型补齐稀疏采集，再走经典重建管线 —— 是一条**绕过数据稀疏**的务实路线

**开源参考**
- 下游重建：Nerfstudio（4DGS / Instant-NGP）、3DGS 代码库
- 扩散 backbone：Stable Video Diffusion、SVD-XT、Diffusion Transformer 系列
- 评测：DNA-Rendering 基准自带指标

**适用场景**：体积视频采集、远程临场（telepresence）、体育赛事多视角重建、影视级自由视点播放、虚拟主播

---

## 🧭 评估

✅ **推荐收录**。作为本次窗口内**唯一的顶会正式录用论文**（SIGGRAPH Asia 2026），收录价值本身较高。虽然重心在神经渲染/生成而非经典几何处理，但其「多视图 + 4D 一致性」的问题设定与几何处理高度相关，且技术点可迁移。

**建议动作**：关注 SIGGRAPH Asia 2026（2026-12-01~04, 吉隆坡）正式出版版本与补充材料。
