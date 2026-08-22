# Orientation-Dependent Drag, Lift, and Torque Correlations for Regular Platonic Polyhedral Particles

## Metadata
- **arXiv**: [2608.18890](https://arxiv.org/abs/2608.18890)
- **Subjects**: Fluid Dynamics (physics.flu-dyn) · Computational Physics (physics.comp-ph)
- **Authors**: Berend van Wachem
- **Date**: Wed, 19 Aug 2026
- **PDF**: [arxiv.org/pdf/2608.18890](https://arxiv.org/pdf/2608.18890)

## 核心创新点

### 研究对象
**五种柏拉图正多面体**（Platonic solids）：从低面数到高面数递进：
1. 四面体 (4 faces)
2. 立方体 (6 faces)
3. 八面体 (8 faces)
4. 十二面体 (12 faces)
5. 二十面体 (20 faces)

代表粒子球形度（sphericity）的递进序列。

### 研究范围
- **Re_p** ∈ [0.1, 300]
- 多种粒子朝向（相对于来流）
- 粒子的 DNS：浸没边界法 (Immersed Boundary Method, IBM)

### 核心贡献
1. **新曳力关联**：显式考虑 Reynolds 数和粒子朝向
2. **升力和扭矩关联**：取向依赖的三角函数 + 指数基函数，系数随 Re 变化
3. **Euler-Lagrange 和点粒子模拟框架**：提供计算高效的力/扭矩预测

## 数值方法

### IBM (Immersed Boundary Method)
- 粒子表面施加无滑移边界条件
- 罚函数或直接力法
- 粒子的 DNS

### 参数化
- **球形度** Φ = (π^(1/3) × (6V_p)^(2/3)) / A_p
  - V_p: 粒子体积
  - A_p: 粒子表面积
  - Φ 从 0.806（四面体）到 1.0（球体）

### 关联公式

#### 曳力
```
F_D = f(Re_p, orientation, sphericity)
```

#### 升力
```
F_L = f(Re_p, orientation, sphericity, 三角函数)
```

#### 扭矩
```
T = f(Re_p, orientation, sphericity, 指数衰减)
```

## 多相流应用

### Euler-Lagrange 框架
- 每个粒子追踪位置、朝向、速度、角速度
- 曳力/升力/扭矩 → 粒子运动方程

### 点粒子近似
- 假设粒子足够小（<< 网格尺度）
- 使用本关联估算力学

## 🥢 可行性分析：非球形粒子多相流

## 控制方程
- N-S 方程（单相或两相）
- 粒子动力学（6-DOF：3 位置 + 3 朝向，或 3 位置 + 四元数）

## 数值方法
- **离散化**：IBM + FVM
- **求解器**：投影法或压力修正
- **粒子-流体耦合**：双向耦合（但计算成本高）

## 计算成本
- 单粒子 Re=1-300：每个几何 ~100 万网格单元
- 5 种形状 × 多朝向 × 多 Re：计算量大
- 预计算关联：查询表 O(1)

## 推荐结论
✅ 推荐实现（非球形颗粒运输的首选关联）

## 应用场景
- 颗粒输送（管道、油气）
- 流化床
- 颗粒沉积
- 大气颗粒物

## 相关研究
- 关联：[[Non-spherical-particles]] · [[Immersed-boundary-method]] · [[Multiphase-flow]]
- 标签: #non-spherical-particles #IBM #drag #lift #torque #multiphase #DNS

---
*💡 由 菜心 自动抓取于 2026-08-22*
