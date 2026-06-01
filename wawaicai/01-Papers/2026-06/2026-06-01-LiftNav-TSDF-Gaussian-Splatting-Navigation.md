---
tags: [导航, 高斯溅射, TSDF, 机器人]
created: 2026-06-01
---

# LiftNav: Path Planning via Semantic Lifting in TSDF-Guided Gaussian Splatting

## 论文信息
- **arXiv**: [2605.31376](https://arxiv.org/abs/2605.31376)
- **作者**: Hannah Schieber
- **日期**: 2026-05-29
- **分类**: cs.RO, cs.CV, cs.GR
- **PDF**: [pdf](https://arxiv.org/pdf/2605.31376)

## 核心方法

### 问题定义
未知室内环境中，自动机器人需要可靠的碰撞避免和物体级理解。TSDF 提供安全规划但缺乏语义；3DGS 提供丰富外观但几何精度不足。

### 核心创新
1. **LiftNav** - 基于 GSFusion TSDF+GS 双图的混合导航框架
2. **实时管道**: YOLO 检测 → TSDF 3D 提升 → B样条轨迹优化
3. **铰链损失碰撞惩罚** - 改进轨迹平滑度和安全性

### 技术优势
- 100% 可行性
- 更短轨迹
- 灵活语义导航

## 技术框架
```
YOLO 检测 → TSDF 3D 提升 → B样条优化 → 安全轨迹
                     ↑
            GSFusion 双地图
```

## 评估
- 数据集: Replica
- 基准: SOTA radiance field baseline

## 相关笔记
[[导航, 高斯溅射]]
[[导航, TSDF]]