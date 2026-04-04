---
type: paper
created: 2026-04-04
updated: 2026-04-04
tags: [paper, 3DGS, polarization, relighting, PBR, reflective-surface]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2603.14001
---

# Physically-Grounded Gaussians with Polarization Cues (PhyGaP)

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Physically-Grounded Gaussians with Polarization Cues |
| **作者** | Jiale Wu et al. |
| **发表** | CVPR 2026 / arXiv:2603.14001 [cs.CV] — 2026-03-14 |
| **链接** | [原文](https://arxiv.org/abs/2603.14001) |
| **DOI** | 10.48550/arXiv.2603.14001 |
| **代码** | 待发布 |

---

## 核心贡献

> 利用偏振线索实现精确反射分解和视觉一致的物体重光照

1. **偏振 deferred 渲染 (PolarDR)**：通过偏振 BRDF (pBRDF) 模型建模偏振，设计极化 deferred 渲染过程计算像素级 Stokes 值
2. **自遮挡感知环境图构建 (GridMap)**：解决非凸物体间接光照问题，每 300 次迭代更新 GridMap
3. **物理接地的高保真重建**：利用偏振线索恢复物理属性（albedo 和 reflectance），支持高质量重光照
4. **GridMap 开销**：训练时额外开销 24.1%，推理时 26.8%

---

## 技术方案

### 核心思想

现有 3DGS 方法在从 RGB 图像重建时难以正确恢复物理属性（albedo 和 reflectance），因此不支持高保真重光照。PhyGaP 观察到这一局限性源于 RGB 图像缺乏形状和材质信息，因此引入偏振线索。

### 关键技术

| 技术 | 说明 |
|------|------|
| 偏振 BRDF (pBRDF) | 物理接地反射模型 |
| PolarDR | 极化 deferred 渲染，计算像素级 Stokes 值 |
| GridMap | 自遮挡感知环境图构建技术 |
| 场景优化 | 支持全或部分偏振信息的直接场景优化 |

### 性能数据

| 指标 | PhyGaP | RGB 基线方法 |
|------|--------|-------------|
| PSNR | ~2 dB 提升 | 基线 |
| Cosine Distance | 45.7% 提升 | 基线 |

---

## 实验结论

- **数据集**：多个合成和真实场景
- **基线**：现有 RGB 基线方法
- **结果**：
  - PSNR 提升约 2 dB
  - Cosine Distance 提升 45.7%
  - 即使仅有部分偏振线索也能良好工作
- **训练时间**：GridMap 额外开销 24.1%

---

## 局限性

- 需要偏振相机或偏振线索输入
- 对非凸物体的间接光照建模仍有挑战
- GridMap 更新频率影响性能与质量平衡

---

## 实现建议

- **实现难度**：高（需要偏振成像设备）
- **预期性能**：接近实时渲染
- **适用场景**：高质量重光照、反射表面重建、AR/VR

---

## 相关工作

- 3D Gaussian Splatting (3DGS)
- Deferred Rendering (DR)
- BRDF 模型
- 偏振成像

---

## 标签

#渲染 #3DGS #PBR #偏振成像 #重光照 #反射 #CVPR2026 #2026
