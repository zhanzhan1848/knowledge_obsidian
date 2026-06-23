# Scene-Level Heterogeneous Physics Simulation with 3D Gaussian Splats

## 📅 日期: 2026-06-23
## 🔗 来源: [arXiv:2606.21753](https://arxiv.org/abs/2606.21753)

---

## 基本信息

| 项目 | 内容 |
|------|------|
| arXiv ID | 2606.21753 |
| 标题 | Scene-Level Heterogeneous Physics Simulation with 3D Gaussian Splats |
| 会议 | CVPR 2026 Findings |
| 提交日期 | 2026-06-20 |
| 方向 | 3DGS + 物理仿真 |

---

## 核心创新

### 问题
- 3DGS 实现 SOTA 照片级实时渲染，但**表示鸿沟**阻止物理交互
- 现有 physics-for-3DGS 方法是**单一系统**，仅能处理物体级物理（理想平面上的孤立环境）
- **无法与复杂静态碰撞几何或异构资产交互**

### 解决方案
首次实现 3DGS 资产参与**场景级、异构、多求解器物理模拟**

### 核心技术: Representation Abstraction Framework
```
输入资产 (异构)
  ├─ 3DGS
  ├─ Virtual Meshes
  └─ Fluids (流体)
         ↓
统一物理粒子集 (Unified Physical Particle Set)
         ↓
Solver-Agnostic Physics Kernel (MPM 等)
         ↓
视觉重建驱动 (Visual Reconstruction)
```

### 关键特性
- **双向耦合交互**: 3DGS 资产 ↔ 流体/网格
- **大规模静态场景**: 捕获场景的静态碰撞边界
- **耦合现象**: 展示逼真的耦合现象（此前无法实现）

---

## 技术亮点

1. **统一粒子抽象**: 所有资产转换为统一物理粒子集
   - 3DGS → 粒子
   - 虚拟网格 → 粒子
   - 流体 → 粒子

2. **求解器无关内核**: 支持 MPM 等多种物理求解器

3. **复杂交互能力**:
   - 可变形 3DGS 资产的非刚性变形
   - 流体 ↔ 3DGS 资产的双向交互
   - 大规模捕获静态环境交互

---

## 与流体渲染的关系

| 维度 | 相关性 |
|------|--------|
| 方向 | ⭐⭐ 间接相关 (3DGS + 物理仿真) |
| 流体角色 | 流体作为物理模拟资产，非渲染焦点 |
| 渲染方法 | 基于 3DGS 渲染，非传统流体渲染 |
| 可借鉴性 | 流体与固体耦合仿真思路 |

---

## 标签

`#3DGS` `#物理仿真` `#异构模拟` `#流体资产` `#MPM` `#CVPR2026`

---

*豆苗 (Doumiao) — 归档时间: 2026-06-23*
