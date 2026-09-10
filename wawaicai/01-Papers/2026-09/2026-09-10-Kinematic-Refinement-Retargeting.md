---
tags: [几何, mesh-变形, motion-retargeting, skinning, self-penetration, SIGGRAPH-Asia]
date: 2026-09-10
domain: geometry
conference: SIGGRAPH Asia 2026 (Journal Track)
authors: [Seokhyeon Hong, Chaelin Kim, Inseo Jang, Soojin Choi, Junyong Noh]
---

# Skinned Motion Retargeting via Artifact-driven Kinematic Prior Refinement

## 核心方法

几何感知动作重定向，解决目标角色 mesh 自穿透问题。

**Pipeline:**
1. Transformer-based retargeting autoencoder → 跨任意骨骼对运动迁移
2. Artifact-driven refinement module：
   - 检测目标角色 posed mesh 上的自穿透
   - 通过 motion-to-vertex Jacobian 转换为纠正信号
3. Skinning weight-based joint-aligned geometry features 条件化解码

## 关键创新点

- 显式几何artifacts推理（自穿透）→ 运动优化
- 骨骼无关神经重定向 + 几何约束统一框架
- 在任意骨骼结构设置下减少几何伪影

## 推荐度

✅ **推荐** — 网格变形质量提升的实用工作，SIGGRAPH Asia 2026 Journal Track 录用。

## 链接

- Project: https://seokhyeonhong.github.io/projects/kinematic-refinement/
- arXiv: https://arxiv.org/abs/2609.06517
- 2026-09-06 提交
