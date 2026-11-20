---
type: paper
created: 2026-11-20
updated: 2026-11-20
tags: [paper, 几何处理, SLAM, 三角面片泼溅, Delaunay三角剖分, GICP, 配准, 表面几何, 重建]
status: processed
domain: 计算机图形学几何处理
agent: wawaicai
source: https://arxiv.org/abs/2611.23935
---

# Facet-SLAM: Real-Time Triangle Splatting SLAM

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Facet-SLAM: Real-Time Triangle Splatting SLAM |
| **作者** | Edward Beng Wai Tan, Siew-Kei Lam（通讯） |
| **单位** | Nanyang Technological University（新加坡南洋理工），College of Computing and Data Science |
| **发表** | arXiv 2026-11-18（cs.RO; cs.CV） |
| **链接** | [原文](https://arxiv.org/abs/2611.23935) ｜ [HTML 全文](https://arxiv.org/html/2611.23935v1) |
| **DOI** | 10.48550/arXiv.2611.23935 |
| **代码** | [github.com/edward62740/Facet-SLAM](https://github.com/edward62740/Facet-SLAM)（论文承诺发布） |
| **平台** | 桌面 RTX 4090 + i9-13900KF；嵌入式 Jetson AGX Orin（MAXN 模式） |

---

## 核心贡献

> **首个实时（real-time）的三角面片泼溅（triangle splatting）SLAM 系统**——用 GICP 几何配准替代光度跟踪，把「重建质量」和「跟踪速度」这两个在 3DGS-SLAM 中长期冲突的目标解耦。

1. **三角面片作为 SLAM 地图基元**：3DGS 地图表面几何差，需事后网格提取或中间表示；**triangle soup 的基元本身就是表面元素**，其顶点可直接三角剖分为连通网格——**无需中间表示，无需融合阶段**。
2. **追踪与建图的职责分离（separation of duties）**——本文最核心的洞见：
   - **Tracker** 用融合深度设定每个三角形的**质心（centroid）**，并以这些质心为 GICP 配准目标
   - **Mapper** 被**限制为「非平移更新」**（non-translating updates），通过**换元（change of variables）**实现
   - 原因：**mapper 的光度优化会把三角形从观测表面推开**，导致它们不再是可靠的配准目标
3. **协方差从邻居质心散布估计**：三角形的自身几何作为 GICP 目标协方差 $\mathbf{B}_i$ 不可靠（顶点只被渲染损失间接监督），改用 **$K$ 个最近邻质心的散布 + 各向同性噪声底**
4. **约束 mapper 的换元技巧**：$\mathbf{x}=\mu\mathbf{1}+\mathbf{Q}\mathbf{e}$，$\mathbf{e}\in\mathbb{R}^2$，$\mathbf{Q}$ 为垂直于 $\mathbf{1}$ 平面的一组正交基——**保证质心严格不动，同时保留 2 个形状自由度**
5. **实测结果**：桌面 ~100 FPS、Jetson AGX Orin 上**达传感器帧率**；比光度方法**快 20×+**；Replica 上 Delaunay 网格的 **chamfer 距离从 1.55 cm 降到 0.86 cm**

---

## 技术方案

### 核心思想

**问题剖析**：TS-SLAM（Triangle Splatting SLAM，首个 triangle-based 稠密 SLAM）用光度跟踪定位，**准确但只有几 FPS**，无法在设备端实时定位。

**自然的替代方案是快速几何配准（GICP）**，但**单独使用不够**：

> mapper 的优化会把三角形从被观测的表面上推开（"displaces triangles from the observed surface"），使它们变成**不可靠的配准目标**。

**根因分析**（论文原文 §IV-G）：mapper 的复合损失

$$E_{\mathrm{photo}}=E_{\mathrm{rgb}}+\lambda_d E_{\mathrm{dep}}+\lambda_n E_{\mathrm{norm}}+\lambda_e E_{\mathrm{reg}}$$

**只间接监督表面位置**。光度梯度中的噪声与偏置因此把三角形推离观测表面，**即使在平坦区域也是如此**，GICP 配准随之退化。

**论文还验证了「直接用三角形自身法向做 point-to-plane 配准」也不可靠**——因为 mapper 为最小化复合代价而倾向于调整三角形的朝向。

### 关键技术

| 技术 | 说明 |
|------|------|
| **三角形基元** | 顶点 $\mathbf{v}_{j1},\mathbf{v}_{j2},\mathbf{v}_{j3}\in\mathbb{R}^3$，各带颜色 $\mathbf{c}\in\mathbb{R}^3$ 与不透明度 $o\in[0,1]$ |
| **质心 $\bm{\mu}_j$** | **由 tracker 从深度观测设定**（关键帧深度观测的滑动均值），**mapper 不允许平移它** |
| **GICP 目标协方差** | $\mathbf{B}_i=\frac{1}{K}\sum_{l\in\mathcal{K}_i}(\bm{\mu}_l-\bar{\bm{\mu}}_i)(\bm{\mu}_l-\bar{\bm{\mu}}_i)^{\top}+\sigma_f^2\mathbf{I}$——用 **$K$ 个最近邻质心的散布** + 各向同性噪声底 $\sigma_f^2$ |
| **换元约束（非平移更新）** | $\mathbf{x}=\mu\mathbf{1}+\mathbf{Q}\mathbf{e}$，$\mathbf{e}\in\mathbb{R}^2$，$\mathbf{Q}\in\mathbb{R}^{3\times2}$ 为 $\mathbf{1}$ 的正交补空间的一组基。实现中用 $(1,-1,0)^{\top}/\sqrt{2}$ 与 $(1,1,-2)^{\top}/\sqrt{6}$ |
| **梯度投影** | $\nabla_{\mathbf{e}}E_{\mathrm{photo}}=\mathbf{Q}^{\top}\nabla_{\mathbf{x}}E_{\mathrm{photo}}$——**顶点梯度去掉平移分量**。损失本身不变 |
| **三角形光栅化** | $\phi_j(\mathbf{p})$ 为像素到投影边的有符号距离，$\mathbf{s}_j$ 为内心，$w_j(\mathbf{p})=\max\big(0,\phi_j(\mathbf{p})/\phi_j(\mathbf{s}_j)\big)^{\sigma}$——从内心的 1 衰减到边的 0，锐度 $\sigma$ |
| **Alpha 合成** | $\hat{I}(\mathbf{p})=\sum_j\mathbf{c}_j(\mathbf{p})\,o_jw_j(\mathbf{p})\prod_{i<j}(1-o_iw_i(\mathbf{p}))$ |
| **关键帧窗口优化** | 额外做**仅位姿的窗口优化**（最近 $N$ 个关键帧，几何 + 光度残差），并把对应三角形随修正**刚性移动**。长序列上 ATE 略有改善 |
| **两进程架构** | mapper（GPU）优化三角形地图并发布质心；tracker（CPU）用 GICP 配准深度帧 |

### 公式

**GICP 目标函数**

$$\mathbf{T}^{*}=\arg\min_{\mathbf{T}}\sum_{i}\mathbf{d}_i^{\top}\big(\mathbf{B}_i+R\mathbf{A}_iR^{\top}\big)^{-1}\mathbf{d}_i,\qquad \mathbf{d}_i=\mathbf{b}_i-T\mathbf{a}_i$$

**目标协方差（邻居质心散布 + 噪声底）**

$$\mathbf{B}_i=\frac{1}{K}\sum_{l\in\mathcal{K}_i}(\bm{\mu}_l-\bar{\bm{\mu}}_i)(\bm{\mu}_l-\bar{\bm{\mu}}_i)^{\top}+\sigma_f^2\mathbf{I}$$

**换元（固定质心）**

$$\mathbf{x}=\mu\mathbf{1}+\mathbf{Q}\mathbf{e},\qquad \mathbf{e}\in\mathbb{R}^{2},\qquad \mathbf{Q}\in\mathbb{R}^{3\times2}\text{（}Q^{\top}Q=I\text{）}$$

$$\nabla_{\mathbf{e}}E_{\mathrm{photo}}=\mathbf{Q}^{\top}\nabla_{\mathbf{x}}E_{\mathrm{photo}}$$

**复合建图损失**

$$E_{\mathrm{photo}}=E_{\mathrm{rgb}}+\lambda_dE_{\mathrm{dep}}+\lambda_nE_{\mathrm{norm}}+\lambda_eE_{\mathrm{reg}}$$

**三角形光栅化权重**

$$w_j(\mathbf{p})=\max\big(0,\phi_j(\mathbf{p})/\phi_j(\mathbf{s}_j)\big)^{\sigma}$$

### 复杂度

- **GICP 配准**：标准 GICP，$O(N\log N)$（KD-tree 邻域查询）+ 迭代优化
- **邻域协方差计算**：每个三角形需 $K$ 近邻质心，$O(T\log T)$
- **mapper 换元**：每次迭代只需投影 6 维 → 4 维（3 顶点 × 3 坐标 → 3 顶点 × 2 自由度），**常数开销**
- **表面精度**：论文报告 **~100 FPS（桌面）**、**传感器帧率（Jetson AGX Orin）**，比光度跟踪快 **20×+**

---

## 实验结论

- **数据集**：**TUM RGB-D**（fr1/desk, fr2/xyz, fr3/office）、**Replica**、**ScanNet**
- **指标**：ATE RMSE（位姿）、PSNR / SSIM / LPIPS（渲染）、L1 深度误差、chamfer、accuracy / completeness @ {1,2 cm}、F-score（几何）
- **基线**：SplaTAM、GS-SLAM、MonoGS、TS-SLAM、Photo-SLAM、GS-ICP SLAM、ORB-SLAM3。**作者自行复现了 TS-SLAM / Photo-SLAM / GS-ICP SLAM / MonoGS**；**所有测量每序列跑 5 次取平均**（考虑随机性）

### 跟踪精度与速度（TUM RGB-D）

| 方法 | fr1/desk | fr2/xyz | fr3/office | Avg | FPS↑ |
|------|---------|---------|-----------|-----|------|
| SplaTAM | 3.4 | 1.2 | 5.2 | 3.3 | 0.4 |
| GS-SLAM | 3.3 | 1.3 | 6.6 | 3.7 | – |
| MonoGS | 1.44 | 1.77 | 1.61 | – | – |
| **Facet-SLAM** | 与稠密光度方法相当 | | | 略低于 TS-SLAM | **~100（桌面）/ 传感器帧率（Jetson）** |

→ 位姿精度与 3DGS 类稠密方法相当（略低于 TS-SLAM），但**帧率高一个数量级以上**；与实时 3DGS-SLAM（Photo-SLAM、GS-ICP SLAM）相当且更快。

### 几何精度（Replica 平均，cm）

| 方法 | Chamfer↓ | Acc/Comp @2cm ↑ |
|------|----------|----------------|
| TS-SLAM（Delaunay 网格） | **1.55** | – |
| **Facet-SLAM（Delaunay 网格）** | **0.86** | **全部指标最优** |
| Photo-SLAM | 相对较差 | – |

→ **Delaunay 网格 chamfer 距离降低 44.7%（1.55 → 0.86 cm）**。论文指出 Photo-SLAM 虽位姿估计准确，但**几何属性相对较差**（初始化后缺少显式深度监督）。

### 消融实验

**Table X — 配准度量**（ATE RMSE / PSNR / 渲染深度 L1）：比较 GICP over 局部 triangle soup vs point-to-point vs point-to-plane（用三角形自身法向）

> **结论**：点式代价与三角形自身法向**都不可靠**；大量序列的 ATE 呈**双峰分布**。本文的 GICP 方案最优。

**Table XI — mapper 的顶点更新方式**：free（标准 triangle splatting 优化器，顶点自由）vs **non-translating（本文）** vs re-centered（自由优化后再重新居中到 tracker 质心）

> **结论**：
> - **non-translating 最优**
> - re-centered 略差，且**技术上不正确**——因为 **Adam 的动量估计仍在累积被丢弃的平移梯度**
> - non-translating 在所有 Replica 序列上**表面朝向一致性略优（0.5–1°）**

### 真实世界实验

- 桌面尺度示例 + **办公隔间**（手持 D435 RGB-D）
- **全程在 Jetson AGX Orin 上在线建图**
- 从地图中提取**带颜色的 Delaunay 网格**，并展示对应表面法线——证明能生成照片级真实感网格

### 显存占用

- 运行期 GPU 显存与 TS-SLAM **相当**（桌面 24–31 k / 39–52 区间）
- **对比现有 3DGS SLAM 方法普遍显存占用大得多**（无论光度还是 ICP 跟踪）
- Photo-SLAM 是唯一原生能在 Jetson 上跑到可接受 FPS 的方法，但**几何不准确**

---

## 局限性

1. **建图质量低于 3DGS 类方法**——部分源于设计决策（用 0 阶 SH、较保守的 densification 行为），部分源于 triangle splatting 表示本身较新（3DGS 已被优化多年）
2. **渲染质量落后**：明确承认「地图质量落后于 3DGS 方法」，并指出部分对比不公平（部分基线用更高阶 SH，本文用 0 阶是可调的设计决策）
3. **需要 RGB-D**（深度传感器）；单目不适用
4. **三角面片泼溅表示本身**仍在早期，缺乏成熟生态
5. 未来工作：寻找能**保持基元空间鲁棒性**同时提升建图质量的优化技术

---

## 相关工作

- **Triangle Splatting**（Kulhanek & Sattler）——三角形基元泼溅
- **TS-SLAM**（Triangle Splatting SLAM）——首个 triangle-based 稠密 SLAM，但只有几 FPS
- **3DGS SLAM**（SplaTAM / MonoGS / GS-SLAM）——光度跟踪
- **GS-ICP SLAM** — 复用高斯属性做点云配准
- **GICP**（Segal et al.）——概率配准框架
- **ORB-SLAM3 / Photo-SLAM** — 稀疏特征 + 稠密地图
- **MILo / 2DGS** — 表面几何改进路线

---

## 实现建议

- **实现难度**：**中高**。几何部分（GICP、受限 Delaunay 三角剖分、triangle splatting 光栅化）都有现成参考：
  - GICP → `small_gicp`（C++）/ Open3D `registration_generalized_icp`
  - 受限 Delaunay → CGAL `CGAL::Delaunay_triangulation_3` / `CGAL::Polygon_mesh_processing::delaunay_triangulation`
  - 可微三角光栅化 → nvdiffrast / PyTorch3D
  - **难点**：① **换元约束的梯度正确性**——mapper 优化器必须在质心约束下工作，且要处理重网格化后拓扑变化；② 质心与深度的关联（滑动均值、关键帧管理）；③ 三角形的 densification / pruning 策略
- **数值稳定性**：**好**。GICP 用协方差正则（$\sigma_f^2$ 噪声底）保证可解；换元约束**严格**保持质心不动（不是软惩罚），数值上比「惩罚平移」稳健得多。**注意 Adam 动量累积问题**——论文的 re-centered 消融说明：**即使事后把顶点重新居中，动量里的平移分量仍在**，必须从参数化层面消除平移自由度
- **适用场景**：
  - ✅ **需要可编辑 / 可仿真的几何地图的机器人与具身 AI**（embodied AI）——核心卖点
  - ✅ **设备端（ Jetson 级）实时稠密 SLAM**
  - ✅ 需要 Delaunay / 三角网格直接可用（不想做 TSDF 融合）的管线
  - ⚠️ 纯渲染质量优先 → 3DGS-SLAM 更优
  - ❌ 单目 / 无深度
  - ❌ 大规模户外（论文只测室内 RGB-D）
- **落地建议**：
  1. **「职责分离」是本文最可迁移的设计模式**：凡是把「几何观测来源」和「外观拟合优化」耦合在同一个优化器里的系统，都可以考虑拆开——让几何量由观测直接设定，优化器只管外观与形状自由度
  2. **用邻域散布而非自身几何估计协方差**——通用做法，任何「基元几何不可靠作为配准目标」的场景都适用
  3. 计划接入 SLAM 时，**务必实现严格的参数化约束而非惩罚项**（论文的消融已证明 re-centered 方案技术上不正确）

---

## 相关笔记

- [[2026-11-20-MODL-Watertight-Mesh-Optimization-Textured-Objects]]
- [[2026-11-20-TRoPE-Topology-Aware-Relative-Positional-Encoding-4D]]
- [[2026-11-13-Delaunay-Based-Nearest-Neighbor-Search-Grid-Accelerated]]

---

## 开源参考

- **CGAL**：`CGAL::Delaunay_triangulation_3`、`CGAL::Polygon_mesh_processing::delaunay_triangulation`
- **small_gicp** — C++ 实现的 GICP（比 Open3D 快得多）
- **Open3D**：`registration_generalized_icp`、`t.geometry`
- **nvdiffrast / PyTorch3D** — 三角面片光栅化
- **g2o / GTSAM** — 关键帧窗口优化

已传递给 @墨鱼丸。
