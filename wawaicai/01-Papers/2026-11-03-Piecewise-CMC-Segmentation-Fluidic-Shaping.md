---
tags: [几何, 网格分割, CMC曲面, 流体成形, 制造, 形状分解, 平均曲率流, 3D打印, 图收缩]
date: 2026-11-03
source: arXiv
arxiv_id: 2611.00227
venue: TOG / CCS / CAM (2026-10-30 announcement)
status: new
authors: Abhinit Sati, Jacob Garrett, Valeri Frumkin, Edward Chien, Emily Whiting (Boston University)
url: https://arxiv.org/abs/2611.00227
---

# Piecewise CMC Segmentation for Fluidic Shaping

## 核心问题

**流体成形（fluidic shaping）** 是一种利用界面张力的制造工艺：在与聚合物**密度匹配**的浸泡液中，将液态聚合物约束在刚性骨架内，自然松弛成极光滑的曲面，固化后可达**纳米级粗糙度**（对比常规 FDM/光刻的微米级沉积痕）。

**瓶颈**：由于成型结果由流体界面平衡决定，现有方法的设计空间仅限于「透镜状」曲面，**无法制造自由曲面（freeform）3D 形状**。

**物理约束（关键洞察）**：
在密度匹配的浴液中，重力被抑制，界面张力驱使液界面趋向 **Constant Mean Curvature (CMC) 曲面**。但由于两流体密度相同，**压强差处处相等**，因此**所有片段必须共享同一个平均曲率 H\***。

→ 这给几何分解施加了一个**全局约束**。

## 方法概述

### 问题形式化

> 给定目标平均曲率 H\*，计算输入几何的一个分割，使得**每个片段都能演化为 CMC 曲面**，且「演化后几何 vs 原始几何」的近似误差小于用户给定阈值。

这被作者称为 **piecewise CMC (P-CMC) segmentation** —— 类比于 developable segmentation（可展分割）与 mold paneling（模具分块）。

### 核心算法

1. **贪心片段生长**
   - 每个片段从**单个网格单元**开始，在输入曲面上扩张
   - 扩张直到该 patch **无法再被 CMC 曲面近似**为止
   - **片段边界 = 曲面偏离 CMC 的位置** → 分割天然把目标几何的**锐利特征集中到稀疏的曲线集合上**
   - 类比 Stein et al. 2018 的 developability flow、Chen & Kara 2026 的 milling 可制造性优化（都是把高斯曲率集中到稀疏曲线上）

2. **CMC 演化过程嵌入分割循环（in-the-loop）**
   - 这是本文最大的技术难点：给定固定边界 + 标量 H\*，平均曲率方程**同时有小解和大解**（如球面的小帽与大帽）
   - **Surface Evolver**（Brakke）只能到达局部极小，会漏掉 E 能量面的**鞍点**（如大帽），而后者在固定体积下同样稳定
   - Pan et al. 2012 / Yu et al. 2016 用标量（t、λ）加权离散体积梯度 —— 但**平均曲率对这些参数非单调**，无法通过调参来设定 H\*
   - **本文方案**：用 Pan et al. 2012 的能量作为内层求解器，再**对其参数做 root-finding** 以恢复对 H\* 的控制
   - 使用**离散 Jacobi 算子**作 Newton Jacobian（Polthier & Rossman 2002 的离散 CMC 指标理论）
   - 声称是**首个**：接受任意三角网格 + 固定边界 + 标量 H\*，收敛后返回**该曲率下、且在固定体积下稳定**的 CMC 曲面（含某些 E 的鞍点）

3. **骨架提取与制造**
   - 从分割缝（seams）提取**线框骨架** → 3D 打印
   - 注入聚合物流体 → 界面张力沿缝收缩、体积松弛成 CMC 面 → 固化
   - 缝的物理作用：**钉扎（pinning）液界面**，否则固定体积的聚合物会松弛成球（最小面积）而完全丧失目标几何

### 理论定位

作者明确把 P-CMC 放在 developable segmentation 的延长线上：
- Julius et al. 2005 / Wang 2008 / Zhao et al. 2022 —— 可展分割
- Eigensatz et al. 2010 / Fu et al. 2010 —— 模具分块
- 共同范式：**把自由曲面分解为可制造的简单基元**

## 实验结论

