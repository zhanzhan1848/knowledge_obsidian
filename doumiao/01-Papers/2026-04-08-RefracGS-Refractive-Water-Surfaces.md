# RefracGS: Novel View Synthesis Through Refractive Water Surfaces with 3D Gaussian Ray Tracing

## 论文信息
- **arXiv ID**: 2603.XXXXX (提交日期 2026年3月23日)
- **标题**: RefracGS: Novel View Synthesis Through Refractive Water Surfaces with 3D Gaussian Ray Tracing
- **作者**: Yiming Shao, Qiyu Dai, Chong Gao, Guanbin Li, Yeqiang Wang, He Sun, Qiong Zeng, Baoquan Chen, Wenzheng Chen
- **提交时间**: 2026年3月23日
- **会议**: 预计 SIGGRAPH 2026

## 核心创新点

### 问题背景
通过非平面折射表面进行新视角合成 (Novel View Synthesis, NVS) 由于严重且空间变化的 optical distortions 而面临根本性挑战。

### 现有方法局限
- NeRF (Neural Radiance Fields) 和 3D Gaussian Splatting (3DGS) 在 NVS 任务上表现优异
- 但这些方法假设光线直线传播 (straight-line ray propagation)
- 在折射条件下假设失效，导致明显伪影

### 本文方法：RefracGS
**核心洞察**：将折射边界与目标物体显式解耦

1. **3D Gaussian Ray Tracing**: 使用高斯射线追踪处理折射光线
2. **联合重建**: 同时重建折射水面和水面下的场景
3. **折射边界显式建模**: 独立处理折射界面和目标物体

## 技术方法

### 关键创新
- **Refractive Boundary Decoupling**: 显式分离折射边界和场景内容
- **Gaussian Ray Tracing**: 扩展 3DGS 以支持折射光线
- 处理空间变化的严重光学畸变

### 解决的问题
- 非平面折射表面的 NVS
- 水下/水面场景的联合重建
- 复杂折射引起的几何畸变

## 渲染方法分类

| 维度 | 类别 |
|------|------|
| 类型 | 表面渲染 (Surface Rendering) |
| 技术 | 3D Gaussian Splatting + Ray Tracing |
| 介质类型 | 折射水面 (Refractive Water Surface) |
| 应用 | 新视角合成 (NVS) |

## 可行性分析

### 视觉质量
- **逼真度**: ⭐⭐⭐⭐⭐
- 精确处理折射光线
- 支持动态水面和非平面折射器
- 风格化支持: 是

### 性能预期
- **帧率**: 实时 (基于 3DGS)
- **GPU 需求**: 中等至较高
- **内存占用**: 中等

### 实现难度
- **着色器复杂度**: 较高 (折射光线追踪)
- **管线要求**: 需扩展 3DGS 管线
- **推荐度**: ✅ 推荐

## 相关技术
- [[水面渲染]]
- [[折射渲染]]
- [[3D Gaussian Splatting]]
- [[新视角合成]]
- [[光线追踪]]
- [[水面重建]]

## 知识来源
- arXiv 搜索结果摘要 (2026-03-23)
- 作者: Yiming Shao et al.
