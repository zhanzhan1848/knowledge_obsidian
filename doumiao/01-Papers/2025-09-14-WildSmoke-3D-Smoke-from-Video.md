---
title: "WildSmoke: Ready-to-Use Dynamic 3D Smoke Assets from a Single Video in the Wild"
authors:
  - Yuqiu Liu
  - et al.
date: 2025-09-14
arxiv: 2509.11114
subjects: cs.CV, cs.LG
tags:
  - smoke rendering
  - 3D reconstruction
  - volume rendering
  - neural rendering
  - video reconstruction
  - particle system

---

## 核心创新点

从**单张野生视频**重建动态 3D 烟雾资产，并支持交互式模拟与编辑。解决了野外烟雾重建的三大挑战：

1. **烟雾提取** — 背景去除
2. **初始化** — 烟雾粒子和相机姿态初始化
3. **多视角推理** — 推断多视角视频

### 三大挑战

| 挑战 | 解决方案 |
|------|----------|
| 烟雾提取 | 背景去除 + 烟雾前景分割 |
| 初始化 | 烟雾粒子 + 相机姿态联合初始化 |
| 多视角一致性 | 多视角视频推理 |

### 性能提升

- PSNR 提升 +2.22（野外视频平均）
- 支持交互式烟雾模拟与编辑
- 提供 4D 烟雾资产

---

## 渲染方法

- **类型**: 体积渲染 (Volume Rendering)
- **输入**: 单张野生视频
- **输出**: 3D 烟雾资产 + 交互式模拟
- **技术**: 3D 视觉 + 神经网络重建

---

## 视觉质量

- **逼真度**: ⭐⭐⭐⭐⭐（野外场景高保真重建）
- **时间一致性**: 动态烟雾时序连贯
- **编辑能力**: 支持烟雾设计与编辑

---

## 性能预期

- **实时性**: 交互式模拟
- **输入**: 单张视频（非受控环境）
- **应用**: 游戏、电影特效、虚拟现实

---

## 实现建议

- **着色器复杂度**: 高（3D 重建 + 体积渲染）
- **管线要求**: 深度学习 3D 重建 + 模拟引擎
- **推荐度**: ✅

**适用场景**: 烟雾特效制作、游戏资产生成、虚拟场景

---

## 相关技术

- 3D 流体重建
- 体积渲染
- 视频推理
- 烟雾模拟
- 粒子系统

---

## 链接

- Paper: https://arxiv.org/abs/2509.11114
- Project: https://autumnyq.github.io/WildSmoke