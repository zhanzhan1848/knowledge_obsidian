# Reduced-Order Deformable Simulation from Particle-Based Skinning Eigenmodes

## 论文信息
- **arXiv**: [2605.29318](https://arxiv.org/abs/2605.29318)
- **日期**: 2026-05-28
- **会议**: CVPR 2026
- **作者**: Donglai Xiang et al. (NVIDIA Research)
- **主题**: 粒子降阶仿真

---

## 核心贡献

### 1. RKPM 表示
- **Reproducing Kernel Particle Method (RKPM)**
- 无网格降阶仿真
- 适用于超弹性可变形物体

### 2. 降阶蒙皮权重
- 求解 Hessian 矩阵广义特征系统
- 避免神经场的单形状优化

### 3. 性能提升
- **训练速度提升 40 倍** (vs 神经场单形状优化)
- 更低仿真误差 (vs FEM 收敛结果)

### 4. 多表示支持
- 网格 (Meshes)
- Gaussian Splatting
- 其他表示

### 5. 应用
- 下游机器人仿真任务

---

## 技术方法

### 创新点
- 现有降阶仿真方法依赖:
  - 网格 (难以获取，复杂形状难以三角化)
  - 神经场 (需单形状优化)
- 本文方案: RKPM + 广义特征系统

### 优势
- 无需高质量网格
- 无需单形状优化
- 可处理任意表示

---

## 渲染相关性

### Gaussian Splatting 粒子仿真
- 与流体渲染中的粒子系统直接相关
- 支持 3D Gaussian Splatting 表示
- 可用于渲染驱动的仿真

### 粒子系统技术
- 粒子光照
- 粒子阴影
- 粒子反射

### 标签
#particle-simulation #reduced-order #RKPM #gaussian-splatting #CVPR2026

---

*整理: Doumiao - 2026-05-29*