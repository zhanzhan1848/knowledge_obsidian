---
type: paper
created: 2026-04-16
updated: 2026-04-16
tags: [global-illumination, neural-compression, lightmap, real-time, dynamic-lighting]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.12625
---

# Random-Access Neural Compression for Temporal Lightmaps in Dynamic Lighting Environments

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Random-Access Neural Compression for Temporal Lightmaps in Dynamic Lighting Environments |
| **作者** | Chao Li et al. |
| **发表** | arXiv/CVPR 2025 (cs.GR) |
| **链接** | [原文](https://arxiv.org/abs/2604.12625) |
| **DOI** | 10.48550/arXiv.2604.12625 |

---

## 核心贡献

> Neural Dynamic GI (NDGI)：时序光贴图集的高效神经压缩，实现动态光照环境下的实时全局光照。

1. 多维特征图 + 轻量网络替代显式存储多帧时序光贴图，显著降低存储体积
2. 训练期引入BC压缩仿真策略，支持最终特征图BC压缩，进一步提升压缩率
3. 结合虚拟纹理(VT)系统实现高效实时解压

---

## 技术方案

### 核心思想

动态光照环境下支持静态物体GI需要预计算多个不同时刻的光照条件（时序光贴图），存储和内存开销巨大。NDGI用神经网络隐式编码时序信息，仅存储网络参数+特征图，按需解码任意时刻的光照。

### 技术对比

| 方法 | 存储内容 | 压缩效果 | 实时性 |
|------|----------|----------|--------|
| 传统多时序光贴图 | 多帧完整光贴图 | 无 | 需大量内存 |
| NDGI | 特征图+网络权重 | 高 | 低解压开销 |

---

## 实验结论

- **发表**: CVPR 2025
- **对比**: 现有动态GI方法
- **结果**: 
  - 高质量动态GI
  - 极低存储和内存需求
  - 解压开销适度

---

## 局限性

- 需要针对特定场景训练网络
- 对极端动态光照变化可能需要更多时序样本

---

## 实现建议

- **实现难度**: 中高（需设计轻量神经网络+VT集成）
- **预期性能**: 存储大幅降低，实时解压可行
- **适用场景**: 游戏引擎光照、VR/AR实时GI、预计算光照系统

---

## 相关笔记

- [[Lightmap-Compression]]
- [[Real-Time-Global-Illumination]]
- [[Neural-Rendering-GI]]
- [[Virtual-Texture-GI]]
