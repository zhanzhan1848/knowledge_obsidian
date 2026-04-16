---
type: paper
created: 2026-04-16
updated: 2026-04-16
tags: [cloud-rendering, 3DGS, streaming, real-time, viewpoint-flexibility]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.02851
---

# Streaming Real-Time Rendered Scenes as 3D Gaussians

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Streaming Real-Time Rendered Scenes as 3D Gaussians |
| **作者** | Matti Siekkinen et al. |
| **发表** | arXiv 2026 (cs.GR/eess.IV) |
| **链接** | [原文](https://arxiv.org/abs/2604.02851) |
| **DOI** | 10.48550/arXiv.2604.02851 |

---

## 核心贡献

> 云渲染新范式：将实时渲染场景的3DGS表示流式传输到客户端，替代传统2D视频流传输。

1. 提出Streaming 3DGS替代视频流：服务端构建优化3DGS模型，客户端本地渲染新视角
2. 支持全量快照+增量更新，实现刚体动态和重光照
3. 改进视角灵活性，相比传统视频流+图像空间变形显著提升延迟补偿效果

---

## 技术方案

### 核心思想

传统云渲染将渲染结果以2D视频流传输，视角与服务器绑定，灵活性受限。该工作将3DGS场景表示本身作为传输内容，客户端接收后本地渲染，实现真正的6DoF视角自由度。

### 系统设计

```
服务端：实时渲染参考视角 → 构建3DGS模型 → 快照+增量更新
     ↓ 网络传输
客户端：接收Gaussian表示 → 本地渲染当前视角
```

### 关键技术

| 技术 | 说明 |
|------|------|
| 3DGS场景表示 | 替代2D视频的核心传输格式 |
| Draco压缩 | 模型压缩减少传输带宽 |
| 增量更新 | 仅传输变化部分，带宽优化 |
| 虚拟纹理系统 | 支持重光照效果 |

---

## 实验结论

- **实现**: Unity原型系统
- **对比**: 传统视频流+图像变形
- **结果**: 显著改善视角灵活性，更好支持多用户场景建模分摊

---

## 局限性

- 3DGS构建需要服务端计算资源
- 动态场景的增量更新带宽需求
- 客户端需要一定的GPU渲染能力

---

## 实现建议

- **实现难度**: 中（基于现有3DGS实现）
- **预期性能**: 视角自由度大幅提升，传输带宽需优化
- **适用场景**: 云游戏、XR远程渲染、多用户3D共享

---

## 相关笔记

- [[3DGS-Cloud-Rendering]]
- [[Gaussian-Splatting-Baseline]]
- [[Real-Time-Rendering-Pipeline]]
