---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, 渲染, PBR, 材质, 纹理压缩, 各向异性过滤, EWA, 神经渲染, 2026-11]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2611.12650
arxiv_id: 2611.12650
---

# Explicit LOD-Conditioned Anisotropic Filtering for Neural Texture Compression (AF-NTC)

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Explicit LOD-Conditioned Anisotropic Filtering for Neural Texture Compression |
| **作者** | Shin Fujieda, Takahiro Harada（东京大学 / 圣母大学） |
| **发表** | arXiv cs.GR, 2026-11-09（Keywords: Texture Compression, Neural Networks, Anisotropic Filtering） |
| **链接** | [原文](https://arxiv.org/abs/2611.12650) / [HTML 全文](https://arxiv.org/html/2611.12650v1) |
| **DOI** | —（arXiv 预印本） |
| **代码** | 论文未提供；实现基于 **PyTorch + Brevitas**（QAT 量化） |

---

## 核心贡献

> **把「各向异性过滤 (AF)」变成神经纹理压缩 (NTC) 解码器里的一等公民**：用硬件采样器同款的**有界三元组 (rot, stretch, LOD)** 条件化解码器，实现**主轴 tap 线 + 副轴层级混合**的双轴学习滤波器，在 **25% 存储预算**下超越无 AF 的 BC7 基线。

1. **诊断（本文最有价值的部分）**：**仅用长宽比 (aspect ratio) 无法设定滤波器**——单一输入无法同时携带足迹的「形状」和「大小」，导致**近处图像在每个距离上被同样地模糊**。缺失的量是**绝对尺寸**，必须作为独立输入 → 直接催生了有界三元组。
2. **有界硬件 AF 足迹三元组**：从屏幕到 UV 的 Jacobian 构造 $A=JJ^\top$，特征值给出主/副轴长度，特征向量给出主轴朝向，形成 $\big(\texttt{rot},\texttt{stretch},\texttt{LOD}\big)$。
3. **双轴学习滤波器**：主轴用**绝对 tap 线长度**（不是固定常数 × 比例），副轴用 **LOD 高斯加权层级混合**对四个特征金字塔层级做 band-limit。
4. **压缩 vs 过滤的归因消融**：证明在当前预算下**残余误差由压缩而非模型大小决定**（模型放大 4× 最多只涨 0.4 dB）。

---

## 技术方案

### 核心思想

**两类 NTC 对 AF 的处理完全相反**：

- **Latent-in-BC**：把学习到的 latent 存在 BC 纹理里，交给 **GPU 纹理单元硬件过滤** → AF **几乎免费**（论文称之为 free AF）。网络只在各向同性样本上训练，也能泛化到良好过滤的输出，因为采样器给出真实的有界足迹，AF 只是该足迹上的加权 tap 混合。
- **Feature-pyramid NTC**（本文目标）：多层特征网格 + 小 MLP 解码器。**没有硬件过滤，没有显式 AF 机制**，每像素单采样会走样，实际系统只能依赖**随机纹理过滤 (STF)**——以噪声换走样，还需时域后处理。

> **本文的定位**：把 AF 做成 feature-pyramid 解码器里的**显式操作**，以像素足迹为条件，**对着各向异性过滤后的 ground truth 训练**，让结果「近处锐利、远处模糊」——这是朴素的 tap 混合做不到的。

**关键诊断（3.1 节）**：朴素设计从 stretch 推导滤波器长度，形如

```math
\texttt{length}=\texttt{stretch}\cdot k
```

这必然失败，因为正确滤波器由**两个独立变化的量**决定：足迹的**绝对尺寸**（决定模糊程度 / mip 层级）与**长宽比**（决定延展程度）。stretch 只编码比例，所以 ratio-only 解码器必须用固定尺寸 $k$，**而 $k$ 只在一个距离上是正确的**——它永远无法同时表达「近处且强烈拉长」与「远处且强烈拉长」两种足迹。

### 关键技术

| 技术 | 说明 |
|------|------|
| 足迹三元组 | $\texttt{LOD}=\log_2(\sigma_{\min}\cdot\texttt{tex\_res})\in[0,12]$ @4K；$\texttt{stretch}=\sigma_{\max}/\sigma_{\min}\in[1,16]$；$\texttt{rot}=\angle(\text{major axis})\in[0,\pi)$ |
| 单一 $\sigma_{\min}$ 复用 | 从渲染器给的 LOD 反解 $\sigma_{\min}=2^{\texttt{LOD}}/\texttt{tex\_res}$，**同一个值**既用于放 tap 又用于构造 AF ground truth，保证一致性 |
| 主轴 tap 线 | $\texttt{length\_major}=\sigma_{\min}\cdot\texttt{stretch}(=\sigma_{\max})$；tap 数按层级分配 $[16,8,4,2]$（共 **30 tap**，对齐硬件 AF 的 tap 预算） |
| 副轴层级混合 | 每层 $l$ 有 LOD 中心 $c_l=\log_2(\texttt{tex\_res}/\texttt{res}_l)$；该层 12d 特征按 $\sigma=0.7$ 的 LOD 高斯加权；加权后拼接，**网格特征宽度恒为 48d** |
| MLP 输入 | 48d 网格特征 + 归一化标量 $\texttt{LOD}/\texttt{lod\_max}$ = **49d**。`rot`/`stretch` **只通过 tap 几何使用，不作为 MLP 输入**（附录 B 消融证明额外喂入 18d 位置编码仅微增） |
| 特征金字塔 | 四层 2D 网格，分辨率 1024/512/256/128，LOD 中心分别为 2,3,4,5，每层 12d |
| 解码器 | MLP，隐层宽 $[192,192]$，leaky-ReLU，末端 sigmoid，输出 **9 通道**（albedo 3 + ARM 3 + normal 3） |
| 训练 | $L_2$ 损失（可选 LOD 加权、法线通道加权）；**Brevitas 量化感知训练 (QAT)** 量化到 int8 |
| 过滤参数采样 | **直接从参数空间独立采样**三元组（rot/stretch 均匀，LOD 按面积比例 $p(\texttt{LOD})\propto 4^{-\texttt{LOD}}$）→ 解码器能看到任何单一视角都不提供的组合 |
| 对比：STF | 随机纹理过滤保持每像素一次解码，但用噪声换走样，需时域后处理；**本文滤波器是确定性的**，无需后处理 |

---

## 公式

```math
// 足迹度量：屏幕到 UV 的 Jacobian
A=JJ^{\!\top},\qquad
\sigma_{\max}\geq\sigma_{\min}\ \ (\text{特征值平方根 = 主/副轴长度})

// 有界三元组
\texttt{LOD}=\log_{2}\!\big(\sigma_{\min}\cdot\texttt{tex\_res}\big)\in[0,12]\ \text{at 4K}   \tag{2}
\texttt{stretch}=\sigma_{\max}/\sigma_{\min}\in[1,16]                                      \tag{3}
\texttt{rot}=\angle(\text{major axis})\in[0,\pi)                                          \tag{4}

// 从 LOD 反解副轴长度（单一 σ_min 处处复用）
\sigma_{\min}=2^{\textrm{LOD}}/\,\texttt{tex\_res}                                        \tag{5}

// 主轴 tap 线长度：由绝对长度导出，而非固定常数 × 比例
\texttt{length\_major}=\sigma_{\min}\cdot\texttt{stretch}\quad(=\sigma_{\max})            \tag{6}

// 副轴层级混合：每层 LOD 中心
c_l=\log_{2}(\texttt{tex\_res}/\texttt{res}_l)                                            \tag{7}
```

---

## 代码片段

```python
# 网络结构（论文 3.4，PyTorch）
class AFNTCDecoder(nn.Module):
    """输入 49d 条件化特征向量 → 输出 9 通道材质贴图"""
    # 编码器: 四层 2D 特征网格, 分辨率 1024/512/256/128, 每层 12d
    #          -> LOD 中心 c_l = 2, 3, 4, 5
    def forward(self, grid_feat_48d, lod):
        # 1) 主轴: rot 定向, length_major = σ_min * stretch, tap 数 [16,8,4,2] = 30
        #    每层双线性采样 tap, 沿主轴放置
        # 2) 副轴: 每层特征按 σ=0.7 的 LOD 高斯加权 (中心 c_l), 加权后拼接 -> 48d
        # 3) 拼接归一化 LOD/lod_max -> 49d
        x = torch.cat([grid_feat_48d, (lod / lod_max).unsqueeze(-1)], dim=-1)
        # MLP: hidden [192, 192], leaky-ReLU, final sigmoid
        # 输出 9 通道: albedo(3) + ARM(3) + normal(3)
        return self.mlp(x)

# 训练后量化 (Brevitas QAT → int8)
# 磁盘体积: 16.75 MB (int8 打包网格 + MLP) ≈ 完整 BC7 mip chain (67 MB) 的 25%

# 过滤参数采样（论文 3.4）—— 直接从参数空间独立采样
# rot   ~ U[0, pi)
# stretch ~ U[1, 16]
# LOD ~ p(LOD) ∝ 4^{-LOD}   (面积比例)
```

---

## 实验结论

- **数据集**：5 个 4K 材质（按空间频率从低到高：blue_metal, clay_roof, stone_floor, pavement, stone_wall），每个在两个场景渲染（**平面**＝近锐远糊；**球面**＝曲面），共 10 个材质–场景对；另加 2 个 PolyHaven mesh 资产（混凝土猫雕像、酒桶）。
- **基线**：`aniso-BC7`（完整 BC7 mip chain + 完整 AF，强上界）、`trilinear-BC7`（同 BC7 贴图但只各向同性 mip 采样，无 AF）、`aniso-2K`（等字节半分辨率参考）。
- **评价方式**：**渲染空间 PSNR**（不是纹理空间）——用各自方法产出的贴图渲染，与**超采样 EWA 参考**对比，同光照下两图仅在贴图上有差异。
- **结果（Table 1，PSNR dB）**：

| 材质 | 场景 | iso（消融） | +aniso（消融） | **AF-NTC** | aniso-BC7（4×） | tri-BC7（4×） |
|---|---|---|---|---|---|---|
| blue_metal | plane | 50.54 | 51.27 | **51.56** | 53.62 | 45.87 |
| blue_metal | sphere | 50.12 | 51.63 | **51.93** | 53.01 | 47.45 |
| clay_roof | plane | 33.65 | 34.67 | **35.02** | 35.57 | 27.39 |
| clay_roof | sphere | 37.63 | 39.33 | **39.76** | 41.42 | 35.80 |
| stone_floor | plane | 33.94 | 36.71 | **38.60** | 39.08 | 35.56 |
| stone_floor | sphere | 34.01 | 37.36 | **39.08** | 39.11 | 34.83 |
| pavement | plane | 33.64 | 36.27 | **37.47** | 40.84 | 36.11 |
| pavement | sphere | 33.81 | 37.54 | **39.66** | 41.78 | 37.70 |
| stone_wall | plane | 30.27 | 32.68 | **33.48** | 35.09 | 30.21 |
| stone_wall | sphere | 30.18 | 33.45 | **35.48** | 38.24 | 34.17 |

  - **AF-NTC 在全部 10 行都超越 trilinear-BC7**（+1.31 ~ +7.63 dB），且**在 25% 存储预算下**。
  - 仍低于 4× 大的 aniso-BC7（差距 0.03 ~ 3.37 dB，均值 1.57 dB）。
  - **消融显示每个部件都在贡献**：iso → +aniso → AF-NTC 逐级提升。增益最小在低频材质 blue_metal（+1.02 dB），最大在高频材质（+4.66 dB stone_floor 平面；+5.85 dB pavement 球面）——**频率越高，AF 价值越大**。

- **结果（Table 2，mesh 资产，PSNR dB）**：

| 资产 | AF-NTC | aniso（4K 全尺寸） | tri | aniso-2K（等字节） |
|---|---|---|---|---|
| cat | 40.34 | 40.40 | 38.33 | 40.06 |
| barrel | 46.02 | 46.09 | 42.54 | 46.09 |

  - 在两个资产上**距 4× 大的 aniso-BC7 仅差 ≤0.07 dB**，比 trilinear-BC7 高 +2.0 ~ +3.5 dB。
  - 对等字节的 2K aniso-BC7：cat +0.28 dB、barrel −0.07 dB——但**作者明确不声称这个结果可推广**（这两个资产的 LOD≈1.4–2.4，足迹大，2K 贴图损失小；Table 1 中细足迹下 2K 比 AF-NTC 高 0.4–3.3 dB）。

- **消融（附录 A，pavement 与 stone_floor）**：
  - **去掉副轴层级混合损失 5.3 ~ 9.3 dB**，且主要损失在**近相机**（足迹最小处）→ **副轴混合是滤波器最重要的部分**。
  - 模型放大 ~4× **最多只涨 0.4 dB** → 当前预算下残余误差由**压缩**决定，不是模型容量。

- **AF ground truth 的构造**：模拟硬件 AF（沿主轴放 $\lceil\texttt{stretch}\rceil$ 个 tap，跨度 $(2^{\texttt{LOD}}/\texttt{tex\_res})\cdot\texttt{stretch}$，每个 tap 在 $\text{mip}=\texttt{LOD}$ 处三线性采样以过滤副轴）。与超采样 EWA 参考的 PSNR 为 **37–41 dB**，故是近似——但**仅用于训练**，评估仍在渲染空间做。

---

## 局限性

- **不主张在通用尺寸–质量上全面超越 BC7**，只主张「在固定压缩预算下过滤正确」。在全部 10 行都低于 4× 大的 aniso-BC7，最多差 3.4 dB。
- **没有报告任何运行时评估**——AF 是 **PyTorch 软件仿真**，不是优化的 GPU 纹理采样器实现。tap 预算与解码性能的权衡需在真实硬件上测量（作者明确列为未来工作）。
- **训练目标本身是近似的**（与超采样 EWA 参考只差 37–41 dB）。
- 逐材质训练/评估（模型随材质一起发布），训练与评估共享同一纹理集。
- 只验证了 **albedo + ARM + normal 三张 4K 贴图**，未覆盖更复杂的材质分层/次表面等。

---

## 相关工作

- [[2026-11-10_AF-NTC-LOD-Conditioned-Anisotropic-Filtering]]
- 纹理与材质：[[神经纹理压缩]] [[PBR 材质]] [[各向异性过滤]] [[EWA 过滤]] [[mipmap 与纹理过滤]]
- 硬件 AF 谱系：Williams 1983（硬件 AF 近似）、Heckbert 1989（EWA）、McCormack et al. 1999、Pharr et al. 2024（随机纹理过滤 STF）
- NTC 谱系：Vaidyanathan et al. 2023（feature-pyramid NTC）、**NTBC（Fujieda & Harada 2024，同作者）**、Weinreich et al. 2024 与 Belcour & Benyoub 2025（latent-in-BC，free AF）
- 量化：Brevitas（Franco et al. 2026）

---

## 实现建议

- **实现难度**：**中**（PyTorch 训练单个材质 + 软 AF 仿真 + QAT；无需改渲染器架构，只需提供逐像素 LOD）
- **预期性能**：4K 材质 16.75 MB（int8）≈ BC7 mip chain 的 25%；质量介于 trilinear-BC7 与 aniso-BC7 之间且明显优于前者
- **适用场景**：
  - ✅ **feature-pyramid 类 NTC**（如 NTBC）的 AF 缺失问题——本文正是它的直接补丁
  - ✅ 高频材质（石材、沥青、墙砖）+ 大面积地面/墙面（足迹跨度大，AF 收益最大）
  - ✅ 需要**确定性**过滤、不想引入 STF 噪声与时域后处理的管线
  - ✅ 移动/主机端 GPU 资源紧张（25% 存储预算）
  - ❌ 追求绝对最高质量（大预算下不如直接用 aniso-BC7）
- **落地建议**：
  1. **最值得复用的不是模型而是诊断**：无论你的 NTC 是哪种，先确认「AF 输入是否同时携带形状与尺寸」。若只喂 aspect ratio，一定有「近处同样模糊」的 bug
  2. 复用渲染器已提供的逐像素 LOD，**反解出的 $\sigma_{\min}$ 必须处处一致**（tap 放置与 GT 构造共用同一个值）
  3. **副轴层级混合不可省**——消融显示它占 5.3–9.3 dB，是整个 AF 的主要来源
  4. tap 预算 [16,8,4,2]（30 tap）对齐硬件 AF；若算力紧张可降级，但需重测
  5. 训练时**从参数空间独立采样**三元组，而非从渲染视角采样——否则模型只见过真实出现过的组合
  6. LOD 按面积比例采样 $p\propto 4^{-\texttt{LOD}}$，匹配屏幕面积分布
  7. 若目标是硬件部署，**必须做真实的 GPU 纹理采样器实现并重新测量延迟**——论文的 PyTorch 版本只能验证质量
- **优先级**：**中高**——对材质管线是直接可用的补丁，且诊断结论（ratio-only 不足）具有普适性
