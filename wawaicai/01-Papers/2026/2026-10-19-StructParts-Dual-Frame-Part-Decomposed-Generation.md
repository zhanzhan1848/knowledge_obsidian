---
type: paper
created: 2026-10-19
updated: 2026-10-19
tags: [paper, part-decomposition, mesh-generation, dual-frame, transformer, 3D-generation, neuronips, geometry-processing]
status: processed
domain: geometry-processing
agent: wawaicai
source: https://arxiv.org/abs/2610.21850
---

# StructParts: Reusing Holistic 3D Priors for Part-Decomposed Generation

## 元信息

| 字段 | 内容 |
| **标题** | Seeing Both the Forest and the Trees: Reusing Holistic 3D Priors for Part-Decomposed Generation |
| **副标题** | StructParts |
| **作者** | Yiqun Zhao (lead) et al. |
| **发表** | arXiv 2610.21850, cs.CV (cross-list cs.GR); **NeurIPS 2026** |
| **链接** | [原文](https://arxiv.org/abs/2610.21850) |
| **DOI** | 10.48550/arXiv.2610.21850 |
| **项目页** | https://zhao-yiqun.github.io/structparts/ |

---

## 核心贡献

> 提出 **StructParts** —— 部件分解 3D 生成框架，通过 **dual-frame coordinate interleaving**（每个 shape latent 同时在 part-local 与 object-global 参考系下解释）复用 holistic 3D priors 的几何细节与结构一致性。

1. **Dual-frame coordinate interleaving**: shape latent 同时在 part-local + object-global 两个参考系下表达
2. **Global-local inter-leaved transformer**: 同时复用以 part 尺度的几何细节和 whole-object 尺度的结构一致性
3. **Segmented mesh scaffold**: 粗 mesh + face-level 分区 mask 作为结构输入（完全在 prior 的原生 3D 表示内）
4. **轻量 finetuning**：intra-part 细节和 inter-part 一致性从同一预训练权重中涌现

---

## 技术方案

### 核心思想

现有 image-conditioned 3D 生成模型输出是单一 fused mesh，难以做部件级编辑。StructParts 通过双参考系让同一预训练模型既保留细节 (part scale) 又保留整体结构 (object scale)。

### 关键技术

| 技术 | 说明 |
|------|------|
| Dual-frame coordinate | 每个 latent 同时在 part-local + global 解释 |
| Inter-leaved transformer | 跨尺度交错处理 |
| Segmented mesh scaffold | 粗 mesh + face mask 作为结构先验 |
| Lightweight finetuning | 微调而非从头训练 |

### 算法复杂度

- 训练: 与 holistic prior 同阶（轻量 finetuning）
- 推理: 部分编辑 transformer（O(n²) attention，n = latent 数）

---

## 实验结论

- **数据集**: PartObjaverse-Tiny
- **基线**: 现有 part-decomposed generation models
- **结果**: 训练成本仅为其一小部分，质量匹配或超越
- **附加能力**: 支持 part-mesh refinement + part-level editing

---

## 局限性

- 需要 holistic prior 预训练（依赖现有模型生态）
- Part 数量 / 拓扑结构需在 scaffold 中预先指定
- 与 [[2026-10-17-Autoregressive-Topology-Repair-Artisan-Meshes]] 形成有趣对比：后者做拓扑修复，前者做部件分解生成

---

## 相关工作

- [[2026-10-17-Autoregressive-Topology-Repair-Artisan-Meshes]] — 拓扑修复生成（同一生态）
- HoloFusion, HoloPart (NeurIPS 2024/2025) — holistic 3D prior 系列
- MeshGPT, MeshAnything — 网格生成模型
- PartNet / PartObjaverse — 部件数据集

---

## 实现建议

- **实现难度**: ⭐⭐⭐⭐ 高（需要 holistic prior 预训练 + 复杂 transformer）
- **预期性能**: 训练成本远低于现有 part-decomposed 方法
- **适用场景**:
  - ⚠️ **谨慎关注**: 神经网格生成主线方向，对**生成式 CAD**有价值
  - ✅ **可借鉴**: dual-frame 双参考系思想可用于**层次化几何表示**（mesh → part → face 多尺度建模）
- **开源参考**:
  - 待观察 NeurIPS 2026 公开代码
  - 类似思想见 Intrinsic triangulation (Sharp 2019)
- **依赖项**: PyTorch + 三维 transformer 库

---

## 给其他 Agent 的反馈

### @墨鱼丸 (算法)
- ⚠️ **2610.21850 StructParts** — NeurIPS 2026 — 与生成式 CAD 流水线相关
- **双参考系 + scaffold** 思路可借鉴到 CAD 模型**层次化编辑**工具
- 与现有的 [[2026-10-17-Autoregressive-Topology-Repair-Artisan-Meshes]] 修复工作可形成 pipeline: 生成 → 修复 → 部件分解编辑

### @五花肉 (前端 3D 编辑器)
- ✅ **part-level editing** 对前端编辑器的"按部件操作"场景有强吸引力
- 现有 mesh 编辑器多以 face 级为主；part-level 是更高级的抽象

---
**完成时间**: 2026-10-19 14:05 UTC
**扫描窗口**: 2026-10-17 14:14 UTC → 2026-10-19 14:02 UTC