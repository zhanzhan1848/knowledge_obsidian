---
type: summary
created: 2026-11-23
updated: 2026-11-23
tags: [daily-summary, 几何处理, 每日论文, 2026-11-23, 重网格化, 网格简化, 多重网格, B-Rep, CAD, 参数化头部模型, 点云去噪, 互锁平铺]
status: processed
domain: 计算机图形学几何处理
agent: wawaicai
source: https://arxiv.org/list/cs.GR/recent
---

# 🥬 每日几何处理论文摘要 — 2026-11-23

> **搜索窗口**：2026-11-22 14:02 UTC → 2026-11-23 14:02 UTC（最近 24 小时）
> **搜索源**：arXiv cs.GR（new + pastweek 列表页）+ arXiv cs.CV（new 列表页 + 几何关键词扫描）+ ACM Digital Library + SIGGRAPH Asia 2026 官网 + SIGGRAPH 2026 镜像 + Brave Web Search
> **命中**：**39 篇 cs.GR 候选 + 271 篇 cs.CV 候选 → 10 篇几何相关**（全部完成精读与结构化笔记）

---

## 📌 本批次说明

**arXiv API 今日不可用**（连续返回 `Rate exceeded.` 与 `503`），**成功切换到列表页抓取**：

1. `arxiv.org/list/cs.GR/new` → 2026-11-23 批次 **10 篇**（2 新投 + 3 交叉 + 5 替换）
2. `arxiv.org/list/cs.GR/pastweek?show=250` → 近一周 **39 篇**（Mon 5 / Fri 6 / Thu 3 / Wed 10 / Tue 15）
3. `arxiv.org/list/cs.CV/new` → **271 篇**，用几何关键词（mesh / point cloud / reconstruct / surface / parametri / remesh / simplif / geometr / topolog / sdf / subdivisi / quad / voxel / isosurface / implicit）过滤
4. RSS `rss.arxiv.org/rss/cs.GR` → 10 篇（与列表页一致，用于交叉校验）

**会议源状态**：
- **ACM Digital Library**：**仍被拦截**（返回 5.7 KB 的空壳页面，无检索结果）。**连续第 9 天失败**。
- **SIGGRAPH Asia 2026**（12-01~04 吉隆坡）：官网程序页仍为「Stay tuned as more details of the program will be revealed soon!」，**论文列表未发布**。但本次通过 arXiv 的 comments 字段捕获到 **2 篇已标注 SA 2026 接收**的论文（FACET - TC、FaceRiff - Conference Papers），另 Direct3D-V3（ACM TOG, SA 2026）经 Web Search 捕获。
- **SIGGRAPH 2026**（07 月举办）：论文已发表，不在 24h 窗口内。
- **Eurographics**：Web Search 因 Brave API 长时间延迟（272 s）仅返回通用结果，**未做专项检索**。

---

## 📚 今日新增（10 篇几何相关）

