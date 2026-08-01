# ParticleGS: 3D Gaussian Splatting for Scientific Particle Data Compression and Rendering

> **日期**: 2026-07-31 (arXiv:2607.22956)  
> **来源**: arXiv cs.GR  
> **关键词**: particle rendering, 3D Gaussian Splatting, compression, scientific visualization  
> **链接**: https://arxiv.org/abs/2607.22956  
> **标签**: #particle-rendering #3DGS #compression #scientific-visualization

## 核心创新

**ParticleGS** 首次将 3D Gaussian Splatting 应用于大规模科学粒子数据的**可视化感知压缩**。针对 HACC 宇宙学模拟的 2.81 亿粒子，实现 65× 压缩比下 30.03 dB PSNR，渲染速度比 ParaView 快 2300×。

核心贡献：直接优化渲染图像质量，而非数据空间重建精度。

## 渲染方法

- **类型**：粒子渲染（点云 → 3DGS）
- **技术**：多阶段多轨道训练 + VizMapper + 空间分块
- **基础**：3D Gaussian Splatting

## 关键创新点

### 1. 多阶段/多分辨率/多轨道训练
- 在不同相机距离（远/中/近轨道）训练
- 渐进式增加分辨率
- 同时学习全局结构和局部细节

### 2. VizMapper
轻量级神经网络（~4,600 参数），输入每高斯属性 + 全局可视化参数，输出乘性修正。实现**单模型适应不同可视化设置**（粒子半径、透明度）。

### 3. 空间分块训练
- KD-tree 分解粒子体积
- 并行独立训练各分块模型
- 全局微调合并
- 提升高需求区域的模型容量

## 性能数据

| 指标 | 数据 |
|------|------|
| 压缩比 | 65× (281M HACC 粒子) |
| PSNR | 30.03 dB |
| 对比 SZ3 | +5~8 dB（同压缩比） |
| 渲染帧率 | 662 FPS (单 GPU) |
| ParaView 对比 | 快 2300× |

## 科学可视化价值

### 粒子数据压缩
- SZ3 在 65× 压缩：~24.7 dB（有轴对齐条纹伪影）
- ParticleGS 在 65× 压缩：~30.03 dB（无伪影）
- LCP 在 65× 压缩：~20.3 dB

### 方向性伪影消除
传统压缩器分轴独立量化，导致渲染时出现轴对齐条纹。ParticleGS 的端到端优化自然避免此问题。

## 流体渲染相关性

虽然本文针对科学模拟粒子（宇宙学 N 体），但技术可直接迁移到**流体 SPH 粒子渲染**：
- 大规模流体模拟的实时可视化
- 粒子数据压缩传输
- 可调可视化参数（半径、透明度）的单模型支持

## 实现建议

- 着色器复杂度：中等
- 管线要求：3DGS 基础 + VizMapper
- 推荐度：✅ 重要

## 参考文献

Bo Jiang, Youyuan Liu, Taolue Yang, Sheng Di, Sian Jin
arXiv:2607.22956 [cs.GR]
