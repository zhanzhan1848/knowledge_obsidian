# 每日渲染论文搜索报告 - 2026-07-17

## 搜索概况
- **搜索时间**：2026-07-17 14:00 UTC
- **搜索范围**：arXiv cs.GR (最近7天)、SIGGRAPH 2026、EGSR 2026
- **关键词**：ray tracing, path tracing, real-time rendering, global illumination, PBR, rasterization, BVH, ray marching, 3D Gaussian Splatting, neural rendering

## 搜索结果摘要

### arXiv cs.GR/cs.CV 新论文 (7月)
本周共发现 **18篇** 相关论文，其中渲染相关重点论文如下：

#### 渲染相关论文

| 论文 | 来源 | 类型 | 相关度 |
|------|------|------|--------|
| ABot-3DWorld 0 | arXiv | **3DGS/世界模型** | ⭐⭐⭐⭐⭐ |
| HyperGS | arXiv | **前馈Gaussian视频** | ⭐⭐⭐⭐⭐ |
| MAC-Splat | ECCV 2026 | **稀疏视角重建** | ⭐⭐⭐⭐ |
| Dynamic Inverse Rendering | ECCV 2026 | **PBR/材质分解** | ⭐⭐⭐⭐ |
| Neural Render Proxies | EGSR 2026 | **可微分光照** | ⭐⭐⭐⭐⭐ |
| Diffusion Material Regularization | ECCV 2026 | **逆渲染/扩散** | ⭐⭐⭐⭐ |
| Intrinsic 3DGS Decomposition | SIGGRAPH 2026 | **内禀分解编辑** | ⭐⭐⭐⭐ |

### SIGGRAPH 2026 渲染技术

**Advances in Real-Time Rendering in Games 课程** (7月21日):

| 技术 | 来源 | 类型 | 相关度 |
|------|------|------|--------|
| ORCA (Online Radiance Cache Acceleration) | EA SEED | **路径追踪加速** | ⭐⭐⭐⭐⭐ |
| Variable Rate Ray Tracing (VRRT) | Infinity Ward | **动态光线追踪** | ⭐⭐⭐⭐⭐ |
| PSSR 升级版 | Sony | **ML超分辨率** | ⭐⭐⭐⭐ |
| Smolder | IO Interactive | **实时体积渲染** | ⭐⭐⭐⭐ |
| SLIM | Roblox | **UGC世界缩放** | ⭐⭐⭐ |

---

## 重要论文详解

### 1. ABot-3DWorld 0: 通用3D世界模型 ⭐⭐⭐⭐⭐
- **核心贡献**：将文本/图像/视频转换为高保真3D Gaussian Splatting世界
- **技术亮点**：
  - Spatial Generative Primitive (SGP) 统一表示
  - 3D一致全景视频生成
  - 实时渲染可达消费级规模
- **适用场景**：3D内容创建、数字孪生、VR/AR
- **已创建笔记**：[2026-07-17_ABot-3DWorld-Universal-World-Model-3D-Space.md](./2026-07-17_ABot-3DWorld-Universal-World-Model-3D-Space.md)

### 2. HyperGS: 前馈Gaussian视频表示 ⭐⭐⭐⭐⭐
- **核心贡献**：单次前向传播从任意视频预测Gaussian表示
- **技术亮点**：
  - 10^4-10^5× 编码速度提升
  - PSNR提升 +2.9-3.1 dB
  - 零样本泛化到720p
- **推荐度**：⭐⭐⭐⭐⭐
- **已创建笔记**：[2026-07-17_HyperGS-Fast-Generalizable-Gaussian-Video.md](./2026-07-17_HyperGS-Fast-Generalizable-Gaussian-Video.md)

### 3. Neural Render Proxies (NRP) ⭐⭐⭐⭐⭐
- **来源**：Disney Research @ EGSR 2026
- **核心贡献**：实时可微分重光照的神经渲染代理
- **技术亮点**：
  - 30-60 Hz 重光照帧率
  - 接近路径追踪视觉保真度
  - 解耦路径采样和发射计算
- **适用场景**：电影光照设计、交互式重光照
- **已创建笔记**：[2026-07-17_Neural-Render-Proxies-Interactive-Differentiable-Lighting.md](./2026-07-17_Neural-Render-Proxies-Interactive-Differentiable-Lighting.md)

### 4. ORCA: 路径追踪加速 ⭐⭐⭐⭐⭐
- **来源**：SIGGRAPH 2026 Advances in Real-Time Rendering
- **核心贡献**：在线辐射缓存加速，**不依赖时序历史**
- **技术亮点**：
  - 所有数据结构即时，帧间不存活
  - 适合完全动态场景
  - 最小改动集成现有路径追踪器
