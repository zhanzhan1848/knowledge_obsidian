---
type: paper
created: 2026-08-05
updated: 2026-08-05
tags: [paper, SVBRDF, PBR, texture-compression, rendering, real-time]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2607.27943
---

# Compact Representation of Mipmapped SVBRDFs via Shared Gaussians

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Compact Representation of Mipmapped SVBRDFs via Shared Gaussians |
| **作者** | Fengdi Zhang (et al.) |
| **发表** | arXiv cs.GR (2026-07-30) |
| **链接** | [原文](https://arxiv.org/abs/2607.27943) |
| **DOI** | 10.48550/arXiv.2607.27943 |
| **代码** | - |

---

## 核心贡献

> 提出Gaussian Texture Compression (GTC)，一种基于2D高斯的mipmapped SVBRDF压缩表示，在保持随机访问和实时解码的同时优于ASTC格式

1. 发现mipmapped SVBRDF数据的两大冗余来源：mip级别间和材质图间
2. 利用2D高斯的空间支撑与值分离特性，在两个维度上共享高斯
3. 通过渐进优化流水线训练GTC
4. 优于行业标准ASTC GPU纹理压缩格式，同时支持随机访问和非神经解码

---

## 技术方案

### 核心思想

2D高斯可以显式分离其空间支撑与携带的值，使得同一空间支撑可在不同mip级别和不同材质图间共享，仅附加级别/图特定信息。

### 关键技术

| 技术 | 说明 |
|------|------|
| 2D Gaussian Representation | 空间支撑与值分离 |
| Cross-Mip Sharing | mip级别间共享空间支撑 |
| Cross-Map Sharing | 材质图间共享空间支撑 |
| Progressive Optimization | 渐进优化训练流水线 |
| Random Access Decoding | 随机访问支持 |

### 压缩质量对比

GTC vs ASTC (行业标准GPU纹理压缩格式):
- 更高的重建质量
- 更低的内存占用
- 相同实时解码性能

---

## 实验结论

- **压缩质量**: 优于ASTC
- **内存占用**: 低于ASTC
- **解码方式**: 非神经、随机访问、实时
- **适用性**: 移动平台友好

---

## 局限性

- 需要预训练
- 对极端压缩率可能有限制

---

## 实现建议

- **实现难度**: 中
- **依赖**: 纹理压缩工具链
- **适用场景**: 游戏、实时渲染、PBR材质
- **推荐度**: ⭐⭐⭐⭐⭐

---

## 相关工作

- SVBRDF表示与压缩
- GPU纹理压缩 (ASTC, BC7, etc.)
- 基于物理的渲染材质
