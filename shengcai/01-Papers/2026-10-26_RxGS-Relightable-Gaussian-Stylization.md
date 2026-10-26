---
type: paper
created: 2026-10-26
updated: 2026-10-26
tags: [paper, 渲染, 可重光照, BRDF, 逆渲染, PBR, 3D高斯泼溅, 风格化, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.25681
---

# RxGS: Relightable Gaussian Stylization via BRDF Decomposition

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | RxGS: Relightable Gaussian Stylization via BRDF Decomposition |
| **作者** | Wanrong Hong¹, Liu Jiang², Mukesh Prasad³, Jun Li¹* （¹UTS, ²Stanford, ³AIIA；*通讯 jun.li@uts.edu.au） |
| **发表** | arXiv 2026-10-19（cs.CV） |
| **链接** | [原文](https://arxiv.org/abs/2610.25681) · [PDF](https://arxiv.org/pdf/2610.25681) |
| **DOI** | — |
| **代码** | 未提供 |

---

## 核心贡献

> 现有 3D 场景风格化都修改「每点 RGB 颜色」，而该颜色已经混合了材质反射率、环境光照与其产生的着色 —— 风格化时把光照**烘焙**进了外观，导致场景无法换光照重渲。RxGS 只优化**漫反射 albedo 场**，保持 roughness / metallicity / 法线 / 环境光 L 不变，从而保留完整 PBR 渲染器所需的全部输入。

1. **识别出「RGB 外观表示无法可重光照」的根因**：per-point RGB 同时编码了材质反射率、环境光照、由此产生的着色、以及视角相关效应；四者未分离。
2. **BRDF-aware 3D Gaussian 场景表示**：先用逆渲染（GS-IR 的分解）恢复每个 Gaussian 的 albedo a_i、roughness r_i、metallicity m_i、法线 n_i 与全局环境光 L。
3. **风格化 = 只优化 albedo 场**：在 **logit 参数化**下优化 {a_i}，加**最近邻特征匹配（NNFM）损失** + **Gaussian 中心上的 k 近邻图空间平滑项**；其余所有属性与几何完全不动。
4. **可重光照性来自「记账式」保证**（不是声称 albedo 单独决定渲染色）：PBR 渲染器消费几何 + {a_i, r_i, m_i, n_i} + L；RxGS 只改 {a*_i}，其余输入保持完整，故同一渲染器可在任意 L 下重跑，得到风格化场景的重光照结果。
5. **结果**：Geometry Consistency Cost（GCC，基于光流 warp 误差）在**所有评测的 NeRF-Synthetic 场景上最低**，在真实采集场景上保持竞争力，且**独有可重光照的风格化能力**。

---

## 技术方案

### 核心思想

**问题剖面图（论文 Fig. 1）**：

```
        Lighting L              Albedo α        Albedo α*
              ↓                    ↓                ↓
   RGB-based Appearance   BRDF-aware Appearance
   Representation          Representation
   （单点颜色 = 反射率 ⊗ 光照 ⊗ 着色 ⊗ 视角）
   → 风格化改颜色 ⇒ 光照被写死 ⇒ 换光不响应
                              → 只改 albedo ⇒ L 可换 ⇒ 可重光照
```

**技术路线**：

1. **场景重建 + 逆渲染分解**：输入重建好的场景（NeRF-Synthetic 或真实采集），用 GS-IR（Zhou et al.）的 BRDF-aware Gaussian 逆渲染恢复：
   - 每 Gaussian 漫反射 albedo a_i
   - roughness r_i、metallicity m_i
   - 表面法线 n_i
   - 全局环境光照 L（球谐/环境图）
   - 几何（Gaussian 的位置/尺度/旋转）
2. **风格化阶段**：只把 {a_i} 作为优化变量。参考图提供风格，通过 VGG 特征空间的最近邻特征匹配损失驱动。
3. **输出**：风格化后的 albedo 场 {a*_i} + 未变的 {r_i, m_i, n_i} + 未变的 L + 未变的几何 → 送入 PBR 渲染器即可得到风格化结果；更换 L 即得到重光照结果。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Logit 参数化的 albedo 场** | 把漫反射反照率在 logit 空间优化（保证值域约束在 [0,1] 有效域内），避免优化到无效颜色 |
| **NNFM loss** | 在 **VGG 特征空间**做最近邻特征匹配，而非像素空间 —— 保留风格语义结构，减少像素级伪影 |
| **空间平滑先验** | 在 Gaussian 中心的 **k 近邻图**上施加平滑项 —— 保证 albedo 在局部邻域内连续，避免斑点式噪声 |
| **GS-IR 输入** | RxGS 直接消费 GS-IR 的分解结果，不重新做逆渲染 |
| **GCC 评估指标** | Geometry Consistency Cost，基于**光流 warp 误差**衡量跨视角几何一致性 —— 风格化不应破坏几何 |

**为何 albedo-only 就能保住可重光照性**：PBR 渲染器的输入契约是 {几何, (a, r, m, n), L}。风格化只替换 albedo 系数，其余输入逐一保持不变 ⇒ 渲染器契约完整 ⇒ 换 L 重跑即可。这不需要 albedo 本身"决定"最终颜色。

---

## 实验结论

- **数据集**：NeRF-Synthetic（合成场景，全评测 GCC 最低）+ 真实采集场景（保持竞争力）
- **基线**：现有基于参考图的 3D 场景风格化方法（NeRF / 3DGS 类 RGB 外观表示方法）
- **结果**：
  - GCC（光流 warp 误差）：**所有评测的 NeRF-Synthetic 场景上最低**
  - 真实采集场景：保持竞争力
  - **独有能力**：风格化后仍可重光照（现有参考图风格化方法均不提供）

---

## 局限性

1. **依赖前置逆渲染的准确性** —— RxGS 消费 GS-IR 的分解。若分解阶段 albedo / 法线 / 环境光不准（尤其真实场景），误差直接传播，且风格化只修 albedo，无法修正分解本身的错误。
2. **全局单一环境光 L** —— 建模的是单一全局环境光照，无法表达空间变化的局部光源（点光源、面光源的强度/位置随时间变化）。
3. **只编辑 albedo** —— 无法风格化依赖 roughness / metallicity 的材质特征（金属质感、釉面光泽），风格迁移范围受限。
4. **需要重建几何与法线** —— 对自由视角/单图输入的场景不适用。
5. **GCC 之外的风格质量评估不够全面** —— 主要指标是几何一致性，风格化保真度更多依赖定性评估。
6. **代码未公开**。

---

## 相关工作

- [[GS-IR]] — RxGS 所依赖的 BRDF-aware Gaussian 逆渲染分解
- [[3D-Gaussian-Splatting]] — 基础表示与可微高斯光栅化
- [[NeRFactor]] — NeRF 系逆渲染分解（几何/反射率/可见性/光照）
- [[PhySG]] — 球高斯 BRDF 表示
- [[TensorIR]] — 张量分解式逆渲染
- [[GaussianShader]] — 高斯着色函数
- [[Relightable-3DGS]] — 每 Gaussian 附加 BRDF 属性与入射光
- [[2026-10-26_JointLight-Async-RGB-Irradiance-Relighting]] — 同批次，另一条「光照传输控制」路线（diffusion + path-traced irradiance cue）
- [[2026-10-26_RADIANT-Object-Centric-Feed-Forward-Global-Illumination]] — 同批次，另一条 GI 路线（feed-forward transformer）

---

## 实现建议

- **实现难度**：**中**。若已有 BRDF-aware Gaussian 逆渲染流水线（GS-IR / Relightable-3DGS），加一层 albedo-only 风格化优化即可。
- **预期性能**：优化式（每场景训练），非前馈。风格化阶段只优化 albedo 场（比优化全部外观参数便宜），且优化后**无需重复**即可在任意光照下重渲。
- **适用场景**：
  - ✅ 艺术风格化 + 需要多光照版本（影视预演、游戏美术资产）
  - ✅ 材质编辑流水线（改 albedo 保留物理属性）
  - ✅ 与 PBR 渲染器对接的场景资产生产
  - ❌ 单图输入 / 无几何重建
  - ❌ 需要风格化金属/光泽质感
- **推荐度**：**⭐⭐⭐⭐ 推荐** —— 「RGB 外观 = 反射率⊗光照⊗着色」的耦合问题是我们所有神经渲染/风格化工作都会踩的坑。这篇给出了**干净的解耦契约**（只改 albedo，其余记账式保持），对我们设计材质编辑/可重光照流水线有直接借鉴价值。

---

## 原始链接

- 论文：https://arxiv.org/abs/2610.25681
- PDF：https://arxiv.org/pdf/2610.25681
