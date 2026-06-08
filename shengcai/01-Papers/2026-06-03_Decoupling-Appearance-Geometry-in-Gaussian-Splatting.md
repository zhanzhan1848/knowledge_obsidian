---
type: paper
created: 2026-06-08
updated: 2026-06-08
tags: [paper, rendering, gaussian-splatting, 3DGS, novel-view-synthesis, geometry]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2606.05124
---

# Decoupling Appearance and Geometry in Gaussian Splatting

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Decoupling Appearance and Geometry in Gaussian Splatting |
| **作者** | Hongyu Zhou et al. |
| **发表** | arXiv cs.GR (2026-06-03) |
| **链接** | [原文](https://arxiv.org/abs/2606.05124) |
| **DOI** | 10.48550/arXiv.2606.05124 |
| **代码** | - |

---

## 核心贡献

> 发现 3DGS 默认形式无法同时表示纹理和几何的本质缺陷，提出为每个 splat 添加额外的几何不透明度参数，实现外观与几何的解耦。

1. **本质缺陷发现**：通过 ground-truth 纹理和几何信息的训练，验证 3DGS 默认形式天生无法同时表示纹理和几何
2. **几何不透明度参数**：为每个 splat 添加单一额外几何不透明度参数 $\alpha_g$，与原有的外观不透明度 $\alpha$ 解耦
3. **透明感优化管道**：提出可选的透明感精选（transparency-curated）优化流程
4. **广泛适用**：在多种数据集上改善了渲染和几何性能，带透明物体的复杂场景提升尤为显著

---

## 技术方案

### 核心思想

3DGS 的每个 splat 同时用同一个不透明度控制外观贡献和几何表示，两者耦合导致矛盾。引入独立的几何不透明度参数 $\alpha_g$ 专门控制几何 SDF 贡献，外观则由原始 $\alpha$ 控制。

### 关键技术

| 技术 | 说明 |
|------|------|
| 几何不透明度 $\alpha_g$ | 解耦几何和外观的不透明度控制 |
| Transparency-curated 优化 | 针对透明物体的特殊优化策略 |
| 双不透明度架构 | 独立优化外观和几何两条路径 |

---

## 实验结论

- **数据集**: 多种合成和真实场景数据集
- **结果**: 
  - 渲染质量提升（PSNR、SSIM 等指标改善）
  - 几何精度提升（尤其在透明物体场景）
  - 两者不再相互制约

---

## 局限性

- 需要额外的优化策略（透明感管道）
- 对极端透明场景仍具挑战

---

## 实现建议

- **实现难度**: 中（修改 3DGS 训练过程，添加参数）
- **预期性能**: 略微增加训练计算量，推理速度基本不变
- **适用场景**: 需同时获取高质量外观和精确几何的 3DGS 应用

---

## 相关工作

- [[3D-Gaussian-Splatting]]
- [[novel-view-synthesis]]
- [[rendering]]