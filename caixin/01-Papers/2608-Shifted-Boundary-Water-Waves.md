---
type: paper
created: 2026-08-31
updated: 2026-08-31
tags: [CFD, water-waves, shifted-boundary, unfitted-FEM, spectral-element, nonlinear]
status: processed
domain: fluid
agent: caixin
source: https://arxiv.org/abs/2608.28123
---

# A high-order polynomial-corrected shifted boundary method for simulating fully nonlinear water waves

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | A high-order polynomial-corrected shifted boundary method for simulating fully nonlinear water waves |
| **作者** | Jens Visbech, Allan P. Engsig-Karup, Harry B. Bingham, Mario Ricchiuto |
| **发表** | arXiv 2026-08-28 / 28 pages, 14 figures |
| **链接** | [原文](https://arxiv.org/abs/2608.28123) |
| **DOI** | https://doi.org/10.48550/arXiv.2608.28123 |
| **Subjects** | physics.flu-dyn, math.NA, cs.NA |

---

## 核心贡献

> 提出无网格贴合高阶多项式修正移位边界 (Shifted Boundary) 格式，在笛卡尔背景网格上模拟完全非线性水波，无需重网格化。

1. **无网格贴合 (Unfitted) 框架**：简单笛卡尔背景网格 + 高阶多项式修正移位边界近似
2. **移动变形自由面**：曲面、高时变性自由面，底床变化全可处理
3. **多项式保持梯度恢复**：精确捕获垂直自由面速度
4. **高阶收敛 + 超粘性稳定**：任意阶 FD 近似 + hyperviscosity 长时间稳定

---

## 技术方案

### 核心思想

自由面和边界位于网格单元内部（无贴合），通过边界条件的移位和多项式修正保持精度。自由面用 FD 显式追踪，边界通过修正源项处理。

### 关键技术

| 技术 | 说明 |
|------|------|
| Shifted Boundary Method | 边界条件从真实边界移至最近网格节点，多项式修正误差 |
| Unfitted Spectral Elements | 网格内部边界，无需重网格 |
| Polynomial-preserving Recovery | 梯度恢复保持多项式精度 |
| Hyperviscosity | 高阶导数人工耗散，长时间稳定 |
| 任意阶 FD | 自由面追踪精度可选 |

---

## 物理模型

- **方程**：完全非线性势流 (Fully Nonlinear Potential Flow, FNPF)
- **自由面**：剧烈运动和变形
- **底床**：affine 和 curved 地形变化
- **非线性波**：stream function waves, high-amplitude solitons

---

## 验证算例

- 周期域和有限域波传播
- 收敛性研究（高阶精度验证）
- 长时间高度非线性波
- 非线性波与曲面/平直底床的相互作用
- 非线性波与垂直壁面

---

## 局限性

- 势流假设（无旋），不适用于旋涡流动
- 超粘性参数需调节
- 仅处理自由面和壁面，复杂内部结构未涉及

---

## 实现建议

- **实现难度**：高（需 spectral element 基础 + 移位边界修正）
- **预期性能**：高阶收敛效率，计算量低于重网格化方法
- **适用场景**：海洋工程、近海结构波载荷、波浪能装置

---

## 相关工作

- [[Shifted Boundary Method]]
- [[Unfitted FEM]]
- [[Water Wave Simulation]]
- [[Spectral Element Method]]
