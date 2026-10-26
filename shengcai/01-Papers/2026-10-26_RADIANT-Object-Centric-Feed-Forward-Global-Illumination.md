---
type: paper
created: 2026-10-26
updated: 2026-10-26
tags: [paper, 渲染, 全局光照, 神经渲染, Transformer, 前馈渲染, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.32075
---

# RADIANT: Object-Centric Feed-Forward Global Illumination

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | RADIANT: Object-Centric Feed-Forward Global Illumination |
| **作者** | Sarah Zhang*, Zhiyang Dou*, Minghao Guo, Benjamin Tod Jones, Wojciech Matusik（MIT CSAIL，*共同一作） |
| **发表** | arXiv preprint 2026-10-23（cs.CV / cs.GR / cs.LG） |
| **链接** | [原文](https://arxiv.org/abs/2610.32075) · [HTML](https://arxiv.org/html/2610.32075v1) |
| **DOI** | 10.48550/arXiv.2610.32075（DataCite pending） |
| **代码** | 论文称 "will release our code and dataset upon publication" |

---

## 核心贡献

> 用「每对象 32 个表面 patch token」替代「每三角形 token」，把全局光照的注意力复杂度从 O(T²)（三角形数 T）降到 O(N²)（场景实体数 N），同时用「不变量形状因子注意力」把辐射传输的几何不变量精确注入 query-key 内积。

1. **对象中心化的前馈全局光照架构 RADIANT**（RADiance-based Inter-Actor Neural Transformer），直接从点云输入单次前向合成 HDR 辐亮度图，无需逐场景优化、无需运行时光线追踪。
2. **Invariant form-factor attention（不变量形状因子注意力）**：将成对欧氏距离、接收/发送端法线夹角等 O(3) 不变量精确分解为 query-key 内积，避免物化 O(N²) 的 pairwise bias 矩阵。
3. **Rasterizer-guided view decoder**：用深度测试的 point-splat 光栅化提供 primary visibility（深度/法线/材质/物体 ID），把「主可见性」与「全局光照传输」解耦，cross-attention 专注于多次反弹互反射、软接触阴影与色彩渗透。
4. **性能**：1.03M 场景基准上 25 dB tone-mapped PSNR 仅需 16k 步（RenderFormer 需 80k，**5×**）；600k 步达 32.2 dB（+3.3 dB vs RenderFormer，+7.6 dB vs RenderFormer-V2）；500 对象场景 512×512 前向 0.83 s（比 RenderFormer+FlashAttention 快 **8.5×**）。

---

## 技术方案

### 核心思想

**问题**：前馈神经渲染器（RenderFormer 等）对三角形做 tokenization，自注意力复杂度 O(T²)，随网格分辨率平方增长。更细分网格不改变宏观辐射传输物理，只增加 token 数 —— 说明传输本质由**曲面几何 + 物体排布**决定，而非网格离散化。

**解法**：借鉴 radiosity / 辐射换热（Goral et al. 1984）的思想 —— 能量交换发生在有限的表面区域与物体之间，与表面三角化密度无关。因此把 token 定义在「表面 patch」而非「多边形」上。

**流水线分两段**：
```
View-Independent（每场景算一次）      View-Dependent（每视角算）
  点编码器 → 每对象 32 patch token        相机光线 token（CamRay + 光栅化通道）
      ↓                                       ↓
  Scene Transformer（12 层自注意力）     Predictor Transformer（6 层交叉/自注意力交替）
  建模物体间辐射交换                          ↓
      ↓                                  DPT Head（4×4 patch → 全分辨率 HDR）
```

### 关键技术

| 技术 | 说明 |
|------|------|
| **Point encoder（10.0M）** | PointNet 风格，在对象居中+尺度归一化坐标系内嵌入 P=2048 表面点采样（16 维属性：位置、法线、10 个材质参数） |
| **Set abstraction** | PointNet++ FPS 选 M=32 质心，每质心 128 近邻，local max-pool + 线性投影 → 32 个 width=1024 的 patch token |
| **Register tokens（16 个）** | 可学习 register token 吸收多余注意力权重；移除它们代价 -0.13±0.01 dB |
| **OBB-RoPE** | 每 token 分配 12 维有向包围盒描述子（patch 质心 + 对象 3 条主轴 × 其世界系标准差）；query/key 旋转组合成相对描述符的函数 R(x⁽ʲ⁾-x⁽ⁱ⁾) |
| **Radiosity statistics（8 维）** | 每对象共享：log area proxy(1) + 平均漫反射 albedo(3) + 平均 emission(3) + 标量平均镜面反射率(1)；经收发端编码 δ_q^i、δ_k^j 注入 query/key，并决定形状因子注意力的增益 |
| **FiLM 通路（各 2.1M）** | 两条 FiLM 通路分别用对象的旋转不变形状统计量、以及相对查询相机的位姿，条件化该对象的 token |
| **Scene Transformer** | 12 层自注意力，width 1024，8 heads，FFN width 1890，**97.0M 参数** |
| **View Decoder（Predictor）** | 6 层，交替 cross-/self-attention，**96.1M 参数** |
| **DPT Head** | 把 4×4 像素 patch 的 ray token 上采样为全分辨率 HDR 辐亮度（Ranftl et al. 2021） |

**不变量形状因子注意力**（核心创新）：

构造 4 维几何不变量向量 G_ij ∈ R⁴，捕获辐射传输的主要项：

```math
G_{ij} =
\begin{bmatrix}
-\|\Delta_{ij}\|^2 & \text{distance kernel} \\
m_i^\top \Delta_{ij} & \text{receiver-facing} \\
-m_j^\top \Delta_{ij} & \text{sender-facing} \\
m_i^\top m_j & \text{mutual orientation}
\end{bmatrix},
\qquad \Delta_{ij} = c_j - c_i
```

其中 c_i 为 patch 质心（以场景均值中心化、按 RMS 半径归一化），m_i 为该 patch 128 个点的未归一化均值法线。

**关键点：每一项都能精确展开为收/发端特征的内积**。例如：

```math
-\|\Delta_{ij}\|^2 = \langle [\,2c_i,\; -\|c_i\|^2,\; -1\,],\; [\,c_j,\; 1,\; \|c_j\|^2\,] \rangle
```

将这些 factored feature 直接附加到 query/key 上，即可在**不物化场景空间几何 bias 矩阵**的前提下注入可学习的形状因子先验。跨层/跨注意力头，这些项被 radiosity statistics 预测的收发端增益 a_t(i)、b_t(j) 调制，对每个 attention logit 贡献标量偏置 Σ_t a_t(i)·b_t(j)·G_ij,t。

**光栅化器引导的 view decoder**：
- 深度测试的 point-splat 光栅化（7×7 dilation）提供 mesh-free primary G-buffer：可见物体 ID、深度、法线、材质
- G-buffer **不显式编码入射光照或阴影** —— 全局上下文由 cross-attention 到 3D scene tokens 提供
- 材质通道只携带直接可见发光体的 emission
- **Routing bias**：ray patch 与某对象 token 的 attention logit 加一个与「该 patch 像素中被光栅化到该对象的比例」成正比的偏置，缩放系数是每层可学习的 signed gate（初始化为 0）
- **球面 cross-attention RoPE**：对象相机系位置 (X,Y,Z) → (atan2(X,-Z), atan2(Y,-Z), -Z)；光线归一化像平面方向 (u,v,-1) → (atan u, atan v, d̄)，d̄ 为该 patch 的平均光栅化命中深度（未命中为 0）。RoPE 相减后，前两维差值直接度量光线与对象相对相机的角度偏移，第三维提供显式深度信息用于遮挡推理

**训练目标**：

```math
\mathcal{L} = \big\| \hat{y} - \log(1+L^\star) \big\|_1
             + 0.05 \cdot \text{LPIPS}\big(\tau(\hat{L}),\;\tau(L^\star)\big)
```

其中 ŷ = log(1+L)，L̂ = exp(min(ŷ,10)) - 1，tone map τ(L) = clip_[0,1](log₂(1+L))。

**优化**：AdamW，peak LR 5×10⁻⁵，8000 步 warmup，cosine 衰减到 10⁻⁶，global batch size 24。

### 架构与计算量对比（论文 Table 1）

| 方法 | 输入 | 三角形注意力 | 传输 token 数 | 传输注意力 | 主可见性 | 达到 25 dB 所需步数 |
|------|------|------|------|------|------|------|
| Neural Radiosity | mesh | — | — | — | 需 ray tracing | — |
| RenderFormer | triangles | all pairs | T | O(T²) | learned | 80k |
| RenderFormer-V2 | triangles | windowed | T | O(T²) | learned | 未达到（600k 内） |
| RenderFormer++ | triangles | per object | 8N | O(N²) | G-buffer | — |
| **RADIANT** | **point inputs** | **none** | **32N** | **O(N²)** | **point splat** | **16k（5×）** |

中位 token 数从 3,205 降到 320。

---

## 实验结论

- **数据集**：1.03M 场景（自建）。遵循 RenderFormer 协议 —— 1–6 个 Objaverse 对象（18,085 个网格）+ 模板房间，随机化墙体裁剪、面光源（每场景 1–8 个发光体，均值 4.5）、按 shading group 的材质。每场景 4 视角，Blender Cycles 512² 渲染（每像素 512 samples，Intel Open Image Denoise 去噪）。留出测试集 1,028 场景 / 4,112 张图。
- **基线**：RenderFormer (Base/V2/++)，匹配参数容量（RADIANT 205.9M）。
- **结果**：
  - 25 dB tone-mapped PSNR：RADIANT **16k 步** vs RenderFormer **80k 步**（5× 更少）
  - 600k 步终值：**32.2 dB**（+3.3 dB vs RenderFormer，+7.6 dB vs RenderFormer-V2）
  - 500 对象场景 512×512 前向：**0.83 s**，比 RenderFormer+FlashAttention 快 **8.5×**
  - 计算开销随**对象数**而非多边形数增长
  - Register token 消融：移除代价 -0.13±0.01 dB

---

## 局限性

1. **非二次物理项未显式建模**：cosine 截断 [cosθ]⁺、1/r² 距离衰减、互相遮挡（mutual visibility occlusion）都**没有**被该因式分解表达，只能留给学习到的 transformer 层处理。
2. **质量评测场景规模受限**：渲染质量在**最多 50 个实体**的场景上评估；可扩展性（500 对象）只在 runtime-only benchmark 上验证了前向速度，未验证质量。
3. **需要每对象 2048 点采样**：虽为 mesh-free，但仍需从网格做均匀表面采样或依赖带法线/材质的原始点云。
4. **训练成本**：1.03M 场景、600k 步的预训练规模，仍属重资产。
5. **主可见性用 point-splat 近似**：depth-tested point splat 代替真实三角形相交，会在点稀疏/薄壁结构处引入 primary visibility 误差。
6. **代码与数据集尚未发布**（"upon publication"）。

---

## 相关工作

- [[RenderFormer]] — 三角形 token 化的前馈渲染器，本文的直接基线
- [[RenderFormer-V2]] — 窗口化注意力变体
- [[Neural-Radiosity]] — 逐场景 radiosity 优化
- [[3D-Gaussian-Splatting]] — 逐场景表示（无跨场景泛化）
- [[Radiance-Cache]] / [[Light-Transport]] — 相关光传输加速
- [[2026-10-26_Ray-by-Ray-GPU-Ray-Tracing-Resource-Management]] — 同批次 GPU RT 硬件效率工作
- [[2026-10-26_RxGS-Relightable-Gaussian-Stylization]] — 同批次 BRDF 分解/可重光照工作

---

## 实现建议

- **实现难度**：**高**。需要：(a) PointNet++ set abstraction 编码器；(b) 完整的 OBB-RoPE 旋转位置编码；(c) 不变量形状因子注意力的 factored query/key 扩展（需改写 attention 内部计算，因为增益调制是 per-head 的标量 logit 偏置，无法用标准 RoPE 表达）；(d) 可微 point-splat 光栅化器（深度测试 + 7×7 dilation + 14 通道 G-buffer）；(e) 球面 RoPE 交叉注意力；(f) DPT 上采样头。
- **预期性能**：单次前向、无需 per-scene 优化与运行时 ray tracing；复杂度 O(N²)（N=场景实体数）。500 对象 / 512² 前向 0.83 s（论文环境）。
- **适用场景**：
  - ✅ 前馈 GI（feed-forward GI）研究基线
  - ✅ 大规模程序化场景（RoomPlan 类）批量渲染
  - ✅ 作为 RenderFormer 的直接升级替代（质量 +3.3 dB，5× 更少步数）
  - ⚠️ 高保真离线渲染仍应走 path tracer（物理精度受限于非二次项未建模）
  - ❌ 单一精细物体/薄壁几何（point-splat 主可见性不足）
- **推荐度**：**⭐⭐⭐⭐⭐ 推荐** —— 对我们而言这是「前馈全局光照」方向当前最强的 SOTA 参照系，架构中「把物理不变量因式分解进 attention 内积」的思想可直接迁移到我们自己的神经渲染/材质工作中。

---

## 原始链接

- 论文：https://arxiv.org/abs/2610.32075
- HTML 全文：https://arxiv.org/html/2610.32075v1
- PDF：https://arxiv.org/pdf/2610.32075
