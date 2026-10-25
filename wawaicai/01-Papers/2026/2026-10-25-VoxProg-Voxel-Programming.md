---
tags: [几何, 体素化, 空间推理, 程序生成, 三维重建, 放置任务, LLM, 网格查询]
type: paper
created: 2026-10-25
updated: 2026-10-25
status: processed
domain: geometry
agent: wawaicai
source: arXiv
arxiv_id: 2610.30127
venue: arXiv cs.CV
year: 2026
authors: Zhichao Zhai, Menglei Zhao, Guikun Chen, Zihao Yan, Kanzhi Wu, Wenguan Wang, Jun Xiao
institutions: Zhejiang University; vivo Mobile Communication Co., Ltd.
categories: [cs.CV]
arxiv_url: https://arxiv.org/abs/2610.30127
project_page: https://voxprog.github.io
---

# VoxProg: 3D Spatial Reasoning through Voxel Programming

## 一句话总结

把"自然语言 → 6-DoF 物体放置"的问题转化为**"体素编程"**：LLM 生成 **Python 程序**，在**局部体素视图**（对场景表面做规则网格离散化）上用**数组操作**构造任务相关的几何参照（隔板、支撑轨、槽位区域），再由**位姿程序**基于这些几何参照求解 $T \in SE(3)$ —— 全程保留与**源网格三角形的精确对应关系**。

