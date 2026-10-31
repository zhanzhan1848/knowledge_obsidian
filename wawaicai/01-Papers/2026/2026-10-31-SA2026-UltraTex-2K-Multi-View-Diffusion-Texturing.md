---
type: paper
created: 2026-10-31
updated: 2026-10-31
source: SIGGRAPH Asia 2026 (Technical Papers)
sa2026_id: papers_2019
venue: SIGGRAPH Asia 2026 Conference Papers (ACM TOG)
status: accepted
authors: Yibo Zhang, Ze Yuan, Nan Cao
affiliations: 吉林大学 / VAST 等
tags: [几何, 3D纹理生成, 多视图扩散, DiT, 高分辨率, 2K纹理, 背景token丢弃, 块稀疏注意力, VAE解码]
domain: geometry
agent: wawaicai
recommendation: ⭐⭐ 推荐（2K 多视图扩散的效率方案，系统性工程）
---

# UltraTex: Unleashing 2K Multi-View Diffusion for 3D Texturing

> 📌 **SA2026（papers_2019）**。与 [[2026-10-31-SA2026-TexSpot-Spatially-Uniform-Point-Latent-Texture]] 互补：**UltraTex 治「算不动」，TexSpot 治「不一致 + 表示受限」**。

## 基本信息

| 项 | 内容 |
|----|------|
| **标题** | UltraTex: Unleashing 2K Multi-View Diffusion for 3D Texturing |
| **作者** | Yibo Zhang, Ze Yuan, Nan Cao |
| **发表** | **SIGGRAPH Asia 2026**（ACM TOG） |
| **代码** | https://github.com/yiboz2001/UltraTex（MIT）；模型在 ModelScope |
| **数据集** | **G-buffer TexVerse**（> 268,000 个 3D 资产的超高清多视图渲染数据集），HuggingFace 公开 |

---

## 技术概述

### 问题：多视图扩散纹理生成卡在 512/768 分辨率

**图像引导的 3D 纹理生成**（image-guided 3D texturing）的现有方法（多视图扩散）**受限于低运行分辨率**（512 或 768），**难以从高分辨率参考图保留高频细节**。

**为什么 2K 很难**：统一的多视图序列**超过 212K tokens** ⟹ **显存与延迟都不可接受**。

### 核心观察：多视图渲染有**两处主要冗余** ⭐

> 论文的关键洞察，写得很清楚：

| 冗余类型 | 说明 | 对策 |
|---------|------|------|
| **背景诱导的序列冗余**（background-induced sequence redundancy） | 同一张 2K 图的背景区域，在所有视图中**几乎相同**，占了大量 token | **Background Token Dropping** |
| **前景内部的稀疏 token 交互**（sparse token interactions within the foreground） | 前景 token 之间的注意力交互是**稀疏**的（远处视图对同一物体区域的贡献低） | **Block-Sparse Attention** |

### 技术方案（三件套）

#### ① Background Token Dropping

**在进入 DiT 骨干之前就移除背景 token**。

> 关键：不是「先算注意力再屏蔽」，而是**在算注意力之前就把 token 删掉** ⟹ 计算量与显存**直接按比例下降**。

#### ② Block-Sparse Attention（块稀疏注意力）

在前景序列上，**分块**做注意力，**减少注意力计算量**。

> 原理：多视图扩散里，**空间邻近的视图之间相关性最强**，远处的弱相关 ⟹ 块内密集、块间稀疏是合理近似。

#### ③ Foreground-Aware VAE Decoding ⭐

> **难点**：只做前景推理会**破坏 VAE 解码的空间结构**（因为 VAE 是整图编码的）。

**Foreground-Aware VAE Decoding** 的作用：**在只保留前景的条件下，依然保证最终高分辨率视图的质量**。

### 数据集：G-buffer TexVerse

- **> 268,000 个 3D 资产**
- **超高清（2K）多视图渲染**
- 含 **G-buffer**（albedo / normal / depth 等）
- 据 SA2026 报道：训练实际使用其中约 **27 万**（数据集总 35 万，训练用 27 万）

---

## 复杂度与性能

| 项 | 数值 |
|----|------|
| 目标分辨率 | **2048×2048**，**6 个视图**同时生成 |
| 统一序列长度 | **> 212K tokens**（朴素做法） |
| **训练加速** | **20.6× – 91.1×** |
| **端到端推理加速** | **22.3× – 74.6×** |
| 基座模型 | FLUX.1-dev 与 FLUX.2-Klein 两个版本 |
| 输出 | albedo + **metallic / roughness**（PBR 通道） |

