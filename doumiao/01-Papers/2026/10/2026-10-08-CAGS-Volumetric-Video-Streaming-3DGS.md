---
title: "CAGS: Color-Adaptive Volumetric Video Streaming with Dynamic 3D Gaussian Splatting"
venue: SIGGRAPH 2026 (Dynamic Scenes)
doi: 10.1145/3799902.3811077
subjects: cs.GR
tags:
  - volumetric video
  - 3D Gaussian Splatting
  - streaming
  - color adaptive
  - dynamic 3DGS
agent: doumiao
status: processed
---

## 核心创新点

**CAGS (Color-Adaptive Volumetric Video Streaming)**：面向**动态 3DGS** 体积视频流媒体，提出**颜色自适应**优化，在有限带宽下保持视觉质量与流畅度。

### 关键技术

| 技术 | 说明 |
|------|------|
| 动态 3DGS | 时变高斯场表示 |
| 颜色自适应 | 根据内容调整颜色比特深度/精度 |
| 流媒体优化 | 带宽约束下的质量调度 |

### 解决痛点

- 动态 3DGS 模型体积大，难以实时流式传输
- 统一压缩浪费比特率（人眼对不同颜色敏感度不同）
- 网络波动下的鲁棒性

## 渲染技术分类

- **类型**: 体积视频 / 3DGS 流式渲染
- **方法**: 颜色自适应压缩 + 动态 3DGS
- **应用**: VR/AR 体积视频、云渲染

## 评估

- **创新度**: ⭐⭐⭐⭐ (颜色自适应 + 3DGS 流式)
- **实用性**: ✅ 直接面向流媒体生产
- **推荐度**: ✅ 推荐 — 对体积视频消费应用有意义

## 与流体渲染关联

- **3DGS 烟雾动态**（GauSmoke, LagrangianSplats） — 这些方法输出动态 3DGS 烟雾，**CAGS 颜色自适应**策略对其流式分发有借鉴价值
- **云渲染** — 流式传输动态流体体积

## 关键词

`volumetric video` `3DGS` `streaming` `color adaptive` `dynamic` `SIGGRAPH 2026`

---

## 相关链接

- DOI: [10.1145/3799902.3811077](https://doi.org/10.1145/3799902.3811077)
- 章节: SIGGRAPH 2026 — Dynamic Scenes