# Effect of Grid Anisotropy, Resolution, and Subgrid-Scale Models in Pseudo-Spectral LES of Low-Level Clouds

## Metadata
- **arXiv ID**: [2605.21196](https://arxiv.org/abs/2605.21196)
- **Submitted**: Wed, 21 May 2026
- **Subjects**: physics.flu-dyn; Atmospheric and Oceanic Physics
- **验证数据**: DYCOMS-II RF01, ASTEX

## 核心创新点

### 方法框架
伪谱方法 + 各向异性最小耗散 (AMD) SGS 模型

### 关键发现
1. **AMD + 伪谱对流** 在不同网格分辨率下产生稳健准确的预测
2. **无参数调优** - 不需要参数优化
3. **推荐网格各向异性**: 垂直间距约为水平间距的 3 倍

### 网格各向异性分析
- 平衡精度和计算效率
- 误差分析基于云液态水含量和垂直速度方差
- 各向异性网格有效提高收敛率

### 验证场景
- 非降水层积云 (DYCOMS-II RF01)
- 降水层积云 (ASTEX)

## 可行性分析：云 LES

### 控制方程
Navier-Stokes + 湍流 SGS 模型 + 云微物理

### 数值方法
- **伪谱平流**: 高精度
- **AMD 模型**: 各向异性最小耗散
- **网格**: 各向异性 (Δz ≈ 3Δh)

### 计算成本
- 中等网格需求
- 谱方法需要周期性边界

### 推荐结论
✅ **推荐参考** - 网格各向异性设计对云 LES 有指导意义

---
**标签**: #LES #cloud-turbulence #grid-anisotropy #AMD #pseudo-spectral