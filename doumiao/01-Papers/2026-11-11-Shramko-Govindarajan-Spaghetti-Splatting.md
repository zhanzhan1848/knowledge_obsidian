---
type: paper
created: 2026-11-11
updated: 2026-11-11
tags: [paper, gaussian-splatting, volume-rendering, differentiable-rendering, curve-geometry, ewa-splatting, anti-aliasing]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2611.12716
---

# Spaghetti Splatting: Differentiating Curvilinear Dirac Masses via Convolution

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Spaghetti Splatting: Differentiating Curvilinear Dirac Masses via Convolution |
| **作者** | George Shramko, Shrisudhan Govindarajan, Rudy Lam, Yizheng Xie, Daniel Rebain, David B. Lindell, Andrea Tagliasacchi |
| **发表** | arXiv preprint (cs.CV, cs.GR), 2026-11-09 |
| **链接** | [arXiv:2611.12716](https://arxiv.org/abs/2611.12716) |
| **DOI** | — |
| **代码** | 摘要未声明 |
| **分类** | 可微分渲染 / 3D Gaussian Splatting 扩展（曲线基元与体积渲染） |

---

## 核心贡献

> **一句话点题：把 EWA splatting"用低频核卷积 Dirac 质量"这一配方从点/三角形推广到曲线基元，得到 Spaghetti Splatting——一个严格包含 3DGS 的可微曲线渲染表示。**

1. **识别出"卷积低频核"这一通用配方**：EWA splatting、Poisson 重建、3D Gaussian Splatting 之所以能从图像反推几何，是因为它们都把定义在无穷小位置上的 **Dirac 质量与低频核做卷积**；该配方可沿两个轴泛化——**核**与**基元**。
2. **Spaghetti Splatting**：将曲线近似为**折线（polyline）**，其卷积结果收敛到连续曲线的卷积，并**对每个线段做体积渲染**，使相邻线段在关节处**复合而不重复计数（composite without overcounting）**。
3. **逐段线性化相机投影**以实现快速训练与推理；该线性化同时**允许使用高斯以外的核**，例如 **Beta 核**。
4. **表示能力上的严格超集**：由于点是零长度曲线，Spaghetti Splatting 的表示**严格包含 3D Gaussian Splatting**。
5. **实用优势**：在一般场景上仍具竞争力；**优于专门针对线状几何的方法**；**原生支持抗锯齿（anti-aliasing）**；产生的**长连通丝状体可直接用于物理仿真**。

---

## 技术方案

### 核心思想

**问题起点**：生产级 3D 系统用点、线、三角形等基元表示几何，因为渲染硬件对它们极其高效。但从图像反推这些基元是困难的——它们是定义在空间中无穷小位置上的 **Dirac 质量**，直接在连续域上做可微渲染没有意义。

**已有的解法及其共性**：EWA splatting、Poisson 重建、3D Gaussian Splatting 表面上技术路线不同，但共享同一个核心配方——**把 Dirac 质量与一个低频核做卷积**。卷积把奇异的 Dirac 变成光滑的、有界的、可微的核函数，从而让"光线—表面相交"的离散检测变成可微的积分。这正是 3DGS 能够被梯度优化训练的根本原因。论文指出这个配方本身是可泛化的：**换一个核**（高斯 → Beta 等）、**换一种基元**（点 → 三角形 → 曲线），配方都成立。

**本文的选择**：点与三角形已被充分研究，于是论文转向**曲线状基元（curvilinear primitives）**，提出 Spaghetti Splatting。"Spaghetti"这个名字暗示了最终产物的形态：细长、连通、可形如面条的丝状体。

**具体做法**：把一条曲线用折线近似（有若干段），并证明**该折线的卷积结果收敛于连续曲线的卷积**（即离散化在卷积核带宽的意义下是无损的）。然后对每一段独立做体积渲染。难点在于**关节处**：若每段都按"占据该段附近的一个小体积"来累加 alpha，连接点会被两段各贡献一次而**过计数**，产生可见的关节亮斑与梯度偏置。论文的处理方式是让相连线段在关节处**复合（composite）而非各自独立累加**，从而保持连续性并避免重复计数。

**效率手段**：逐段**线性化相机投影**（对每条线段把投影变换局部线性化），从而可以用轻量的 splatting 内核做快速训练与推理。附带的好处是这一线性化不依赖高斯形状，**因此可以自由替换核，例如使用 Beta 核**——这为控制核的紧致程度/尾部衰减提供了额外自由度（Beta 核在不同区间外的衰减行为与高斯不同）。

**结果定位**：由于长度为零的曲线就是点，Spaghetti Splatting 的表示空间**严格包含 3DGS**，因此不会因曲线化而丢失点云能力；实际表现上它在一般场景保持竞争力，同时在**线状几何**上超过专用方法，**原生抗锯齿**（因为核的低频性质天然提供滤波），并且输出的**长连通丝状体可以直接送入物理仿真**（例如后续的流体/绳索/毛发模拟）——这一点对流体渲染社区尤其有价值：它提供了"渲染表示 + 可仿真几何"的统一资产。

---

## 关键技术

| 技术 | 说明 |
|------|------|
| **Dirac 质量 + 低频核卷积** | 通用配方：将奇异基元与低频核卷积，得到光滑可微的密度场，取代离散相交检测 |
| **双轴泛化（核 × 基元）** | 配方沿"核的形状"与"基元的几何"两轴推广；本文取"曲线基元 + 可替换核" |
| **折线近似曲线** | 曲线离散为折线，卷积结果收敛到连续曲线的卷积 |
| **逐段体积渲染** | 每个线段独立进行体积渲染积分，而非对整条曲线做整体求交 |
| **关节复合（joint compositing）** | 相邻线段在连接点复合而非各自累加，避免过计数造成的亮斑与梯度偏置 |
| **逐段线性化相机投影** | 对每段的相机投影做局部线性化，用作快速训练/推理的基础 |
| **核可替换性（Beta 核）** | 线性化不绑定高斯形状，因此可使用 Beta 等其他核，获得不同的紧致度与尾部衰减特性 |
| **抗锯齿的原生支持** | 低频核本身即是滤波器，无需额外超采样或后处理即获得抗锯齿 |
| **严格超集性质** | 点 = 零长度曲线，故曲线表示严格包含 3DGS 的表达能力 |
| **面向物理仿真的输出** | 生成的连通长丝状体可直接用于后续物理模拟 |

---

## 公式

以下为基于摘要所述机制的**示意性**公式（摘要本身未给出显式公式）。

**1. Dirac 基元的卷积化（示意）**

$$\text{原始基元：}\quad \mu(x) = \sum_i w_i\,\delta(x - p_i) \qquad \text{（点基元，3DGS 情形）}$$

$$\text{卷积后密度：}\quad \rho(x) = (\mu * k)(x) = \sum_i w_i\, k(x - p_i)$$

其中 $k$ 为低频核（高斯或 Beta）。这一步是把奇异 Dirac 转为光滑可微密度的关键。

**2. 曲线基元的卷积（示意）**

$$\rho_{\text{curve}}(x) = \int_{\mathcal{C}} w(s)\, k\!\left(x - \boldsymbol{\gamma}(s)\right)\, ds$$

折线近似 $\mathcal{C} \to \bigcup_{j} \overline{p_j p_{j+1}}$ 后，论文主张该折线的卷积**收敛**到连续曲线的卷积（离散化误差随分段加密而消失，在核带宽意义下成立）。

**3. 逐段体积渲染（示意）**

$$C = \sum_{j=1}^{J} T_j \int_{\text{段 } j} c(\mathbf{x})\, \sigma_j(\mathbf{x})\, d\mathbf{x},\qquad T_j = \prod_{k<j}\left(1 - \alpha_k\right)$$

**关节复合约束**：连接点 $\mathbf{p}_j$ 处的贡献只被计入一次，避免两段各贡献 $\alpha/2$ 之类导致过计数：

$$\alpha(\mathbf{p}_j^{\text{shared}}) \;\text{由相邻段联合确定}\;\neq\; \alpha_j(\mathbf{p}_j) + \alpha_{j+1}(\mathbf{p}_j)$$

**4. 线性化投影与核的通用性（示意）**

$$\Pi(\mathbf{x}) \approx \Pi(\mathbf{p}_j) + \mathbf{J}_j(\mathbf{x} - \mathbf{p}_j),\qquad \mathbf{J}_j = \left.\frac{\partial \Pi}{\partial \mathbf{x}}\right|_{\mathbf{p}_j}$$

由于线性化只用到投影的局部一阶行为，**核的具体形式不再被约束**，故可替换为 Beta 核：

$$k_{\text{Beta}}(\mathbf{u}) \propto \left(1 - \|\mathbf{u}\|^2 / \beta^2\right)^{+}_{(\nu-1)/2}$$

$\beta$ 紧致核提供比高斯更快的衰减（更强的抗锯齿与更少邻域重叠）。

**5. 超集性质（示意）**

$$p_i \in \text{3DGS 表示} \;\Rightarrow\; p_i \in \text{Spaghetti 表示（作为长度 } 0 \text{ 的曲线）}\;\Rightarrow\; \text{Spaghetti} \supseteq \text{3DGS}$$

---

## 代码片段

```python
# 概念性伪代码：Spaghetti Splatting 的折线表示 + 逐段体积渲染
# 说明：结构化示意，非论文提供的真实实现

import torch


class Spaghetti:
    """折线近似曲线；每个基元是一段线段，端点共享以支持关节复合。"""

    def __init__(self, points, weights, radii, kernel="beta"):
        # points: (J, 2, 3) 每段的两个端点（相邻段共享端点）
        self.pts = points
        self.w = weights
        self.r = radii
        self.kernel = kernel

    def _density(self, x):
        """Σ_j w_j * k(x - closest_point_on_segment_j)，对所有段求和。"""
        dens = torch.zeros(x.shape[:-1], device=x.device)
        for j in range(self.pts.shape[0]):
            p0, p1 = self.pts[j, 0], self.pts[j, 1]
            d = p1 - p0
            t = torch.clamp(((x - p0) * d).sum(-1) / (d * d).sum(-1).clamp_min(1e-8), 0, 1)
            proj = p0 + t[..., None] * d
            u = (x - proj) / self.r[j]
            if self.kernel == "beta":
                k = (1.0 - (u * u).sum(-1)).clamp_min(0.0) ** 1.5
            else:  # gaussian
                k = torch.exp(-0.5 * (u * u).sum(-1))
            dens = dens + self.w[j] * k
        return dens

    def render(self, rays, n_samples=64):
        """逐段体积渲染；关节处通过共享端点的密度场自然复合，不重复计数。"""
        out = torch.zeros(rays.shape[0], 3, device=rays.device)
        for ray in rays:
            # 沿光线采样（示意：均匀采样）
            t = torch.linspace(0.0, 1.0, n_samples, device=ray.device)
            pts = ray[None, :3] + ray[None, 3:] * t[:, None]
            sigma = self._density(pts)                       # (S,)
            alpha = 1.0 - torch.exp(-sigma * (t[1] - t[0]))  # 逐样本吸收率
            T = torch.cumprod(torch.cat([torch.ones(1, device=t.device),
                                          1.0 - alpha[:-1]]), 0)
            # 关节处理：共享端点只计入一次（共享密度场已保证，此处显式去重）
            contrib = (T * alpha)[:, None] * ray_color(pts)
            out += contrib.sum(0)
        return out


def train_step(scene: Spaghetti, images, optimizer):
    """逐段线性化相机投影使梯度可传；核可自由替换（高斯 / Beta）。"""
    pred = scene.render(scene.rays)
    loss = ((pred - images) ** 2).mean()
    optimizer.zero_grad()
    loss.backward()
    optimizer.step()
    return loss
```

---

## 实验结论

- **数据集**: 摘要未说明具体数据集名称与规模。仅提及评估覆盖"general scenes"（一般场景）与"line-like geometry"（线状几何）两类场景，具体数据集摘要未说明。
- **基线**: 摘要提及的对比对象包括：3D Gaussian Splatting（作为表示能力的参照与超集基准）、**专门针对线状几何的方法**（"methods specialized to line-like geometry"，具体名称摘要未给出）、以及**state-of-the-art 方法**（一般场景上的 SOTA）。EWA splatting 与 Poisson 重建在文中作为**方法论先例**被引用，而非必然作为定量基线。
- **结果**: 
  - 在**一般场景**上与 state-of-the-art **保持竞争力**（competitive）。
  - **优于**专门针对线状几何的方法。
  - **原生支持抗锯齿**（无需额外机制）。
  - 产生的**长连通丝状体可直接用于物理仿真**。
  - 由于点视为零长度曲线，表示上**严格包含 3DGS**。
  - 摘要未给出具体数值指标（全文 10 页、8 图、1 表）。

---

## 局限性

- 摘要未说明折线的**段数选择策略**、量化误差与曲线复杂度之间的关系。
- 摘要未说明与 3DGS 相比的**具体训练/推理时间与显存开销**；逐段线性化投影虽称"fast"，但缺少量化。
- **关节复合**的数值稳定性（尤其是短线段、尖锐转折处）摘要未讨论。
- **Beta 核**的收益仅为定性提及，未给出与高斯核的定量对比。
- 曲线表示在**极端视角**（极短投影长度）下的退化行为摘要未说明。
- **代码未声明**，实现复现需依赖论文全文与作者的补充材料。
- 物理仿真可用性的验证深度不明——摘要仅称"directly amenable to physics simulation"，未说明是否做了仿真实验。

---

## 相关工作

- [[2026-10-19-SplashSplat-Multi-View-Liquid-Reconstruction]] — 多视角液体重建；同样依赖 splatting 类表示与卷积核的体积渲染，与本文的曲线基元互补。
- [[2026-09-25-DiffusionShadow]] — 扩散式体积光/阴影；低频核滤波性质与本篇的抗锯齿机制在原理上一致（都是卷积核作为滤波器）。
- [[2026-11-11-Mishra-Pal-Singular-Jet-Drop-Impact-Crater-Collapse]] — 液滴撞击坑塌缩中的奇异射流；输出细长高���射流，与本文生成的"spaghetti"细长丝状形态在几何直觉上相通。
- [[2026-11-05-Zhang-Cai-Huang-Ren-GauSmoke-Hybrid-Physics-Optical-Gaussian-Splatting]] — 光学高斯泼溅与物理混合；高斯基元族的扩展路径。
- [[2026-03-11-GSSR-Gaussian-Set-Surface-Reconstruction]] — 高斯集合表面重建；同属"Dirac 质量 + 卷积核"范式的表面版本。
- [[2026-03-16-Volumetric-Ray-Traced-Primitives-SIGGRAPH2025]] — 体积光线追踪基元；本文的逐段体积渲染可与之对比评估。

---

## 实现建议

- **实现难度**: ✅ 中等偏低。核心是标准 splatting 管线（投影、排序、alpha 合成）的**基元替换**：把"一个高斯椭球"换成"一条线段上的核积分"。真正的工程难点有三处：① 关节处的不重复计数（需要把共享端点做单一归属）；② 逐段线性化投影的实现（每个线段一组雅可比）；③ 排序（线段投影的深度区间排序）。若已有 3DGS 代码库，复用其投影/排序/合成框架，改动量中等。
- **预期性能**: ✅ 线性化投影 + 逐段渲染使训练与推理保持较快速度；线段基元数量通常远小于高斯数量（一条曲线用少量段表示），因此**显存与速度有望优于同等质量的 3DGS**。⚠️ 实际成本随折线总段数线性增长，若场景含大量高曲率曲线，段数会膨胀；建议配合分块/层级 LOD。
- **适用场景**: 
  - ✅ **流体/烟雾的细丝结构渲染**：喷射流、雾丝、飘带状烟雾——正是本篇强调的"长连通丝状体"。
  - ✅ 需要**几何可直接进入物理仿真**的资产（绳索、发丝、粒子拖尾、水流细股）：渲染表示与仿真几何统一，避免"渲染表示 ≠ 仿真表示"的两套资产。
  - ✅ **线状几何**（毛发、线缆、笔触、树枝）的重建与渲染，优于线状专用方法。
  - ✅ 需要**原生抗锯齿**的细结构渲染。
  - ⚠️ 不建议用于强"点云"倾向的场景（如细碎沙砾、高频噪声表面），曲线的超集性是"表达上"而非"效率上"的优势。
  - ❌ 需要严格各向同性椭球自适应缩放（3DGS 的关键能力）时，线性化投影与各向异性高斯之间存在取舍，需自行评估。

---
