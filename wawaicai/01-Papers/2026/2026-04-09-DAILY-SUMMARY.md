# 📋 几何处理每日摘要 — 2026-04-09

## 🔍 搜索范围
- arXiv cs.GR 最近 23 篇投稿（2026-04-03 ~ 2026-04-09）
- ACM Digital Library / SIGGRAPH 2026 官网
- 关键词：mesh processing, geometry processing, point cloud, subdivision surface, parametrization, remeshing, simplification

---

## 🆕 新发现论文（几何处理相关）

### 1. [Topology-First B-Rep Meshing](https://arxiv.org/abs/2604.02141)
**arXiv:2604.02141 | cs.GR, cs.CG | 2026-04-02 | ⭐ 重点推荐**

**核心创新**：将 B-Rep 拓扑结构作为 meshing 过程中的不变量，不再依赖 2D trimming curves（在 Fusion360 数据集中 14% 的 trims 存在自相交）。

**算法要点**：
- 在 3D 空间直接用邻接曲线裁剪参数化面片，不使用参数域的 2D trim 曲线
- 用户只需调节一个几何容差参数控制网格与曲面的偏离
- 拓扑正确性与几何精度解耦，容差增大只影响几何精度，不影响拓扑
- 五阶段流程：几何采样 → 曲线吸附 → 环路嵌入 → 跨面缝合 → 保拓扑等距 remeshing

**评估**：在 ABC 和 Fusion360 共 10,000+ CAD 模型上测试，包括现有工具失败案例

**可行性**：✅ **强烈推荐实现**
- libigl 参考：`remesh_along_line_set`, `trim_mesh_by_curves`（需自定义）
- CGAL：`SMesh_3`, `Polygon_mesh_processing`
- 算法核心清晰，适合集成到 CAD 网格管线

---

### 2. [Neural parametric representations for thin-shell shape optimisation](https://arxiv.org/abs/2604.06612)
**arXiv:2604.06612 | math.NA | 2026-04-08**

**核心方法**：NRep — 使用带周期激活函数的 MLP 将壳体中面参数坐标映射到物理坐标，作为形状优化设计变量。

**算法要点**：
- 周期激活函数（正弦/余弦）保证 MLP 输出对参数坐标的平滑可微
- 体积约束下的结构顺应性优化，网络参数作为设计变量
- 避免传统网格顶点优化导致的网格纠缠问题
- 适用于复杂格皮（lattice-skin）结构

**可行性**：⚠️ **学术价值高，工程化需评估**
- 适合等几何分析（IGA）结合
- 非传统几何处理，偏向拓扑优化

---

### 3. [Visibility-Based GPU-Accelerated Approximate Convex Decomposition (VisACD)](https://arxiv.org/abs/2604.04244)
**arXiv:2604.04244 | cs.GR, cs.CG | 2026-04-05 | ⭐ 推荐**

**核心创新**：基于可见性的旋转等变 ACD 算法，GPU 加速，输出交-free 凸分解。

**算法要点**：
- 传统 ACD 依赖大量凸块且对输入方向敏感
- VisACD 利用可见性信息引导分解，减少凸块数量
- 旋转等变性保证输入旋转后结果一致
- 物理仿真碰撞检测场景直接受益

**可行性**：✅ **推荐实现**
- GPU 并行化友好
- libigl：`convex_decomposition`（需扩展）
- 适合碰撞检测预处理管线

---

### 4. [Points-to-3D: Structure-Aware 3D Generation with Point Cloud Priors](https://arxiv.org/abs/2603.18782)
**arXiv:2603.18782 | cs.CV → cs.GR 交叉 | 2026-03 | 几何重建相关**

**核心方法**：基于 TRELLIS latent 3D diffusion model，将点云先验嵌入结构 latent space。

**算法要点**：
- 将可见点云体素化，用 TRELLIS sparse structure VAE 编码
- 结构修复网络（inpainting）在可见区域保持观测，几何完成未观测区域
- 分阶段采样：结构 inpainting → 边界精修
- 支持 VGGT 等 feed-forward 单图点云预测

**可行性**：⚠️ **依赖复杂深度学习框架，算法层面有参考价值**
- 神经隐式几何与点云融合的思想值得借鉴
- 几何完成（geometric completion）算法可独立研究

---

### 5. [Non-Rigid 3D Shape Correspondences: From Foundations to Open Challenges (STAR)](https://arxiv.org/abs/2604.01274)
**arXiv:2604.01274 | cs.GR | 2026-04-02**

**类型**：State-of-the-Art Report（综述）

**覆盖范围**：
- 谱方法（functional maps）
- 组合优化方法（离散约束）
- 变形方法（deformation-based）

**参与机构**：TU Munich, MPI, INSAIT, Waseda, Stanford 等

**可行性**：📚 **推荐阅读**
- 全面了解非刚性形状对应的最新进展
- 适合作为几何匹配算法选型参考

---

## 📊 搜索统计

| 来源 | 本次发现几何相关 | 备注 |
|------|----------------|------|
| arXiv cs.GR (Apr 3-9) | 23 篇投稿，约 5 篇相关 | 涵盖 B-Rep meshing, ACD, shape opt |
| SIGGRAPH 2026 | 会议 2026-07 洛杉矶 | 技术论文列表已上线，详情待抓取 |
| Eurographics 2026 | 会议信息待确认 | EG 2026 在荷兰代尔夫特 |

---

## 🔔 行动项
- [ ] 深度分析 Topology-First B-Rep Meshing 的 libigl 集成方案
- [ ] 跟踪 SIGGRAPH 2026 Technical Papers 完整列表
- [ ] VisACD 开源代码发布后进行复现分析

---

*🥬 黄喉 | 几何专家 Agent | 2026-04-09 14:06 UTC*
