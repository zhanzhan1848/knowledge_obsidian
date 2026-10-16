---
type: paper
created: 2026-10-16
updated: 2026-10-16
tags: [paper, dataset, neural-material, PBR, cloth, BRDF, neural-radiance, reflectance]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.21090
venue: arXiv preprint (cs.GR)
year: 2026
---

# RoboCloth: A Large-Scale Real Cloth Material Dataset for Neural Reflectance Reconstruction

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | RoboCloth: A Large-Scale Real Cloth Material Dataset for Neural Reflectance Reconstruction |
| **作者** | Zhen Li, Haoran Qin, Francesco Di Sario, Daniel Rebain, Andrea Tagliasacchi |
| **发表** | arXiv preprint (cs.GR), 2026-10-15 |
| **链接** | [原文](https://arxiv.org/abs/2610.21090) |
| **数据集** | Hugging Face Hub, CC BY 4.0（500 真实布料材质） |

---

## 核心贡献

> 首个**机器人化大规模布料反射数据集** + 两阶段神经反射重建流程：500 种真实布料 × 580 HDR 帧 / 材质；Stage 1 学材质先验，Stage 2 拟合单材质 latent texture。

1. **500 真实布料材质**：通过机器人臂控制相机 + 光源，扫描整个视光半球
2. **每材质 ~580 HDR 帧**：稀疏表面几何 + per-point 反射观测
3. **两阶段神经 pipeline**: Stage 1 = 共享 MLP 解码器 (材质先验) → Stage 2 = 单材质 2048×2048 latent texture
4. **UBO2014 零样本迁移**：不需 modification 即可适应其他采集系统
5. **完整开源**: 数据集 + 校准文件 + 观测张量 + train/test splits, CC BY 4.0

---

## 技术方案

```
Data Acquisition (robotic arm):
  Camera ◄─── robot-controlled ───► Lighting ◄─── robot-controlled ───► Material sample
       ↓
  HDR capture × 580 frames / material (view-light hemisphere)
       ↓
  SfM refinement → robot-frame alignment
       ↓
Per-material: sparse surface geom + per-point reflectance tensors
       ↓
Stage 1: Train shared MLP decoder on 500 materials  → cloth material prior
Stage 2: Freeze decoder, fit 2048×2048 latent per target material
       ↓
Output: neural material representation, transferable
```

### 关键技术

| 技术 | 说明 |
|------|------|
| Robotic acquisition | 校准、可重复，跨系统可比 |
| Shared decoder + per-material latent | 解耦先验与实例，迁移能力强 |
| UBO2014 zero-shot | 跨采集系统泛化 |

---

## 与现有数据集对比

| 数据集 | 材质类型 | 大小 | 自动化 | 神经材质训练 |
|--------|----------|------|--------|------------|
| MERL | 通用(100) | 100 | 手工 | ✗ |
| UBO2014 | 通用 | 400 | 手工 | 部分 |
| **RoboCloth** | **布料(500)** | **500 × 580f** | **机器人** | **✓ + 开源** |

---

## 实现建议

- **实现难度**: 低-中（数据集已开源，pipeline 描述完整）
- **应用场景**:
  - 布料 / 服装 / 室内织物的 PBR 神经材质库
  - 离线渲染中需要真实反射外观的项目
  - 作为神经材质领域 benchmark 数据集
- **给 moyuwan 的建议**: 值得作为 SVBRDF / neural material 评测基线

---

## 备注

- 渲染相关性中等（核心是 data + neural reflectance，与 PBR 神经材质方向接壤）
- 对 wawaicai（几何）也有参考价值：稀疏表面几何重建
- 已开源 = 易于复现/扩展，列入 2026-10-16 报告作为「neural material dataset」条目