> 加速比范围很宽（20.6–91.1×），说明**收益随场景中背景占比变化** ⟹ 背景占比越高，收益越大。

---

## 数值稳定性

### ✅ 优势
- ✅ **「先丢 token 再算注意力」** ⟹ 显存与算力**同比例下降**，不会因稀疏注意力实现不当而引入误差（它是**精确删减**而非近似）
- ✅ **Block-Sparse Attention 是近似** ⟹ 需权衡块大小与质量；块太小 ⟹ 块间信息丢失
- ✅ **Foreground-Aware VAE 解码**专门处理了「前景推理 → 整图 VAE」的**结构不匹配**问题 ⟹ 避免明显的解码伪影
- ✅ **多基座验证**（FLUX.1-dev + FLUX.2-Klein）⟹ 方法不绑定特定骨干

### ⚠️ 风险点
- ⚠️ **背景 token 的丢弃是「硬」操作** ⟹ 若前景与背景颜色相近，**分割/判别错误会导致前景轮廓被误删** ⟹ 需依赖前景-背景的可靠判别（本文用「foreground-only 推理」措辞，机制未在摘要展开）
- ⚠️ **Block-Sparse Attention 的近似误差**随视角间基线增大而增大 ⟹ 视角间隔的选择是关键超参
- ⚠️ **UV 失真问题未解决**：多视图生成 → 需要一致性融合到 UV ⟹ 失真仍由 UV 展开承担
- ⚠️ **2K × 6 视图的显存下限**仍不低 ⟹ 消费级 GPU 未必跑得动（论文未给具体显存数字）

---

## 推荐结论

✅ **推荐（系统/效率方向，可直接借鉴工程模式）**

### 理由
1. **「冗余分析 → 精确删减 → 稀疏注意力 → 专门化解码」的四步流水线**是可迁移的工程范式：
   - **任何「多视图 / 多 token 联合生成」的场景**都可以套用这个模式
   - 特别是**先删再算**这个顺序 —— 精确删减比事后屏蔽更省
2. **数据集 G-buffer TexVerse（268K 资产，2K 多视图 + G-buffer）规模可观** ⟹ 对任何多视图纹理工作都有价值
3. **PBR 输出（albedo + metallic + roughness）** ⟹ 直接对接生产管线
4. **MIT 许可代码 + 公开模型** ⟹ 可直接用

### 与 TexSpot 的组合
- **UltraTex**：把多视图扩散**推到 2K**（效率 + 细节保留）
- **TexSpot**：用 **Texlet 表示 + 全局形状上下文**解决**视图不一致 + 表示分辨率限制**
- ⟹ **理想组合**：UltraTex 产高分辨率多视图 ⟹ TexSpot 把它们一致地融合到高分辨率纹理表示上

### 落地建议
- **立即可试**：MIT 代码 + ModelScope 模型，做「参考图 → 2K 多视图 → 融合到现有网格 UV」的完整流程
- **移植建议**：Background Token Dropping 这一招可以移植到**任何基于 DiT 的多视图/多图生成**（包括 3DGS 生成、多图补全）

---

## 相关工作脉络

| 方向 | 代表 | 与本文关系 |
|------|------|-----------|
| 多视图纹理 | **TexSpot**（SA2026） | **互补**：一致性 + 表示 |
| 多视图纹理 | GLOSS（SA2026）、Texture Consolidation（arXiv 2610.36098）、ExMesh++ | 同赛道 |
| 高分辨率生成 | SUPIR / 各种 4K 扩散 | 技术基础 |
| 骨干 | FLUX.1-dev / FLUX.2-Klein | 基座 |
| 稀疏注意力 | 各种 block-sparse / sliding-window attention | 底层技术 |
| 抠图/前景 | 各类 foreground segmentation | Background Token Dropping 依赖 |
| PBR 纹理 | 各类 PBR 纹理生成 | 输出目标 |
| 数据集 | Objaverse / G-buffer TexVerse | 本文新建 TexVerse |

---

## 相关笔记

- [[2026-10-31-SA2026-TexSpot-Spatially-Uniform-Point-Latent-Texture]]
- [[2026-10-28-2610-36098-Texture-Consolidation-Multi-View-Renderings]]
- [[2026-10-30-SA2026-MeRM-Neural-Geometry-Tokens]]

相关主题：[[几何处理]] [[3D纹理生成]] [[多视图扩散]] [[DiT]] [[高分辨率生成]] [[PBR纹理]] [[稀疏注意力]]
