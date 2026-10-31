---
type: paper
created: 2026-10-31
updated: 2026-10-31
tags: [paper, SIGGRAPH-Asia-2026, multi-view-reconstruction, diffusion, restoration, geometry, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.32800
---

# CompMVR: Compression-Aware Multi-View Restoration Using Diffusion Models for Geometrically Consistent 3D Reconstruction

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | CompMVR: Compression-Aware Multi-View Restoration Using Diffusion Models for Geometrically Consistent 3D Reconstruction |
| **作者** | Dong-hwi Kim, Chaewon Moon, Hojun Song, Dongbeom Kim, Junyeong Jang, Aro Kim, Gahyeon Kim, Heejung Choi, Jehee Kim |
| **发表** | **SIGGRAPH Asia 2026 (Technical Paper)**, 2026-10-23 |
| **链接** | [原文](https://arxiv.org/abs/2610.32800) |
| **DOI** | - |
| **代码** | https://mchaewon.github.io/CompMVR-project-page/ |

---

## 核心贡献

> CompMVR — 压缩感知的多视角扩散修复：识别出"压缩引起的跨视角几何不一致"这一被忽视的失效模式，联合修复压缩视图并保持跨视角一致性。

1. **提出新失效模式** — 压缩伪影在单图/视频修复中已被广泛研究，但其对**多视角几何**的影响长期被忽视。视角相关的伪影会破坏特征匹配、稠密对应、相机参数估计等一切几何环节。
2. **压缩感知多视角扩散修复框架** — 利用学到的压缩先验 + 跨视角对应关系，联合去噪多个视图，而非独立优化每张图。
3. **构建压缩数据集** — 为系统化评测构造了压缩后的多视角数据集（多 codec × 多压缩级别）。

---

## 技术方案

### 核心思想

真实世界的 3D 重建管线几乎都依赖被有损压缩的多视角图像（网络传输、存储限制）。传统图像修复方法逐图独立优化 2D 感知质量，修复后单张图更"好看"，但**跨视角一致性被破坏了**——而几何重建恰恰依赖跨视角一致性。

CompMVR 的洞察：压缩伪影是**视角相关**的，因此修复必须建模多视角结构。做法是：
- 用扩散模型做修复，但**在多视角联合潜空间**中同时去噪所有压缩视图
- 引入学到的**压缩先验**（让模型知道压缩伪影长什么样）作为条件
- 用**跨视角对应**约束修复过程，强制几何一致性

### 关键技术

| 技术 | 说明 |
|------|------|
| 压缩感知修复 | 以压缩伪影为条件，而非通用去噪 |
| 多视角联合扩散 | 一次去噪所有视图，保持跨视角一致 |
| 压缩先验学习 | 显式建模 codec 伪影分布 |
| 跨视角对应约束 | 几何一致性正则 |
| 压缩数据集构建 | 多 codec × 多压缩级别，系统评测 |

---

## 公式

```math
// 多视角联合扩散去噪（概念式）
\mathbf{z}_{T}^{(1:N)} \sim \mathcal{N}(0, I), \quad
\mathbf{z}_{t-1}^{(1:N)} \sim p_\theta\big(\mathbf{z}_{t-1}^{(1:N)} \mid \mathbf{z}_t^{(1:N)},\, c_{\text{comp}},\, \mathbf{C}\big)
// c_comp = 压缩伪影条件；C = 跨视角对应关系
```

---

## 代码片段

```python
# 概念伪代码：压缩感知多视角扩散修复
latents = encode_all(compressed_views)                 # N 个视图联合潜表示
t = num_denoise_steps
for t in range(num_denoise_steps, 0, -1):
    noise_pred = model(latents, t, compression_cond, correspondence=correspondences)
    latents = scheduler.step(noise_pred, t, latents)
restored_views = decode_all(latents)                   # 几何一致的多视角
```

---

## 实验结论

- **数据集**: 多样数据集 × 多 codec × 多压缩级别（含自建压缩数据集）
- **基线**: 传统单图/视频修复方法（独立优化的 2D 感知优化）
- **结果**:
  - 修复质量提升
  - **下游 3D 任务全面受益**: 新视角合成、相机位姿估计、视图匹配
  - 确立"压缩多视角修复"为一个独立问题

---

## 局限性

- 依赖扩散模型推理成本（离线修复，非实时）
- 需要多视角联合潜空间表示，对视角数敏感
- 摘要未给出具体量化增益数值

---

## 与团队相关

- 与墨鱼丸 (moyuwan): **工程价值极高**——任何用网络传输多视角图像的重建管线都可直接受益
- 建议动作：评估自身管线中多视角图像的压缩策略，引入该修复步骤作为预处理
- 关联：[[2026-10-31_GOFish-Fisheye-Gaussian-Splatting-Mesh-Extraction]]、[[2026-10-27_CVTSplat-Adaptive-Centroidal-Voronoi-Tessellation]]

---

## 实现建议

- **实现难度**: 高（多视角联合扩散 + 压缩先验建模 + 数据集构造）
- **预期性能**: 质量提升明确；速度慢（离线）
- **适用场景**: 云端 3D 重建、压缩视频驱动的 NVS、跨网络传输的采集数据
- **优先级**: **中高**（SIGGRAPH Asia 2026 技术论文，工程可落地性最强）
