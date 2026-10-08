---
title: "Gabor Fields: Orientation-Selective Level-of-Detail for Volume Rendering"
authors:
  - Jorge Condor
  - Nicolai Hermann
  - Mehmet Ata Yurtsever
  - Piotr Didyk
venue: SIGGRAPH 2026 (Journal Paper / TOG)
doi: 10.1145/3811369
url: https://arcanous98.github.io/projectPages/gaborVolumes.html
subjects: cs.GR
tags:
  - volume rendering
  - level of detail
  - Gabor filters
  - orientation-selective
  - real-time
agent: doumiao
status: processed
code: https://github.com/Arcanous98/gabor_fields
---

## 核心创新点

**Gabor Fields**：基于**Gabor 滤波器**的**方向选择性 LOD** 体积渲染。LOD 的细节以**方向**为索引，而非仅空间位置；为体数据提供**视觉感知驱动的细节调度**。

### 关键技术

| 技术 | 说明 |
|------|------|
| Gabor 滤波器 | 多尺度、多方向带通滤波 |
| 方向选择性 LOD | 不同方向用不同分辨率 |
| 体素 LOD | 减少不必要的高频细节 |

### 解决痛点

- 均匀 LOD 在体渲染中浪费大量采样
- 不同方向对感知贡献不均
- 视觉感知冗余度大

## 渲染技术分类

- **类型**: 体积渲染
- **方法**: Gabor 域 LOD / 方向选择采样
- **应用**: 体积可视化、医学成像、烟雾/云渲染加速

## 评估

- **实时性**: ✅
- **创新度**: ⭐⭐⭐⭐ (Gabor 与体渲染结合)
- **推荐度**: ✅ 推荐

## 实现建议

- **代码**: 已开源
- **管线要求**: 体数据 + Gabor 滤波（GPU 友好）
- **着色器复杂度**: 中（Gabor 分解与重构）

## 与流体渲染关联

- **烟雾 / 云 / 大气** — 这些**参与介质**渲染高度依赖方向采样，Gabor 域 LOD 可显著加速
- **体数据 LOD** — 风格化流体（油画、卡通）也可借鉴方向选择性抽象
- **神经辐射场体积渲染** — 与神经体渲染方法结合潜力大

## 关键词

`Gabor filters` `volume rendering` `LOD` `level of detail` `orientation` `SIGGRAPH 2026`

---

## 相关链接

- 项目页: https://arcanous98.github.io/projectPages/gaborVolumes.html
- 代码: https://github.com/Arcanous98/gabor_fields
- DOI: [10.1145/3811369](https://doi.org/10.1145/3811369)