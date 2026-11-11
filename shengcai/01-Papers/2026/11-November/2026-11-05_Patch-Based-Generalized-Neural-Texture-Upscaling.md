---
type: paper
created: 2026-11-11
updated: 2026-11-11
tags: [paper, rendering, neural-texturing, texture-upscaling, real-time-rendering, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2611.07289
arxiv_id: 2611.07289
---

# Patch-Based Generalized Neural Texture Upscaling

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Patch-Based Generalized Neural Texture Upscaling |
| **作者** | Shin Fujieda, Takahiro Harada (**AMD**) |
| **发表** | arXiv cs.GR, 2026-11-05（预印本） |
| **链接** | [原文](https://arxiv.org/abs/2611.07289) |
| **DOI** | - |
| **代码** | 论文未公开链接 |

---

## 核心贡献

> 一个**通用化**的轻量 MLP，在纹理采样阶段即插上采样低分辨率纹理——**无需逐资产训练**，同一模型适用于任何现有场景。

1. **通用化（generalized）而非过拟合**：模型在多样化的纹理 patch 集合上训练，因此不需要 per-asset 训练。
2. **采样阶段上采样**：上采样发生在纹理采样阶段，而非离线烘焙。
3. **三重收益**：磁盘占用降低（存低分辨率基纹理）、VRAM 节省（无需存高分辨率纹理）、GPU 执行不分叉（单一权重集共享）。
4. **Patch-based 训练**：在 patch 级别训练，天然支持任意分辨率与任意 UV 布局。

---

## 技术方案

### 核心思想

纹理压缩（[[AF-NTC]] 那类）与纹理上采样是同一问题的两个极端。传统"per-asset 超分辨率"（如 TexSR）需要为每个资产训练一个网络——管线重、资产间不一致、无法增量更新。

本文把超分辨率做成**渲染管线内的一个通用组件**：一个共享的小 MLP，输入低分辨率纹理 patch，输出高分辨率 patch。

### 关键技术

| 技术 | 说明 |
|------|------|
| **通用 MLP** | 跨资产共享权重，单一集合 |
| **Patch 采样训练** | 在 patch 集合上训练，不绑定具体资产/UV 布局 |
| **渲染时上采样** | 嵌入纹理采样阶段，采样即插值 |
| **单权重集** | 所有纹理共享，GPU 执行不分叉 |

### 公式

```math
// 采样阶段上采样（语义形式）
Vec3 sampleUpscaled(Texture2D base, vec2 uv, float lod) {
    Vec3 c = base.sample(uv, lod);       // 低分辨率基纹理采样
    // 由通用 MLP 学习的细节重建
    return detailMLP(upsampleContext(uv), c, lod);
}
```

---

## 代码片段

```cpp
// 渲染管线集成（语义伪代码）
// 资产管线无需改动：只存低分辨率基纹理
TextureHandle baseTex = loadTexture(asset.lowResTexture);

// 纹理采样阶段统一上采样（单一共享权重，无 GPU 分叉）
Vec3 sampleMaterial(vec2 uv, float lod) {
    Vec3 lo = baseTex.sample(uv, lod);
    return sharedUpscaler.forward(uv, lo, lod);   // 通用 MLP，所有纹理共用
}
```

---

## 实验结论

- **数据集**: 多种纹理类别（论文含 mesh 资产评测，材质与网格混合）
- **基线**: 解析式上采样方法（bicubic 等）
- **结果**:
  - 在多个纹理类别上**感知质量一致优于解析式上采样方法**
  - **无需逐资产训练**——同一模型可直接用于任何现有场景，不需修改纹理数据或资产管线
  - 存储层：存低分辨率基纹理 → 磁盘占用下降
  - 运行时：采样时上采样 → 无需在 VRAM 中存高分辨率纹理
  - 单一权重集共享 → 保证 GPU 执行不分叉（无 divergent branch）

---

## 局限性

- 通用化必然带来**专用性损失**——相比 per-asset 专用模型，通用模型对特定高频材质的细节可能不足
- 预印本，未见同行评审
- 检索元数据中未包含完整数值表格（需查 PDF 补全具体 PSNR/LPIPS 数字）

---

## 相关工作

- [[2026-11-09_AF-NTC-Explicit-LOD-Conditioned-Anisotropic-Filtering]]
- [[2026-06-25-Neural-Texture-Compression-Hypernetworks]]
- [[2026-04-01_Neural-Harmonic-Textures]]
- 概念：[[神经纹理]], [[纹理上采样]], [[超分辨率]], [[纹理压缩]]

---

## 实现建议

- **实现难度**: 低（一个共享小 MLP + 纹理采样阶段接入）
- **预期性能**: 感知质量优于解析式上采样；磁盘与 VRAM 同时下降；GPU 执行不分叉
- **适用场景**: 通用游戏/引擎资产管线——**无需改动资产管线**，这是最大的工程优势
- **与团队的关系**: 同作者同日的 [[2026-11-09_AF-NTC]] 与本篇可**串联**：低分辨率基纹理 → 通用 MLP 上采样 → AF 条件解码器。建议 @墨鱼丸 把这两篇当成一条"神经纹理管线"整体评估
- **优先级**: 高（改动小、无需重训、收益直观）
