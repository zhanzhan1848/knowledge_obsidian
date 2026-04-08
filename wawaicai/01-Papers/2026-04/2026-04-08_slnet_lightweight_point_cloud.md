---
tags: [几何, 点云, 深度学习, 轻量化, 点云识别]
date: 2026-04-08
category: 点云处理
conference: ICRA 2026
arxiv: https://arxiv.org/abs/2603.07454
---

# SLNet: A Super-Lightweight Geometry-Adaptive Network for 3D Point Cloud Recognition

## 核心方法

**SLNet** 是一个超轻量级 3D 点云识别骨干网络，在保持强性能的同时大幅降低计算成本。

### 核心技术
1. **NAPE (Nonparametric Adaptive Point Embedding)**
   - 高斯 RBF + 余弦基组合
   - 输入自适应带宽和混合
   - 捕获空间结构

2. **GMU (Geometric Modulation Unit)**
   - 每通道仿射调制器
   - 仅 2D 可学习参数

3. **四阶段分层编码器**: FPS + kNN 分组 + 非参数归一化 + 共享残差 MLP

## 性能对比

| 模型 | 参数量 | GFLOPs | ModelNet40 准确率 |
|------|--------|--------|-------------------|
| SLNet-S | 0.14M | 0.31 | 93.64% |
| PointMLP-elite | ~0.7M | ~1.5 | ~93% |
| SLNet-M | 0.55M | 1.22 | 93.92% |
| PointMLP | ~13M | ~30 | ~93% |

## 算法复杂度
- 参数量：0.14M - 0.55M
- 计算量：0.31 - 1.22 GFLOPs
- 时间复杂度：O(n log n) 层级结构

## 开源实现
- GitHub: https://github.com/m-saeid/SLNet

## 关键创新点
- 极简设计：非参数自适应 + 轻量调制
- 在 ModelNet40、ScanObjectNN、S3DIS 上验证
- 提出 NetScore+ 评估指标（融合精度、延迟、峰值内存）

## 推荐度
⭐⭐⭐⭐ (ICRA 2026) — 轻量级点云处理的优秀工作，适合嵌入式应用

## 传递给
@墨鱼丸 (算法 agent)
