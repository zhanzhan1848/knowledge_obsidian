---
type: paper
created: 2026-11-08
updated: 2026-11-08
tags: [paper, volumetric-video, tsdf, marching-cubes, gpu-native, real-time-reconstruction, rgb-d, texture-mapping, wacv2027]
status: processed
domain: 流体渲染
agent: doumiao
source: https://arxiv.org/abs/2611.03033
---

# GPU-Native Real-Time Textured Mesh Reconstruction with Seam-Aware Multi-View Radiometric Correction

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | GPU-Native Real-Time Textured Mesh Reconstruction with Seam-Aware Multi-View Radiometric Correction |
| **作者** | Hiroyuki Sato |
| **发表** | arXiv preprint 2026-11-02 · **Accepted to WACV 2027** (20 pages incl. appendix) |
| **链接** | [原文](https://arxiv.org/abs/2611.03033) |
| **DOI** | 10.48550/arXiv.2611.03033 |
| **代码** | 未在摘要中给出 |

---

## 核心贡献

> 一套**全 GPU 常驻**的实时体积视频系统：TSDF 融合 → Marching Cubes → 连通分量去噪 → 视角纹理映射 → inpainting → 辐射度接缝校正，**全程不返回主机**；用**定长数组网格拓扑**实现 GPU 上常数时间邻接访问；用**逐相机低频增益场**消除曝光接缝。

1. **全管线 GPU 常驻** —— 消除 CPU 网格处理、CPU 侧纹理化、以及阶段间的 CPU-GPU 传输，这是实时性的主要来源。
2. **定长数组拓扑表示** —— 网格拓扑用固定大小数组表示，GPU 上邻居访问是 **O(1)**，使下游网格级操作**数据并行**。
3. **辐射度接缝校正** —— 逐面从单相机取纹理会留下平滑变化的曝光接缝；估计**逐相机低频增益场**并**在 GPU 上烘焙进图集**（atlas）。

---

## 技术方案

### 核心思想

现有 TSDF 系统（如 nvblox）已能加速融合与网格提取，但扩展到**逐帧带纹理网格**时不得不引入 CPU 处理或额外传输。本文的核心主张：**输入 staging 之后，整条重建+纹理化管线常驻 GPU**。

关键工程创新是网格拓扑的表示方式：传统 GPU 网格处理需要哈希表/邻接表查询（不可数据并行），本文用**定长数组**表示网格拓扑，使邻居访问变成常数时间索引。

### 关键技术

| 技术 | 说明 |
|------|------|
| **TSDF 融合** | 多 RGB-D 传感器体素融合 |
| **Marching Cubes** | GPU 上的等值面提取 |
| **连通分量去噪** | GPU 上的浮空噪声块剔除 |
| **视角纹理映射** | 每个三角面从单一相机投影取色 |
| **Inpainting** | 填充未观测区域 |
| **定长数组网格拓扑** | 常数时间邻居访问 → 网格级操作数据并行 |
| **逐相机低频增益场** | 估计曝光低频变化，烘焙进图集消除接缝 |
| **GPU 常驻管线** | 阶段间无主机往返 |

---

## 公式

```math
\textbf{定长数组拓扑：}\quad
\text{faceAdj}[3i + k] \in \{0,\dots,N_f-1\}
\quad\Rightarrow\quad
\text{邻居访问复杂度 } \mathcal{O}(1)\ \text{而非哈希 }\mathcal{O}(1)\text{ 均摊但不可并行}

\textbf{逐相机辐射度校正：}\quad
I^{\,\text{corrected}} = I \cdot G_c(\boldsymbol{u},\boldsymbol{v})
\quad\text{其中 } G_c \text{ 为相机 } c \text{ 的低频增益场},\ \bar{G}_c \to 1

\textbf{图集烘焙：}\quad
A(\boldsymbol{u},\boldsymbol{v}) \leftarrow
I_{c(\boldsymbol{u},\boldsymbol{v})}(\boldsymbol{u},\boldsymbol{v})\cdot G_{c(\boldsymbol{u},\boldsymbol{v})}
```

---

## 实验结论

- **数据集**: **CMU Panoptic**（多 RGB-D 传感器）
- **基线**: CUDA 加速的 **nvblox**、CPU 版 **Open3D**、离线带纹理网格化基线
- **结果**:
  - 在**所有测试的体素分辨率与传感器数量**下均快于基线
  - 相对 nvblox / Open3D 峰值加速**超过一个数量级**
  - 感知重渲染质量**接近离线带纹理网格化基线**

---

## 局限性

- **需 RGB-D 传感器**，非单目；重建精度受 TSDF 固有精度限制
- **逐面单相机取色**：必然产生曝光接缝，靠增益场校正——但对**强烈非朗伯材质**（镜面、玻璃）增益场模型失效，而流体/水面正是强高光材质
- **未涉及动态场景与流体**：本文目标是静态重建逐帧更新，流体快速形变下的时间一致性未讨论
- **WACV 2027**，非 SIGGRAPH 系

---

## 与流体渲染的关联

- **体积视频（volumetric video）** 是流体渲染的上游环节——重建的场景常常包含**水/液体**（浴缸、游泳池、玻璃水箱）
- **本文的增益场校正思路可迁移到流体渲染的辐射度处理**：多视角拍摄的水体在体积渲染中同样面临逐视角曝光差异与接缝
- **GPU 常驻 + 定长拓扑**的工程范式，是**实时体积渲染**（如 volumetric video streaming）的直接参考
- 与 [[2026-10-08-CAGS-Volumetric-Video-Streaming-3DGS]] 属同一"体积视频"研究簇
- 对流体的直接增益：重建好的水面网格可作为**自由表面流体模拟的边界条件**

---

## 实现建议

- **实现难度**: 中高（需要 CUDA 全管线重构，工作量大但技术路径清晰）
- **预期性能**: 论文称峰值**>10× 加速**于 nvblox / Open3D；实时帧率需查全文
- **适用场景**: 多 RGB-D 实时重建；作为流体渲染前处理，**实时**可行

---

## 相关工作

- [[2026-10-08-CAGS-Volumetric-Video-Streaming-3DGS]]
- [[2026-11-02-SplashSplat-Reconstructing-Splashing-Liquids]]
- [[2026-11-08-HGKS-Compact-ALE-Gas-Kinetic-Unstructured-Mesh]]

## 关键词

`volumetric video` `TSDF` `Marching Cubes` `GPU-native` `real-time` `RGB-D` `radiometric correction` `texture atlas` `WACV 2027`
