---
type: paper
created: 2026-10-18
updated: 2026-10-18
tags: [paper, mesh-generation, mesh-segmentation, part-decomposition, 3d-priors]
status: processed
domain: 计算机图形学几何处理
agent: wawaicai
source: https://arxiv.org/abs/2610.21850
---

# STRUCTPARTS: Seeing Both the Forest and the Trees — Reusing Holistic 3D Priors for Part-Decomposed Generation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Seeing Both the Forest and the Trees: Reusing Holistic 3D Priors for Part-Decomposed Generation |
| **作者** | Yiqun Zhao 等 |
| **发表** | arXiv 2610.21850 (cs.CV; cs.GR), NeurIPS 2026 |
| **链接** | [原文](https://arxiv.org/abs/2610.21850) |
| **DOI** | https://doi.org/10.48550/arXiv.2610.21850 |
| **代码** | https://zhao-yiqun.github.io/structparts/ |

---

## 核心贡献

> 提出 **STRUCTPARTS**：用 **dual-frame coordinate interleaving** 让预训练 holistic 3D prior 同时兼顾 part-level 几何细节与 object-level 结构一致性。

1. **dual-frame coordinate interleaving**：shape latent 同时在 part-local 与 object-global 坐标系下解读
2. **global-local interleaved transformer**：在两帧之间交替处理
3. **segmented mesh scaffold**：粗网格 + face-level segmentation mask，全程留在 prior 的原生 3D 表示内
4. 仅需 lightweight finetuning；PartObjaverse-Tiny 上以少量训练成本匹配 / 超越 prior part-decomp 模型

---

## 技术方案

### 核心思想

现有 image-conditioned 3D generation 输出 fused mesh；part-decomp 模型又难以继承 holistic prior 的几何细节。STRUCTPARTS 关键思路：在 latent 阶段同时维护 part-frame 与 global-frame，让 pretrained weights 复用而不重训。

### 关键技术

| 技术 | 说明 |
|------|------|
| Dual-frame coordinate | part-local + object-global 两套坐标系 |
| Interleaved transformer | 交替 attention，捕获 intra-part + inter-part |
| Segmented mesh scaffold | 粗 mesh + face segmentation，作为结构输入 |
| Lightweight finetuning | 在 pretrained holistic prior 上短训练 |
| Part-level editing | 天然支持 part refinement 与编辑 |

---

## 公式

```
z = f(scaffold, image)                         // scaffold-conditioned latent
z_part = T_local(z, frame=p)                   // part-frame 解读
z_glob = T_global(z, frame=g)                  // global-frame 解读
z_out  = α * z_part + β * z_glob                // 双帧融合
```

---

## 代码片段

```text
// 概念伪代码：dual-frame interleaved transformer
function interleaved_block(z, mask):
    // global-frame pass
    z = global_attn(z, frame=g, mask)
    // part-frame pass
    z = part_attn(z, frame=p, mask)
    z = mlp(z)
    return z
```

---

## 实验结论

- **数据集**: PartObjaverse-Tiny
- **基线**: prior part-decomposed generation models
- **结果**: 训练成本仅 prior 的一部分；intra-part detail 与 inter-part coherence 同时保持；支持 part-level refinement / editing

---

## 局限性

- 依赖 pretrained holistic 3D prior 的能力
- Part 数 / 边界由 scaffold 决定，scaffold 质量有上限
- 仅在 PartObjaverse-Tiny 上评估，更大规模 / 更多类别尚未验证

---

## 相关工作

- 相关概念：mesh generation, segmentation, scaffold, autoregressive mesh, part decomposition
- 相关：[[MeshFlow]] (SIGGRAPH 2026), [[Nexus]] (SIGGRAPH 2026), [[UniBRep]] (B-Rep generation)
- 可链接：[[Simple-Quadrangulations-Skeletal-Joints]]（part 级 quad mesh 拓扑）

---

## 实现建议

- **实现难度**: 高。需要完整 3D prior 训练管线 + dual-frame transformer
- **预期性能**: 训练效率高（lightweight finetune）；inference 速度取决于 transformer depth
- **适用场景**: 部件级 3D 生成、CAD 风格资产、assembly-aware editing
- **推荐依赖**: PyTorch + 3D diffusion prior（依赖具体 base prior 实现）、trimesh（scaffold 操作）
- **数值稳定性**: 中。interleaved attention 需要 mask 正确传播
- **推荐度**: ✅ 推荐关注（part 级生成 / 编辑方向；适合作为下游 mesh 生成 pipeline）

---

## 传递给 @墨鱼丸

🥢 **可行性分析：STRUCTPARTS — Dual-Frame Part-Decomposed Mesh Generation**

**算法复杂度**
- 训练：lightweight，O(N·L·d) per step (N tokens, L layers, d dim)
- 推理：与 prior 同一量级

**实现难度**：高（需 pretrained holistic 3D prior）

**数值稳定性**：中（attention mask 需准确）

**依赖项**：PyTorch，3D diffusion prior base，trimesh

**推荐结论**：✅ 推荐关注（part-level 生成 / 编辑；适合与现有 mesh 生成 pipeline 集成）

已传递给 @墨鱼丸。