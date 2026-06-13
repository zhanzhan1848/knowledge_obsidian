# SIGGRAPH 2026 流体渲染论文汇总

## 搜索时间
2026-06-13

## 相关论文

### 1. Mixwell: Sharp 2D Fluid Brushes for Progressive Physics-Based Mixing
- **奖项**: SIGGRAPH 2026 Best Paper
- **作者**: Doug James, Ethan James
- **技术**: 
  - Sharp 2D fluid brushes
  - GPU-accelerated analytical methods
  - Progressive, resolution-independent physics-based mixing
  - Potential flow around cylindrical tines
- **特点**:
  - 无需网格或中间重采样
  - 实时、任意分辨率流体混合和渲染
  - negligible numerical dissipation
- **链接**: [Session Details](https://s2026.conference-schedule.org/presentation/?id=papers_413&sess=sess108)

### 2. Spatiotemporal FLIP for Fast Free-Surface and Two-Phase Simulation With Very Large Time Steps
- **奖项**: Honorable Mention
- **作者**: Bernhard Braun, Rene Winchenbach, Jan Bender, Nils Thuerey
- **技术**: FLIP (FLuid Implicit Particle), Large Time Steps, Free-Surface
- **特点**: 快速自由表面和两相模拟
- **链接**: [SIGGRAPH 2026 Papers](https://s2026.siggraph.org/program/technical-papers/)

### 3. Volume-Preserving LBM-MPM Coupling for Air-Water-Sand Mixtures
- **作者**: Mathieu Desbrun (等)
- **机构**: Inria Saclay
- **技术**: LBM-MPM 耦合 (Lattice Boltzmann Method - Material Point Method)
- **特点**: 空气-水-沙混合物模拟
- **链接**: [Publication Page](https://pages.saclay.inria.fr/mathieu.desbrun/m@pubs.html)

### 4. Fast VEM Fluid Simulation
- **作者**: Renbo Wu
- **技术**: VEM (Virtual Element Method)
- **链接**: [Author Page](http://ren-bo.net/)

### 5. Buoyancy-driven Phase Separation in the Material Point Method
- **技术**: MPM (Material Point Method), 相分离
- **应用**: 浮力驱动的相分离

### 6. A Nonlocal Monolithic Variational Framework for Free Surface Flows
- **技术**: 非局部变分框架, 自由表面流

### 7. Tube Maps: Fast SPH Boundary Handling with Tubular Coordinates
- **作者**: Columbia University
- **技术**: SPH (Smoothed Particle Hydrodynamics), 边界处理
- **特点**: 使用管状坐标的快速 SPH 边界处理
- **链接**: [Project Page](https://gatc.cs.columbia.edu/projects/tubemaps.html)

## 渲染方法总结

| 论文 | 类型 | 技术 | 性能 |
|------|------|------|------|
| Mixwell | 2D Fluid Brushes | Potential Flow, GPU | Real-time |
| Spatiotemporal FLIP | Free-Surface/2-Phase | FLIP, Large Timestep | Fast |
| LBM-MPM Coupling | Multi-Phase | LBM + MPM | Scalable |
| Tube Maps | SPH | Tubular Coordinates | Fast Boundary |

## 关键趋势
1. **GPU 加速**: 多个工作强调 GPU 并行计算
2. **大时间步长**: 提高模拟效率
3. **多相流**: 空气-水-沙 等复杂多相系统
4. **实时光照**: Mixwell 实现实时渲染

## 标签
#SIGGRAPH2026 #流体模拟 #自由表面 #SPH #MPM #GPU加速