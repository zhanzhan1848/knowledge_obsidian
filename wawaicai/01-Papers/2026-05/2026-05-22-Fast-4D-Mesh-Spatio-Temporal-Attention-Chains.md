---
title: "Fast 4D Mesh Generation by Spatio-Temporal Attention Chains"
authors: "Dvir Samuel, Yuval Atzmon, Gal Chechik, Yoni Kasten"
institution: "NVIDIA Research, Tel-Aviv; Bar-Ilan University"
date: 2026-05-21
category: Mesh-Generation, 4D-Reconstruction
tags: [4D-mesh, temporal-correspondence, attention, video-to-mesh, NVIDIA]
paper: https://arxiv.org/abs/2605.19786
project: https://research.nvidia.com/labs/par/fast4dmesh/
---

# Fast 4D Mesh Generation by Spatio-Temporal Attention Chains

## 核心方法

### 问题定义
从单目视频恢复动态3D网格，同时保持时间一致性和高效计算。

### 核心思想：Spatio-Temporal Attention Chain
- **关键发现**：4D backbone 在仅4步去噪后就已建立时序对应关系
- 将注意力视为软马尔可夫传输：通过注意力矩阵相乘获得 token 迁移概率
- 三步传播链：
  1. 锚帧顶点 → 锚帧潜在 token ($V_a \to Z_a$)
  2. 跨时间传输 ($Z_a \to Z_f$ via temporal self-attention)
  3. 投影回3D点 ($Z_f \to V_f$)

### 技术优势
- **训练无关** (training-free)，直接利用预训练4D backbone
- 锚帧网格细节得以保留
- 动态网格几何质量和时序一致性改善

## 性能指标

| 指标 | 数值 |
|------|------|
| 生成时间 | **9秒** (vs SOTA 需~2分钟) |
| 加速比 | **13×13×** |
| 视频长度 | 可扩展至 SOTA 的 **16×** |
| 下游任务 | 2D/4D 追踪、相机估计 |

## 算法流程

```
输入：单目视频
1. 图像→3D anchor mesh（现成方法）
2. 4D backbone 仅运行4步去噪
3. 从注意力图中提取时序对应场
4. 通过 Attention Chain 传播顶点
5. 输出：时序一致动态网格序列
```

## 开源实现

- Project Page: https://research.nvidia.com/labs/par/fast4dmesh/
- GitHub: 待发布

## 相关技术

- 相关工作：Consistent4D, DreamGaussian4D, 4DGen, SV4D, CAT4D
- 基础：ActionMesh (两阶段设计)
- 追踪基础：TAPIR, CoTracker, SPATracker

## 可行性评估

- ✅ **推荐实现** - 训练无关，可直接利用现有4D生成模型
- ⚠️ 需要预训练4D backbone 作为 backbone
- 可作为 墨鱼丸 的时序几何处理模块参考

## 与几何处理关联

- 网格时序一致性 → 拓扑保持变形
- 顶点对应场 → 网格追踪
- 锚帧几何保留 → 细节感知简化