---
tags: [几何, 数据集, 3D重建, 全景, 点云, 网格, 重网格化]
---

# Holo360D: A Large-Scale Real-World Dataset with Continuous Trajectories for Advancing Panoramic 3D Reconstruction

## 论文信息

| 属性 | 值 |
|------|-----|
| arXiv | [2604.22482](https://arxiv.org/abs/2604.22482) |
| 分类 | cs.CV / cs.GR (cross-list) |
| 日期 | 2026-04-24 |
| 作者 | Zhuoxiao Li |
| 来源 | arXiv (数据集论文) |

## 核心内容

### 数据集规模
- **109,495** 全景图
- 配对点云、**网格**、对齐相机位姿
- 连续全景序列（首次提供）
- 高完整性深度图

### 数据采集与处理
```
3D激光扫描仪 + 360相机 → 原始数据
          ↓
    在线/离线SLAM系统处理
          ↓
    后处理流水线：
    ├─ 几何去噪 (geometry denoising)
    ├─ 网格孔洞填充 (mesh hole filling)
    └─ 区域特定重网格化 (region-specific remeshing)
```

### 关键贡献
1. **首个大规模连续全景序列数据集**
2. **后处理流水线**：专门为360度数据集设计
3. **基准测试**：微调3D重建模型，提供有效微调策略洞察

## 开源相关
- 数据集和代码将公开

## 相关笔记
[[重建, 点云, 网格, 重网格化]]

## 评估

### ✅ 推荐关注
**数据集值得关注** — 提供高质量几何处理流水线参考。

### 重点关注技术
1. **Mesh hole filling** — 网格修复
2. **Region-specific remeshing** — 区域重网格化
3. **Geometry denoising** — 几何去噪

### 应用场景
- 全景3D重建
- 3DGS/NeRF训练数据
- 网格后处理流水线参考
