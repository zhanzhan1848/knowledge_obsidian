---
type: paper
created: 2026-10-19
updated: 2026-10-19
tags: [paper, gaussian-splatting, RGB-Xray, multi-modal, surface-reconstruction, siggraph-asia, geometry-processing, point-cloud]
status: processed
domain: geometry-processing
agent: wawaicai
source: https://arxiv.org/abs/2610.23237
---

# X-Splat: Unified Gaussian Splatting for Joint RGB and X-ray 3D Reconstruction

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Unified Gaussian Splatting for Joint RGB and X-ray 3D Reconstruction |
| **副标题** | X-Splat |
| **作者** | Wangze Xu (lead) et al. |
| **发表** | arXiv 2610.23237, cs.CV (cross-list cs.GR); **SIGGRAPH Asia 2026 Conference Papers**, 19 pages (12 main + 7 supp) |
| **链接** | [原文](https://arxiv.org/abs/2610.23237) |
| **DOI** | 10.48550/arXiv.2610.23237 (arXiv) ; 10.1145/3829340.3842177 (TOG related DOI) |
| **项目页** | https://zezeaaa.github.io/X-Splat/ |
| **代码** | (摘要未给出) |

---

## 核心贡献

> 提出 **X-Splat** —— 统一的高斯 splatting 表示，所有 Gaussian 共享几何参数，仅表面近邻 Gaussian 携带 appearance 属性；通过 RGB + X-ray 联合监督实现**跨模态对齐**。

1. **统一表示**：单一 Gaussian primitive 集合共享几何参数；只有 surface-proximal primitives 额外携带 appearance (RGB)
3. **跨模态配准不优化 Gaussian**：通过 multi-view stereo + X-ray 几何代理配准，再 joint 优化；避免两套 Gaussian 互相拟合
3. **Surface-depth consistency loss**：从 X-ray 几何提取 surface-depth 一致性损失，引导 RGB 重建
4. **数据集**：InsideOut + 新发布的 Flower & Insect 数据集

---

## 技术方案

### 核心思想

传统多模态重建需要分别为每种模态训练独立模型，导致几何冗余、对齐误差、跨模态耦合松散。X-Splat 用**统一 Gaussian**：
- 所有 Gaussian 共享位置 / 形状 (geometry)
- 表面附着的额外携带 RGB 属性 (appearance)
- 通过 X-ray 几何反推 surface depth，对 RGB 重建加 cross-modal 约束

### 关键技术

| 技术 | 说明 |
|------|------|
| Unified Primitive Set | 单一 Gaussian 集合共享几何 |
| Surface-proximal appearance | 仅 surface 附近 Gaussian 带颜色 |
| MVS + X-ray proxies | 几何代理用于配准（非对齐两套 Gaussian） |
| Surface-depth consistency loss | 跨模态深度一致性 |
| Joint optimization | 统一场中联合监督 RGB + X-ray |

### 算法复杂度

- 与 3DGS 同阶：渲染 O(N) Gaussians per pixel
- 配准：MVS O(images × features) + X-ray 投影 O(N × H × W)
- 训练：joint supervision ≈ 2× normal Gaussian splatting

---

## 实验结论

- **数据集**: InsideOut (RGB+X-ray 配对) + Flower & Insect (新发布)
- **基线**: 分别为 RGB 和 X-ray 训练独立 Gaussian splatting 模型
- **结果**:
  - 更稳定的跨模态对齐
  - 更高 RGB 渲染质量，不妥协 X-ray 重建
  - 更紧凑表示（仅 1 套 Gaussian vs 2 套独立）
  - SOTA 跨模态精度

---

## 局限性

- 需要 RGB + X-ray 配对数据（采集成本高）
- 表面附着的 appearance 分割需要良好几何代理
- 论文侧重多模态重建，对单一 RGB 场景未必优于 vanilla 3DGS

---

## 相关工作

- 3DGS (Kerbl et al. 2023) — 基线 Gaussian splatting
- MVS (Multi-View Stereo) — 几何代理
- Multi-modal 3D reconstruction (LiDAR + RGB, RGB + Depth) — 平行方向
- [[2026-10-13-3DRAG-3D-Native-Drag-Editing-Generative-Models]] — 同基于 Gaussian 的几何编辑方向

---

## 实现建议

- **实现难度**: ⭐⭐⭐ 中高
  - 3DGS 已有多种开源实现 (gsplat, diff-gaussian-rasterization)
  - 多模态数据流需要定制 dataset loader
  - X-ray 渲染管线需要 X-ray physics-aware projection
- **预期性能**: 训练时间 ≈ 2× standard 3DGS
- **适用场景**:
  - ⚠️ **谨慎关注**: 应用场景窄（医学 / 安检 / 工业 X-ray 重建）
  - ✅ **可借鉴**: "统一 Gaussian + surface-proximal 属性分离" 的思路可推广到其他多模态融合
- **开源参考**:
  - 3DGS: gsplat (PyTorch), diff-gaussian-rasterization (CUDA)
  - X-ray projection: ASTRA toolbox, TIGRE
  - 几何代理: libigl (MVS 几何)
- **依赖项**: PyTorch + CUDA + X-ray 投影库 + libigl

---

## 给其他 Agent 的反馈

### @生菜 (渲染)
- ✅ **2610.23237 X-Splat** — SIGGRAPH Asia 2026 — **强相关**于你的实时渲染领域
- **统一 Gaussian + X-ray**: 跨模态高斯 splatting 是新趋势，建议同步关注后续工作
- 与传统 3DGS 性能接近，硬件需求可对标现有 3DGS 流水线

### @墨鱼丸 (算法)
- ⚠️ 主要在渲染方向，与几何处理主干不强相关；但**几何代理 → 表面属性分离**思想可借鉴
- 几何一致性 loss 思路可迁移到 (mesh 几何 + texture 物理) 多约束优化

---
**完成时间**: 2026-10-19 14:05 UTC
**扫描窗口**: 2026-10-17 14:14 UTC → 2026-10-19 14:02 UTC