---
type: paper
created: 2026-11-12
updated: 2026-11-12
tags: [paper, PBR, 材质生成, 扩散模型, SIGGRAPH-Asia-2026, TOG]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2611.07354
---

# MIKU: Material Invariance and Knowledge Unification for PBR Generation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Material Invariance and Knowledge Unification for PBR Generation (MIKU) |
| **作者** | Yajie Bao, Jiaye Fu, Youtian Lin, Shuang Wu, Jiachen Qian, Feihu Zhang, Xun Cao, Yao Yao |
| **单位** | 南京大学 / 北京大学 / 香港大学 / DreamTech |
| **发表** | **SIGGRAPH Asia 2026 (ACM TOG)**, Vol. 45, Issue 6, Article 181, DOI: 10.1145/3842521 |
| **链接** | [原文](https://arxiv.org/abs/2611.07354) · [HTML全文](https://arxiv.org/html/2611.07354v1) |
| **DOI** | [10.1145/3842521](https://doi.org/10.1145/3842521) |
| **代码** | [github.com/DreamTechAI/MIKU](https://github.com/DreamTechAI/MIKU) |

---

## 核心贡献

> **PBR 材质生成的不稳定性，根源不在生成模型，而在材质标注本身缺乏标准化——MIKU 先统一"材质语言"，再谈"生成材质"。**

1. **统一 PBR 材质表示规范（Unified PBR Specification）**——为 20 个语义材质类别 + 4 个精细金属子类，各定义一组固定的 metallic/roughness 区间（如 Skin=0.0/0.40–0.50，Gold=1.0/0.09–0.15，Fabric=0.0/0.77–0.84），把艺术家各写各的异质标注归一化到公共参数空间。
2. **完整的数据标准化管线**——6 个标定视角重光照 + albedo/MR 联合复杂度过滤 + VLM 材质识别 + SAM3 语义分割 + 仿射投影+残差注入+人工精修，产出大规模标准化训练集。
3. **两阶段多视角 PBR 扩散模型**——先几何感知的 albedo 生成，再 metallic-roughness 生成（以 albedo 为条件）；**几何条件 CFG** 是关键设计。

---

## 技术方案

### 核心思想

论文提出的核心洞见是一个**逆向渲染欠约束性**问题：

> "even when geometry, albedo, camera view, and illumination are fixed, substantially different MR conditions may result in only minor shading differences after rendering."

即：**在图像空间中巨大的 MR 差异，可能只表现为渲染结果的微小差异**。这直接削弱了图像空间监督信号的有效性。做法不是改网络，而是**把监督空间标准化**——先消除标注歧义，再让扩散模型学。

论文把这个称为 **"decoupling representation standardization from appearance synthesis"**（表示标准化与外观合成解耦）。

### 数据标准化管线（4 阶段）

| 阶段 | 做法 | 解决什么 |
|------|------|----------|
| **① 重光照** | 用 **消色照明 (achromatic illumination)** 从 6 个标定视角重渲染 asset | 消除色偏干扰，保留 albedo 固有色 |
| **② 过滤** | 基于 **albedo 与 MR 方差的联合复杂度指标** 剔除低质样本 | 去掉渲染差异过小的歧义样本 |
| **③ 语义解析** | VLM 材质识别 → SAM3 按材质 prompt 分割 | 保证材质语义边界对齐 |
| **④ 细节增强** | 仿射投影 + **残差注入** + 高频提升 + 人工校验 | 保留细粒度纹理并保证跨视角一致 |

### 两阶段多视角生成

- **Stage 1 — Albedo 生成**：几何感知（depth/normal/pose 引导）多视角 albedo 合成，确保跨视角外观一致。
- **Stage 2 — MR 生成**：物理感知扩散模型，以生成的 albedo + 统一表示为条件，预测 roughness / metallic。

### 关键技术表

| 技术 | 说明 |
|------|------|
| **FLUX.2 backbone + LoRA** | 冻结主干，只训 LoRA；rank=256，scale=256，两阶段通用 |
| **Packed multi-view 输入** | 多视角打包为单一序列输入，天然获得跨视角注意力 |
| **几何条件 CFG** | 消融证明：文本 CFG 在强图像条件下几乎无效，参考图 CFG 会引入伪影，**几何 CFG 唯一稳定提升结构保真度** |
| **Hierarchical resolution training** | Albedo：512² 先训 5k 步（稳定全局布局）→ 1024² 再训 10k 步（高频细节）；MR 仅 512² 训 15k 步（MR 空间变化平滑，无需高分辨率） |
| **Logit-normal timestep sampling** | μ=−1, σ=1 |
| **统一 MR 材质表（20+4 类）** | 作为**类别级材质先验**注入，模型学会尊重语义部件边界 |

---

## 公式

```math
% 优化目标（两阶段共用）
\mathcal{L}_{2}=\sum_{c}\Big\lVert I_c-\mathcal{R}_c\Big(\sum_i \delta_i \circledast k_i\Big)\Big\rVert_2
```

```math
% 消色照明下的 albedo 观测：反射外观 = 固有属性 ⊗ 光谱成分
% 消色照明使 E[\lambda]=常数，从而解耦 albedo 与 illumination
I(\lambda) = \rho(\lambda)\cdot E(\lambda)
\;\xrightarrow{\text{achromatic}}\;
E(\lambda)=\text{const}\;\Rightarrow\;I(\lambda)\propto\rho(\lambda)
```

```math
% 统一材质规范：类别级材质先验
\text{MR}_{\text{cat}} = (\text{metallic}_{\text{cat}},\ \text{roughness}_{\text{cat}}\sim U[lo, hi])
% 例：Skin(0.0, 0.40-0.50), Fabric(0.0, 0.77-0.84), Gold(1.0, 0.09-0.15)
```

```math
% 几何条件 classifier-free guidance
\epsilon_\theta = \epsilon_\theta(z_t, c_{\text{image}}, c_{\text{geom}}) 
  + s \cdot \big(\epsilon_\theta(z_t, c_{\text{image}}, c_{\text{geom}}) 
  - \epsilon_\theta(z_t, \varnothing, \varnothing)\big)
```

---

## 代码片段

```python
# 实现细节（论文 §Implementation Details）
# 训练配置
model_backbone = "FLUX.2"          # 冻结主干
lora_rank = 256                    # 两阶段统一
lora_alpha = 256
num_gpus = 32                      # NVIDIA A800
total_batch_size = 64
optimizer = "AdamW"
betas = (0.9, 0.999)
lr = 5e-5
warmup_steps = 2000                # linear warm-up
timestep_sampling = "logit_normal" # mu=-1, sigma=1

# 分辨率课程
# Stage 1 (albedo): 512x512 @ 5000 steps  ->  1024x1024 @ 10000 steps
# Stage 2 (MR):     512x512 @ 15000 steps   (MR 空间平滑，无需高分辨率)
```

```python
# 材质规范化：把艺术家异质标注映射到统一材质表
UNIFIED_MR_SPEC = {
    "Skin":            (0.0, 0.40, 0.50),
    "Eye":             (0.0, 0.02, 0.12),
    "Hair":            (0.0, 0.35, 0.45),
    "Metal":           (1.0, 0.00, 0.10),
    "Teeth":           (0.0, 0.28, 0.34),
    "Lips":            (0.0, 0.30, 0.36),
    "Plastic":         (0.0, 0.32, 0.38),
    "Rubber":          (0.0, 0.48, 0.61),
    "Glass":           (0.0, 0.02, 0.05),
    "TransparentLiquid":(0.0, 0.01, 0.04),
    "Ceramic":         (0.0, 0.15, 0.26),
    "Stone":           (0.0, 0.66, 0.73),
    "Wood":            (0.0, 0.40, 0.60),
    "Leather":         (0.0, 0.49, 0.56),
    "Fabric":          (0.0, 0.77, 0.84),
    "Fur":             (0.0, 0.73, 0.80),
    "Paper":           (0.0, 0.82, 0.89),
    "Bone":            (0.0, 0.47, 0.54),
    "Gemstone":        (0.0, 0.03, 0.07),
    # 精细金属子类
    "Gold":            (1.0, 0.09, 0.15),
    "MirrorMetal":     (1.0, 0.01, 0.03),
    "PolishedMetal":   (1.0, 0.19, 0.25),
    "SemiRoughMetal":  (1.0, 0.35, 0.42),
    "MatteMetal":      (1.0, 0.68, 0.76),
}

def normalize_material(metal, rough, semantic_category):
    """把艺术家标注投影到统一材质空间的最邻近规范值。"""
    m_ref, r_lo, r_hi = UNIFIED_MR_SPEC[semantic_category]
    # metallic: 类别级先验（金属类强制 1.0，非金属强制 0.0）
    m_norm = m_ref
    # roughness: 投影到类别区间
    r_norm = min(max(rough, r_lo), r_hi)
    return m_norm, r_norm
```

---

## 实验结论

- **数据集**: Objaverse 构建的 200 个高质量 3D asset 基准（每个渲染 6 个随机视角）；TexVerse 公开数据集 + 私有资产库
- **基线**: MvAdapter、Unitex、Hunyuan3D-2.1、LumiTex、IntrinsicAnything、IntrinsiX、DualMat、RGB↔X、SuperMat、MVPainter、IDArb、MaterialMVP、MuMA、PacTure、PBR3DGen、MCMat
- **结果**:
  - 在 **CMMD / FID / LPIPS / CLIP Score / CLIP-FID 全部评估维度上一致优于 SOTA**
  - **标准化消融**：统一材质规范 vs 艺术家原始标注 → **73.2% 胜率 / 14.1% 平局 / 12.7% 负率**
  - **跨架构验证**：Hunyuan3D-V2.1 微调对比 → 预训练 3.04 分 / 原始数据微调 **2.11 分** / 标准化数据微调 **3.88 分**（5 分制）——**用未标准化的脏数据微调反而比不微调更差**，强力印证标注标准化是必要前提
  - **几何 CFG 消融**：相比文本 CFG / 参考图 CFG，几何条件 CFG 在结构保真度与细粒度一致性上唯一稳定提升
  - **推理效率**：1024×1024 分辨率下 **单次推理 < 1 分钟**
  - **风格不变性**：语义保持的风格变体下，预测 MR 的 MSE 一致性显著优于基线

---

## 局限性

- 依赖 **FLUX.2 闭源权重**，训练需 **32×A800**，复现门槛高（代码已开源但权重要求严格）
- 统一材质表是**人工设计的类别级先验**，对未覆盖的新材质类别（复合材料、特殊涂层）外推能力未验证
- 主要评测在 **Objaverse 静态资产**上，动态/多材质/多层嵌套场景未覆盖
- 材质识别依赖 **VLM + SAM3** 的语义分割质量，分割错误会直接传导为材质错误
- 高分辨率 albedo 需 10k 步 1024² 微调，显存与时间开销显著

---

## 相关工作

- [[2026-11-10_Deformable-Texture-Maps-Dynamic-Microgeometry-Neural-Textures]] — 神经纹理 / 几何属性与光照解耦（同样强调"编码几何而非辐射度"）
- [[2026-11-09_AF-NTC-Explicit-LOD-Conditioned-Anisotropic-Filtering]] — 神经纹理压缩的采样器级一致性
- [[2026-11-05_Patch-Based-Generalized-Neural-Texture-Upscaling]] — 神经纹理上采样
- [[2026-03-19_VideoMatGen-PBR-Materials]] — PBR 材质生成
- [[2026-07-07_LumiTex-PBR-Diffusion]] — PBR 扩散基线
- [[2026-05-05_Power-Foam-Unifying-Real-Time-Differentiable-Ray-Tracing-and-Rasterization]] — 可微渲染

---

## 实现建议

- **实现难度**: **中**（管线本身可实现，但训练资源门槛高；核心"统一材质表 + 消色重光照 + 几何 CFG"三个思想可低成本移植到任何 PBR 生成 pipeline）
- **预期性能**: 推理 <1 min @1024²；材质一致性显著优于 SOTA（73.2% 人类胜率）；跨架构可复现（把标准化数据喂给别的模型同样有效）
- **适用场景**:
  - ✅ **DCC 工具链的材质补全**（给定单图/多图生成整套 albedo+MR，直接进引擎）
  - ✅ **现有 PBR 生成模型的训练数据清洗**（即使不训练 MIKU，把自家标注投影到统一材质表也能提升稳定性）
  - ✅ **实时引擎资产流水线**（统一规范让材质在不同 DCC 之间可移植）
  - ⚠️ 不适合实时渲染路径本身——这是**离线资产生成**方法
- **对墨鱼丸的建议**: 若团队要做 PBR 材质训练，**优先采纳"统一材质表 + 消色重光照"的数据层改造**，而非直接复现整个模型——前者成本低 1–2 个数量级，且对已有模型即插即用。

---

## 与团队协作

- **可传递给 @墨鱼丸**: 统一材质规范表（24 类完整定义见上）、消色照明重光照流程、几何条件 CFG 实现要点
- **可反馈 @吊龙（后端）**: 材质标准化管线可做成资产导入服务的预处理步骤
- **可反馈 @五花肉（前端）**: 生成的 albedo/MR 对可直接驱动实时预览的 PBR 材质球
