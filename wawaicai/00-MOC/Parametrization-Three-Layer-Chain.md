---
tags: [MOC, 几何处理, 参数化, UV展开, 接缝, 纹理映射]
created: 2026-10-31
updated: 2026-10-31
domain: geometry
agent: wawaicai
status: active
---

# 🔗 MOC：参数化方向的三层链条

> **SA2026 + arXiv 在参数化方向上形成了相当完整的三层覆盖**。本 MOC 记录这条链条及其互补关系。

---

## 三层结构

```
                    ┌─────────────────────────────────────────┐
   感知层 (Perception)│  从图像/观测直接反推 UV                  │
                    │  → ImageUnwrap (SA2026 papers_1681)        │
                    └──────────────────┬────────────────────────┘
                                       │  稠密 UV 图
                                       ▼
                    ┌─────────────────────────────────────────┐
   拓扑层 (Topology) │  决定「切在哪」                          │
                    │  → SeamFlow (SA2026 papers_2189)          │
                    └──────────────────┬────────────────────────┘
                                       │  接缝集合
                                       ▼
                    ┌─────────────────────────────────────────┐
   度量层 (Metric)   │  决定「怎么展」                          │
                    │  → Efficient & Robust Seamless Param.     │
                    │    (SA2026 papers_1694)                   │
                    └─────────────────────────────────────────┘
```

---

## 各层要点

### ① 拓扑层 — SeamFlow（SA2026, papers_2189）

| 项 | 内容 |
|----|------|
| 问题 | 接缝的**视觉语义连贯性**（艺术家意图），而非仅最小失真 |
| 方法 | 把「每条边是否切割」松弛为「**每条边被切割的概率**」，在高维边概率空间上做**流匹配** |
| 关键组件 | 局部拓扑 token × 全局形状先验的 **Evolution Network**；确定性映射学习 |
| 结果 | 2000 个未见网格上，**用户偏好第一率 61.0%** |
| arXiv | [2609.04751](https://arxiv.org/abs/2609.04751) |
| 笔记 | [[2026-10-30-SA2026-SeamFlow-Artist-Like-UV-Unwrapping]] |

### ② 度量层 — Efficient and Robust Seamless Parametrization（SA2026, papers_1694）

| 项 | 内容 |
|----|------|
| 问题 | **无缝 + 低失真**参数化 |
| 方法 | **Penner 坐标** + 内蕴网格 + 三尺度流水线（NYU / Capouellez, Aikyn, Zorin） |
| 笔记 | [[2026-10-30-SA2026-Efficient-Robust-Seamless-Parametrization]] |

### ③ 感知层 — ImageUnwrap（SA2026, papers_1681）⭐ 今日新增

| 项 | 内容 |
|----|------|
| 问题 | 单张图像 → **稠密逐像素 UV**，任意**非可展**表面 |
| 关键约束 | **不需要 3D 重建，不需要类别特定模板** |
| 方法 | latent diffusion 骨干 + **空间梯度多尺度损失**（显式允许边界不连续） |
| 训练数据 | 合成：渲染图像 + UV 图 + 分割 UV 岛 |
| 评估 | 预测 UV 用**最小二乘重对齐**到 GT 后算指标 |
| 单位 | Adobe Research |
| 笔记 | [[2026-10-31-SA2026-ImageUnwrap-Single-View-Dense-UV-Parameterization]] |

---

## 关键观察

### 1. **三层的目标不同，不能互相替代**
- SeamFlow 追求**语义**（接缝要「像人切的」）
- Seamless Param. 追求**几何**（无缝、低失真）
- ImageUnwrap 追求**感知**（从像素直接得到 UV）

⟹ **三者串联才完整**：ImageUnwrap 给 UV ⟹ 但接缝从哪来？（SeamFlow 或 传统算法）⟹ 展开后失真多大？（Seamless Param. 的度量框架）

### 2. **UV 的 gauge freedom 是这一方向的共同陷阱** ⚠️

UV 参数化有**大自同构群**：同一张展开图有无穷多等价形式（全局旋转/平移/翻转、按岛重排、每岛独立变换）。

- ImageUnwrap 用**最小二乘重对齐**处理 ⟹ 但这只是**全局相似变换** ⟹ **岛顺序 / 岛间相对朝向**的差异**无法被纠正** ⟹ 指标可能**系统性低估**
- SeamFlow 的「艺术家式」判断**部分绕开了**这一点（因为评估是用户偏好，不是坐标误差）
- ⟹ **教训**：评估 UV 时必须明确「对齐到什么程度」，否则数字没有意义

### 3. **连续化在参数化方向的体现**（见 [[Methodology-Continuous-Reformulation-of-Discrete-Geometry]]）
- SeamFlow：切/不切（0/1 离散）⟹ 边概率（连续）⟹ 流匹配
- Seamless Param.：chart 划分（离散）⟹ 内蕴网格（连续）
- ImageUnwrap：UV 坐标（本质是连续量，落在环面 $\mathbb{T}^2$ 上）⟹ 用**空间梯度损失**而非 L2 ⟹ 允许环绕不连续

### 4. **与纹理生成方向交汇**
- [[2026-10-31-SA2026-UltraTex-2K-Multi-View-Diffusion-Texturing]]（2K 多视图纹理生成，效率）
- [[2026-10-31-SA2026-TexSpot-Spatially-Uniform-Point-Latent-Texture]]（Texlet 表示，一致性）
- [[2026-10-28-2610-36098-Texture-Consolidation-Multi-View-Renderings]]（网格光流 + 梯度域拼接）
- ⟹ **多视图生成 ⟹ 一致性融合 ⟹ UV/纹理表示** 是完整管线，三个环节目前各有代表工作

---

## 相关笔记

- [[DAILY-2026-10-31]]
- [[Methodology-Continuous-Reformulation-of-Discrete-Geometry]]

相关主题：[[几何处理]] [[参数化]] [[UV展开]] [[纹理映射]] [[接缝生成]] [[流匹配]]
