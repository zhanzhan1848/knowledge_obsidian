# Real-Time 3D Simulation of Heat-Induced Air Turbulence

## 论文基本信息
| 字段 | 内容 |
|------|------|
| **标题** | Real-Time 3D Simulation of Heat-Induced Air Turbulence |
| **arXiv** | [2603.02048](https://arxiv.org/abs/2603.02048) |
| **cs.Category** | cs.GR (Graphics) |
| **提交日期** | 2026-03-02 |
| **作者** | Ethan Chung (U Hawaii), Man Luo (U Hawaii), Suren Jayasuriya (ASU), Huaijin Chen (U Hawaii), Jinwei Ye (George Mason), Nianyi Li (Clemson) |
| **DOI** | 10.48550/arXiv.2603.02048 |

## 研究领域

### 渲染方法
- **类型**: 体积渲染 (Volume Rendering)
- **技术**: Curved Ray Tracing through SPH Particle Field

### 核心贡献

### 1. 统一的热驱动流体框架
将热传递、密度变化和光学折射统一建模，生成多视角一致的 3D 折射率场。

### 2. 可压缩 SPH + 温度输运
- 扩展 compressible SPH，增加温度输运
- **浮力模型**: 温度梯度 → 浮力 → 上升羽流
- **压力驱动**: 压力差驱动湍流混合
- 适用于实时 refractive rendering

### 3. 自适应步长 Curved Ray Tracing
- **关键创新**: 空间自适应步长
- 折射率梯度大的区域 → 精细步长 → 高频畸变细节
- 平滑区域 → 较大步长 → 提高效率
- 兼顾物理精度与实时性能

## 技术方法

### 模拟管线
```
Heat Sources (hexahedral regions)
    ↓ (温度差驱动)
Source-Particle Heat Exchange
    ↓
Inter-Particle Conduction (Fourier equation)
    ↓
Temperature Field → Buoyancy + Pressure Forces
    ↓
Compressible SPH Update
(position, velocity, density, temperature)
    ↓
Density → Refractive Index Field
    ↓
Curved Ray Tracing (adaptive step)
    ↓
Multi-view Consistent Distortion
```

### 核心公式

**Heat Source Flux** (源-粒子交换):
```
q_s(x,T) = (T_s - T) · λ_s · r · Δt
  (inside source)
q_s(x,T) = (T_s - T) · λ_s · r · Δt · (1 - d_s/R_s)
  (in influence zone, d_s < R_s)
```

**Fourier Heat Conduction**:
```
ρ · c · ∂T/∂t = ∇·(k∇T) + Q
```

### 渲染管线
- 粒子状态 → 连续折射率场
- Curved ray integration via spatially adaptive stepping
- 多相机共享同一动态 3D 折射体积 → 多视角一致性由构造保证

## 性能指标

| 指标 | 数值 |
|------|------|
| **帧率** | ~40 FPS (实时) |
| **方法** | Compressible SPH + adaptive curved ray tracing |
| **视角一致性** | 多视角一致性 (3D volumetric model) |
| **传统方法局限** | 2D screen-space warps → 多视角崩坏 |

## 与现有方法对比

| 方法 | 多视角一致 | 3D折射体积 | 实时性 |
|------|-----------|-----------|--------|
| Screen-space warps | ❌ | ❌ | ✅ |
| Lattice Boltzmann (offline) | ✅ | ✅ | ❌ |
| **本文方法** | ✅ | ✅ | ✅ |

## 相关工作

### SPH 湍流研究
- Monaghan: compressible α-turbulence models
- Violeau: SPH turbulence schemes analysis
- Adami: 3D turbulence studies
- 近年: vorticity enhancement, micropolar models (foam), improved stability

### 热湍流实时方法
- GPU Lattice Boltzmann + heat transfer (大内存开销)
- Phase screens / spatially-varying PSF (无 3D 介质)
- Procedural noise distortions (Game engines)

## 创新点总结

1. ✅ 首个实时 3D Lagrangian 热驱动流体 + 折射渲染统一框架
2. ✅ Compressible SPH 扩展温度输运、浮力、压力驱动
3. ✅ 自适应步长 curved ray tracing（高效 + 高频畸变细节）
4. ✅ 多视角一致性优于 image-based 方法

## 适用场景

- 🌡️ 热 haze 效果（路面、海市蜃楼）
- 🎬 影视视觉特效
- 🛩️ 飞行模拟
- � VR/AR 热扭曲效果
- 🔬 多相机科学可视化

## 可行性分析：热空气湍流体积渲染

### 渲染方法
- **类型**: 体积渲染 (Volume Rendering)
- **技术**: Curved Ray Tracing + SPH Particle Field

### 视觉质量
- **逼真度**: ⭐⭐⭐⭐ (多视角一致，depth-dependent distortion)
- **风格化支持**: 部分（可调热源参数）

### 性能预期
- **帧率**: ~40 FPS (GPU)
- **GPU 需求**: 中等（SPH particles + ray marching）
- **内存占用**: 低（粒子数量可控）

### 实现建议
- **着色器复杂度**: 中等
- **管线要求**: GPU particle simulation + custom ray tracing
- **推荐度**: ✅ 适合实时热扭曲效果

## 链接

- **Paper**: https://arxiv.org/abs/2603.02048
- **HTML**: https://arxiv.org/html/2603.02048v1

---
*笔记创建时间: 2026-04-02 14:15 UTC*
*标签: #volume-rendering #SPH #heat-turbulence #curved-ray-tracing #real-time #fluid-rendering*
