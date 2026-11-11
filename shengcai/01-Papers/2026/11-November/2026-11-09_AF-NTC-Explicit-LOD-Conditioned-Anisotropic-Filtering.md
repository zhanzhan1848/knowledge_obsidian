---
type: paper
created: 2026-11-11
updated: 2026-11-11
tags: [paper, rendering, neural-texturing, texture-compression, anisotropic-filtering, real-time-rendering, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2611.12650
arxiv_id: 2611.12650
---

# AF-NTC: Explicit LOD-Conditioned Anisotropic Filtering for Neural Texture Compression

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Explicit LOD-Conditioned Anisotropic Filtering for Neural Texture Compression |
| **作者** | Shin Fujieda, Takahiro Harada (**AMD**) |
| **发表** | arXiv cs.GR, 2026-11-09（预印本, ACM CCS 模板） |
| **链接** | [原文](https://arxiv.org/abs/2611.12650) |
| **DOI** | - |
| **代码** | 论文未公开链接 |

---

## 核心贡献

> 把硬件纹理单元的**三参数各向异性过滤**（minor-axis scale/LOD、aspect ratio、major-axis orientation）显式喂给神经纹理压缩解码器，补上 NTC 家族长期缺失的一环。

1. **诊断 + 最小修复**：仅用 footprint 宽高比设定滤波器是不够的——单一输入无法同时携带 footprint 的**形状**与**尺寸**，导致近处也跟远处一样糊。有界三元组 $(\texttt{rot}, \texttt{stretch}, \texttt{LOD})$ 恢复质量。
2. **双轴学习滤波器**：对没有硬件过滤的解码器，沿**主轴**采样一条 tap 线，沿**次轴**做 level blend。
3. **压缩 vs. 过滤的分离消融**：用模型大小消融区分"误差来自压缩"还是"误差来自过滤"，量化各自贡献。

---

## 技术方案

### 核心思想

主流 NTC（Neural Texture Compression）设计是**特征金字塔 + MLP 解码器**：每个材质存一组多分辨率可学习特征网格 + 小 MLP。

问题：这类解码器**收不到 GPU 纹理单元的过滤**。它在一个固定 UV、固定 LOD 上学习材质，每像素一次采样 → 走样。实践上依赖 STF（stochastic texture filtering，采样随机 tap 子集）来缓解，代价是额外噪声。

已有方案（如 NTBC）把神经特征打包进 BC block，让标准资产管线能携带，但仍是固定 UV/LOD 学习。

**本文做法**：让解码器接收与硬件采样器完全相同的三个有界量：
- **minor-axis scale (LOD)** —— footprint 尺寸
- **aspect ratio** —— footprint 形状
- **major-axis orientation** —— footprint 朝向

这三者驱动"沿主轴的 tap line + 沿次轴的 level blend"，并**用各向异性过滤后的 ground truth 训练**。

### 关键技术

| 技术 | 说明 |
|------|------|
| **特征金字塔 NTC** | 多分辨率可学习特征网格 + MLP 解码器（Vaidyanathan et al. 2023 范式） |
| **软件 AF 滤波核** | 沿主轴的多 tap 采样 + 次轴 mip 混合 |
| **有界条件三元组** | $(\texttt{rot}, \texttt{stretch}, \texttt{LOD})$，全部有界，便于网络输入归一化 |
| **渲染空间评测** | PSNR 在渲染空间测，而非纹理空间——对比 supersampled EWA 参考图 |
| **模型大小消融** | 分离压缩误差与过滤误差 |

### 公式

```math
// 解码器条件（与硬件采样器一致的三个有界量）
\texttt{rot} \in [0, \pi)      // 主轴朝向
\texttt{stretch} \ge 1        // 长短轴比（aspect ratio）
\texttt{LOD} \ge 0            // 次轴尺度 / mip level

// 双轴滤波采样（语义形式）
\mathbf{v}_{\mathrm{tap}} = \mathrm{MLP}\big(
    \mathrm{sample}_{\mathrm{majorAxis}}(\text{feature},\ \texttt{rot},\ \texttt{stretch}),
    \mathrm{blend}_{\mathrm{minorAxis}}(\text{LOD})
\big)
```

---

## 代码片段

```cpp
// 运行时采样语义（伪代码）
// 1) 由光栅化足迹得到硬件采样器同样的三个有界量
Footprint fp = computeFootprint(uv, ddx, ddy, mipLevel);
float lod     = fp.minorAxisScale;   // LOD
float stretch = fp.aspectRatio;      // 长短轴比
float rot     = fp.majorAxisAngle;   // 主轴朝向

// 2) 沿主轴取 tap line，沿次轴做 level blend
Vec3 taps[MAX_TAPS];
for (int i = 0; i < numTaps; ++i) {
    vec2 off = majorAxisDir * (stretch * (i - (numTaps-1)/2.0f));
    taps[i]  = featurePyramid.sample(uv + off, lod);
}

// 3) 次轴 level blend（mip 混合）
Vec3 levelBlend = featurePyramid.blendLevels(uv, lod);

// 4) 解码
Vec3 rgb = decoderMLP(taps, levelBlend, rot, stretch, lod);
```

---

## 实验结论

- **数据集**: 5 个 4K 材质（按空间频率从低到高：blue_metal、clay_roof、stone_floor、pavement、stone_wall），每个在 2 个场景渲染（平面 = 近锐远糊；球面）；另加 2 个真实网格资产（混凝土猫雕像、酒桶，PolyHaven，非平铺 UV）
- **基线**:
  - `iso`：同架构解码器，仅用各向同性样本训练，无 footprint 输入（free-AF 思路）
  - `+aniso`：同解码器，用各向异性过滤 GT 训练
  - `aniso-BC7`：完整各向异性 BC7 mip 链（强上界参考）
  - `trilinear-BC7`：同 BC7 图但仅各向同性过滤 + trilinear mip（弱基线）
- **结果（PSNR dB, 渲染空间）**:

| 材质 | 场景 | iso | +aniso | **AF-NTC** | aniso-BC7 | tri-BC7 |
|------|------|------|------|------|------|------|
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

  - **AF-NTC 在全部 10 行都优于 trilinear-BC7**，幅度 **+1.31 dB ~ +7.63 dB**
  - 始终低于 aniso-BC7，差 **0.03 ~ 3.37 dB**（均值 1.57 dB）
  - **AF-NTC 只用 BC7 mip 链 25% 的体积**（aniso/tri 基线约 4× 大）
  - 单项增益：最低频材质 +1.02 dB（blue_metal plane），最高频材质最高 +5.85 dB（pavement sphere）
  - 消融显示：显式学习 AF footprint **每一部分都在所有材质与场景上提升 PSNR**
  - 网格资产（猫雕像、酒桶）上同样有效

---

## 局限性

- 只针对**特征金字塔 NTC** 家族（Vaidyanathan 2023 / NTBC），未覆盖 latent-in-BC NTC（Weinreich 2024 / Belcour & Benyoub 2025）家族
- 依赖软件 AF 实现，硬件采样器无法直接复用（Vaidyanathan et al. 已指出软件 AF 需要过多 tap 才实时）
- 仍未完全追平完整各向异性 BC7（平均差 1.57 dB）
- 预印本，未见同行评审

---

## 相关工作

- [[2026-06-25-Neural-Texture-Compression-Hypernetworks]]
- [[2026-04-01_Neural-Harmonic-Textures]]
- [[2026-11-05_Patch-Based-Neural-Texture-Upscaling]]
- 概念：[[神经纹理压缩]], [[各向异性过滤]], [[特征金字塔]], [[纹理压缩]]

---

## 实现建议

- **实现难度**: 低-中（核心是给现有 NTC 解码器加 3 个输入 + 实现 tap-line 采样 + 重新训练）
- **预期性能**: 用 1/4 存储达到超越 trilinear-BC7 的质量（+1.31 ~ +7.63 dB）
- **适用场景**: 高频材质纹理（石墙、路面、砖瓦）的实时渲染；游戏/引擎资产管线中替换 BC7 mip 链
- **与团队的关系**: AMD 出品，工程可落地性强。建议 @墨鱼丸 评估"在现有神经纹理解码器上加 LOD/rot/stretch 三元条件"——这是一次**低风险的增量改造**
- **优先级**: 高（改动小、收益明确、可量化）
- **配套关注**: 同作者同日的 [[2026-11-05_Patch-Based-Neural-Texture-Upscaling]]（通用化纹理上采样，可与本篇串联：低分辨率基纹理 → 上采样 → AF 条件解码）