### 1. RemeshingAgent: An Iterative Agent for Repair-Based Decimation of Generated Building Meshes ⭐⭐ 重点
| 项 | 内容 |
|---|---|
| **arXiv** | [2611.20533](https://arxiv.org/abs/2611.20533)（2026-11-19, cs.GR） |
| **作者** | Haipeng Wang |
| **核心** | **把「网格简化到极低预算」重定义为「清洗 → 简化 → 验证」的迭代验证流程**。① **三角形预算分解理论**（$B = B_{\text{curv}} + B_{\text{crease}} + B_{\text{comp}} + B_{\text{genus}}$；**低于连通分量下界时理论上不存在合法输出** → 先清洗是强制要求而非工程 hack）② **实例特异性病理诊断**（哪些分量显著、悬崖阈值逐网格变化 → 无单一固定算法可通用）③ **RemeshingAgent** 把循环变成带验证契约的过程 ④ **检索重放部署**：CPU 11.7 s/mesh，**推理零 LLM 调用** |
| **结果** | 0.5% 预算下 QEM 与顶点聚类均「融化」（删部件 / 焊薄壁），本方法保持拓扑干净；20 个未见城市建筑上与商业重网格化器持平；24 个训练建筑上 **9 人盲评 168:48**（$p=0.0195$） |
| **意义** | **「先清洗」有理论依据**——这是与传统「先简化后修复」流程相反但更正确的顺序。**预算分解（曲率/折痕/分量/亏格）与智能体无关，可独立提取** |
| **结论** | ✅ **推荐实现** — 算子全部现成（libigl `igl::simplify` / CGAL `isotropic_remeshing` / `repair_hole`）；难点在「修复契约」形式化与预算自动量化 |
| **笔记** | [[2026-11-23-RemeshingAgent-Iterative-Repair-Based-Decimation]] |

---

### 2. ParaBMG: A Parallel Block Multigrid Framework for Large-Scale Evolving Sparse Systems on Unstructured Meshes ⭐⭐ 重点
| 项 | 内容 |
|---|---|
| **arXiv** | [2611.27396](https://arxiv.org/abs/2611.27396)（**2026-11-23 当日新投**, cs.GR） |
| **作者** | Kangbo Lyu, Mingqi Geng, Jinchen Jiang, Yu Wang, Minchen Li, Tao Du（清华图形学组） |
| **核心** | **几何处理中「大规模演化稀疏线性系统」的并行块多重网格预条件框架 + 首个统一基准**。① **全并行几何层次构建** ② **块 Jacobi 平滑**（$\mathbf{D}=\mathrm{blkdiag}(B_1..B_{n_b})$，块内并行解）③ **层次复用**（演化问题中相邻迭代层次高度相似）④ **MAS 启发的互补粗校正** → 迭代数降一个数量级 |
| **结果** | 4 个几何处理管线、**40,000+ 线性系统、未知量最高 6.6M**；vs 通用 AMG **3.7×–7.7×**，vs 自研 CPU 多重网格 **6×–105×**，vs MAS **6×–96×**；3 个交互式应用获**数量级加速** |
| **意义** | **层次复用是最容易拿到的收益**——不需要重写求解器，只需缓存层次 + 增量更新。这是几何处理管线中被忽视的大头 |
| **结论** | ⚠️ **谨慎评估** — 需 CUDA 全栈自研；但**建议先用 PETSc AMG / pyamg 确认线性求解是否真是瓶颈**（很多管线瓶颈其实是层次构建或访存） |
| **笔记** | [[2026-11-23-ParaBMG-Parallel-Block-Multigrid-Unstructured-Meshes]] |

---

### 3. BRepA: Graph-Based B-Rep Pretraining for Unified CAD Understanding and Generation ⭐⭐ 重点
| 项 | 内容 |
|---|---|
| **arXiv** | [2611.22903](https://arxiv.org/abs/2611.22903)（2026-11-19, cs.CV; cs.GR） |
| **作者** | Dekai Zhu, Zhaiyu Chen, Stefan Gavranovic, Slobodan Ilic（ETH Zürich + Imperial College） |
| **核心** | **统一的 B-Rep 自监督预训练，显式同时重建「几何」与「拓扑」**。① B-Rep 表示为图（面/边/顶点为节点，解析几何为特征，邻接为边）② **联合损失** $\mathcal{L}=\lambda_g\mathcal{L}_{\text{geom}}+\lambda_t\mathcal{L}_{\text{topo}}$，拓扑项本质是**邻接矩阵重构** ③ 一次大规模无标注 CAD 预训练 → 迁移到分割 + 生成 |
| **结果** | 分割：**仅 1% 标注，mIoU 提升 32.52%**；生成：扩散模型表征与 BRepA 特征对齐后**训练近 2× 加速**、同等算力质量更优——**尽管扩散模型规模约为 BRepA 的 20 倍** |
| **意义** | **「拓扑重建头」可独立提取**——即使不做生成式任务，拓扑自监督也能提升 CAD 分割。是 [[2026-03-17-Masked-BRep-Autoencoder-Hierarchical-Graph-Transformer]] 的强对标 |
| **结论** | ✅ **推荐实现**（标注稀缺的 CAD 分割场景）— 但**数据准备是最大工程量**：需 OpenCascade 从 STEP 导出 B-Rep 图 |
| **笔记** | [[2026-11-23-BRepA-Graph-Based-BRep-Pretraining-CAD]] |

---

### 4. FACET: A Data-Efficient Regional Parametric Head Model ⭐⭐ 重点
| 项 | 内容 |
|---|---|
| **arXiv** | [2611.26773](https://arxiv.org/abs/2611.26773)（**2026-11-23 当日**, cs.CV; cs.GR） — **SIGGRAPH Asia 2026 Technical Communications** |
| **作者** | Mathieu Lamarre, Elly Akhoundi, Thibault Goyallon, Patrick Anderson, Étienne Danvoye（Ubisoft 巴黎） |
| **核心** | **在固定小身份池下用「架构」替代「数据」**。① **16 解剖区域的身份分解**——**绕开全局 PCA 的 $N-1$ 秩上限**（区域化后总容量 $\sum_r(N_r-1)\gg N-1$）② **FACS AU 表情模型 + 逐身份神经个性化** ③ **独立颈/肩区域**抑制姿态泄漏到上半脸 |
| **结果** | held-out neutral-fit 误差：**全局 PCA 下界 1.95 mm → FACET 0.23 mm（8.5×）**，且在**相同训练身份**上达成；表情模型**在每个分量数上都优于**正确正则化的全局表情 PCA → **直接反驳「FACS 太 overcomplete 无法拟合」的论断**；每个贡献都有匹配拓扑/训练集/归一化的全局 PCA 消融 |
| **意义** | **「分块 PCA 突破秩上限」是与表示无关的通用技巧**——任何 PCA 型参数化模型都可套用 |
| **结论** | ✅ **推荐实现**（生产级数字人头部模型）— 难点在区域边界的**连续性**（拼接处）与 16 区域划分方式 |
| **笔记** | [[2026-11-23-FACET-Regional-Parametric-Head-Model]] |

---

### 5. FrameSeg3D: Learned Local Frames for Segmenting Small Parts on High-Resolution 3D Scans ⭐ 重点
| 项 | 内容 |
|---|---|
| **arXiv** | [2611.22124](https://arxiv.org/abs/2611.22124)（2026-11-19, cs.CV; cs.GR） |
| **作者** | Xinwen Zhang, Tongyan Wang, Huawei Lin（University of Toronto） |
| **核心** | **重新表述问题：小部件分割的瓶颈不是「有多少点落在部件上」，而是「部件如何被看到」（方向 + 尺度）**。① 阶段一从**低分辨率**整体视图预测每部件的**局部坐标系**（中心 + 朝向）② 阶段二绕法线环绕取多视图，在**扫描仪原生分辨率**下分割 ③ **规范化**（居中 + 正对 + 固定尺度）→ **单一网络跨部件类型** |
| **意义** | **「规范化消除类型差异」是本文最可迁移的通用思想**——任何「小目标分割」都可套用：预测局部系 → 规范化 → 统一分割器。现有方法失败的两类原因（整体处理丢分辨率 / 先定位再分割依赖部件专用知识）诊断精准 |
| **结论** | ✅ **推荐实现** — 局部系可用 **PCA + 主轴消歧**做弱监督初始化，避开朝向监督的获取难题 |
| **笔记** | [[2026-11-23-FrameSeg3D-Learned-Local-Frames-Small-Part-Segmentation]] |

---

### 6. GAAFormer: Geometry-Anchored Attention Transformer for Joint Point Cloud Denoising and Upsampling ⭐ 重点
| 项 | 内容 |
|---|---|
| **arXiv** | [2611.27281](https://arxiv.org/abs/2611.27281)（**2026-11-23 当日**, cs.CV） |
| **作者** | Haoxi Tian（Southwest Petroleum University） |
| **核心** | **统一的生成式八叉树 Transformer 同时做去噪 + 上采样**。① **几何锚定注意力**——邻域由**固定体素窗口**确定而非序列化位置索引 → 输出树变化时分组稳定 ② **交替位移**消除窗口轴对齐偏差 ③ **删除一致性**理论性质 ④ 编码器/位置编码/预测头/**参数量全部与序列化骨干相同** |
| **结果** | 去噪 PUNet：CD $=6.0643\times10^{-5}$，**CD −3.35%**、**Hausdorff −19.34%**；上采样：PU-GAN $0.8475\times10^{-5}$ / PU1K $1.7057\times10^{-5}$ / Sketchfab $1.0147\times10^{-5}$，CD / Hausdorff / point-to-surface **三项全面改善** |
| **意义** | **Hausdorff 改善 19.34% 而 CD 只改善 3.35% → 收益主要在离群点/最坏情况**，这对下游重建（Poisson 会放大离群点）价值最大 |
| **结论** | ✅ **推荐实现** — **「几何锚定 vs 序列化」可作为低成本独立实验**（替换注意力模块即可） |
| **笔记** | [[2026-11-23-GAAFormer-Point-Cloud-Denoising-Upsampling]] |

---

### 7. EAST: Event-Anchored Surface Transport for Event-Based Gaussian Reconstruction ⭐ 重点
| 项 | 内容 |
|---|---|
| **arXiv** | [2611.27224](https://arxiv.org/abs/2611.27224)（**2026-11-23 当日**, cs.CV） |
| **核心** | **针对事件重建的核心病态「外观变化可以补偿深度误差」**。① **三角化候选锚定 SDF 零集**（硬约束起点）② **事件时序测量的法向流约束射线-表面交点深度**——深度的一阶导约束，比光度约束更具辨识力 ③ **有界高斯修正**：$\Delta \mathbf{c}_v = \mathrm{clamp}\big(\beta(\psi(f_t) - \psi(f_0))\big)$，**初始化时为零**但**把图像梯度传导给实时场** ④ 高效网格提取 |
| **结果** | PAEv3D + NeRF Synthetic 上**表面精度**与**参考视角渲染**双提升，且**可从学到的场中高效提取网格**（这是相对纯 3DGS 的关键增量） |
| **意义** | **「冻结初始参考场 + 描述子差 + clamp」这个耦合方式可迁移**——即便不用事件相机，把 3DGS 对齐到 SDF 时也可用它稳定几何 |
| **结论** | ⚠️ **谨慎评估** — 需事件相机硬件；SDF+Gaussian 双表示的联合渲染是工程难点。**若只求表面，2DGS / PGSR 可能更省事** |
| **笔记** | [[2026-11-23-EAST-Event-Anchored-Surface-Transport]] |

---

### 8. TacHOI: Contact-Aware Object Reconstruction and Tracking for Egocentric Videos ⭐ 重点
| 项 | 内容 |
|---|---|
| **arXiv** | [2611.26764](https://arxiv.org/abs/2611.26764)（**2026-11-23 当日**, cs.RO; cs.CV） |
| **作者** | Jackson Codd, Haoyu Li, Xianyi Cheng（UNC Chapel Hill） |
| **核心** | **用触觉打破单目的尺度-深度歧义**。① **手是已知尺寸的** → **空间分离的触点构成物理直尺** $d_{ij}=\|\mathbf{p}_i-\mathbf{p}_j\|\in\mathbb{R}_{\text{metric}}$ ② **各向异性物体尺度** $\mathbf{S}=\mathbf{R}\mathrm{diag}(s_1,s_2,s_3)\mathbf{R}^\top$ ③ **免训练**联合优化（手姿 + 物体轨迹 + 尺度），无模板、无深度传感器 ④ 触觉约束 + 视觉对齐 |
| **结果** | 100 条 ARCTIC/HO3D 序列：ARCTIC 中位 ADD-S* **15.6 cm → 3.6 cm（4.3×）**，HO3D **2.8 cm**，均为评估方法最低；OpenTouch 上验证真实触觉观测 |
| **意义** | **「已知尺寸的参照物破尺度歧义」是本文最可迁移的思想**——不限触觉 |
| **结论** | ⚠️ **谨慎评估** — 需触觉硬件 + 度量手标定。**建议先做刚性（各向同性尺度）版本**验证管线再放开 |
| **笔记** | [[2026-11-23-TacHOI-Contact-Aware-Object-Reconstruction]] |

---

### 9. Interlocking Tiling of 3D Finite Domains
| 项 | 内容 |
|---|---|
| **arXiv** | [2611.20401](https://arxiv.org/abs/2611.20401)（2026-11-19, cs.GR） |
| **作者** | Xuyang Ma, Rulin Chen, Chaewoon Kim, Ying He, Peng Song（UCLA） |
| **核心** | **新问题定义「互锁平铺」**：用少量全等原型砖（$K$ 小 → 模具成本低）精确铺满三维域，**同时**保证互锁稳定——既有方法必然二选一。解法：**两级层次分解**（域级划分互锁部件 → 部件级划分互锁砖）+ **带规则结构的新图表示**（同时编码「同形」与「互锁」两个约束） |
| **意义** | **层次化分解（先分大件、再分小件）可大幅简化组合几何问题**——即使不做互锁平铺也值得借鉴 |
| **结论** | ⚠️ **谨慎评估** — 域级划分本质 NP-hard；**体素表示无法表达斜面砖**（互锁结构常需非轴对齐特征）；建议用 **OR-Tools CP-SAT / Z3** 实现并**先加入制造公差模型** |
| **笔记** | [[2026-11-23-Interlocking-Tiling-3D-Finite-Domains]] |

---

### 10. FaceRiff: Data-Efficient Unified Text-to-3D Face Asset Synthesis via Geometric Conditioning
| 项 | 内容 |
|---|---|
| **arXiv** | [2611.21867](https://arxiv.org/abs/2611.21867)（2026-11-19, cs.CV; cs.AI; cs.GR） — **SIGGRAPH Asia 2026 Conference Papers** |
| **作者** | Elly Akhoundi, Mathieu Lamarre, Thibault Goyallon, Patrick Anderson, Étienne Danvoye（Ubisoft，与 FACET 同组） |
| **核心** | **在共享 UV 空间用「UV 法线图作几何条件」引导扩散，一次生成网格 + albedo + 位移**。① **逐实例法线**引导 albedo/位移 ② **数据集均值法线**作**规范空间锚点**解决网格 UV 定位 ③ **SDXL + 任务 LoRA**，每任务**更新主干 < 3% 参数** ④ **2,049 扫描 / ~350 身份、单卡训练** ⑤ 免逐实例优化 |
| **结果** | vs FaceG2E / DreamFace：**每提示多样性更高**且保持提示一致性 + 固定拓扑 UV 一致；额外产出**光照无关 albedo**（可 PBR 重光照）与**毛孔级位移**（此前文本驱动基线做不到）；**45 位业界专业人士盲评**认为真实感显著高于 DreamFace |
| **意义** | **「法线图作为几何条件」可迁移到任何「2D 扩散先验 ↔ 3D 几何」搭桥场景**（身体、车辆、家具） |
| **结论** | ⚠️ **谨慎评估** — 数据准备（UV 对齐 + 光照解耦）是最重的一步。**光照解耦建议先做弱版本**（SH 前几阶拟合光照，残差作 albedo） |
| **笔记** | [[2026-11-23-FaceRiff-Text-to-3D-Face-Asset-Geometric-Conditioning]] |

---

### 📄 附加：FFGaussType（字形/SVG → 高斯的前馈转换）
| 项 | 内容 |
|---|---|
| **arXiv** | [2611.26431](https://arxiv.org/abs/2611.26431)（2026-11-20, cs.CV; cs.GR）— Tencent AI Lab + KAIST |
| **核心** | **字形/SVG 几何 → 高斯资产的单次前馈转换（9.1 ms/资产）**，取代每资产数千步迭代优化；点编码器 → **单一特征平面** → **共享解码器**产出携带法向的高斯；**几何转换与材质/光照解耦**；特征平面可编码传输；数据集 **27,221** 资产，**按字体族留出** |
| **结果** | 未见字体族 + 测试图标：**法向误差 $1.62°$、轮廓 IoU 0.985**（对比前馈转换器最好）；匹配逐资产拟合需数千步才达到的保真度 |
| **结论** | ⚠️ **谨慎评估** — **建议先做「网格 + MSDF」基线**；FFGaussType 的真正优势是**融入 3DGS 场景的光影与软阴影** |
| **笔记** | [[2026-11-23-FFGaussType-FeedForward-Glyph-SVG-Gaussian]] |

---

## 🚫 未建笔记（判定为非几何处理主题，节选）

| arXiv | 标题 | 判定理由 |
|--------|------|---------|
| 2611.27525 | PennyGS: Full Resolution 3DGS Training in Minutes on Consumer GPUs | 3DGS 训练加速，主体是渲染工程 |
| 2611.27719 | VeilGS: Solving Darkness as a Veil of 2D Basis Maps over Retinex 3DGS | 渲染外观（生菜域） |
| 2611.25934 | AGSR: Aperture-Guided Super-Resolution for Gaussian Splatting | 渲染超分 |
| 2611.25838 | ContextRenderer: Dynamic-Context Video Generation | 视频生成 |
| 2611.23755 | GramStatTexNet: Texture Analysis-by-Synthesis | 纹理分析（材质域） |
| 2611.23450 / 2611.22805 / 2611.23054 / 2611.22512 / 2611.22240 | NIRJALA / DOOM-GS / ReTouchGS / ATS / Cross3DGS | 纯 3DGS 渲染优化 |
| 2611.22207 / 2611.22005 / 2611.21890 / 2611.21334 / 2611.20948 / 2611.20546 / 2611.20283 / 2611.19429 | ARG-Avatar / Lamp Placement / Facial Asset SR / Polarimetric / BTF / GS Trajectory / CiGS / 3D Segmenter | 渲染 / 材质 / 数据集 |
| 2611.26600 | A Tutorial on Complementarity-Based Contact Models for Robotics | 机器人接触模型 tutorial（吊龙域） |
| 2611.25338 | VideoRNG: Relightable Neural Gaussians from Generative Video Models | 外观生成 |
| 2611.20190 | A Line is Not Just a Line: Visualizing Harmonious Complex Line Sets | 可视化（HCI 域） |
| 2611.20245 | From XR Sketches to CAD: Preserving Design Intent with AI | 6 页 vision workshop |
| 2611.27407 | BladeR: Wind Turbine Blade Reconstruction from UAV | 工业重建应用（几何含量偏低） |
| 2611.27060 | Bridge Point Cloud Semantic Segmentation (cross-sensor DA) | 点云**语义**分割，主体是域适应 |
| 2611.27352 | PAVE: Road Network Modeling with VLMs | 交通网络（无几何处理核心） |
| 2611.20502 | Pointillist Maize: 3D Reconstruction of Field-Grown Maize | 应用型 SfM/MVS 评测，无方法创新 |

---

## 🧭 今日技术备忘（可迁移模式）

| 模式 | 出处 | 可迁移场景 |
|------|------|-----------|
| **三角形预算分解：$B = B_{\text{curv}}+B_{\text{crease}}+B_{\text{comp}}+B_{\text{genus}}$** | RemeshingAgent | 任何面数受限的简化任务；**$B_{\text{comp}}$ 是硬下界** |
| **「先清洗」是理论强制而非工程 hack** | RemeshingAgent | 简化管线顺序应反转（传统是后修复） |
| **检索重放替代 LLM 推理：确定性、可复现、零推理成本** | RemeshingAgent | 任何把 LLM 固化下来的场景（11.7 s/mesh CPU） |
| **层次复用 + 增量更新** | ParaBMG | 演化稀疏系统；**不需重写求解器即可拿到收益** |
| **块 Jacobi：块内并行 + 迭代数降一个数量级** | ParaBMG | GPU 几何求解器 |
| **拓扑重建 = 邻接矩阵重构（link prediction）** | BRepA | 即使不做生成，拓扑自监督也提升 CAD 分割 |
| **区域分解突破全局 PCA 的 $N-1$ 秩上限** | FACET | **任何 PCA 型参数化模型**（与表示无关） |
| **均值法线作规范空间锚点** | FaceRiff | UV 空间生成的定位问题（也可用于身体/车辆） |
| **法线图作几何条件连接 2D 扩散先验与 3D 几何** | FaceRiff | 身体 / 车辆 / 家具资产生成 |
| **LoRA 每任务 < 3% 参数 + 强预训练主干** | FaceRiff | 小数据（2000 样本）训专用生成器的实用配方 |
| **「部件如何被看到」比「有多少点落在上面」更关键** | FrameSeg3D | 任何小目标 / 细部几何任务 |
| **规范化（居中+正对+固定尺度）消除类型差异 → 单一网络通用** | FrameSeg3D | 小目标分割的统一方案 |
| **几何锚定注意力：邻域由体素窗口而非序列索引确定** | GAAFormer | 稀疏/变长结构上的注意力设计 |
| **Hausdorff 改善 ≫ CD 改善 = 收益在离群点** | GAAFormer | 评估指标选择——下游重建会放大离群点 |
| **用「已知尺寸的参照物」破尺度歧义** | TacHOI | 单目度量恢复；不限触觉 |
| **从实时场与冻结初始场的描述子差得到有界修正** | EAST | 把 3DGS 对齐到 SDF 的稳定耦合方式 |
| **法向流（深度的一阶导）比光度约束更具辨识力** | EAST | 任何深度/位姿联合估计 |
| **两级层次分解（先大件后小件）简化组合几何问题** | Interlocking Tiling | 任何组合分解问题 |
| **规则图表示同时编码「同形」与「互锁」** | Interlocking Tiling | 结构化装配 / 铺砌类问题 |
| **特征平面：把 3D 资产转换降为 2D → 可编码压缩** | FFGaussType | 3DGS 场景中的文本 / 图标资产 |
| **前馈转换替代逐资产迭代优化** | FFGaussType | 已知几何的资产转换（9.1 ms vs 数千步） |
| **共享解码器 → 新资产零训练成本** | FFGaussType / BRepA | 任何「大量同类资产」的生成管线 |

---

## 📊 统计

- 候选 **39 篇 cs.GR** + **271 篇 cs.CV** → 几何相关 **11 篇** → **建笔记 10 篇 + 附加 1 篇（FFGaussType）** + 摘要 1 篇
- **arXiv API 今日全时段不可用**（Rate exceeded / 503）→ **成功切换到列表页 + RSS 双通道**，结果与 RSS 一致，**检索完整性未受损**
- 24h 窗口内 cs.GR **当日新投仅 2 篇**（PennyGS / ParaBMG），跨类别投稿（cs.CV / cs.LG / cs.RO / cs.AI）占多数 → **必须扩展到 cs.CV 扫描**才能维持覆盖率（本期 cs.CV 贡献 5 篇几何笔记）
- 知识库累计：wawaicai/01-Papers 现有笔记 **>1,322 篇**

---

## ⚠️ 待改进

1. **ACM DL 连续 9 天抓取失败**（Cloudflare / 空壳页面）——**建议正式改用 Semantic Scholar API / OpenAlex / Crossref** 作为 ACM 替代通道，或直接放弃 ACM 源、依赖 arXiv + SIGGRAPH 镜像
2. **arXiv API 频繁限流**——建议**固化「列表页 + RSS 双通道」为默认检索方式**（今日验证有效且交叉一致），API 仅作补充
3. **SIGGRAPH Asia 2026（12-01 开幕）论文列表仍未发布**——建议 **11-25 ~ 11-28** 期间复查，可一次性收录技术论文集
4. **Eurographics 2026 论文集路径仍未确认**——今日 Web Search 因 Brave 长延迟未完成，需确认 diglib 收录路径
5. **Brave Web Search 单次查询耗时达 272 s**（返回通用结果）——需在超时预算内做多查询并行或降级

---

*下次运行：2026-11-24 22:00 UTC*
