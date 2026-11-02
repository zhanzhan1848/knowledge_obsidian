---
type: paper
created: 2026-11-01
updated: 2026-11-01
tags: [paper, 渲染, 神经渲染, Gaussian-Splatting, 立体视觉, 度量尺度, 新视角合成, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.35902
---

# StereoSplat: Metric-Scale Novel View Synthesis via Stereo-Grounded Gaussian Splatting

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | StereoSplat: Metric-Scale Novel View Synthesis via Stereo-Grounded Gaussian Splatting |
| **作者** | Vladimir Yugay, Denis Rozumny, Theo Gevers, Elias Vansteenkiste, Martin R. Oswald, Diogo C. Luvizon（ETH Zürich 等） |
| **发表** | arXiv preprint 2026-09-29（cs.GR / eess.IV） |
| **链接** | [原文](https://arxiv.org/abs/2610.35902) · [HTML](https://arxiv.org/html/2610.35902v1) |
| **DOI** | 10.48550/arXiv.2610.35902（DataCite pending） |
| **代码** | 论文未给出仓库链接（待跟踪） |

---

## 核心贡献

> 单目方法**无视双目对（binocular pairs）的本质**，导致无法取得可靠的**度量尺度（metric-scale）**新视角合成。StereoSplat 采用**原生立体架构**：从基础立体模型（foundation stereo backbone）提取稠密多尺度特征与视差，送入专用高斯解码器，直接翻译为**逐像素 3D 高斯**。

1. **原生立体架构（native stereo）**：不做「单目 + 立体后处理」，而是从立体骨干网络直接提取稠密多尺度潜特征与视差。
2. **专用高斯解码器**：cross-view 特征融合 + **门控深度精化（gated depth refinement）**，把立体特征直接转为逐像素 3D 高斯。
3. **深度自适应聚合（depth-adaptive aggregation）**：解决重叠视角间**逐像素预测的高冗余** —— 在**逆深度空间**中聚类并聚合图元，同时保留细粒度细节。
4. **XRStereo 数据集**：大规模**合成**立体视频数据集，包含多种 rig 配置，专门匹配真实世界平台的物理硬件。
5. **结果**：仅用合成数据训练，在挑战性基准上取得新视角合成**深度精度的大幅提升**，同时保持高保真合成；并可**零样本迁移**到真实立体视频，应用于混合现实、自动驾驶、机器人。

---

## 技术方案

### 核心思想

**度量的来源是视差**。单目方法靠深度歧义性（scale ambiguity）猜测尺度，而立体匹配给出**有度量**的视差 $\Rightarrow$ 深度可由视差反解：

```math
Z = \frac{f \cdot B}{d}
```

其中 $f$ 为焦距、$B$ 为基线长度、$d$ 为视差。立体骨干网络在**像素对齐**的稠密视差上给出这一度量锚点。

问题在于：逐像素预测高斯会造成**跨视角的巨量冗余**（左右相机的像素在物理上对应同一表面点）。StereoSplat 用**逆深度空间聚类聚合**来解决：

- 在逆深度 $1/Z$ 空间中，同一表面的像素天然靠近 → 聚类天然对齐
- 聚合时保留细节（不是简单取均值，而是学习式的聚合）

### 关键技术

| 技术 | 说明 |
|------|------|
| **Foundation stereo backbone** | 预训练立体匹配骨干，输出稠密视差 + 多尺度特征 |
| **Cross-view feature fusion** | 跨视图特征融合，聚合左右相机的互补信息 |
| **Gated depth refinement** | 门控深度精化，控制视差→深度的转换精度 |
| **Depth-adaptive aggregation** | 在**逆深度空间**聚类并聚合高斯，消除跨视角冗余同时保留细节 |
| **XRStereo** | 大规模合成立体视频数据集，多 rig 配置 |

### 公式

视差到深度的转换（度量尺度的来源）：

```math
Z(u) = \frac{f\,B}{d(u)}
```

逆深度空间的聚类（冗余消除的关键）：

```math
\tilde{z}(u) = \frac{1}{Z(u)} = \frac{d(u)}{f B}
```

在 $\tilde{z}$ 空间中聚类，使物理上同一表面的跨视角像素聚合到一起：

```math
\mathcal{C}_k = \Big\{ u : \big\| \tilde{z}(u) - \mu_k \Big\| < \tau \Big\},
\qquad
\mu_k = \frac{1}{|\mathcal{C}_k|}\sum_{u \in \mathcal{C}_k} \tilde{z}(u)
```

门控深度精化（学习式的残差修正）：

```math
Z_{\mathrm{refined}}(u) = Z(u) \cdot \big(1 + g_\theta(F(u), d(u))\big),
\qquad g_\theta \in [-\,\epsilon,\ \epsilon]
```

逐像素高斯解码：

```math
(\mu_u, \Sigma_u, \alpha_u, c_u) = \mathrm{Dec}\big(\mathrm{Fuse}(F_L(u), F_R(u)), Z_{\mathrm{refined}}(u)\big)
```

### 代码片段

```python
# 概念级伪代码：立体接地的高斯解码 + 逆深度空间聚合
def stereosplat_forward(left, right, rig):
    # 1) 基础立体骨干：稠密多尺度特征 + 视差
    feat_l, feat_r, disp = stereo_backbone(left, right)

    # 2) 跨视图特征融合
    fused = cross_view_fusion(feat_l, feat_r)

    # 3) 门控深度精化（度量尺度的来源）
    depth = rig.f * rig.baseline / (disp + eps)       # 视差 -> 度量深度
    depth = depth * (1 + gate(fused, disp))            # 门控残差修正

    # 4) 逐像素高斯解码
    gaussians = decode_gaussians(fused, depth)

    # 5) 逆深度空间聚类聚合（消除跨视角冗余，保留细节）
    inv_depth = 1.0 / depth
    clusters = cluster_in_inverse_depth(inv_depth)
    gaussians = aggregate_gaussians(gaussians, clusters)  # 学习式聚合
    return gaussians
```

---

## 实验结论

- **训练数据**：**仅 XRStereo 合成数据**（多种 rig 配置）
- **评测**：挑战性基准上的新视角合成（画质 + **深度精度**）+ 真实立体视频零样本迁移
- **结果**：
  - 渲染新视角的**深度精度相对既有基线有实质性提升**（substantial improvements in depth accuracy of rendered novel views）
  - 同时保持**高保真的新视角合成**
  - **零样本迁移到真实立体视频**，面向混合现实、自动驾驶、机器人应用
- **数值细节**：摘要未给出具体 PSNR/SSIM/LPIPS 与深度误差数值表，也未列出基线名称

---

## 局限性

1. **摘要未给量化表**：无法从摘要判断相对具体基线的增益幅度
2. **依赖高质量立体骨干**：视差质量是上游瓶颈；弱纹理、反光、重复纹理区域立体匹配本身不可靠
3. **需要已知标定参数** $f$、$B$：度量尺度的引入以精确标定为前提
4. **仅用合成数据训练**：合成-真实域差距（glass、反射、动态物体）可能限制真实场景表现，尽管论文声称可零样本迁移
5. **逐像素预测 + 聚合的计算开销**：即使聚合消除了冗余，骨干网络与逐像素解码的成本依然存在
6. **立体硬件约束**：需要双目相机（双摄），单目设备不适用

---

## 相关工作

- [[2026-11-01_GeoGSplat-Geometry-Grounded-Non-Pixel-Aligned-GS]] — 同为前馈 3DGS，同样解决深度/几何约束缺失
- [[2026-11-01_BudSplat-Feed-Forward-3DGS-Rendering-Budget]] — 前馈 3DGS 的冗余与预算
- [[2026-10-31_GOFish-Fisheye-Gaussian-Splatting-Mesh-Extraction]] — 特殊相机模型（鱼眼）下的 3DGS
- [[2026-10-31_RealMe-Immersive-Volumetric-Video-Minimal-Captures]] — 体积视频采集
- [[Stereo-Vision]] / [[Foundation-Stereo-Model]] / [[Gaussian-Splatting]] — 基础技术

---

## 实现建议

- **实现难度**：**高**。需要：(a) 接入一个预训练立体匹配骨干（模型权重与推理管线）；(b) 立体特征融合模块；(c) 门控深度精化；(d) 逐像素高斯解码头；(e) 逆深度空间的图元聚类与聚合（需自定义 GPU kernel）；(f) 合成立体数据生成管线（XRStereo 或自建）。
- **预期性能**：摘要仅称「深度精度大幅提升 + 高保真合成 + 零样本迁移」，无具体数字。
- **适用场景**：
  - ✅ **自动驾驶 / 机器人**的双目相机（度量尺度的需求是刚需）
  - ✅ 需要**精确几何**（而非仅视觉逼真）的仿真场景
  - ✅ 混合现实中的新视角合成
  - ❌ 单目设备；或视差不可靠的场景（强反光玻璃、夜间）
- **推荐度**：**⭐⭐⭐ 推荐** —— 方法扎实但领域较窄（双目 + 度量尺度）。核心可迁移洞察：**「度量尺度必须来自外部度量锚点，而不是从单目歧义中猜测」**；以及「**逆深度空间是消除跨视角冗余的自然空间**」。后者对任何多视角融合的表示都适用。

---

## 原始链接

- 论文：https://arxiv.org/abs/2610.35902
- HTML 全文：https://arxiv.org/html/2610.35902v1
- PDF：https://arxiv.org/pdf/2610.35902
