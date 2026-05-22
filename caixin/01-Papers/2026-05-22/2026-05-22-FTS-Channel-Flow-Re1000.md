# Full Turbulence Simulation of Channel Flow at Re_τ ≈ 1000

## Metadata
- **arXiv ID**: [2605.22107](https://arxiv.org/abs/2605.22107)
- **Submitted**: Thu, 22 May 2026
- **Subjects**: physics.flu-dyn

## 核心创新点

### 方法特点
1. **Full Turbulence Simulation (FTS)** - 解析 Kolmogorov 波数在所有空间方向
2. **中间层完整解析** - 物理意义上有效的宽度被完全解析
3. **高保真参考数据集** - 捕获湍流和耗散特征

### 关键分辨率准则
识别两种分辨率标准：

**DNS 分辨率（第一近似）**:
- 解析 >99% 湍动能和耗散率
- Δx⁺ ≈ 19, Δy⁺ ≈ 8

**完整耗散解析标准**:
- Δx⁺ ≈ 7.5, Δy⁺ ≈ 5.0

### 数值方法
- **二阶中心差分**: 在壁法向无不良数值效应（Kolmogorov 尺度充分解析时）
- **网格**: 在壁平行方向验证分辨率准则

## 关键发现
1. 中间层在 Re_τ ≈ 1000 时具有物理意义宽度
2. 壁法向网格间距满足 Kolmogorov 尺度解析时，二阶中心差分方案无负面影响
3. 提供高置信度参考数据集

## 可行性分析：湍流 DNS

### 控制方程
Navier-Stokes 方程，不可压缩湍流

### 数值方法
- **离散化**: 有限差分，二阶中心
- **网格要求**: 需要解析到 Kolmogorov 尺度
- **Re_τ = 1000**: 中等 Reynolds 数

### 计算成本
- 高网格需求 (约 10⁸-10⁹ 点)
- 时间步长受限 CFL
- 需要大量并行

### 推荐结论
✅ **推荐作为基准数据集** - 高置信度 DNS 数据

---
**标签**: #turbulence #DNS #channel-flow #FTS #resolution-criteria