# Gaussian Fluids

> A Grid-Free Fluid Solver based on Gaussian Spatial Representation

## 论文信息

| 属性 | 值 |
|------|-----|
| **arXiv** | [2405.18133](https://arxiv.org/abs/2405.18133) |
| **会议** | SIGGRAPH 2025 Conference Papers |
| **DOI** | 10.1145/3721238.3730620 |
| **作者** | Jingrui Xing, Bin Wang, Mengyu Chu, Baoquan Chen (Peking University) |
| **GitHub** | https://github.com/xjr01/Gaussian-Fluids-Code |
| **项目页** | https://xjr01.github.io/GaussianFluids/ |

## 核心创新

### 问题背景
传统流体模拟使用 Eulerian (网格)、Lagrangian (粒子) 或 Hybrid 方法，都需要离散化空间。

### 核心思想
将连续流速场建模为多个高斯函数的加权和：

```
v(x, t) = Σᵢ wᵢ(t) · gᵢ(x; μᵢ, Σᵢ)
```

其中 gᵢ 是高斯核函数。

### 关键技术
1. **连续可微表示**: GSR 表示连续可微，可直接推导空间导数解析解
2. **First-order Fluid Optimizer**: 专为流体动力学设计的一阶优化器
3. **内存高效**: 相比网格方法，稀疏高斯表示更节省内存
4. **空间自适应**: 高斯自动适应流场复杂度

## 技术公式

### 速度场表示
```
v(x,t) = Σₖ wₖ · exp(-‖x - μₖ‖² / (2σₖ²))
```

### 空间导数 (解析求解)
```
∂v/∂x = Σₖ wₖ · (-(x - μₖ) / σₖ²) · exp(-‖x - μₖ‖² / (2σₖ²))
```

### Navier-Stokes 求解
- 对流项: 使用速度场自身对流
- 压力项: 求解压力Poisson方程
- 黏性项: 使用解析导数计算

## 实验结果

### 2D 测试
- 涡旋衰减 (Vortex Decay)
- Kármán 涡街 (Kármán Vortex Street)
- 双平板间流体

### 3D 测试
- 涡旋环碰撞 (Vortex Ring Collision)
- 圆柱绕流
- 长期模拟稳定性测试

### 性能
- 内存占用显著低于 Eulerian 方法
- 时间演化计算效率优于隐式神经表示 (NeRF-based)
- 一阶求解器尚未达到显式方法的速度

## 与渲染的关系

### 模拟 → 渲染 pipeline
GSR 表示可以直接与 3D Gaussian Splatting 渲染结合：
1. 流体模拟输出 → 高斯粒子位置/属性
2. 3DGS 渲染管线 → 流体渲染结果

### 优势
- 统一表示：模拟和渲染使用相同基元
- 可微渲染：支持端到端优化
- 适应性：细尺度结构自动保留

## 适用场景

| 场景 | 推荐度 |
|------|--------|
| 离线电影流体特效 | ⭐⭐⭐⭐⭐ |
| 实时流体模拟 | ⭐⭐⭐ |
| 交互式流体 | ⭐⭐⭐ |
| 流体与场景结合 | ⭐⭐⭐⭐⭐ |

## 代码资源

```bash
git clone https://github.com/xjr01/Gaussian-Fluids-Code
```

---

*关键词: Fluid Simulation, Gaussian Spatial Representation, Grid-Free, SIGGRAPH 2025*
