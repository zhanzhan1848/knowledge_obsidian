---
tags: [几何, 形状表示, 球面调和, 骨骼, 点云重建]
---

# Skeletal-Anchored Dual Harmonics (SADH)

## 论文信息

- **标题**: Skeletal-Anchored Dual Harmonics for Structured 3D Modeling
- **arXiv**: [2606.07337](https://arxiv.org/abs/2606.07337)
- **作者**: Zhentao Huang et al.
- **发表**: cs.GR (Graphics)
- **日期**: 2026-06-05

## 核心方法

SADH 提出一种新的 3D 形状表示，将**局部表面几何**与**内部中尺度骨骼组织**紧密耦合。

### 关键创新

1. **双通道球面调和 (SH) 公式**:
   - 一个通道建模局部径向几何
   - 另一个通道通过广义视角锥定义自适应 patch 支持

2. **与各向同性基元的区别**:
   - 不同于 medial spheres 或 Gaussian kernels
   - SH patches 直接编码各向异性局部几何 + 自适应空间支持
   - 单个 anchor 可紧凑表示细节丰富、方向变化的表面区域

3. **阶段优化框架**:
   - 从非组织点云开始
   - 联合优化表面几何、anchor 位置、patch 方向、结构连通性

### 应用场景

- 变形 (deformation)
- 动画 (animation)
- 拓扑感知编辑
- 无监督表面分割/共分割

## 推荐结论

✅ **推荐实现**

理由：
- 统一建模局部几何和内部结构组织
- 紧凑表示各向异性表面区域
- 产生的 geodesic anchor graph 保留邻接 patch 间的结构关系

## 开源参考

- DeepSDF, Occupancy Networks, ConvONet (神经隐式)
- MASH (Masked Anchored Spherical Distances)
- L1-medial skeleton

## 关键词

`shape representation` `spherical harmonics` `skeletal` `point cloud` `surface reconstruction` `3D modeling`