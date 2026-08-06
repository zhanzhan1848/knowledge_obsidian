---
type: paper
created: 2026-08-06
updated: 2026-08-06
tags: [free-surface, turbulence, surface-deformation, air-water-interfaces, PIV]
status: processed
domain: fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2608.04687
---

# Free-Surface Curvature and Its Relation to Subsurface Turbulence

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Free-surface curvature and its relation to subsurface turbulence |
| **作者** | Daniel Ruth |
| **发表** | arXiv 2026-08-05 |
| **链接** | [原文](https://arxiv.org/abs/2608.04687) |
| **DOI** | https://doi.org/10.48550/arXiv.2608.04687 |
| **代码** | - |

---

## 核心贡献

> 建立自由表面曲率与水下几毫米处速度场的定量关系，为光学传感近面湍流提供理论基础

1. **理论框架**：基于 Euler 方程（重力+表面张力）建模表面变形
2. **实验验证**：高分辨率同步测量表面拓扑和水下速度场
3. **关键发现**：表面曲率与近面水平速度散度高度相关
4. **应用**：证明可通过表面变形推断水下流动状态

---

## 技术方案

### 控制方程

自由表面边界条件下的 Euler 方程：

$$\nabla \cdot \mathbf{u} = 0, \quad \frac{D\mathbf{u}}{Dt} = -\frac{1}{\rho}\nabla p + \mathbf{g}$$

表面张力项：$\sigma \kappa$（$\kappa$ 为曲率）

### 关键关系

$$\kappa \propto \nabla \cdot \mathbf{u}_{h}|_{z \approx \text{几毫米}}$$

即表面曲率与近表水平速度散度成正比

### 实验配置

| 参数 | 值 |
|------|---|
| 测量技术 | 同步 PIV + 表面拓扑测量 |
| 关注深度 | 表面下几毫米 |
| Re 范围 | 多种 |
| Fr 数 | 多种 |

---

## 物理机制

- **表面变形机制**：水下湍流通过压力波动和切应力驱动表面变形
- **去相关效应**：随深度增加，表面形状与内部流动去相关，且在小尺度上更快
- **气体/热量传输**：近面水平速度散度直接关联空气-水界面输运

---

## 实验结论

- **统计验证**：大面积统计上表面曲率与近面速度散度高度一致
- **瞬时验证**：局部瞬时值也满足理论预测
- **物理意义**：光学测量表面变形可推断水下湍流状态

---

## 局限性

- 假设表面未破裂（unbroken surface）
- 有限 Re 和 Fr 数范围

---

## 实现建议

- **实现难度**: ★★★☆☆
- **预期性能**: 为非接触式流动传感提供新方法
- **适用场景**: 海洋表面观测、河流表面流场测量、工业液面监测