- **数据集**：论文涉及自由曲面 3D 结构的流体成形
- **基线**：需要后处理/平滑的常规 SOTA 方法
- **结果**：
  - 固化后成为**单一连续、各向同性的体积**（对比 FDM 逐层沉积的各向异性 + 微米级沉积痕）
  - 每段内部表面达到**纳米级粗糙度**
  - **无需昂贵的后处理或平滑**即可达到同等表面质量
  - 从单一光学曲面扩展到**自由曲面 3D 几何**的端到端流水线

## 复杂度分析

- **CMC 演化内层**：Newton 迭代 + 稀疏线性求解（离散 Jacobi），单次 O(N^1.5)–O(N^2)（N 为片段顶点数）
- **root-finding 外层**（为命中目标 H\*）：需多次内层求解 → 代价乘以 root-finding 迭代数（通常 10–30）
- **贪心分割**：每个片段扩张需反复测试「当前 patch 是否可被 CMC 近似」，最坏情况 O(F) 次 CMC 求解测试（F 为面数）
  - 实际有增量策略：新增元素后增量更新
- **空间**：O(N) per segment

## 数值稳定性

- **H\* 根求解的病态性**：平均曲率对内层参数非单调 → root-finding 需要稳健的括区间（bracketing）策略，且可能遇到 H* 不可达的区间（此时需要回退或调整边界）
- **鞍点稳定性**：Surface Evolver 类方法漏解大帽（major cap）是一个**已知的失败模式**，本文用参数化 + root-finding 显式处理，但需验证 root-finding 不会收敛到不稳定解
- **Newton 的适用域**：Newton 法收敛到**附近的解**，不管物理稳定性 —— 所以必须配合稳定性检查（论文附录 D 讨论了体积约束下的稳定性分析）
- **离散 CMC 指标的奇异性**：离散 Jacobi 算子在退化/薄三角形上条件数差 → 需要网格质量前置检查
- **贪心的局部性**：片段生长是贪心的，全局最优性无保证（与 developable segmentation 相同的经典局限）
- **边界条件**：固定边界 + CMC 的多解性（小帽/大帽）使得边界附近解分支的选择敏感

## 实现难度

- **算法复杂度**：**高**
  - CMC 演化 + Newton + root-finding 三层嵌套
  - 分割贪心策略本身的实现相对直接，但调参（容差阈值、扩张准则）空间大
- **依赖项**：
  - **Surface Evolver**（Brakke）—— 或自行实现 Pan et al. 2012 的离散 CMC 能量 + Newton
  - 稀疏求解（Eigen、PETSc）
  - 网格布尔/偏移（构造初始骨架、3D 打印几何）→ CGAL、OpenVDB
  - 制造验证需要流体成形实验装置（BU 有相关设备）
- **代码**：论文未声明公开

## 推荐结论

⚠️ **谨慎评估**（针对数字制造 / 形状分解方向）

理由：
1. **几何思想很有价值**：P-CMC 分割是 developable segmentation 范式在 CMC 曲面上的推广，**把目标几何的锐利特征自动集中到稀疏曲线**这一点是通用的、可迁移的设计思想 —— 任何"曲率集中"类的形状分解都可以借鉴这个贪心扩张框架
2. **实现门槛高**：三层嵌套（分割 → CMC 演化 → root-finding）+ 鞍点稳定性处理，对工程实现要求不低
3. **强依赖制造工艺**：若下游没有流体成形设备，方法的实用价值大打折扣
4. **全局最优性无保证**：贪心框架的经典局限

**建议传递给 @墨鱼丸 的用途**：
- **P1（作为算法参考）**：「曲率集中式贪心分割」的框架可用于其他制造性分解任务（如可展面分割、加工方向优化）
- **P2（作为工艺方向）**：若项目涉及高光滑度 3D 打印，这条路线值得关注
- **不建议**直接投入工程实现，除非项目方向明确涉及流体成形

## 相关工作

- [[Piecewise-Developable-Segmentation]]
- [[Constant-Mean-Curvature-Surfaces]]
- [[Surface-Evolver]]
- [[Shape-Decomposition-Manufacturing-Primitives]]
- [[Greedy-Patch-Growing-Segmentation]]
- [[2026-11-03-Representation-Aware-Closed-Surface-Parameterization-FLASH]]
- [[2026-11-03-Mesh-Agnostic-Refinement-Body-Shapes]]
