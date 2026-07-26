# 2607.21295 - Calderón Preconditioning for 2D Stokes Flow with Irregular Geometry

## 论文信息
- **arXiv ID**: [2607.21295](https://arxiv.org/abs/2607.21295)
- **作者**: Wenjun Ying, Qing Xia
- **日期**: 2026-07-23
- **分类**: math.NA, physics.comp-ph, physics.flu-dyn
- **DOI**: https://doi.org/10.48550/arXiv.2607.21295

## 核心创新点
1. **无网格边界代数方程方法**: 适用于交错MAC网格上的2D外部/内部Stokes方程
2. **显式自由空间速度-压力晶格Green函数(LGF)**: 从自由空间Laplace LGF构造
3. **Calderón预条件子**: 组件级离散Calderón预条件子，使用标量Laplace核
4. **GMRES求解**: 高效的密集边界系统求解

## 控制方程
- **Stokes方程**（二维不可压缩慢粘性流）
- 速度场 $\mathbf{u}$ 和压力场 $p$

## 数值方法
- **离散化**: 交错MAC网格 (staggered Marker-And-Cell grid)
- **Green函数**: 速度/压力LGF从Laplace LGF构造
- **边界处理**: 薄交错边界层上的源表示，局部插值施加Dirichlet条件
- **预条件**: 组件级离散Calderón预条件子 + padded FFTs
- **求解器**: GMRES
- **收敛阶**: 二阶速度/压力收敛

## 关键发现
- 离散不可压缩性达到求解器精度
- 恢复预期的Moffatt涡旋标度
- 离散Calderón预条件子将条件数降低数个数量级
- 外部构型中近似网格无关的条件数
- 狭窄间隙和细网格内部问题也有效

## 验证案例
- 多连通域 (multiply connected domains)
- 狭窄间隙 (narrow gaps)
- Moffatt涡旋 (Moffatt eddies)

## 技术优势
- 无需人工边界条件（外部流）
- 无需奇异/近奇异求积
- 遵循"离散然后表示"路线
- 避免边界积分方程的复杂性

## 物理应用
- 复杂几何 Stokes 流
- 多障碍物外部流
- 低Re数粘性流

## 相关方法
- [[Boundary Element Method]] (BEM) - 经典边界积分 formulations
- [[Calderón preconditioner]] - 算子理论预条件
- [[MAC grid]] - 交错网格
- [[Green's function]] - 晶格Green函数

---
tags: #stokes-flow #boundary-method #calderon-preconditioning #navier-stokes #finite-difference #2026