- **已创建笔记**：[2026-07-17_ORCA-Online-Radiance-Cache-Acceleration.md](./2026-07-17_ORCA-Online-Radiance-Cache-Acceleration.md)

### 5. Variable Rate Ray Tracing (VRRT) ⭐⭐⭐⭐⭐
- **来源**：Infinity Ward @ Call of Duty: Modern Warfare 4
- **核心贡献**：动态分配光线预算，支持亚像素采样和选择性超采样
- **技术亮点**：
  - 时空重建消除去遮挡伪影
  - GPU驱动的帧级调度器
  - 稳定GPU成本
- **已创建笔记**：[2026-07-17_Variable-Rate-Ray-Tracing-COD-MW4.md](./2026-07-17_Variable-Rate-Ray-Tracing-COD-MW4.md)

### 6. Intrinsic 3DGS Decomposition ⭐⭐⭐⭐
- **来源**：SIGGRAPH 2026
- **核心贡献**：3D Gaussian Splatting的内禀分解和编辑
- **技术亮点**：
  - 独立Gaussian原语集合
  - 数据驱动引导优化
  - 单图像编辑→全局面重渲染
- **已创建笔记**：[2026-07-17_Intrinsic-Decomposition-Editing-3D-Gaussian-Splats.md](./2026-07-17_Intrinsic-Decomposition-Editing-3D-Gaussian-Splats.md)

---

## SIGGRAPH 2026 Papers (渲染相关)

| 论文 | 类型 | 相关度 |
|------|------|--------|
| GraphiXS (不确定性4DGS) | SIG | ⭐⭐⭐⭐ |
| Spatio-Temporal Control Variates with ReSTIR | SIG | ⭐⭐⭐⭐⭐ |
| Lifting Lines and Tone (Path-space stylization) | SIG/TOG | ⭐⭐⭐⭐ |
| Bounding Stratified Bernoulli for GPIS Ray Marching | SIG/TOG | ⭐⭐⭐⭐ |
| Gaussian Point Splatting | SIG/TOG | ⭐⭐⭐⭐⭐ |

---

## 技术趋势分析

### 1. Gaussian Splatting 持续主导
- HyperGS 实现前馈编码
- MAC-Splat 解决稀疏视角问题
- Intrinsic 3DGS 支持编辑
- GraphiXS 引入不确定性建模

### 2. 实时路径追踪成熟
- ORCA 辐射缓存
- VRRT 动态采样
- VRRT 在COD中生产验证

### 3. 神经渲染与物理渲染融合
- NRP (Disney): 可微分光传输学习
- Diffusion正则化: 物理基础+数据驱动
- 逆渲染成为热点

### 4. 工业界采用加速
- SIGGRAPH 2026呈现多个生产系统
- Roblox SLIM, COD VRRT, PSSR升级

---

## 本周关注重点

1. **ORCA** 的即时辐射缓存思路值得在实时PT中考虑
2. **VRRT** 的GPU驱动调度可用于高要求实时RT场景
3. **NRP** 的可微分渲染框架可作为光照优化基础
4. **HyperGS** 的前馈预测范式是高效视频处理方向

---

## 已创建笔记

- `2026-07-17_ABot-3DWorld-Universal-World-Model-3D-Space.md`
- `2026-07-17_MACSplat-Multi-Attribute-Consistency-Sparse-View.md`
- `2026-07-17_HyperGS-Fast-Generalizable-Gaussian-Video.md`
- `2026-07-17_Dynamic-Inverse-Rendering-Material-Lighting.md`
- `2026-07-17_Neural-Render-Proxies-Interactive-Differentiable-Lighting.md`
- `2026-07-17_Diffusion-Material-Regularization-Inverse-Rendering.md`
- `2026-07-17_Intrinsic-Decomposition-Editing-3D-Gaussian-Splats.md`
- `2026-07-17-daily-search-report.md` (本报告)

---

## 相关资源
- ABot-3DWorld: https://abot-world.amap.com/plaza
- HyperGS Project (待确认)
- Neural Render Proxies: https://studios.disneyresearch.com/2026/07/01/neural-render-proxies-for-interactive-and-differentiable-lighting/
- Diffusion Regularized IR: https://gerwang.github.io/diffusion-regularized-inverse-rendering/
- SIGGRAPH 2026 Papers: https://kesen.realtimerendering.com/sig2026.html
- Advances in RT Rendering: https://advances.realtimerendering.com/s2026/index.html

---
*报告生成时间: 2026-07-17 14:00 UTC*
