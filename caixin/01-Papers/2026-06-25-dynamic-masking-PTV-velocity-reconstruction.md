# Dynamic masking for boundary-aware velocity reconstruction in volumetric particle tracking with moving solids

**arXiv:** [2606.25748](https://arxiv.org/abs/2606.25748)
**Authors:** Jibu Tom Jose, Arieh Jacobson, Dhanush Vittal Shenoy, Omri Ram (Technion - Israel Institute of Technology)
**Date:** 2026-06-24
**Categories:** PTV (Particle Tracking Velocimetry), Lagrangian-to-Eulerian, Moving Boundaries, Immersed Boundary

---

## 核心创新点

1. **问题**: 体积粒子跟踪测速 (PTV) 中，当固体存在于测量体内时，传统全流体重建方法精度低
2. **方法**: **LE-DM** (Lagrangian-to-Eulerian reconstruction with Dynamic Masking)
   - 引入时变符号距离函数 (SDF) 分类网格节点: 开流体 / 边界壳 / 固体内部
   - 在掩蔽域内单次求解，同时约束粒子数据、不可压缩性、表面速度、正则化项
3. **优势**: 
   - 首格点误差从 14% 降至 3% (体速度百分比)
   - 恢复独立测量的表面速度
   - 适用于静止壁面、平动、旋转、多个变形体

---

## 物理背景

### 体积粒子跟踪测速 (PTV)
- 产生散粒 Lagrangian 轨迹
- 需重建到 Eulerian 网格才能计算速度梯度、涡量、压力、载荷
- 常用技术: Tomographic imaging, Shake-the-Box (STB)

### 挑战
- 速度误差经空间微分放大
- 近壁区域重建最弱
- 压力场积分对速度误差敏感

---

## LE-DM 方法

### 动态掩蔽 (Dynamic Masking)
**时变 SDF** 分类:
- **开流体节点**: 纯流体求解
- **边界壳节点**: 施加表面速度约束
- **固体内部节点**: 排除

### 重建约束
1. **粒子数据约束**: Lagrangian → Eulerian 插值
2. **不可压缩性**: $\nabla \cdot \mathbf{u} = 0$
3. **表面速度**: 强制满足 $\mathbf{u}|_{\partial D} = \mathbf{u}_{surf}$
4. **正则化**: 抑制噪声

### 数学框架
$$\min_{\mathbf{u}} \text{cost}(\mathbf{u}) \quad \text{s.t.} \quad \nabla \cdot \mathbf{u} = 0, \quad \mathbf{u}|_{\partial D} = \mathbf{u}_{surf}$$

---

## 数值验证

| 测试案例 | 方法 | 首格点误差 |
|----------|------|-----------|
| 解析振动球 | 全流体 | 14% 体速度 |
| 解析振动球 | LE-DM | **3%** 体速度 |
| CFD 上升球 (合成) | LE-DM | 满足精度 |
| Tomographic-PTV 自由上升球 | 全流体 | 无法恢复表面速度 |
| Tomographic-PTV 自由上升球 | LE-DM | **成功恢复** |

---

## 与现有方法对比

| 方法 | 代表 | 特点 |
|------|------|------|
| 直接插值 | binning, local interpolation | 简单但无物理约束 |
| VIC/VIC+ | vortex-in-cell | 无移动边界处理 |
| B-spline FlowFit | Gesemann | 无移动边界处理 |
| CCM | constrained cost minimization | 无自然边界处理 |
| **LE-DM** | **本文** | **移动边界支持** |

---

## 应用场景

- 粒子图像测速 (PIV/PTV) 后处理
- 自由表面流动
- 多体相互作用流动
- 医疗微流控 (血细胞流动)

---

## 代码/数据

待查

---

## 标签

#PTV #particle-tracking #Lagrangian-to-Eulerian #moving-boundaries #velocity-reconstruction #immersed-boundary #vorticity #CFD #experiment