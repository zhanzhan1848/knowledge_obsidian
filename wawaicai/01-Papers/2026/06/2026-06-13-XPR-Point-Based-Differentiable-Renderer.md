---
title: "XPR: An Extensible Cross-Platform Point-Based Differentiable Renderer"
authors:
  - Steve Rhyner
  - Sankeerth Durvasula
  - Aleksandr Kovalev
  - Hansel Jia
  - Adrian Zhao
  - Mrutunjayya Mrutunjayya
  - Nilesh Ahuja
  - Selvakumar Panneer
  - Christina Giannoula
  - Nandita Vijaykumar
date: 2026-06-10
tags: [几何, 点云, 可微渲染, 3DGS, 跨平台, JAX, XLA]
cite: "arXiv:2606.11529 [cs.GR]"
url: "https://arxiv.org/abs/2606.11529"
---

# XPR: Extensible Cross-Platform Point-Based Differentiable Renderer

## 核心问题

现有点基可微渲染器存在两大局限：
1. **可编程性差**：每种新方法需重写底层内核、手写反向传播
2. **可移植性差**：CUDA/Vulkan 专用，无法跨 NVIDIA/AMD/Intel/TPU/Trainium/CPU

## 核心贡献

XPR = **X**LA-based **P**oint rendering with automatic **R**everse mode

### 三大设计目标

1. **易编程**：用户只需指定方法特定逻辑，4 个接口函数
2. **通用性**：覆盖点基可微渲染的大设计空间
3. **可移植性**：跨平台编译器降低到多样化加速器

### 四函数接口

```python
# XPR 抽象渲染管线为 4 个接口函数
def project(primitive, camera): ...      # 投影
def tile_cull(primitive, tiles): ...      # tile 剔除
def pixel_info(primitive, pixel): ...     # 像素信息
def evaluate(primitive, pixel): ...       # 贡献计算
```

### 单元素函数设计

- 每个接口函数操作单个 primitive 或单个 pixel
- 用户不写循环 → XPR 自动生成迭代和过滤
- 动态结构转换为静态形状操作（适配 TPU 等加速器）

### 管线分解

```
渲染管线分解为多个模块，每个模块只有一个并行维度：
- primitives 并行
- tiles 并行
- pixels 并行
- primitive-tile pairs 并行

构建块：data-parallel element-wise ops, prefix-sum, sort, scatter, gather
```

## 已实现方法（260-304 行代码）

| 方法 | 描述 |  primitive |
|------|------|-----------|
| 3DGS | 3D Gaussian Splatting | 3D 高斯 |
| 3DGUT | Gaussian ray casting | 3D 高斯 + ray |
| LinPrim | Linear primitives | 八面体 |

## 跨平台支持

| 平台 | 支持 |
|------|------|
| NVIDIA GPU | ✓ |
| AMD GPU | ✓ |
| Intel GPU | ✓ |
| Google TPU | ✓ |
| Amazon Trainium | ✓ |
| CPU | ✓ |

### 性能对比

- 在 NVIDIA L40S 上达 CUDA 基线 **97.18%** 的渲染速度
- JAX/XLA 实现，从单一代码路径跨平台

## 与现有框架对比

| 框架 | 可编程性 | 跨平台 | 自动微分 |
|------|---------|--------|---------|
| gsplat (CUDA/HIP) | 差 | 部分 | 差 |
| Nvdiffrast | 中 | 差 | 差 |
| PyTorch3D | 中 | 差 | 差 |
| Mitsuba3 (Dr.Jit) | 中 | 部分 | ✓ |
| Dressi (Vulkan) | 差 | 部分 | ✓ |
| **XPR (JAX/XLA)** | **✓** | **✓** | **✓** |

## 覆盖的设计空间

- **Primitive 类型**：3DGS, 2DGS, GES, TriangleSplatting, LinPrim, EVER, 3D Superquadric
- **像素颜色计算**：投影 + ray casting + path length
- **渲染特征**：depth, semantics (LangSplat)
- **Primitive-tile 选择**：tile culling, stop-the-pop
- **存储表示**：ContraGS, C3DGS

## 可行性评估

✅ **强烈推荐关注**

| 维度 | 评分 |
|------|------|
| 算法创新性 | 中（系统设计创新，非算法） |
| 工程可行性 | 高（JAX/XLA 跨平台） |
| 可扩展性 | 高（4 函数接口） |
| 实用性 | 高（快速原型 + 跨平台） |

### 潜在应用
- 3D 重建流水线
- 神经渲染研究
- 跨硬件训练/部署
- 世界模型和视频生成管线

### 关键洞察

XPR 的核心洞察：**将点基渲染管线分解为静态形状并行操作**，使跨平台编译成为可能。

这对几何处理工具链的潜在影响：
1. 可用 JAX/XLA 构建跨平台的 3DGS/LinPrim 处理管线
2. 自动微分的点渲染可嵌入更大的几何优化系统
3. 统一的 primitive 接口便于比较不同点基表示