---
type: paper
created: 2026-10-31
updated: 2026-10-31
tags: [paper, fluid-rendering, volume-rendering, volumetric-video, diffusion, 4d-consistency, siggraph-asia, cs.CV]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2610.30023
---

# RealMe: Immersive Volumetric Video from Minimal Captures

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | RealMe: Immersive Volumetric Video from Minimal Captures |
| **作者** | Chenxu Zhou, Zhiyuan Yu, Yudong Jin, Yinji Shentu, Yu Zhang, Jiaming Sun, Xiaowei Zhou (浙江大学 ZJU3DV) |
| **发表** | arXiv 2026-10-21 · **SIGGRAPH Asia 2026 Conference Papers** · cs.CV |
| **链接** | [原文](https://arxiv.org/abs/2610.30023) |
| **项目页** | https://zju3dv.github.io/realme |

---

## 核心贡献

> 以**高分辨率视频扩散模型**为核心，把稀疏低分辨率采集"增强"为 **2K 分辨率、4D 一致**的视频，再重建沉浸式体积视频——解决了扩散方法"分辨率低 + 4D 不一致"两大硬伤。

1. **统一框架**：RealMe 将稀疏采集 → 高分辨率 4D 一致视频 → 体积视频重建统一在一个以视频扩散模型为中心的框架内。
2. **布局感知位置编码**：从采集视频构造**辅助数据**，编码为潜变量并配合 layout-aware positional embeddings，使扩散模型**感知多视角采集布局**。
3. **因子化时空注意力适配**：扩散模型改造注意力以适配多视角采集布局，跨视角与跨时间去噪 → 捕获时间动态与多视角关系。
4. **潜空间频域损失（latent frequency loss）**：在潜空间提供**频域监督**，缩小生成视频与真实采集之间的数据差距——这是保证"生成细节"不偏离真实分布的关键技巧。

---

## 技术方案

### 核心思想

```
稀疏低分辨率采集
      ↓ 构造辅助数据 + 布局感知位置编码
   潜变量（latents）
      ↓ 视频扩散模型（因子化时空注意力）
   2K 高分辨率、4D 一致的视频
      ↓
   沉浸式体积视频重建
```

> 💡 **为什么需要"频域"损失？** 扩散模型在潜空间做的是**低通优先**的去噪，高频细节容易丢失或产生"塑料感"。在潜空间直接加频域监督项，等于**显式约束高频分量的分布**，让增强结果在统计上贴近真实采集（而不是贴近扩散先验）。这对流体/烟雾这类**本身高频丰富**的内容尤其重要。

### 关键技术

| 技术 | 说明 |
|------|------|
| **高分辨率视频扩散模型** | 核心引擎，非传统多视角重建后处理 |
| **布局感知位置编码** | 让扩散模型知道每个相机在空间中的位置 → 跨视角一致 |
| **因子化时空注意力** | 时空解耦，降低多视角 × 多时序的注意力开销 |
| **潜空间频域损失** | 频域监督，弥合生成-真实数据差距 |
| **DNA-Rendering 基准** | 公开基准用于评测 |
| **RealVV 自采数据集** | 团队自采的体积视频数据集 |

---

## 公式

**布局感知潜变量构造**（示意）：

```math
z = \mathcal{E}\!\left(A(x, \mathcal{L})\right) \oplus P_{\text{layout}}(\mathcal{L})
```

其中 $\mathcal{L}$ 为采集布局（相机位姿集合），$P_{\text{layout}}$ 为布局感知位置编码。

**潜空间频域损失**：

```math
\mathcal{L}_{\text{freq}}
= \left\| \mathcal{F}\!\left[\hat{z}_{\text{pred}}\right] - \mathcal{F}\!\left[z_{\text{target}}\right] \right\|^2,
\qquad \mathcal{F} = \text{离散傅里叶变换}
```

**因子化时空注意力**：

```math
\text{Attn}(Q,K,V) = \text{Attn}_{\text{time}}\!\left(\text{Attn}_{\text{space}}(Q,K,V)\right)
```

---

## 实验结论

- **数据集**：
  - 公开基准：**DNA-Rendering**（体积视频重建标准基准）
  - 自采：**RealVV** 数据集
- **结果**：在视觉保真度与 **4D 一致性**两方面均**优于当时最先进方法**。
- **能力**：可从**最小化采集**（稀疏 + 低分辨率）生成沉浸式体积视频。

---

## 局限性

- 依赖**高分辨率视频扩散模型**，推理成本高（多次去噪），不适合实时。
- 生成式增强必然存在**保真度上限**——测量证据可能被扩散先验"改写"。
- 主要面向**静态场景 + 相机运动**的体积视频；对**流体本身剧烈运动**（独立于相机的动态）的处理未充分展开。
- 需**多视角采集布局**信息（位姿），单目输入不适用。

---

## 相关工作

- [[2026-10-31-Sparse-View-4DGS-Spatiotemporal-Priors]] — 姊妹作，同为 SIGGRAPH Asia 2026，走"稀疏重建 + 先验"路线（对比：本文走"扩散增强"路线）
- [[2026-10-08-CAGS-Volumetric-Video-Streaming-3DGS]] — 体积视频流式
- [[2026-10-20-FluidGen-Physics-Aware-Fluid-Video]] — 流体视频生成（本文的泛化到流体场景的潜在方向）

---

## 实现建议

- **实现难度**：高（需要高分辨率视频扩散模型的训练与推理基建 + 体积重建管线）
- **预期性能**：离线；扩散去噪为主要开销
- **适用场景**：**沉浸式体积视频**（XR 观看、虚拟制片、体积捕捉升级）、**低质量采集的抢救**
- **推荐度**：⚠️（工程门槛高，但对体积视频方向是重要参考）
- **可迁移到流体渲染的点**：
  1. **潜空间频域损失** → 可直接用于**流体 4DGS / NeRF 的重建监督**：传统 L2/L1 重建损失在高频（细丝烟雾、水花、飞沫）上权重不足，频域损失能显著改善细节保真度
  2. **布局感知位置编码** → 若流体在多机位下被拍摄，可让重建网络感知相机布局，提升跨视角一致性
  3. **因子化时空注意力** → 流体动态 + 多视角的联合建模，成本可控
