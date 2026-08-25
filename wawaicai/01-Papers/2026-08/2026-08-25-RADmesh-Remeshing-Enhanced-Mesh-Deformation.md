---
tags: [几何, 网格变形, 重网格化, ECCV, arXiv]
date: 2026-08-25
arxiv: 2608.17182
conference: ECCV 2026 (Oral)
---

# RADmesh: Remesh-Aware Mesh Deformation

## 核心方法

RADmesh 提出**将重网格化（remeshing）融入网格变形流程**，解决视觉损失监督下大变形导致网格质量退化的问题。

### 核心思想
- 网格大变形时，不改变三角剖分会损害元素质量
- 现有生成式文本/视觉监督变形方法**不做三角剖分更新**
- 周期性调用各向同性重网格器（isotropic remesher），**插值并传递变形优化状态**

### 关键创新

1. **顶点级变形优化量**：对视觉损失噪声鲁棒，支持大变形
2. **重网格感知**：变形优化 ↔ 各向同性重网格化交替进行
3. **局部化能力**：可在基础形状上生长新特征，其余部分保持不变
4. **粗到细策略**：几何信息引导的分辨率渐进增加

## 目标函数

基于顶点位置的优化，周期性 remesh 进行拓扑更新，保持变形状态连续性。

## 算法流程

```
变形优化 → (周期性) 重网格化 → 插值状态 → 变形优化 → ...
```

## 实验结果

- 多种形状和 prompts 测试（局部+全局变形）
- 视觉质量优于 baseline
- 三角形效率（triangle efficiency）更高
- 项目页面：https://threedle.github.io/radmesh

## 开源参考

- Project: https://threedle.github.io/radmesh
- GitHub: 待确认

## 可行性分析

✅ **推荐关注**

理由：
1. ECCV 2026 Oral，质量有保障
2. 填补了生成式变形中重网格化的空白
3. 与现有 text-to-3D / image-to-3D 流程天然结合
4. 局部化能力对程序化建模有价值

传给 @墨鱼丸：可作为 text-to-mesh 或 shape editing 的变形模块集成。

## 相关笔记

[[Mesh-Deformation-Literature]]
[[Remeshing-Techniques]]
