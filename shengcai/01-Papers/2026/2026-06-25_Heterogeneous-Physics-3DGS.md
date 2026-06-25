---
tags: [渲染, 3DGS, 物理仿真, CVPR2026, 2026]
date: [[2026-06-25]]
status: 待读
---

# Scene-Level Heterogeneous Physics Simulation with 3D Gaussian Splats

## 基本信息
| 标题 | 值 |
|------|-----|
| 作者 | Xiaoyang Liu |
| 发表 | CVPR 2026 Findings |
| 链接 | [arXiv:2606.21753](https://arxiv.org/abs/2606.21753) |
| PDF | [PDF](https://arxiv.org/pdf/2606.21753) |

## 核心贡献
1. 首次实现 3DGS 资产参与场景级、异构、多求解器物理模拟
2. 提出 **Representation Abstraction Framework**，将 3DGS、虚拟网格和流体转换为统一物理粒子集
3. 实现 3DGS 资产与非刚性变形的复杂双向交互

## 技术方案

### 问题背景
3DGS 实现 state-of-the-art 照片级真实感渲染，但表示差距阻止这些资产的物理交互。生产级物理引擎不理解 3DGS 表示，而先前方法仅展示以理想平面为背景的物体中心物理。

### 关键创新
1. **Representation Abstraction Framework**：将所有资产转换为统一物理粒子集
2. **求解器无关物理内核**：处理粒子集和静态场景碰撞边界
3. **双向映射**：物理结果驱动每个资产的特定视觉重建

## 实验结论
- 首次实现 3DGS 资产与流体、网格的复杂双向交互
- 支持大规模捕获静态环境的真实耦合现象

## 标签
#3DGS #PhysicsSimulation #Heterogeneous #CVPR2026

## 相关笔记
[[2026-06-25_Mesh2GS-White-Box-3DGS-Plenoptic-Sampling]]
