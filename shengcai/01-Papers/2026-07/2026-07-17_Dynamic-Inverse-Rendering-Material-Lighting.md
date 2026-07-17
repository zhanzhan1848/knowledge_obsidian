---
type: paper
created: 2026-07-17
updated: 2026-07-17
tags: [paper, inverse-rendering, 3DGS, PBR, global-illumination, rendering]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2607.09329
---

# Dynamic Inverse Rendering for Enhanced Material-Lighting Decomposition

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Dynamic Inverse Rendering for Enhanced Material-Lighting Decomposition |
| **作者** | Raza Yunus et al. |
| **发表** | ECCV 2026 |
| **链接** | [原文](https://arxiv.org/abs/2607.09329) |
| **代码** | https://razayunus.github.io/DIR |

---

## 核心贡献

> 探索刚体运动在逆渲染中分解材质和光照的潜力

1. **刚体运动约束**: 利用运动产生的多样化光-表面交互
2. **神经SDF + 3DGS混合**: 先用神经SDF获取初始几何和物体姿态，再用3DGS细化
3. **PBR分解**: 联合优化几何、姿态、材质和环境光照

---

## 技术方案

### 核心思想

逆渲染中，将出射表面辐射分解为材质和光照是严重病态的——多个组合可能产生相同的观测颜色。传统方法需要多光照条件观测。本文证明**刚体运动**可以提供足够的光-表面交互约束。

### Pipeline

1. **渐进优化**: 神经SDF representation
2. **3DGS细化**: 联合细化所有帧的初始估计
3. **材质+光照优化**: 物理基础渲染（PBR）准确分解

### 关键技术

| 技术 | 说明 |
|------|------|
| 神经SDF | 初始几何和姿态估计 |
| 3D Gaussian Splatting | 细节捕捉 |
| Split-sum近似 | 高效计算一次弹跳间接辐射 |
| PBR渲染方程 | 物理基础分解 |

---

## 实验结论

- 运动比静态观测更能准确分解材质
- 即使在嘈杂真实世界条件下也保持优势
- HOT3D数据集验证

---

## 局限性

- 假设刚体运动
- 需要足够的运动覆盖

---

## 实现建议

- **实现难度**: 中高
- **适用场景**: 物体捕捉、AR/VR、 relighting
- **推荐度**: ⭐⭐⭐⭐
