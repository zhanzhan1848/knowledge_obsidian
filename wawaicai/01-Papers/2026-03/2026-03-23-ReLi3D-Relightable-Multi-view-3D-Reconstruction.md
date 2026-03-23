---
tags: [几何, 3D重建, 多视图, 材质估计, 深度学习]
arxiv: https://arxiv.org/abs/2603.19753
date: 2026-03-23
conference: ICLR 2026
---

# ReLi3D: Relightable Multi-view 3D Reconstruction with Disentangled Illumination

**作者**: Jan-Niklas Dihlmann, Mark Boss, Simon Donne, Andreas Engelhardt, Hendrik P. A. Lensch, Varun Jampani
**发表日期**: 2026-03-20
**arXiv ID**: 2603.19753
**会议**: ICLR 2026
**分类**: cs.CV, cs.GR

## 核心方法

ReLi3D 是首个**统一端到端管线**，可同时重建：
1. 完整 3D 几何
2. 空间变化的 PBR 材质
3. 环境光照

**推理速度**: < 1 秒

### 架构设计
```
多视图输入
    ↓
Transformer Cross-Conditioning
    ↓
┌─────────────────┬─────────────────┐
│  Path 1         │  Path 2         │
│  结构+外观预测   │  环境光照预测    │
└─────────────────┴─────────────────┘
    ↓
可微分 Monte Carlo MIS 渲染器
    ↓
可重光照 3D 资产
```

## 关键创新

1. **多视图约束** 解决材质/光照解耦的病态问题
2. **双路径预测策略**:
   - 路径 1: 物体结构和外观
   - 路径 2: 从背景或反射预测环境光
3. **混合域训练协议**: 合成 PBR 数据集 + 真实 RGB 捕获

## 技术细节

### 可微分渲染
- Monte Carlo 多重重要性采样 (MIS)
- 支持端到端训练

### 训练数据
- 合成 PBR 数据集
- 真实世界 RGB 捕获

## 算法复杂度
- **推理时间**: < 1s
- **输入**: 稀疏多视图图像

## 相关技术
- [[3D重建]]
- [[材质估计]]
- [[可微分渲染]]
- [[NeRF]]
- [[3D Gaussian Splatting]]

## 开源实现
- Project Page: https://reli3d.jdihlmann.com/
- 代码: 待发布

## 应用场景
- 3D 资产生成
- 虚拟现实内容
- 电商 3D 建模
- 游戏资产生成

## 推荐度
✅ **推荐关注** - 统一重建管线，工业应用价值高

## 来源
- arXiv: https://arxiv.org/abs/2603.19753
- PDF: https://arxiv.org/pdf/2603.19753
- Project: https://reli3d.jdihlmann.com/
