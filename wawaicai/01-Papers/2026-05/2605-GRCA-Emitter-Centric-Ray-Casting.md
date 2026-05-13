---
tags: [几何, 射线追踪, LiDAR, 动态场景, 模拟]
created: 2026-05-13
---

# Gajmer Ray-Casting Algorithm (GRCA) - LiDAR 仿真中的几何加速方法

## 核心方法

**GRCA** 提出一种反转射线查询思路的通用光线-三角形求交算法，专为动态 LiDAR 仿真设计。核心创新：**发射器中心视角** — 不问"这条射线击中哪个三角形"，而问"哪些射线可能击中这个三角形"。

### 关键技术

1. **Emitter-centric apparent area**: 从发射器视角计算每个三角形的可视面积
2. **Cone/Plane 建模**: 将旋转 LiDAR 发射器建模为旋转追踪锥或平面
3. **Per-triangle channel culling**: 逐三角形剪枝掉不可能到达的射线通道
4. **零加速结构**: 动态几何下无需重建加速结构

### 双扩展策略

| 扩展 | 效果 |
|------|------|
| **Range Culling** | 真实部署范围 (10–100m) 剪枝，GPU 最高 7.02x，CPU 9.33x |
| **Hybrid Pipeline** | 动态物体用 GRCA，静态物体用 OptiX/Embree，GPU 最高 10.5x，CPU 19.2x |

## 性能基准

测试条件：2–8 个 128×4096 射线 LiDAR（360°/180°），复杂动态场景

| 配置 | 相比 OptiX (GPU) | 相比 Embree (CPU) |
|------|-----------------|------------------|
| Range culling off | 最高 7.97x | 14.55x |
| Range culling on | 最高 7.02x | 9.33x |
| Hybrid | 最高 10.5x | 19.2x |

场景规模：~22M 三角形，~9M 动态，8 LiDAR

## 创新点

- **问题反转思想**：从发射器视角做几何剪枝
- **通用性**：不仅限于 LiDAR，任何已知射线源位置的场景均可应用
- **Vendor-agnostic**：纯 compute-based 实现

## 算法复杂度
- 时间复杂度：O(n·m) 其中 n=三角形数，m=射线数（但常数极小）
- 空间复杂度：O(n) 预分配 superset mesh

## 实现难度
- 算法复杂度：中/高（几何推导较复杂）
- 数值稳定性：✅ 精确几何运算
- 依赖项：GPU compute shader（CUDA/通用计算）
- 并行化：天然并行，适合 GPU

## 开源参考
- 论文: https://arxiv.org/abs/2605.10457
- 暂无已知开源实现

## 相关笔记
[[STA-FEM-Dynamic-Tetrahedral-Assembly]] - 另一个动态几何处理方法