---
title: "Latent Dynamics for Full Body Avatar Animation"
authors:
  - Meta Codec Avatars Lab
date: 2026-05-20
arxiv: 2605.21478
subjects: cs.CV, cs.GR
tags:
  - 3D Gaussian Splatting
  - avatar animation
  - loose clothing
  - particle dynamics
  - neural rendering
  - latent dynamics

---

## 核心创新点

**隐变量动力学** 用于 3D Gaussian Avatar 的宽松服装动画，通过 transformer 解码器和动力学残差隐变量捕捉超越姿态的历史依赖形变。

### 解决的问题

- 宽松服装形变取决于历史、惯性和接触，姿态无法完全解释
- 现有方法将隐变量固定、从姿态回归或从训练数据检索，无法建模其自身动力学
- 细粒度细节丢失，产生模糊渲染和时间伪影

### 关键技术

1. **Pose-conditioned 3D Gaussian Avatar**
   - 基于 [Wang et al., 2025] 的 3DGS avatar

2. **Transformer 解码器**
   - 捕捉数据中的细粒度形变细节
   - 两个输入：用户驱动的信号（身体+面部关键点）+ 残差隐变量

3. **Latent Dynamics Model**
   - 预测残差隐变量如何随姿态驱动演化
   - 分解每次更新为：驱动力(Driving)、恢复力(Restoring)、耗散力(Dissipative)
   - 从短时姿态历史 + 前一隐变量状态预测
   - 增量积分更新隐变量

4. **多服装支持**
   - 9 个受试者、多种宽松服装验证

### 技术规格

| 指标 | 说明 |
|------|------|
| 隐变量分解 | 驱动力 + 恢复力 + 耗散力 |
| 推理开销 | 极小 |
| 控制参数 | 刚度、阻尼、响应度 |

---

## 渲染方法

- **类型**: 3D Gaussian Splatting (3DGS)
- **动态建模**: Latent Dynamics Model (时序一致性)
- **形变捕捉**: 宽松服装、头发、软组织

---

## 视觉质量

- **逼真度**: ⭐⭐⭐⭐⭐ (细粒度服装形变)
- **时间一致性**: 历史依赖的连贯滚动
- **可控性**: 刚度/阻尼等参数控制

---

## 性能预期

- **帧率**: 实时渲染
- **推理开销**: 极小（隐变量更新）
- **内存占用**: 3DGS 高斯点存储

---

## 实现建议

- **着色器复杂度**: 高（transformer + 3DGS）
- **管线要求**: 3DGS + Transformer
- **推荐度**: ✅

**适用场景**: 数字人动画、远程存在、宽松服装形变仿真

---

## 相关技术

- 3D Gaussian Splatting [Kerbl et al., 2023]
- Pose-driven Avatars
- Transformer 解码器
- Latent Space Dynamics
- 粒子/服装物理仿真

---

## 链接

- Paper: https://arxiv.org/abs/2605.21478
- Video: https://youtu.be/xjnr3YM0yIE