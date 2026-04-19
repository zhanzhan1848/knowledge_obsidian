# VVGT: Visual Volume-Grounded Transformer

## 文献信息
- **arXiv**: [2604.12217](https://arxiv.org/abs/2604.12217)
- **日期**: 2026-04-14
- **作者**: Youcheng Cai et al.
- **类别**: cs.GR

## 核心创新点

### 问题背景
- 传统 Direct Volume Rendering (DVR) 在密集体素网格上操作，分辨率和交互需求增加时扩展性受限
- 3D Gaussian Splatting (3DGS) 提供新表示方式，但现有体积扩展仍依赖昂贵的 per-scene 优化

### 核心贡献
VVGT 是一个前馈式、表示优先的框架，将体积数据直接映射为 3D Gaussian Splatting 表示：

1. **双 Transformer 网络架构**
2. **Volume Geometry Forcing (VGF)**: 一种极线交叉注意力机制，将多视角观测集成到分布式 3D Gaussian 原语，无需表面假设
3. **消除 per-scene 优化**，支持零样本泛化

### 技术细节

#### 体积渲染特性
- 每个像素沿射线聚合贡献（区别于表面重建的 3DGS 方法）
- VGF 通过 epipolar 交叉注意力整合多视角信息

#### 性能表现
- 数量级加速转换
- 改善几何一致性
- 强零样本泛化能力

## 与流体渲染关联

| 技术 | 关联度 | 说明 |
|-----|-------|------|
| 体积渲染 | ⭐⭐⭐⭐⭐ | 烟雾、体积光效果的核心技术 |
| 3DGS | ⭐⭐⭐ | 可用于粒子流体渲染 |
| 前馈推理 | ⭐⭐⭐⭐ | 实时渲染潜力 |

## 关键词
`volume rendering` `3D Gaussian Splatting` `volumetric visualization` `feed-forward` `neural rendering`

## 待办
- [ ] 关注代码发布
- [ ] 评估在烟雾/体积云渲染场景的效果
