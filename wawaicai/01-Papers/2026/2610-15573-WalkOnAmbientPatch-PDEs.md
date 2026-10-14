---
title: "Solver-Adapted Isometric Embeddings for Projected Walk on Spheres"
arxiv_id: "2610.15573"
date: 2026-10-11
venue: arXiv preprint
tags: [几何, 几何嵌入, 等距映射, 表面PDE, Monte Carlo, WOS]
authors:
  - Yunfeng Liao
url: "https://arxiv.org/abs/2610.15573"
---

# Solver-Adapted Isometric Embeddings for Projected Walk on Spheres

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Solver-Adapted Isometric Embeddings for Projected Walk on Spheres |
| **作者** | Yunfeng Liao (et al.) |
| **发表** | arXiv preprint |
| **链接** | [arXiv:2610.15573](https://arxiv.org/abs/2610.15573) |
| **DOI** | 10.48550/arXiv.2610.15573 |
| **代码** | TBD |
| **交叉**: cs.GR + math.NA |

---

## 核心贡献

> 将嵌入视为求解器变量 — 引入 WoAP（Walk-on-Ambient-Patch），通过边等距约束 + 切点排斥分离本质几何上遥远的区域，处理紧密折叠表面。

1. **嵌入作为变量**: 不固定嵌入，联合优化
2. **边等距 + 切点排斥**: 在高余维环境约束下分离折叠区域
3. **几何-采样权衡分析**: 维度数 × 均匀切线推进 × 重要性权重三方面

---

## 技术方案

### 核心思想

传统 Projected Walk on Spheres (PWoS) 在折叠嵌入下易出现投影冲突。本文把嵌入自由度也纳入求解器优化空间：

1. **嵌入优化变量**: 边等距约束 + 切点排斥
2. **patch states**: 跟踪残余投影分支（不引入 PDE 边界）
3. **高余维分离**: 本质遥远区域可在环境高维分离

### 关键技术

| 技术 | 说明 |
|------|------|
| 边等距约束 | 度量保持约束 |
| 切点排斥 | 本质分离 |
| 高余维嵌入 | 自由分离维度 |
| patch states | 残余投影追踪 |
| 重要性权重分析 | 切线 biased proposal trade-off |

---

## 算法复杂度

- **嵌入优化**: 内层迭代
- **PDE 求解**: 与 WOS 同阶
- **存储**: 复杂度 ~|patch states|

---

## 实验结论

- **折叠表面**: 投影冲突降低
- **硬约束**: 验证度量保持
- **fixed-RMSE 比较**: 在更严格精度目标下高维更优

---

## 局限性

- 高维嵌入增加内存与训练复杂度
- 重要性权重方差随高维上升
- 联合优化的收敛性分析尚未完整

---

## 相关工作

- [[Walk-on-Spheres]]
- [[Geometric-PDE-Solver]]
- [[Isometric-Embedding]]
- [[Surface-PDE]]
- [[Monte-Carlo-Geometry]]

---

## 实现建议

- **实现难度**: 高（数值分析 + 等距几何）
- **预期性能**: 与 WOS 同阶迭代，略增每步耗时
- **适用场景**: 复杂拓扑表面的 PDE（流体、电场、热场）
- **开源参考**:
  - libigl: 网格变形与拉普拉斯算子
  - pyBind11 + Eigen: 数值代数
  - gpytoolbox / GPyTorch: 高斯过程嵌入
  - polyscope: 几何可视化

---

## 论文元数据

- **arXiv 提交**: 2026-10-11 12:38 UTC
- **领域**: 数值几何 + 蒙特卡洛 PDE 求解
