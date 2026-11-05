---
type: paper
created: 2026-11-05
updated: 2026-11-05
tags: [paper, 渲染, 重光照, 光线追踪, Transformer, 扩散模型, 置换不变, PRope, GTA, 神经渲染, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2609.07414
---

# RelightFormer: 前馈生成式 Transformer 多视图重光照

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | RelightFormer: Feed-forward Generative Transformer for Multiview Object Relighting |
| **作者** | Hejun Wang, Jinxi Li, Junwei Jiang, Shiwei Mao, Hu Cheng, Shouwang Huang, Bo Yang（**vLAR group**, Laval University 等） |
| **发表** | arXiv 2026-09-07（cs.GR），**SIGGRAPH Asia 2026 / ACM TOG** |
| **链接** | [原文](https://arxiv.org/abs/2609.07414) · [HTML](https://arxiv.org/html/2609.07414v1) |
| **DOI** | — |
| **代码** | ✅ 已公开：https://github.com/vLAR-group/RelightFormer |

---

## 核心贡献

> **把「渲染方程的积分」映射为「Transformer 的 cross-attention」**：照明 attention 的注意力权重隐式学习 $f(\omega_i,\omega_o)(\omega_i\cdot n)$，实现**完全不做内禀属性反演**的前馈重光照；配合**置换不变的多视图编码**，用 9 万对象 × 3.9 万光照的大规模合成数据训练。

1. **Latent Illumination Module**：以照明 token 为 key/value、图像 token 为 query 做 cross-attention，**注意力权重隐式逼近 BSDF × 余弦项**，把渲染积分离散化为可学习形式。
2. **完全绕过逆向渲染**：不做 albedo / normal / roughness 估计，不做病态优化，纯粹依靠大规模数据学到的视觉先验。
3. **置换不变多视图编码**：用 **PRope**（从**物理相机配置**而非帧索引计算旋转角）替换 Wan2.1 的帧索引 RoPE → 多视图注意力对输入顺序天然不变。
4. **Laval Objaverse Dataset (LOD)**：**90,545 个 Objaverse 对象 × 39,008 个 Laval 数据库光照**，解决多视图重光照公开数据稀缺问题。
5. **零样本泛化强**：在真实 OLATverse 数据集（42 对象）的环境光重光照与**旋转点光源重光照**上取得最佳或可比结果。

---

## 技术方案

### 核心思想

传统重光照有两条路：
- **逆向渲染**：显式估计内禀属性 → 病态优化、逆解歧义
- **单图生成模型**：忽略多视图线索，无法理解 3D 几何与材质交互

**本文路线**：把渲染方程看作「注意力」的形式，做**纯前馈**的重光照。

**核心洞察（本文最漂亮的一点）**：渲染方程的表面辐射积分

$$L_o(\omega_o)=\int_\Omega f(\omega_i,\omega_o)L_i(\omega_i)(\omega_i\cdot n)\,d\omega_i$$

与 Transformer cross-attention 的输出

$$o_i=\sum_j \mathrm{softmax}\!\left(\frac{q_i k_j^\top}{\sqrt d}\right)v_j$$

在**结构上高度相似**（都是「用 query 对一组带权 value 求加权和」）。于是把照明 token 做成 key/value、图像 token 做成 query，**注意力权重就隐式学到了 $f(\omega_i,\omega_o)(\omega_i\cdot n)$**——BSDF 与余弦项无需显式建模。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Latent Illumination Module** | Transformer block $\ell$ 处：$x^{\text{cond}}_{t,\ell}=\mathrm{GTA}(x^{\text{image}}_{t,\ell})+\mathrm{CrossAttn}(x^{\text{image}}_{t,\ell};x^{\text{illum}})$；照明 token 由**光线嵌入的入射光照表示**构造 key |
| **GTA（Geometry-Aware Attention）** | Miyato et al. 2024；$\mathrm{GTA}(Q,K,V)=D\cdot\mathrm{Attn}(D^\top Q,D^{-1}K,D^{-1}V)$，$D$ 为逐 token 的变换矩阵序列，由**相机投影矩阵 + 2D patch 坐标**导出 |
| **PRope（置换不变位置编码）** | Li et al. 2025b；$D_i=\mathrm{diag}(D_i^{\text{Proj}},D_i^{\text{RoPE}})$，$D_i^{\text{Proj}}=I_{d/8}\otimes\tilde P_i$（归一化投影矩阵，编码相机视锥间相对投影几何），$D_i^{\text{RoPE}}=\mathrm{diag}(\mathrm{RoPE}_{d/4}(x_i),\mathrm{RoPE}_{d/4}(y_i))$；**旋转角来自物理相机配置而非帧索引** → 天然置换不变 |
| **底座** | Wan2.1 视频基础模型改造为 latent diffusion transformer |
| **LOD 数据集** | 90,545 Objaverse 对象 × 39,008 Laval 数据库光照；提供多视图 + 目标光照的配对 |
| **评价协议** | 每个子任务从留出测试集**均匀采样 7,248 对图像**；报告 PSNR、SSIM、LPIPS、**sPSNR**（scale-invariant PSNR：先用最小二乘回归把预测强度对齐到 GT 尺度再算误差，消除全局强度/曝光失配带来的偏差） |

---

## 公式

**渲染方程（被映射为注意力）**：

```math
L_{o}(\omega_{o})=\int_{\Omega}f(\omega_{i},\omega_{o})\,L_{i}(\omega_{i})\,(\omega_{i}\cdot n)\,\mathrm{d}\omega_{i}
```

**Cross-attention**：

```math
o_{i}=\sum_{j}\underset{j}{\operatorname{softmax}}\!\left(\frac{q_{i}k_{j}^{\top}}{\sqrt{d}}\right)\,v_{j}
```

**条件化 token（多视图自注意力 + 照明交叉注意力）**：

```math
x_{t,\ell}^{\text{cond}}=\underbrace{\operatorname{GTA}\!\left(x_{t,\ell}^{\text{image}}\right)}_{\text{multi-view self-attention}}
+\underbrace{\operatorname{CrossAttn}\!\left(x_{t,\ell}^{\text{image}};x^{\text{illum}}\right)}_{\text{illumination cross-attention}}
```

**GTA**：

```math
\mathrm{GTA}(Q,K,V)=D\mathrm{Attn}\big(D^{\top}Q,\;D^{-1}K,\;D^{-1}V\big)
```

**PRope 分解**：

```math
D_{i}=\begin{bmatrix}D_{i}^{\text{Proj}}&\mathbf{0}\\ \mathbf{0}&D_{i}^{\text{RoPE}}\end{bmatrix},\quad
D_{i}^{\text{Proj}}=I_{d/8}\otimes\tilde{P}_{i}\in\mathbb{R}^{\frac{d}{2}\times\frac{d}{2}}
```

```math
D_{i}^{\text{RoPE}}=\begin{bmatrix}\operatorname{RoPE}_{d/4}(x_{i})&\mathbf{0}\\ \mathbf{0}&\operatorname{RoPE}_{d/4}(y_{i})\end{bmatrix}\in\mathbb{R}^{\frac{d}{2}\times\frac{d}{2}}
```

---

## 代码片段

```text
// 多视图注意力（置换不变）
D_i = diag(D_i^Proj, D_i^RoPE)
  D_i^Proj = I_{d/8} ⊗ P̃_i        # P̃: 归一化 4×4 投影矩阵
  D_i^RoPE = diag(RoPE_{d/4}(x_i), RoPE_{d/4}(y_i))

out = D · Attn(D^T Q, D^-1 K, D^-1 V)
    where Attn(Q,K,V) = softmax(QK^T/√d) V

// 照明 cross-attention
q ← 参考图 + 噪声目标图的特征
k,v ← 光线嵌入的入射光照 token
// 注意力权重隐式逼近 f(ω_i,ω_o)(ω_i·n)
```

---

## 实验结论

- **数据集**:
  - **LOD（Laval Objaverse Dataset）**：90,545 个 Objaverse 对象 × 39,008 个 Laval 数据库光照
  - **OLATverse**（真实世界，Zhou et al. 2026）：42 个对象的验证集，用于零样本评测
  - **TensoIR**（Jin et al. 2023）：**分布外**评测
- **基线**:
  - **LightSwitch**（Litman et al. 2025）、**Reli3D**（Dihlmann et al. 2026）
  - **DiLightNet**（Zeng et al. 2024）、**Neural Gaffer**（Jin et al. 2024b）
- **关键结果**:
  - **单图重光照**：本文在所有指标上最优，泛化到未见对象时纹理一致、细节保持。**LightSwitch 与 Reli3D 在歧义情形下明显退化**（缺少多视图对应），本文靠大规模数据先验保持鲁棒
  - **多图重光照**：一致优于所有基线；**性能随参考视图数量单调提升** → 说明模型确实提取了底层 3D 几何并与全局入射光融合。**DiLightNet 与 Neural Gaffer 无法从多视图对应中提取线索**，保真度低
  - **分布外（TensoIR）**：取得有竞争力的结果
  - **真实 OLATverse 环境光重光照**：各指标均具竞争力（合成训练 → 真实对象与光照的强迁移）
  - **真实 OLATverse 旋转点光源重光照**（最难的场景：集中光源产生显著视角相关高光与阴影）：**PSNR 与 SSIM 最佳**；Neural Gaffer 的 sPSNR 与 LPIPS 略好 → 论文结论：RelightFormer **整体辐射保真度好，但快速变化的镜面光照下的感知细节仍有挑战**
  - **材质分层**：在多数材质上最佳，含 **glossy、translucent、furry** 等困难类别；但 **Neural Gaffer 在 plastic 与 stone 上 PSNR 更高**（图像式重光照对困难材质本质病态且歧义）
- **消融/趋势**:
  - 参考视图数 ↑ → 性能单调 ↑（多视图编码确实有效）
  - 逐材质分析揭示了图像式重光照的根本歧义

---

## 局限性

- **感知细节在强镜面下仍弱**：旋转点光源场景 sPSNR/LPIPS 略输 Neural Gaffer
- **困难材质上 PSNR 不占优**：plastic / stone 上 Neural Gaffer 更高（图像式重光照本质病态）
- **不做内禀属性估计** → 无法输出可编辑的材质/几何参数，也无法做物理精确的任意光照推理
- **依赖环境光表示**：目标光照以环境贴图（latent 光照 token）形式注入，**点光源以外的光源类型**（如复杂 area light、动态阴影投射）覆盖有限
- **合成训练数据域限制**：Objaverse 对象 + Laval HDRIs 的组合，真实感材质覆盖不全
- **大模型成本**：基于 Wan2.1 视频基础模型改造，推理开销与训练资源都不低；LOD 数据集本身也是巨大资产
- **多视图输入顺序无关性**是好的设计，但**没有利用视图间的遮挡/可见性显式推理**

---

## 相关工作

- [[Rendering-Equation]] — Kajiya 1986
- [[GTA-Geometry-Aware-Attention]] — Miyato et al. 2024
- [[PRope]] — Li et al. 2025b
- [[Wan2.1]] — 视频基础模型底座
- [[Neural-Gaffer]] — Jin et al. 2024b
- [[DiLightNet]] — Zeng et al. 2024
- [[LightSwitch]] — Litman et al. 2025
- [[TensoIR]] — Jin et al. 2023
- [[Gaussian-Light-Transport-13D-Gaussian-GI]]

---

## 实现建议

- **实现难度**: **高**（大型扩散 Transformer 改造 + 大规模数据渲染管线 + PRope/GTA 集成）
- **预期性能**: 各指标 SOTA；但**速度与显存成本高**（论文未给具体推理耗时）
- **适用场景**:
  - ✅ **商品/资产渲染的快速重光照**（改环境光即出图，无需重跑路径追踪）
  - ✅ 多视图输入可用的场景（多角度照片 → 一致的重光照结果）
  - ✅ 需要强泛化到未见对象/未见光照的场景
  - ❌ 需要**物理精确**或可编辑材质参数的场景
  - ❌ 强镜面 + 快速变化点光源（感知细节不足）
- **落地建议**:
  1. **「渲染方程 = cross-attention」这个映射是本文最值得内化的思想**：不仅适用于重光照，**任何「对入射光方向做加权积分」的任务都能用同一 trick**（如神经辐射缓存、可微光照估计）
  2. **置换不变多视图编码（PRope）**是通用组件：从物理相机配置而非帧索引编码位置，对任何无序多视图/多图任务都适用
  3. **sPSNR 指标**值得纳入自建评测——消除曝光失配后的比较更能反映真实几何/材质保真
  4. 数据是本工作的主要壁垒（LOD 9万×3.9万）；**若无法复现训练，至少可用其推理代码做下游应用**，或参考其「大规模合成数据 + 前馈生成模型」的范式自行构建数据
  5. 若追求物理精确性，可考虑**与 [[Gaussian-Light-Transport-13D-Gaussian-GI]] 这类解析式光传输求解互补**：后者给物理解，前者给快速生成
