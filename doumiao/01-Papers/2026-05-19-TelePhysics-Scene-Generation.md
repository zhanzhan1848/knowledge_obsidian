---
title: "TelePhysics: Physics-Grounded Multi-Object Scene Generation from a Single Image with Real-Time Interaction"
authors:
  - Yabo Chen
  - et al.
date: 2026-05-19
arxiv: 2605.20290
subjects: cs.GR, cs.CV
tags:
  - physics simulation
  - scene generation
  - 3D reconstruction
  - fluid simulation
  - particle system
  - real-time

---

## 核心创新点

**TelePhysics** — 训练无关（training-free）框架，将单张图像转换为物理一致、可控制的视频。通过全场景 3D 重建表示，统一空间坐标系解决物体穿透和对齐歧义。

### 解决的问题

- 扩散视频模型缺乏物理一致性和可控性
- 单图到 3D 方法存在物体穿透问题
- 物理场景生成方法存在空间错位、风格伪影

### 关键技术

1. **全场景统一 3D 重建**
   - 统一空间坐标系表示全场景几何
   - 解决物体穿透和对齐歧义

2. **场景级多物体交互**
   - 精确的场景级多物体物理交互
   - 高级力学操控控制类型

3. **模拟与渲染解耦**
   - 绕过高延迟先验
   - 实时物理交互预览 + 照片级视觉保真度

### 技术规格

| 指标 | 说明 |
|------|------|
| 框架类型 | Training-free |
| 物理精度 | 场景级多物体 |
| 延迟 | 实时预览 |
| 视觉保真度 | 照片级 |

---

## 渲染方法

- **类型**: 物理仿真 + 神经渲染
- **特点**: 模拟与渲染解耦
- **支持**: 实时交互预览

---

## 视觉质量

- **逼真度**: ⭐⭐⭐⭐⭐ (照片级)
- **物理一致性**: 场景级多物体
- **可控性**: 高级力学操控

---

## 性能预期

- **帧率**: 实时
- **延迟**: 低（解耦架构）
- **适用**: 交互式视频合成

---

## 实现建议

- **着色器复杂度**: 高
- **管线要求**: 物理仿真 + 渲染引擎
- **推荐度**: ✅

**适用场景**: 视频生成、物理仿真、交互式内容创作

---

## 链接

- Paper: https://arxiv.org/abs/2605.20290
- Code: https://github.com/xinzhang007/TelePhysics