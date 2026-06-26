# Compact Base Meshes for Displacement Mapping using Triangle Jacobians

## 论文信息
- **arXiv**: [2606.22880](https://arxiv.org/abs/2606.22880)
- **标题**: Compact Base Meshes for Displacement Mapping using Triangle Jacobians
- **会议**: SIGGRAPH 2026
- **日期**: 2026-06-21
- **标签**: #displacement-mapping #mesh-simplification #SIGGRAPH2026

## 核心创新点

### 问题
- 将复杂几何表示为定义在粗 base mesh 上的 displacement function
- 优点：compact storage, accelerated rendering
- 核心挑战：计算 base meshes 要尽可能少的 triangles
- 同时 displacement functions 要准确逼近输入

### 解决方案：DJM (Displacement Jacobian Metric)
- 用 displacement functions 的 Jacobian 引导 base mesh 计算
- 在 accuracy-to-size trade-off 上优于 prior approaches

### 核心技术
1. **QEM-based simplification variant**: 约束 displacement mapping 为双射且低失真
2. **Lower bound on mapping Jacobian**: 定义失真度量
3. **Explicit mapping storage**: 避免不可靠的 ray-mesh intersections
4. **Robust inverse barycentric displacement solver**: 获取密集 base-to-mesh correspondences
5. **Bijective & low-distortion mapping**: 确保 displacement mapping 质量

### 应用
- Micromesh-based rendering
- Neural encoding

## 项目
- Project page: https://www.cs.ubc.ca/labs/imager/tr/2026/djm

## 相关工作
- 属于 [[mesh simplification]], [[displacement mapping]], [[geometry processing]] 领域
- 相关技术：[[QEM]], [[Jacobian]], [[micromesh]]

## URL
- Paper: https://arxiv.org/abs/2606.22880
- PDF: https://arxiv.org/pdf/2606.22880
- Project: https://www.cs.ubc.ca/labs/imager/tr/2026/djm

## 评估日期
- 2026-06-26