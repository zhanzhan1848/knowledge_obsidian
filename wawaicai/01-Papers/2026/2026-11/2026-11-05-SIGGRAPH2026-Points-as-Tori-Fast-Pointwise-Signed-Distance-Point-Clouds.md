---
type: paper
created: 2026-11-05
updated: 2026-11-05
tags: [paper, 几何, 点云, 有符号距离, 重建, 环面拟合, SIGGRAPH2026, ACM-TOG]
status: processed
domain: geometry
agent: wawaicai
source: https://doi.org/10.1145/3811385
---

# Points as Tori: Fast Pointwise Signed Distance for Point Clouds

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Points as Tori: Fast Pointwise Signed Distance for Point Clouds |
| **作者** | Nicole Feng, Ioannis Gkioulekas, Keenan Crane (Carnegie Mellon University) |
| **发表** | ACM Transactions on Graphics, Vol. 45, No. 4 (SIGGRAPH 2026), pp. 1-24 |
| **在线发表** | 2026-07-03 |
| **链接** | [ACM DL](https://doi.org/10.1145/3811385) · [arXiv:2607.16946](https://arxiv.org/abs/2607.16946) |
| **DOI** | 10.1145/3811385 |
| **代码** | ✅ [github.com/nzfeng/points-as-tori](https://github.com/nzfeng/points-as-tori) · [项目页](https://nzfeng.github.io/research/PointsAsTori/index.html) |

---

## 核心贡献

> 用「局部环面（torus）拟合」把点云直接变成有符号距离的解析表示，绕开全局优化与体素离散化，同时统一了 signed distance 与 winding number / Poisson 重建的理论。

1. **局部环面拟合（local torus fitting）**：核心思想是**环面具有闭式有符号距离函数**。对点云每个局部邻域拟合一个环面，从而直接获得 signed distance 的解析参数化。
2. **前馈式曲率/偏移预测**：用预训练网络**直接输出每个点的曲率参数与偏移参数**，无需昂贵的全局优化。
3. **无离散化、无全局优化**：方法**不需要体素网格化**、不需要全局求解，可**任意空间分辨率逐点求值**；天然可高度并行。
4. **统一理论**：提出新理论，把 signed distance 计算与经典的 **winding number** 和 **Poisson 表面重建**方法统一在同一框架下。
5. **免重建直接应用**：点云可直接参与下游运算，**无需显式重建**：偏移（offset）、形态学运算、布尔运算、以及用 sphere tracing 直接可视化偏移面。

---

## 技术方案

### 核心思想

传统 signed distance 方法在「快」与「稳」之间不可兼得：

| 路线 | 速度 | 稳健性 | 问题 |
|------|------|--------|------|
| 体素/SDF 网格化 | 快 | 依赖重建质量 | 需全局重建 + 离散化，细节受网格分辨率限制 |
| Poisson 重建 | 中 | 需法向一致 | 依赖 winding number / 法向定向，全局求解 |
| Winding number | 中 | 法向噪声敏感 | 全局积分代价高 |

**本文的第三条路**：把"重建"局部化 —— 每个点附近拟合一个**环面**。因为环面的 signed distance 有闭式解，所以拟合完成后直接得到解析式 SDF。

### 关键技术

| 技术 | 说明 |
|------|------|
| **环面闭式 SDF** | 标准环面（主半径 R、次半径 r）的有符号距离有解析表达式，是方法可用的前提 |
| **前馈曲率/偏移网络** | 预训练网络从局部点云 patch 直接回归 per-point 曲率与 shift 参数，取代迭代拟合 |
| **统一理论** | 把 SDF 统一到 winding number / Poisson 重建的谱框架下，解释「为何重建与距离是同一问题」 |
| **任意分辨率查询** | 输出是解析参数化形式 ⟹ 可在任意空间分辨率上采样 SDF，无网格分辨率下限 |

---

## 算法复杂度

- **时间复杂度**：$O(N)$ 前馈推理（N = 点数），可完全并行；查询为 $O(1)$ 逐点
- **空间复杂度**：$O(N)$（每点存曲率 + 偏移参数）
- **相对传统**：省去体素网格的 $O(N_h^3)$ 内存与 Poisson 全局求解的迭代代价

---

## 实现难度

- **算法复杂度**：**中** — 环面 SDF 闭式解本身简单，难点在**局部 patch 拟合的鲁棒性**与**法向定向**
- **数值稳定性**：**高** — 解析式无迭代累积误差；但环面退化情形（patch 近似平面时次半径 $r \to \infty$）需特殊处理
- **依赖项**：PyTorch / JAX（前馈网络）、CUDA；几何部分为纯解析计算
- **前提条件**：⚠️ **输入点云必须带法向且法向一致定向**（oriented point cloud）

---

## 实验结论

- **输入来源验证**：photogrammetry、mesh 采样、3D Gaussians、neural implicits 四类点云均适用
- **下游应用**：offsets、morphological / boolean operations、sphere tracing 可视化
- **对比**：同时具备"快"与"稳"，优于 winding number 与 Poisson 重建路线

---

## 局限性

- 需要**一致定向的法向**，而法向定向本身是未解难题（参见 [[2026-11-05-SIGGRAPH2026-Surface-Reconstruction-Unoriented-Points-Greens-3rd-Identity]] 与 [[2026-11-05-SIGGRAPH2026-MegaNorm-Point-Normal-Orientation-Super-Large-Scale]]）
- 局部环面拟合对**尖锐特征**（尖角、细长结构）拟合误差较大
- 前馈网络是**学习式**的，未见形状可能退化

---

## 可行性评估

✅ **强烈推荐实现**

### 推荐理由
1. **代码已开源**，可直接跑通
2. **理论价值高**：首次把 SDF 与经典重建方法统一，为"免重建的几何运算"提供了统一视角
3. **落地快**：替换现有 pipeline 中的 Poisson/winding-number 步骤即可

### 实现建议
- **优先级**：**高**（有代码 + 理论清晰 + 应用面广）
- **集成点**：CAD 内核的点云布尔运算、offset 生成、神经隐式的网格化后处理
- **注意事项**：上游必须先解决法向定向（可参考本轮 MegaNorm / G3R）

---

## 相关工作

- [[2026-11-05-SIGGRAPH2026-Surface-Reconstruction-Unoriented-Points-Greens-3rd-Identity]] — 解决法向定向这一前提问题
- [[2026-11-05-SIGGRAPH2026-MegaNorm-Point-Normal-Orientation-Super-Large-Scale]] — 场景级法向定向
- [[2026-11-05-SIGGRAPH2026-Dual-Contouring-Expanded-Cubes-DCx-Neural-Unsigned-Distance]] — 从 unsigned distance 提取等值面
- [[SDF Signed Distance Field]]
- [[Point Cloud Processing]]

---

**推荐度**：⭐⭐⭐⭐⭐
