---
type: paper
created: 2026-11-24
updated: 2026-11-24
tags: [paper, 参数化, 几何图像, 潜扩散模型, 牙科CAD, 曲面生成, 三维生成]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2611.31128
---

# CrownFusion: 3D Dental Crown Generation Using Geometry Images and Latent Diffusion

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | CrownFusion: 3D Dental Crown Generation Using Geometry Images and Latent Diffusion |
| **作者** | Johan Ziruo Ye, Xingguang Yan, Søren Hauberg, Angel X. Chang, Hao Zhang, Peter Lempel Søndergaard (J.Z. Ye 与 X. Yan 等同贡献) |
| **发表** | **MICCAI 2026** (accepted), arXiv cs.CV/cs.GR (2026-11-24 cross) |
| **链接** | [原文](https://arxiv.org/abs/2611.31128) |
| **DOI** | — |
| **代码** | [crownfusion.github.io](https://crownfusion.github.io/) |

---

## 核心贡献

> 用"几何图像"（geometry image）代替点云作为三维表示，配合潜扩散模型生成牙科全冠设计，并开源 11,513 例标注口内扫描数据集。

1. **CrownImage 表示**：以 2D 网格编码表面坐标的几何图像表示，使冠部几何能直接调用成熟的图像生成架构（潜扩散）。
2. **高空间分辨率 → 更少平滑伪影**：相较点云，几何图像可在远更高的空间分辨率上操作，显著缓解三维生成中的平滑化（smoothing）伪影。
3. **咬合匹配度量的概率生成**：提出基于与对颌牙（antagonist teeth）邻近度的 occlusal fit 度量，支持"多个合理设计"的多样性。
4. **FDI 16 Crown Dataset 开源**：11,513 例标注口内扫描，支撑牙科 CAD 研究。

---

## 技术方案

### 核心思想

**为什么不用点云？** 点云是无序集合，破坏了表面的邻接结构，且在 3D 生成中常见问题有三：① 邻接关系难建模；② 采样密度不均导致细节丢失；③ 扩散去噪后表面出现平滑伪影（over-smoothing）。

**Geometry Image** 的思路来自参数化：把曲面（冠部）切成一片，展开到规则 2D 网格，每个网格点存一个 3D 坐标 $(x,y,z)$。于是：

$$
\text{Surface} \;\longleftrightarrow\; \text{Image} \in \mathbb{R}^{H \times W \times 3}
$$

这带来三个好处：
- 可以直接套用 Image U-Net / 潜扩散（latent diffusion）的全部架构与训练技巧；
- 分辨率可以任意提高（点云做不到这点）；
- 边界处的对应关系由参数化固定，便于条件注入。

**CrownImage** 的具体细节：冠部（dental crown）表面经参数化展开成矩形网格；由于冠部是"帽状"拓扑（类比圆盘/球面），边界条件天然确定。

**条件生成**：以**邻牙（surrounding dentition）**为条件，通过联合学习的嵌入（jointly learned embeddings）注入到扩散的 cross-attention 中。这样生成的冠部会与患者实际牙列解剖学匹配。

**咬合度量**：对每对（冠, 对颌牙）计算邻近度，定义

$$
\text{OcclusalFit}(\hat{c}, a) = \max_{p \in \hat{c},\, q \in a} \big( \delta - d(p, q) \big)
$$

即冠部与对颌牙的最小距离越接近咬合间隙 $\delta$ 越好。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Geometry Image (CrownImage)** | 曲面参数化 → 2D 规则网格上的 3D 坐标图；需保边界、减畸变 |
| **Latent Diffusion** | 在 VAE 潜空间做扩散去噪；直接复用图像架构 |
| **Cross-attention 条件注入** | 邻牙嵌入作为条件，注入 U-Net 的 cross-attention |
| **联合嵌入学习** | 邻牙与冠部共享编码器，确保条件与目标在潜空间对齐 |
| **Occlusal fit 度量** | 与对颌牙距离度量，用于评估与多样化解排序 |
| **FDI 16 Crown Dataset** | 11,513 例标注口内扫描，标准化牙位编号（FDI system） |

---

## 代码片段

```python
# 概念性伪代码：CrownImage 表示
def to_crown_image(crown_mesh, param_uv, res=(512, 512)):
    """把冠部网格展开成规则 2D 网格上的 3D 坐标图。"""
    H, W = res
    img = torch.zeros(H, W, 3)
    # 在参数域上采样（弧长参数化可减少畸变）
    for (i, j) in grid_samples:
        uv = param_uv.sample(i / (H - 1), j / (W - 1))
        p = param_uv.query(uv)          # 曲面求值
        img[i, j] = p
    return img

def from_crown_image(img, param_uv):
    """逆向：几何图像 → 三角网格（利用参数化的邻接关系直接建拓扑）。"""
    V = img.reshape(-1, 3)
    F = param_uv.grid_faces(len(V))
    return V, F
```

---

## 实验结论

- **数据集**：FDI 16 Crown Dataset（11,513 例标注口内扫描，本文开源）+ 定量实验 + 专家评价研究（expert testimonials）
- **基线**：基于点云的三维生成方法（如 P2C/Point-E 类的点云扩散）
- **结果**：
  - 细几何细节保持更好（高分辨率几何图像 vs 点云）；
  - 平滑伪影显著减少；
  - 生成冠部解剖学合理，形态变化适配个体病例；
  - occlusal fit 度量能区分多个有效设计

---

## 局限性

- 依赖可靠的**冠部参数化**——论文未充分展开参数化细节（这是几何处理侧的关键依赖）；
- 几何图像的分辨率直接决定细节上限，显存与推理成本随之上升；
- 扩散模型本身是黑盒，**不保证几何有效性/可打印性**（制造约束需额外投影）；
- 牙科专用，泛化到通用几何生成需重新训练。

---

## 相关工作

- [[Geometry-Image]] · [[Parametrization]] · [[Latent-Diffusion]] · [[Point-Cloud-Generation]]
- [[Neural-Implicit-Representation]] · [[Dental-CAD]] · [[Mesh-Generation]]
- [[Surface-Synthesis]] · [[Texture-Image]]

---

## 实现建议

- **实现难度**：中（若已有几何图像/参数化经验）；高（从零需同时处理参数化 + 潜扩散训练）
- **预期性能**：潜空间扩散推理秒级（单冠）；几何图像分辨率是主要显存瓶颈
- **适用场景**：牙科 CAD 自动化、个性化医疗器械设计、需要"条件化 + 多样性"的三维生成
- **落地建议**：几何处理侧最有价值的部分其实是**参数化与边界处理**——可复用到任意"帽状/圆盘拓扑"曲面的几何图像化；occlusal fit 度量可直接作为下游制造约束的评价指标

## 开源参考

- libigl: `igl::lscm` / `igl::harmonic`（冠部参数化）
- libigl: `igl::harmonic(U, b, bpd, W, E, n, Q, diffuse, known, w, b, gamma)` — 边界延拓
- PyTorch Diffusers: `diffusers.UNet2DConditionModel` + `AutoencoderKL`（潜扩散骨架）
- 数据集: 论文项目页 crownfusion.github.io（FDI 16 Crown Dataset）