---

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | VoxProg: 3D Spatial Reasoning through Voxel Programming |
| **作者** | Zhichao Zhai, Menglei Zhao, Guikun Chen, Zihao Yan, Kanzhi Wu, Wenguan Wang, Jun Xiao |
| **机构** | 浙江大学；vivo 移动通信 |
| **发表** | arXiv cs.CV, 2026-10-21 |
| **链接** | [原文](https://arxiv.org/abs/2610.30127) |
| **项目页** | https://voxprog.github.io |
| **arXiv ID** | 2610.30127 |

---

## 核心贡献

1. **体素编程（voxel programming）表述**
   - 将物体表面按**任务自适应分辨率**离散到规则 3D 网格
   - 网格把空间坐标与邻接关系**直接暴露为数组操作**
   - 生成程序可索引网格以**隔离接触区域、提取边界、测量局部范围与朝向**

2. **两阶段程序管线**
   - **证据程序** $P_e$：构造任务所需表面区域 + 空间关系
   - **位姿程序** $P_p$：查询已验证几何，度量并求解目标位姿
   - 两阶段都带**执行反馈**（数值诊断 + 渲染视图）→ 迭代改写代码

3. **VoxProg-Bench：71 任务基准**
   - 覆盖 **Functional (28) / Geometric (14) / Contextual (29)** 三类

4. **双指标评估协议**
   - **IA Rank Score**（感知排序，衡量意图一致性）
   - **3D Physical Validity**（几何验证：静态支撑 + 物体互穿）
   - **关键消融结论**：先构造**显式几何证据**再合成位姿，优于直接网格编程；**局部体素视图**在全部 71 个任务上提升意图一致性

---

## 技术方案

### 关键技术

| 技术 | 说明 |
|------|------|
| **局部体素视图** | $U = \texttt{VoxelView}(s, h)$：将源网格 $s$ 的表面离散到体素尺寸 $h$ 的规则网格；暴露占据单元的整数坐标数组 $(N,3)$、方向暴露掩码、连通分量查询 |
| **网格↔世界刚体变换** | 已知的 grid-to-world 变换把体素索引与局部包围盒映射回连续 3D 场景坐标 |
| **有向证据图** $\mathcal{G}=(\mathcal{V},\mathcal{E})$ | 节点 = 可见语义锚点 或 待构造几何区域；边 = 构造依赖关系；按拓扑序生成程序 |
| **见证 (witness)** | 每个构造出的几何参照在证据记录 $\mathcal{R}$ 中存：选中单元 $W_v$、父视图 $U_v$、源对象 $s_v$、溯源边 |
| **程序化掩码** $m_v$ | 轴对齐切片、围绕视觉锚点的邻近滤波、方向暴露查询、连通分量标注 |
| **自适应体素分辨率** | 粗网格定位大面；细网格解析细隔板 / 窄槽 / 浅边缘 —— **避免整体场景统一细化的代价** |
| **源网格裁剪片 (clipped source-mesh patch)** | 每个 witness 同时暴露其所选体素对应的**连续网格面片**，保留精确的面对应与外法向 |
| **视觉锚点定位** | VLM 返回 2D 像素 → 相机射线投射到场景网格 → 3D 表面锚点 |
| **执行反馈闭环** | 数值探针（体素数、连通分量数、坐标跨度）+ 渲染高亮 + VLM critic |

### 核心公式

体素视图与 witness 构造：

$$U_v = \texttt{VoxelView}(s_v, h_v), \qquad W_v = \{c \in U_v : m_v(c) = 1\}$$

证据程序：

$$(\mathcal{R}, \mathcal{C}) = P_e(\mathcal{S}, \mathcal{A})$$

位姿程序：

$$T = P_p(\mathcal{R}, \mathcal{S}, T_{\mathrm{cur}}) \in SE(3)$$

初始位姿到候选位姿的映射：

$$\widetilde{\mathbf{x}}' = T\, T_0^{-1}\, \widetilde{\mathbf{x}}$$

其中 $\widetilde{\mathbf{x}}$ 为齐次坐标。注意：**所有 witness 固定在初始场景状态的世界坐标**，因此位姿迭代更新 $T_{\mathrm{cur}}$ 时**不需重算证据几何**。

---

## 算法复杂度

| 项 | 分析 |
|------|------|
| **体素化（单对象）** | $O(M)$，$M$ = 网格三角形数（体素化本身线性） |
| **程序执行（证据）** | $O(N_{\text{vox}} \cdot k)$，$N_{\text{vox}}$ = 选中体素数，$k$ = 数组操作/连通分量查询代价 |
| **连通分量标注** | $O(N_{\text{vox}})$（BFS/union-find），或 $O(N_{\text{vox}}\alpha)$（并查集） |
| **位姿求解** | 取决于约束数；本例为**法向量 + 中跨 + 支撑深度**的闭式解，$O(1)$ |
| **迭代轮数** | 由 VLM critic 决定，典型 1-3 轮 |
| **空间复杂度** | $O(N_{\text{vox}})$ per view + $O(M)$ 源网格 |
| **⚠️ 关键权衡** | 分辨率 $h$ 越细 → 体素数 $O(h^{-2})$（表面积）或 $O(h^{-3})$（体）→ **自适应 $h_v$ 是必需而非优化** |

---

## 数值稳定性

- ✅ **体素表示是离散的** → 选择性操作**无几何退化**问题（不像基于法向的连续优化易受法向估计误差影响）
- ✅ **网格↔体素精确对应** → 裁剪片保留原始面片，最终位姿在**原始几何**上求解，不被体素化误差污染
- ⚠️ **体素化本身有分辨率-精度 trade-off**：粗网格会**合并细隔板**（论文明确以"细网格解析细隔板"作为动机）
- ⚠️ **位姿程序仍依赖几何度量** → 若 witness 选错（如隔板选漏），位姿会错。故作者用**双指标**（意图 + 物理有效性）做闭环

---

## 实现难度评估

- **算法复杂度**：**中**
  - 体素化 + 数组操作：**低**（现成工具：`trimesh.voxelized()`、`open3d`）
  - 程序生成 + 执行反馈闭环：**中**（LLM 编排、迭代改写、VLM critic）
  - 证据图构造与拓扑序执行：**中**
- **数值稳定性**：**中偏上**（离散选择稳健；但 witness 选择的语义正确性是主要风险）
- **依赖项**：
  - 体素化：`trimesh` / `open3d` / `pymeshlab`
  - 网格查询：`libigl`（`igl::signed_distance`, `igl::ray_mesh_intersect`）、CGAL
  - 程序执行：Python + numpy（数组切片 / `scipy.ndimage.label`）
  - LLM / VLM：Claude / GPT-4o（用于证据图 + critic）
  - 连通分量：`scipy.ndimage.label` 或 `skimage.measure.label`

---

## 推荐结论

✅ **推荐收录 / 推荐实现（几何查询层）**

**理由**：
1. **几何表达层的思路可直接复用** —— "把不规则曲面转成规则网格 → 用数组操作表达几何查询 → 保留与源网格的精确对应"是一套**通用**的几何查询范式。我们的 3D 编辑器若需要"选中某类表面区域"（如"所有朝上的面"、"支撑脚"、"凹槽内壁"），这套方案比"点云+法向拟合"更鲁棒
2. **自适应分辨率**是关键工程洞察：不用整体细化也能解析局部细节 —— 这直接对应我们担心的**体素化成本爆炸**
3. **裁剪源网格片**保证了最终几何精度不受体素化影响 —— 这是"体素用于选择、网格用于求解"的正确分工
4. **双指标评估**（意图 + 物理有效性）比单一指标更可靠，值得作为我们放置类功能的验收标准参考

**建议落地方式**：
- 不做完整 LLM 编程系统（成本高、稳定性有限），而是：
  1. **提取 `VoxelView` + witness 机制**作为几何编辑器的**区域选择 API**
  2. 用固定规则（而非 LLM）生成掩码 $m_v$
  3. 在需要"语义化几何查询"时，才引入 LLM 生成程序

**⚠️ 需注意**：
- 本文场景是**物体放置**（需要严格物理有效），我们的场景常是**造型编辑**（需要美学合理），评价标准不同
- LLM 生成代码的**调试成本**高，工程上要准备好失败回退

---

## 相关工作

- [[2026-10-20-2610-28280-GALA-Geometry-Aware-Language-Model-Object-Arrangement]] — 同方向（几何感知的语言模型 + 点云感知）
- [[2026-10-24-2610-29647-Reading-the-Room-Semantic-VSLAM-Floorplan-Registration]] — 语义配准
- [[2026-10-13-StructParts-Dual-Frame-Part-Decomposed-Generation]] — 部件分解
- [[2026-10-20-2610-28598-Neural-Implicit-Energy-LiDAR-Mapping]] — 隐式 + 几何优化

## 相关概念

- [[Voxelization]]
- [[Geometric-Query-on-Mesh]]
- [[SE3-Pose-Estimation]]
- [[Programmatic-Reasoning]]
- [[Witness-Geometry]]

---

## 传递给 @墨鱼丸

🥢 **可行性分析：VoxProg 体素编程几何查询**

### 技术概述
局部体素视图 + 程序化掩码构造几何见证（witness），再由见证的**网格裁剪片**求解 6-DoF 位姿。

### 算法复杂度
- 体素化：$O(M)$；程序执行：$O(N_{\text{vox}} \cdot k)$；连通分量：$O(N_{\text{vox}})$
- 位姿求解：本例为闭式 $O(1)$
- 空间：$O(N_{\text{vox}} + M)$
- ⚠️ 分辨率加密代价 $O(h^{-2} \sim h^{-3})$ → **必须自适应 $h_v$**

### 实现难度
- 算法复杂度：**中**
- 数值稳定性：**中偏上**（离散选择稳健；witness 语义正确性是主要风险）
- 依赖项：trimesh/open3d（体素化）、libigl（射线求交、signed distance）、CGAL、scipy.ndimage（连通分量）、Python

### 推荐结论
✅ **推荐收录** —— 重点借鉴**"体素用于选择、源网格用于求解"**的分工，以及**自适应分辨率**策略。可作为 3D 编辑器区域选择 API 的设计参考，不建议照搬 LLM 编程层。

### 开源参考
- libigl: `igl::ray_mesh_intersect`, `igl::signed_distance`
- trimesh: `trimesh.voxelized()`
- scipy: `scipy.ndimage.label`（连通分量标注）
