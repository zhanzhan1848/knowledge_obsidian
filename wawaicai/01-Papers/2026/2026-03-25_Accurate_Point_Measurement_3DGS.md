---
title: Accurate Point Measurement in 3DGS -- A New Alternative to Traditional Stereoscopic-View Based Measurements
authors:
  - Rongjun Qin
date: 2026-03-25
tags:
  - 3D Gaussian Splatting
  - 3DGS
  - 几何测量
  - 点云测量
  - 三角测量
  - Mesh Reconstruction
  - Point Cloud
---

# Accurate Point Measurement in 3DGS

## 核心方法

本文提出利用 **3D Gaussian Splatting (3DGS)** 实现精确几何测量的新方法，作为传统立体视觉测量的替代方案。

### 核心创新点
1. **3DGS 几何化应用**：将 3DGS 从渲染扩展到精确测量
2. **多视图三角测量**：跨多视图（>2）选取对应点
3. **无专业设备**：无需立体工作站在普通硬件上实现
4. **高精度**：1-2cm RMSE，优于 mesh 方法

### 技术原理
```
3DGS 模型
    ↓
用户在不同视图选取对应点
    ↓
多视图三角测量
    ↓
精确 3D 点坐标
```

### 关键优势
- 精确渲染源视图和中间视图
- 支持多视图交会的更高精度
- 薄结构、尖锐角落等困难场景表现优异

## 算法复杂度
- **时间复杂度**：O(N) 点数
- **空间复杂度**：O(N) Gaussians

## 开源实现
- **代码**：https://github.com/GADOSU/3dgs_measurement_tool
- **Web 应用**：在线演示工具

## 数据集与实验

### UAV 航空数据集
| 指标 | 本文方法 | Mesh 方法 |
|------|---------|-----------|
| 标准场景 RMSE | 1-2 cm | 较差 |
| 薄结构 RMSE | 0.037 m | 0.062 m |
| 尖锐角落 | 全部成功 (0.013m) | 完全失败 |

## 会议/期刊
- arXiv cs.CV
- ISPRS Congress 2026 接收

## 相关笔记
[[3DGS 综述]]
[[Points-to-3D 结构感知3D生成]]

## 可行性评估

✅ **推荐实现**

### 算法复杂度：低
- 基于已有 3DGS 模型
- 交互式工具

### 数值稳定性：高
- 三角测量精度高
- 多视图增强

### 依赖项
- 3DGS 模型（训练好的）
- Web 前端框架

### 应用场景
- 摄影测量
- BIM建模
- 地形测量
- 文化遗产保护
