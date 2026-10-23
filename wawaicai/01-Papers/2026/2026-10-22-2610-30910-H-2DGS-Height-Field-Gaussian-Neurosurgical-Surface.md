---
type: paper
created: 2026-10-23
updated: 2026-10-23
tags: [paper, geometry-processing, gaussian-splatting, surface-reconstruction, TSDF, signed-distance-field, height-field, neurosurgery, deformation, cs.GR]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2610.30910
arxiv_id: 2610.30910v1
---

# H-2DGS: Height-Field Gaussian Splatting for Sharp and Deformable Neurosurgical Surface Reconstruction

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | H-2DGS: Height-Field Gaussian Splatting for Sharp and Deformable Neurosurgical Surface Reconstruction |
| **作者** | Zhang Zichuan, Bart Brouwers, Rembrandt Bakker, Maud Landers, Geert-Jan Rutten, Maxime Chamberland |
| **发表** | arXiv 2026-10-22 (cs.CV, eess.IV, cs.GR) |
| **链接** | [原文](https://arxiv.org/abs/2610.30910) · [HTML](https://arxiv.org/html/2610.30910v1) |
| **DOI** | [10.48550/arXiv.2610.30910](https://doi.org/10.48550/arXiv.2610.30910) |
| **代码** | 未在摘要中给出 |

---

## 核心贡献

> 面向神经外科手术，把 3D Gaussian Splatting 的「厚度模糊」问题通过 TSDF 融合 + height-field 2D 高斯改造为**锐利、可形变的皮层表面**，并支持术后配准。

1. **问题定位**：常规 3DGS 在**视角覆盖有限**（内窥镜手术）时，会把不透明度摊在一个**厚而几何模糊的带状体**中，无法形成围绕脑组织的清晰边界边界，遮挡内部结构（纤维追踪、MRI 解剖）。
2. **H-2DGS 三阶段流水线**：
   - ① 稳健的 3DGS 重建（浓缩不透明分布）
   - ② 将其深度**融合进共享的截断有符号距离场（TSDF）**表面
   - ③ 用**曲面定向的 2D 高度场高斯**表示该 TSDF 表面
3. **分离基底**：高度（height）、颜色、opacity 使用**独立基底**，分别提供局部几何与外观；并以**邻接过渡目标（neighbor-transition objective）**协调重叠 patch。
4. **术后对齐支持**：MRI 导出的深度对重建结果做**形变（deform）**，配合**跟踪颜色（tracked-color）监督 + 交替优化**保持外观。
5. **结果**：5 例真实神经外科病例，多视角深度不一致性低，压缩表示仅 **7.97MB**，交互渲染 **29–42 ms/帧**。

---

## 技术方案

### 核心思想

| 阶段 | 表示 | 作用 |
|------|------|------|
| **① 稳健 3DGS** | 传统 3D Gaussian Splatting | 在有限视角下尽量把不透明度**浓缩**为可信 3D 观测 |
| **② TSDF 融合** | 截断有符号距离场 | 把稀疏深度**融合为一张锐利表面**，解决厚度模糊 |
| **③ Height-field 2DGS** | 曲面定向的 2D 高斯（高度基底 + 颜色基底 + opacity 基底） | 以**贴合表面**的薄高斯原语替代体积高斯，得到锐利边界 |

### 为什么用 height-field

- 体积 3DGS 在稀疏视角下**沿视线方向摊开不透明度**，导致「厚带」
- **height-field 2D 高斯**把每个原语约束为**贴合曲面的薄片**，天然抑制沿视线厚度
- 与 **TSDF** 结合：先用 TSDF 保证几何锐利，再用 height-field 保持 3DGS 的高质量外观与实时性
- 邻接过渡目标保证相邻 patch 之间的连续性，避免出现缝隙/错层

### 术后形变（Postoperative Alignment）

1. MRI 导出的深度 → 驱动重建表面的**形变场**
2. **跟踪颜色（tracked-color）监督**：形变过程中锁定已重建的颜色/外观
3. **交替优化（alternating optimization）**：几何形变与外观保持交替进行，避免形变时外观塌陷

---

## 复杂度分析

| 项 | 说明 |
|----|------|
| **训练/重建** | 三阶段串联：3DGS 训练 + TSDF 融合 + height-field 重表示，属离线阶段 |
| **渲染** | **29–42 ms/帧**（交互级）；height-field 2DGS 相比体积 3DGS 原语更薄，渲染更轻 |
| **存储** | **7.97MB**（5 例病例），压缩表示，非常紧凑 |
| **形变对齐** | 交替优化（几何形变 ↔ 外观保持），离线推理阶段 |

---

## 实现难度

- **算法复杂度**：**中**（3DGS + TSDF 融合 + 2D 高斯三条成熟线的组合，创新在融合与约束）
- **数值稳定性**：
  - TSDF 融合对**深度噪声**敏感，需要截断阈值谨慎设置
  - height-field 高斯与曲面的**贴合度**需要邻接过渡目标约束，否则易出现 patch 缝隙
  - 术后形变 + 外观保持的**交替优化**需防止两者相互干扰（形变破坏外观 / 外观约束阻碍形变）
- **依赖项**：
  - 3D Gaussian Splatting 代码库（3DGS 原版 / gsplat）
  - TSDF 融合（Open3D / Voxblox / nvblox 级别的 TSDF）
  - 2DGS / height-field splatting 渲染器
  - MRI 深度导出与配准工具链

---

## 推荐结论
✅ **推荐跟踪 / 谨慎实现**

### 推荐理由
1. **几何处理核心问题**：把体积高斯「压」成**曲面定向薄高斯**，是 3DGS 表示的一次有意义的表示层改进，对「既要 3DGS 外观又要几何锐利」的场景普遍有价值（不限于神经外科）
2. **表示层创新可迁移**：height-field 2DGS + TSDF 的组合思路，可迁移到任何「稀疏视角 + 需要锐利表面 + 要实时渲染」的场景
3. **工程指标漂亮**：7.97MB 存储、29–42ms 交互渲染，落地性强

### 实现注意
- 建议先在 **3DGS + Open3D TSDF** 上做小规模复现，验证 height-field 高斯是否真的消除厚度模糊
- 邻接过渡目标与交替优化的实现细节（论文正文）对复现成败影响大

---

## 开源参考

- **3D Gaussian Splatting**：原版实现（3DGS / gsplat）
- **2DGS**：2D Gaussian Splatting（Bi et al.）—— height-field 高斯的直接前身
- **TSDF 融合**：Open3D TSDF、nvblox、Voxblox
- **相关工作**：[[2026-10-20-2610-28598-Neural-Implicit-Energy-LiDAR-Mapping]]（同样是「让表示服务几何」的主题）

## 与 wawaicai 研究方向的连接

- **与 [[3D Gaussian Splatting]]**：属于 3DGS 表示的「表面化」方向 —— 与 [[几何查询无网格化]]（tessellation-free）同源动机：都试图在保留快速渲染的同时获得**显式几何保证**
- **与 [[表面重建]]**：TSDF → 曲面的路线是经典表面重建范式，本文把它与神经渲染表示结合
- **与 [[神经隐式表示]]**：与 LiDAR 建图那篇（shape operator 正则化）共同构成「神经表示的几何先验注入」趋势

## 应用场景

- 神经外科导航（皮层表面 + 纤维追踪 + MRI 融合可视化）
- 医学影像的实时 3D 交互（术中形变 + 术后配准）
- 任何「有限视角 + 需要锐利表面 + 实时渲染」的场景（AR 内窥镜、扫描展示）

---
相关主题：[[3D Gaussian Splatting]] [[表面重建]] [[TSDF]] [[神经隐式表示]] [[高度场]] [[神经外科导航]] [[表面化表示]]