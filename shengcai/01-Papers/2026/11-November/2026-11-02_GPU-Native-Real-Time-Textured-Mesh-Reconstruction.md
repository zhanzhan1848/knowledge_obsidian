---
type: paper
created: 2026-11-11
updated: 2026-11-11
tags: [paper, rendering, reconstruction, mesh-reconstruction, gpu-optimization, real-time-rendering, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2611.03033
arxiv_id: 2611.03033
---

# GPU-Native Real-Time Textured Mesh Reconstruction with Seam-Aware Multi-View Radiometric Correction

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | GPU-Native Real-Time Textured Mesh Reconstruction with Seam-Aware Multi-View Radiometric Correction |
| **作者** | Hiroyuki Sato |
| **发表** | arXiv cs.CV / cs.GR, 2026-11-02（预印本） |
| **链接** | [原文](https://arxiv.org/abs/2611.03033) |
| **DOI** | - |
| **代码** | 论文未公开链接 |

---

## 核心贡献

> 把**重建与纹理化全流程常驻 GPU**——TSDF 融合、Marching Cubes、连通分量去噪、视角纹理映射、修补、辐射度接缝校正，**中间网格/图像数据不回传主机**。

1. **全 GPU 常驻管线**：输入 staging 之后，所有阶段在 GPU 上完成，无 CPU 往返。
2. **定长数组网格拓扑表示**：给出 **O(1) 邻居访问**，让下游网格级操作数据并行化。
3. **视角纹理映射 + 修补**：每面从单一相机取色。
4. **逐相机低频增益场 (radiometric correction)**：估计并烘焙到 atlas，消除曝光接缝。
5. **性能**：CMU Panoptic 上超越 nvblox 与 Open3D，峰值加速**超过一个数量级**。

---

## 技术方案

### 核心思想

现有 TSDF 系统加速了融合与网格提取，但**加逐帧纹理化**就会引入：
- CPU 端网格处理
- CPU 端纹理工作
- 阶段间额外的 CPU↔GPU 传输

本文把整条链留在 GPU 上，并用定长数组拓扑表示解决"网格在 GPU 上怎么做拓扑查询"这一关键障碍。

### 关键技术

| 技术 | 说明 |
|------|------|
| **GPU 常驻流水线** | TSDF fusion → Marching Cubes → 连通分量去噪 → 视角纹理映射 → inpainting → 辐射度接缝校正，全在 GPU |
| **定长数组拓扑** | 网格拓扑用定长数组存，邻居访问 O(1)，下游操作可数据并行 |
| **逐相机增益场** | 因每面只从一个相机取色，图像内平滑变化的曝光差异会残留 → 估计低频增益场并烘焙进 atlas |
| **CUDA 全链路** | 无中间网格/图像回传主机 |

### 公式

```math
// 逐相机低频增益场（语义形式）
// 每个相机的曝光差异可分解为低频增益 g_c(u,v)
I_corrected = I_raw / g_c(u,v)      // 或 I_raw * (1/g_c)
// 低频 -> 平滑拟合（可用低阶多项式或小分辨率图上采样）
g_c = smooth_fit(residual_c)
```

---

## 代码片段

```cpp
// GPU 常驻管线（语义伪代码）
// 阶段间无主机往返
gpuOnlyPipeline(inputStaging) {
    // 1) TSDF 融合 (GPU)
    gpu_tSdf_fusion(depthFrames, poses);

    // 2) Marching Cubes (GPU) -> 定长数组拓扑
    Topology topo = gpu_marching_cubes(gpu_tSdf);      // 定长数组, O(1) 邻居

    // 3) 连通分量去噪 (GPU, 数据并行)
    gpu_connected_components_prune(topo);

    // 4) 视角纹理映射 (GPU)
    Atlas atlas = gpu_view_based_texturing(topo, cameras);

    // 5) Inpainting (GPU)
    gpu_inpaint(atlas);

    // 6) 辐射度接缝校正：逐相机低频增益场烘焙进 atlas
    for (auto& cam : cameras) {
        Field g = fit_low_frequency_gain(atlas, cam);   // 低频增益场
        gpu_bake_gain(atlas, cam, g);
    }
    return atlas;
}
```

---

## 实验结论

- **数据集**: **CMU Panoptic**（多 RGB-D 传感器）
- **基线**: **nvblox**（CUDA 加速）、**Open3D**（CPU）、离线纹理化网格基线
- **结果**:
  - 在**所有测试的体素分辨率与传感器数量下都比基线快**
  - 相对 CUDA 加速的 **nvblox 峰值加速超过一个数量级**
  - 相对 CPU 的 **Open3D** 同样远超
  - **感知重渲染质量接近离线纹理化网格基线**

---

## 局限性

- 依赖多 RGB-D 传感器（RGB-D 采集成本）
- 视角纹理映射每面只取一个相机 → 需要增益场校正来抹平曝光差异，残余伪影未完全消除
- 定长数组拓扑表示在网格极密时可能有额外内存开销
- 预印本，未见同行评审

---

## 相关工作

- [[2026-04-17-Fast-Voxelization-LOD-Microgeometry-Rendering]]
- [[2026-08-18-GS-Voxel-Fitting-Free-Structured-Latents]]
- 概念：[[TSDF融合]], [[Marching Cubes]], [[纹理映射]], [[GPU原生管线]]

---

## 实现建议

- **实现难度**: 中-高（需要一整套 CUDA 网格处理 + 拓扑表示 + 纹理映射 + inpainting）
- **预期性能**: 超 nvblox 一个数量级；质量接近离线基线
- **适用场景**: **实时数字孪生采集、AR 场景重建、机器人空间感知**
- **与团队的关系**: "GPU 常驻 + 定长数组拓扑"是一组可复用的工程模式。若团队做动态场景重建，可参考。建议同时转给 @黄喉（几何）——定长数组网格拓扑表示对几何处理同样有价值
- **优先级**: 中
