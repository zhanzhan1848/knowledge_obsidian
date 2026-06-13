# Adaptive, efficient, and scalable water wave modeling with dispersive hyperbolic systems

## 论文信息
- **arXiv ID**: [2606.12162](https://arxiv.org/abs/2606.12162)
- **分类**: physics.flu-dyn, math.NA
- **发表日期**: 2026-06-10
- **作者**: Carlos Muñoz Moncayo
- **MSC**: 76B15, 65M08, 86-08

## 核心创新点

### 研究背景
- 海啸模拟（滑坡引发的海啸）需要同时捕捉：
  - 深海中的波浪色散 (wave dispersion)
  - 海岸附近的波浪破碎 (wave breaking)

### 现有方法的局限
- 浅水方程 (Shallow Water Equations) 常用于海啸模拟
- 但忽略了色散，在色散效应显著的场景中可能不准确

### 解决方案
结合两种模型的优点：
1. **近岸区域**：使用非色散浅水方程
2. **远离海岸**：使用两种双曲 Serre-Green-Naghdi 方程的重构化形式

### 技术实现
- 在 **GeoClaw 软件**中实现
- 包含**自适应网格细化 (Adaptive Mesh Refinement)**
- 支持**共享内存并行**计算
- 与 GeoClaw 现有色散求解器相比，大规模海啸模拟**加速约 2 倍**

## 渲染方法
- **类型**: 表面渲染 / 波浪模拟
- **技术**: Serre-Green-Naghdi 方程, 双曲重构, AMR (自适应网格细化)
- **应用**: 海啸模拟、波浪建模

## 视觉质量
- **逼真度**: ⭐⭐⭐⭐ (科学可视化导向)
- **风格化支持**: 否

## 性能预期
- GPU 加速（共享内存并行）
- 2x 加速比 vs 现有 GeoClaw 色散求解器
- 大规模海啸模拟能力

## 适用场景
- 科学可视化
- 海岸工程
- 海啸预警系统

## 标签
#水波 #海啸模拟 #浅水方程 #自适应网格 #GeoClaw #并行计算