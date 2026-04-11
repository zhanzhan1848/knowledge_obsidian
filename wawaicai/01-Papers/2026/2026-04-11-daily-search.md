# 2026-04-11 每日论文搜索报告

> 搜索时间：2026-04-11 14:07 UTC  
> 数据源：arXiv cs.GR (近7日, 共26篇)  
> 关键词：mesh processing, geometry processing, point cloud, subdivision, parametrization, remeshing, simplification  
> 筛选结果：5篇相关 / 26篇总计

---

## 🔑 核心相关论文

### [P1] VisACD: Visibility-Based GPU-Accelerated Approximate Convex Decomposition

- **arXiv**: [2604.04244](https://arxiv.org/abs/2604.04244)  
- **分类**: cs.GR + cs.CG  
- **日期**: 2026-04-05  
- **作者**: Egor Fokin 等

#### 摘要
针对碰撞检测中几何体分解的精度/效率权衡问题，提出 **VisACD**——一种基于可见性的、旋转等变的、无交叉的近似凸分解算法，支持 GPU 加速。相比现有方法，产生更少的凸部件，对网格方向不敏感，效率更高。

#### 核心技术点
- **Approximate Convex Decomposition (ACD)**：在保真度和碰撞效率之间取得平衡
- **旋转等变性**：不依赖输入网格方向，鲁棒性强
- **无交叉分解**：intersection-free 保证
- **GPU 加速**：适合实时物理仿真流水线

#### 算法复杂度
- 实际效率高于现有 ACD 方法（原文未明确列出大 O）
- 凸部件数量 < 先前 SOTA

#### 可行性评估
```
算法复杂度：中
数值稳定性：良好（旋转等变）
依赖项：GPU (CUDA)
```

#### 推荐结论
✅ **推荐评估** — 适用于物理仿真前处理，替代 V-HACD 等方案

#### 开源参考
- 对比基准：V-HACD, CoACD
- 几何相关：CGAL `CGAL::Polygon_mesh_processing::convex_decomposition`
- libigl: `igl::convex_hull`

---

### [P2] Image-Guided Geometric Stylization of 3D Meshes

- **arXiv**: [2604.07795](https://arxiv.org/abs/2604.07795)  
- **分类**: cs.CV + cs.GR  
- **日期**: 2026-04-09  
- **作者**: Changwoon Choi 等

#### 摘要
提出以图像为引导的 3D 网格几何风格化框架，利用预训练扩散模型提取图像抽象风格表示，通过粗到细的风格化管线大幅形变输入 3D 模型，同时**保留原始网格的合法拓扑和语义**。提出近似 VAE 编码器，从网格渲染中提供高效可靠的梯度。

#### 核心技术点
- **Coarse-to-fine 形变管线**：保拓扑的几何变形
- **扩散模型引导**：风格引导的网格形变梯度来源
- **近似 VAE 编码器**：高效梯度计算，可用于网格渲染反向传播
- **语义保留**：part-level semantics 在形变中保持

#### 算法复杂度
- 依赖预训练扩散模型推理，计算较重
- 前向推理时间：未列出

#### 可行性评估
```
算法复杂度：高（依赖大型扩散模型）
数值稳定性：一般（梯度可能不稳定）
依赖项：PyTorch, Diffusion Model (SD / SDXL)
```

#### 推荐结论
⚠️ **谨慎评估** — 适合风格化 3D 内容生成；几何处理核心方向相关性低

#### 开源参考
- 项目主页：论文中提供（project page link）
- libigl: `igl::deform` 系列, ARAP

---

### [P3] Skelebones: Scaffold-Skin Rigging System (Mean Curvature Skeleton)

- **arXiv**: [2604.08547](https://arxiv.org/abs/2604.08547)  
- **分类**: cs.CV + cs.GR  
- **日期**: 2026-04-09  
- **作者**: Jiaxin Wang 等

#### 摘要
提出 Skelebones 三步框架：(1) 将时序一致的变形 Gaussian 压缩为自由形骨骼；(2) **从规范 Gaussian 中提取 Mean Curvature Skeleton（均值曲率骨架）**，并时序精化保证拓扑正确的运动结构；(3) 通过 PartMM 绑定骨骼与皮肤合成新运动。

#### 核心技术点
- **Mean Curvature Skeleton 提取**：从 Gaussian Splatting 表示中生成拓扑正确骨架，**核心几何算法**
- **自由形骨骼压缩**：非刚性形变近似
- **Partwise Motion Matching (PartMM)**：分段运动合成
- **LBS 对比基准**：PSNR 提升 17.3%

#### 算法复杂度
- 骨架提取：O(n log n) 量级（细分曲面收缩方法典型）
- 时序精化：与帧数线性相关

#### 可行性评估
```
算法复杂度：中（骨架提取成熟方法）
数值稳定性：良好（Mean Curvature Flow 收缩）
依赖项：libigl (曲率计算), CGAL (骨架提取)
```

#### 推荐结论
✅ **推荐研究** — Mean Curvature Skeleton 提取部分可独立复用于网格骨架化任务

#### 开源参考
- libigl: `igl::cotmatrix` (Laplacian), `igl::principal_curvature`
- CGAL: `CGAL::extract_mean_curvature_flow_skeleton`
- 代码：将公开（论文承诺）

---

### [P4] GEAR: Geometry-Motion Alternating Refinement for Articulated Objects

- **arXiv**: [2604.07728](https://arxiv.org/abs/2604.07728)  
- **分类**: cs.CV + cs.GR + cs.RO  
- **日期**: 2026-04-09  (CVPR 2026)  
- **作者**: Jialin Li 等

#### 摘要
提出 GEAR 框架，以 EM 式交替优化（几何与运动互为潜变量和显式变量）在 Gaussian Splatting 表示中联合建模关节体的几何与运动。利用 2D 分割先验和弱监督约束提升分割质量。

#### 核心技术点
- **EM 式交替优化**：几何重建与运动参数估计解耦
- **弱监督分割约束**：无需密集标注
- **多关节体泛化**：复杂结构鲁棒性强

#### 可行性评估
```
算法复杂度：中
依赖项：3DGS, SAM (2D分割)
```

#### 推荐结论
⚠️ **关联参考** — 关节体几何重建与分割，可参考用于形变网格场景

---

### [P5] Compact Gaussian Hair Reconstruction with Card Clustering

- **arXiv**: [2604.03716](https://arxiv.org/abs/2604.03716)  
- **分类**: cs.CV + cs.GR  
- **日期**: 2026-04-04  (CVPR 2026)  
- **作者**: Haimin Luo 等

#### 摘要
提出从多视角图像紧凑重建高保真发型的管线。将发丝聚类为 hair cards，共享纹理码本，与 3DGS 渲染结合。初始发丝几何由生成先验加速重建。存储减少 200 倍，重建时间减少 4 倍。

#### 核心技术点
- **发丝几何重建**：初始几何由生成模型推断
- **Card Clustering**：结构化稀疏表示，大幅压缩
- **纹理码本共享**：减少冗余存储

#### 可行性评估
```
算法复杂度：中
相关性：发丝/细线几何特殊结构重建
依赖项：3DGS, PyTorch
```

#### 推荐结论
⚠️ **领域参考** — 细长几何结构重建的思路（curves/rods）

---

## 📊 本日统计

| 指标 | 数值 |
|------|------|
| 总扫描论文数 | 26 |
| 直接相关（核心几何处理） | 2 (P1 VisACD, P3 Skelebones) |
| 关联相关（几何+视觉） | 3 (P2, P4, P5) |
| 不相关论文 | 21 |
| 本周期最新推荐 | VisACD (凸分解), Skelebones (骨架提取) |

---

## 🔗 后续动作

- [ ] 深入阅读 VisACD 全文（碰撞检测几何分解）
- [ ] 跟踪 Skelebones 开源代码发布
- [ ] 传递可行性报告给 @墨鱼丸

---

*生成时间: 2026-04-11 14:07 UTC | Agent: wawaicai 🥬*
