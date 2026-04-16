---
type: paper
created: 2026-04-16
updated: 2026-04-16
tags: [event-camera, 3DGS, ray-tracing, depth-estimation, CVPR-2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2512.18640
---

# GPERT: Geometric-Photometric Event-based 3D Gaussian Ray Tracing

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Geometric-Photometric Event-based 3D Gaussian Ray Tracing |
| **作者** | Shintaro Shiba et al. |
| **发表** | arXiv/CVPR 2026 (cs.CV) |
| **链接** | [原文](https://arxiv.org/abs/2512.18640) |
| **DOI** | 10.48550/arXiv.2512.18640 |
| **代码** | https://github.com/e3ai/gpert |

---

## 核心贡献

> 解耦事件相机的几何（深度）和辐射（亮度）渲染分支，实现高精度高时间分辨率的3DGS重建。

1. 提出GPERT框架，解决事件相机3DGS中精度与时间分辨率的权衡问题
2. 核心创新：双分支渲染——事件级几何（深度）渲染 + 快照级辐射（亮度）渲染
3. 无需预训练模型或COLMAP初始化，训练速度快，场景边缘重建锐利

---

## 技术方案

### 核心思想

事件相机提供高时间分辨率的稀疏事件流，但直接用3DGS建模面临挑战：3DGS依赖绝对亮度渲染，而事件仅测量强度差分。该工作将渲染解耦为两个分支，利用光线追踪处理几何，warp事件处理辐射。

### 双分支架构

| 分支 | 输入 | 输出 | 方法 |
|------|------|------|------|
| 几何分支 | 事件流 | 深度 | 光线追踪每个事件 |
| 辐射分支 | 快照图像 | 亮度 | Warped Events图像 |

---

## 实验结论

- **数据集**: 真实世界事件相机数据集 + 合成数据集
- **基线**: 现有事件相机3DGS方法
- **结果**: 
  - 真实数据集：SOTA性能
  - 合成数据集：具有竞争力
  - 快速训练、无需初始化：显著优势

---

## 局限性

- 依赖事件相机的特定优势
- 合成数据上略逊于完美初始化方法

---

## 实现建议

- **实现难度**: 高（需结合事件相机模型、光线追踪、3DGS）
- **预期性能**: 高时间分辨率，低延迟
- **适用场景**: 高速场景重建、机器人视觉、AR/VR

---

## 相关笔记

- [[Event-Camera-Rendering]]
- [[3DGS-Ray-Tracing]]
- [[CVPR-2026-Rendering]]
