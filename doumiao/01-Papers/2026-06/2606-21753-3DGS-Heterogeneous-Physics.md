# Scene-Level Heterogeneous Physics Simulation with 3D Gaussian Splats

## 论文信息
- **arXiv**: [2606.21753](https://arxiv.org/abs/2606.21753)
- **标题**: Scene-Level Heterogeneous Physics Simulation with 3D Gaussian Splats
- **作者**: (待补充)
- **会议**: CVPR 2026 Findings
- **日期**: 2026-06-20
- **标签**: #fluid #3DGS #physics-simulation

## 核心创新点

### 问题
- 3D Gaussian Splatting (3DGS) 达到SOTA照片级渲染效果
- 但 representation gap 阻止了物理交互
- 现有 physics-for-3DGS 方法是 monolithic silos
- 仅能处理 object-centric physics（孤立环境中的简单场景）
- 无法与复杂静态碰撞几何或异构资产交互

### 解决方案：Representation Abstraction Framework
- 首次桥接 3DGS 资产与 scene-level heterogeneous multi-solver physical simulations
- 将所有异构资产（3DGS、虚拟网格、流体）转换为统一的物理粒子集
- 这是实现复杂行为（如 3DGS 资产的非刚性形变）的关键

### 核心技术
1. **统一物理粒子集**: 将 3DGS、mesh、fluid 转换为统一表示
2. **Solver-agnostic Physics Kernel**: 处理粒子集和静态场景碰撞边界
3. **双向映射**: 物理结果映射回驱动每个资产的视觉重建

### 技术亮点
- 非刚性形变 (non-rigid deformation)
- 复杂静态碰撞几何支持
- 异构 solver 支持
- 真实感耦合现象 (realistic coupled phenomena)

## 演示场景
- Deformable 3DGS assets ↔ fluids ↔ meshes 双向交互
- 大规模捕获静态环境交互

## 相关工作
- 属于 [[3DGS]] + [[physics simulation]] 交叉领域
- 相关技术：[[Material Point Method]], [[particle-based simulation]]

## URL
- Paper: https://arxiv.org/abs/2606.21753
- PDF: https://arxiv.org/pdf/2606.21753

## 评估日期
- 2026-06-26