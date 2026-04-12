---
tags: [几何, 高斯溅射, 边缘设备, 能耗优化]
---

# Real-Time 3D Gaussian Splatting under Constrained GPU Budgets

## 核心方法

**问题定义**: 边缘客户端（如VR头显、瘦客户端）上的实时3DGS rasterization 能耗与性能权衡。

**核心方法**:
1. **Emulation-based approach**: 在高端GPU上通过降频 + 功耗限制模拟不同GPU能力等级
2. 系统性测量帧率、运行时行为、功耗
3. 覆盖从嵌入式/移动级到高端消费级GPU的性能包络

**分析指标**:
- FPS-power curves
- Energy per frame
- Performance per watt

## 相关笔记
[[几何, 高斯溅射]]
[[几何, 能耗优化]]
