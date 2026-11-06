# 论文索引 (Papers MOC)

## 2026-11

### 2026-11-06
> 📌 严格 24h 窗口内 cs.GR 新批次 **13 条**（11-05 提交 9 条 + 11-04 提交 4 条），渲染相关 **5 篇**全部收录。**ACM DL 仍被 Cloudflare 拦截**（403）；SIGGRAPH Asia 2026（12/1-4 吉隆坡）论文尚未上载完毕，本轮以 arXiv 上的 TOG 版本覆盖。本轮 **5 篇新笔记**。

**实时渲染 / 纹理 / PBR**
- [[2026-11-06_Neural-Texture-Upscaling-Generalized-MLP]] - **广义神经纹理上采样**：单个泛化 MLP 集成进**纹理采样阶段**，渲染时按需上采样 → **无需改纹理数据、无需改资产管线、无需逐资产训练**，且共享权重 → **GPU 执行不发散**（破解 NTC 的最大拦路虎）；$3\times3$ 输入→$2\times2$ 输出，$d{=}256$/$L{=}4$；**解析双线性 + 学习残差**；**LPIPS 而非 PSNR** 评价（PSNR 会偏好模糊图）；隐藏维 $d\ge64$ 后收益饱和；**漫反射顶点可跳过 MLP**（NTC 做不到）；渲染端 FLIP 0.0519 vs bicubic 0.0573 / bilinear 0.0626。**AMD（TOG）** ⭐⭐⭐⭐
- [[2026-11-06_T2-Splat-Adaptive-Topology-Mesh-Splatting]] - **拓扑自适应与外观精修解耦**：Stage I Safe RDT + **DTE**（QEM 边折叠 + 梯度驱动顶点分裂 + 优化器状态拼接）；Stage II **零初始化逐面残差 Mip-texture** + 尺度自适应过滤；$\sigma$ 退火 $1.0\to0.0001$ + $\alpha_{\text{floor}}\to1$ → **末端退化为实心三角形、over-drawing 归零、原生兼容游戏引擎**；Mip-NeRF360 **+0.71 dB** vs MeshSplatting；**OpenGL 236 FPS（1.87×）**、**网格 −59%**；面数可压到 **10%**（$4^2$ 纹理是性价比拐点）。NeurIPS 2026 ⭐⭐⭐⭐

**3DGS / 在线重建 / 网格编辑**
- [[2026-11-06_HIBS-Hierarchical-Incremental-Beta-Splatting]] - **beta 核当几何置信度旋钮**：形状参数 $\beta$ 在「类高斯 ↔ 平顶 solid surfel」间插值 → 有证据处生成硬表面片、没证据处生成软探针；**可观测性 $c_z=(B/z)/\theta_0$ × MVS 一致性 $c_{\mathrm{mvs}}$** 交叉验证初始化；**beta 专属 tile 剔除界** $x_{\text{cut}}=1-(255o)^{-1/\beta}$（标准高斯阈值对低不透明度 solid 核**是正确性 bug**）；**闭式矩匹配合并**（$\xi(\beta)=4.5/(\beta{+}2.5)$、$\kappa(\beta)=15(\beta{+}2.5)/(\beta{+}3.5)$，闭式逆 $\beta=15/(15{-}\kappa)-3.5$）——**KL 合并在有界核上会发散**；误差驱动重定位替代 clone/split；在线 MipNeRF360 **27.47 dB / 1:18**（i3DGS 26.66 / 2:09），**时间 −40%**。WACV 2027 ⭐⭐⭐⭐
- [[2026-11-06_P-MGS-Perceptual-Gaussian-Allocation]] - **感知优先于几何**：现有方法每面固定 $K$ 个高斯 = 误把「网格细分密度」当「表达容量需求」；本文按需求分数 $Q_f=\frac1V\sum_v A_{fv}^2\bar\rho_{fv}$（近似误差 ∝ 梯度能量 × 面积²）分配，**拉格朗日负载定价**求解带逐视图负载约束 $\sum_f n_fT_{fv}\le W_v$ 的整数规划；**事后绑定**保留重建自由度；**局部仿射变形传递**更新中心与协方差；NeRF-Synthetic **34.00 dB / 545K**（Mani-GS −0.75 dB 但高斯少 79.7%）、DTU **32.36 dB / 191K** 全优；**错配证据**：GaMeS 在 Chair −5.12 dB、Hotdog −4.29 dB，Lego 用 **8.5× 高斯仍低 2.58 dB** ⭐⭐⭐⭐
- [[2026-11-06_EDGAR-Diffusion-Gaussian-Avatar-Refinement]] - **用合成失败驱动扩散精修高斯化身**：EDGAR-SET 三元组 $(I_f,I_{gt},I_r)$（400K 图 / 数千身份，NeRSemble+RGBAvatar 真实 × CAFCA+3DGS 合成），**LPIPS 过滤划定「可恢复域」**；**Sapiens 身份特征注入 cross-attention 的 K/V**、扩散特征作 Q；**SD-Turbo 单步**、冻结 residual/cross-attn 只训 self-attn；**MoE** 应对退化多样性；**精修结果蒸馏回 3D** → 推理期零扩散开销、保持 Base 速率；vs SDEdit 主观偏好 **98%**（且 SDEdit 的 CLIP 0.9078 **低于** Base 0.9369、LPIPS 更差 0.2728 vs 0.2133）；诚实承认 CAP4D 上 L1 略退化、GaussianAvatars **tWE 上升**。**TOG，代码开源** ⭐⭐⭐⭐

**传感器可微渲染 / 仿真**
- [[2026-11-06_4DPS-mmWave-Radar-Micro-Doppler-Rendering]] - **把慢时间轴引入雷达前向模型**：现有可微雷达渲染器全假设静态、每点每帧只评估一个相位 → **无从定义速度**；本文把**速度作为可微参数**，点直接泼溅进 **range + Doppler bin**（而非逐 chirp 重渲染）→ 成本不再随 chirp 数线性增长；**输出原始复数回波** → 复用真实 DSP 得到任意表示；**单 H100：HuPR 5.7 min/序列**；RT-Pose 微多普勒相关性 **0.966**、下游姿态模型 **21.9 cm MPJPE**（真实训练 16.7 / RF-Genesis **127.6**）⭐⭐⭐

- [[2026-11-06-daily-search-report]] - 📋 每日论文搜索报告 2026-11-06

### 2026-11-05
> 📌 严格 24h 窗口内 cs.GR 新投稿仅 1 条（视觉分析类，非渲染）。**高价值来自 SIGGRAPH Asia 2026 的 TOG 上载批次**（9 月起陆续上传，本轮补齐此前遗漏）。本轮 **9 篇新笔记**。ACM DL 仍被 Cloudflare 拦截（CDP 授权未完成），以 arXiv 上的 TOG 版本替代覆盖。

**全局光照 / 光线追踪**
- [[2026-11-05_Gaussian-Light-Transport-13D-Gaussian-GI]] - 光传输方程解表示为位置×方向×法线×材质的 **13D 高斯混合**，直接最小化渲染方程残差（绕过 Neumann 级数）；训练 7–12 分钟、1080p@63fps、模型 1–5.9MB，比 NR(VF) 快 3.7× 且 FLIP 更低；Morton tile + 逐子空间 Mahalanobis 剔除（每像素仅 76 核）；半梯度降方差；各向异性惩罚。SA 2026 / TOG ⭐⭐⭐⭐⭐
- [[2026-11-05_ResLRB-Constant-Memory-Differentiable-Light-Tracing]] - 光线追踪每路 k 个传感器连接使伴随图分支化 → **加权蓄水池采样随机保留 1 个** + PRNG 重放 + 逐顶点局部 AD 作用域 → **显存恒定 142MB**（naive AD 深度 16 即 OOM），深度 16 快 2×，梯度无偏；Attached 扩展用前向 Jacobian 链。SA 2026 / TOG ⭐⭐⭐⭐⭐

**可微渲染 / 工具**
- [[2026-11-05_Sensitivity-AOV-Differentiable-Rendering-Derivatives]] - 把 $\partial M/\partial\theta$ 提升为**一等渲染输出**：敏感性缓冲区 + 四级管线（选择/聚合/绑定/编码）；一次 adjoint sweep 全部视图复用（延迟着色类比）；自由检视相机；反向/正向对偶定位。SA 2026 / TOG ⭐⭐⭐⭐

**实时渲染 / 网格 / 纹理**
- [[2026-11-05_GRTMesh-GPU-Native-Real-Time-Textured-Mesh]] - TSDF→MC→去噪→纹理→修补→辐射度接缝校正**全 GPU 常驻**；0.02m 体素 **13.1ms/帧**（vs nvblox 208ms / Open3D CPU 1359ms）；**24×16 每相机对数增益场**消除曝光接缝（接缝失配降 27.3–33.3%，单增益只拿 30–72%）；代码开源 ⭐⭐⭐⭐
- [[2026-11-05_GaussianRenderFormer-Transformer-Rendering-3DGS]] - Transformer **无光栅化器**直接渲染 3D 高斯：38.08 vs 44.02 dB（低 5.94 dB，慢 275×）；**投影足迹**显式注入（23K 参数零初始化）→ +1.4~1.7 dB；2D 嵌入 −5.2dB、4×4 patch −3.0dB；诚实的瓶颈诊断框架（分离泛化/输入损失/欠训练）；TMLR 审稿中，代码开源 ⭐⭐⭐⭐

**光照 / 重光照 / HDR**
- [[2026-11-05_RelightFormer-Feedforward-Multiview-Relighting]] - **渲染方程积分 = Cross-Attention**（注意力隐式学 $f(\omega_i,\omega_o)(\omega_i\cdot n)$），完全绕过逆向渲染；PRope 置换不变多视图编码（角度来自物理相机配置）；LOD 数据集 90,545 对象 × 39,008 HDRIs；多视图性能随参考数单调提升。SA 2026，代码开源 ⭐⭐⭐⭐
- [[2026-11-05_Recurrent-Dynamic-Range-Extension-HDR-Reconstruction]] - 单 EV 扩展（曝光不变、输出有界 $[0,2]$）**递归**恢复 HDR；**Memory Replay 从 NLP 迁移到图像** → 全 ResNet 跨阶段反传；推理自适应平均 5 步、档数翻倍以上；4K 半秒。SA 2026 / TOG ⭐⭐⭐⭐
- [[2026-11-05_Shedding-Light-Benchmark-Lighting-Understanding]] - 用「光探针 + inpaint」把生成模型的光照理解转成**可量化的光照参数匹配**（方向/颜色/辐射分布）；代码与数据全开源。SA 2026 / TOG ⭐⭐⭐

**几何恢复 / 绑定 / 矢量**
- [[2026-11-05_TailorRig-Garment-Aware-Controllable-Rigging]] - 绑定重述为**可控结构化完整绑定生成**：用户指定身体模板 + 语义标签驱动自回归辅助骨链；**层级 chain-to-bone 蒙皮**（先定运动链再细分）消除跨链权重渗漏；Human-Mix 数据集 38,088 角色 / 21 类；Body J2J 0.023、蒙皮 L₁ 7.70（消融：层级编码器 2.4×、Chain-to-Bone 1.46×）。SA 2026 / TOG ⭐⭐⭐⭐
- [[2026-11-05_PIE-PS-Photometric-Stereo-Event-Streams]] - 相邻事件 + 光照方向配对成 PIE，**PIEF = 有符号事件率**（免对比度阈值）；PIE-GNN 跨时空共享 + RGA 软可靠性加权；MAE 8.70°(DiLiGenT-Sim)/10.38°(真实) 全优；消融：去 PIEF 14.52°、去 RGA 11.99°。SA 2026 ⭐⭐⭐
- [[2026-11-05_SketchForge-Training-Free-Scene-to-Vector-Sketching]] - **结构/纹理解耦**的免训练矢量化（DiffVG + 轮廓/DINO 注意力引导初始化，结构分支 SSIM 0.112→0.807）；multiply 融合；Aesthetic 4.84 / Edge F1 0.978。SA 2026 ⭐⭐⭐

- [[2026-11-05-daily-search-report]] - 📋 每日论文搜索报告 2026-11-05

### 2026-11-02
> 📌 严格 24h 窗口内 cs.GR 新投稿 0 篇（周末批次空窗，arXiv 上一批次 10-30）。扩展至 10-26~11-02 共 30 篇，**渲染相关 7 篇均为重复确认**（10-27/10-28/10-29/10-31 已收录），本轮新增 1 篇 + 补充 2 篇较薄笔记。

**新增**
- [[2026-11-02_Dynamic-Skinning-Kinematics-Driven-Cartoon-Effects]] - 位置导数驱动的次级运动变形器，免物理求解；TVCG 2026 vol.32 no.3 ⭐⭐⭐ *(动画层，非渲染核心)*

**重复确认（已补公式与量化数据）**
- ~~[[2026-10-31_NeuOctree-Neural-Explicit-Shape-Representation]]~~ → 已补充：双分支解码器公式、递归精化 $\mathbf{q}_{k+1}=\Pi_{\text{ray}}(\widehat{\mathbf{p}}_k)$、**28 组压缩误差实测值**、正样本归一化技巧 ⭐⭐⭐⭐⭐
- ~~[[2026-10-31_GOFish-Fisheye-Gaussian-Splatting-Mesh-Extraction]]~~ → 已补充：标定定义域公式、**+3.17 dB 单项贡献**、相机侧衰减分离式 ⭐⭐⭐⭐⭐
- [[2026-10-28_GraftRay-Path-Tracing-Mesh-Insertion]] - OptiX 高斯路径追踪 + 基图像删失 NNLS ⭐⭐⭐⭐⭐
- [[2026-10-28_Honeycomb-Surfels-Hexels]] - 六边形图元 + 一阶颜色场 ⭐⭐⭐⭐⭐
- [[2026-10-27_CVTSplat-Adaptive-Centroidal-Voronoi-Tessellation]] - 自适应 CVT，构造快 5~10× ⭐⭐⭐⭐
- [[2026-10-28_CTBakeGS]] - 免训练烘焙，光学深度解析匹配 ⭐⭐⭐⭐
- [[2026-10-28_DomeGS]] - 天空并入 3DGS 几何 ⭐⭐⭐⭐

- [[2026-11-02-daily-search-report]] - 📋 每日论文搜索报告 2026-11-02

## 2026-10

### 2026-10-31
> 📌 严格 24h 窗口内 cs.GR 新投稿 0 篇（周末空窗）；本节 12 篇为补漏 10-18 ~ 10-29 的 SIGGRAPH Asia 2026 集中上载 + 遗漏论文。

**神经表示 × 光线追踪**
- [[2026-10-31_NeuOctree-Neural-Explicit-Shape-Representation]] - 八叉树角点特征直接预测光线命中/位置/法线/反照率，免网格提取与纹理烘焙；28 组对比 24 组位置误差最优，支持非水密几何 ⭐⭐⭐⭐⭐
- [[2026-10-31_Gaussian-Grid-Frequency-Adaptive-Neural-Representation]] - 频率自适应划分 2D Gaussian 与特征网格计算量；解码 1.24~2.14×、PCIe 流量降 23~176× ⭐⭐⭐

**光栅化 / 网格提取**
- [[2026-10-31_GOFish-Fisheye-Gaussian-Splatting-Mesh-Extraction]] - 首个鱼眼直接训练的 3DGS 表面重建，>180° FoV 光栅化 + 同场景对齐网格；FIORD +2.28 dB、FullCircle +1.97 dB ⭐⭐⭐⭐⭐

**多视角重建 / 压缩**
- [[2026-10-31_CompMVR-Compression-Aware-MultiView-Restoration]] - 压缩引起跨视角几何不一致这一新失效模式；多视角联合扩散修复，SA 2026 技术论文 ⭐⭐⭐⭐

**4D / 体积视频**
- [[2026-10-31_RealMe-Immersive-Volumetric-Video-Minimal-Captures]] - 视频扩散模型 + 因子化时空注意力 + 潜空间频域损失；2K 4D 一致体积视频，SA 2026 ⭐⭐⭐⭐

**SLAM / 跟踪**
- [[2026-10-31_LingGS-Gaussian-SLAM-Explicit-Geometric-Tracking]] - 冻结 3D 基础模型当虚拟 RGB-D + 显式几何求解器解耦跟踪与几何；7 FPS @ 4090、吞吐 2~3× ⭐⭐⭐⭐

**参数化几何 / 生成式布局**
- [[2026-10-31_CRAB-Cuboid-Representation-AsBuilt-BIM]] - BIM 就绪长方体表示 + Flow Matching 精化；墙厚 MAE 2.80 cm，79.5% 在 3 cm 内，SA 2026 ⭐⭐⭐
- [[2026-10-31_HairDeck-Set-Diffusion-Hair-Cards]] - 发卡作为无序集合用 set diffusion 生成；Chamfer −44%、33× 加速 ⭐⭐⭐
- [[2026-10-31_Greenscapes-Vegetation-City-Placement-Optimization]] - VLM 给布局 + CMA-ES 调参数，遮阴/声学代理 + 感知描述子双目标 ⭐⭐⭐

**交互 / 动画 / 评测**
- [[2026-10-31_UniffordInteractor-Unified-Affordance-HOI]] - UAR + 层次化交互生成，统一可供性建模含物-物接触；ACM TOG / SA 2026 ⭐⭐⭐
- [[2026-10-31_DragonMoCap-Monocular-MoCap-Diverse-Topologies]] - rig 作动态输入 + 语言接地关节查询 token；未见骨架零样本适配，SA 2026 ⭐⭐
- [[2026-10-31_Joints-Camera-Action-CoGenerating-Motion-Video]] - 独立运动模型 + 少量 cross-attention 桥接预训练视频模型；NVIDIA，~200K 训练对 ⭐⭐⭐
- [[2026-10-31_Trajeform-Crowd-Data-Embedding]] - 重建 VAE 学习行为级嵌入，作为模拟器可信度指标 ⭐⭐
- [[2026-10-31_PhysSkinPlusPlus-Self-Supervised-Neural-Skinning]] - 物理信息自监督神经蒙皮；冲突感知梯度修正 + 降阶动力学实时模拟 ⭐⭐⭐

- [[2026-10-31-daily-search-report]] - 📋 每日论文搜索报告 2026-10-31

### 2026-10-29
**路径追踪 / 光传输**
- [[2026-10-29_GraftRay-Physically-Based-Mesh-Insertion-GS-Scenes]] - 随机透明性让高斯场景真正可做路径追踪；单位辐射基图 + 截断 NNLS 反解面光源 ⭐⭐⭐⭐⭐
- [[2026-10-29_Reusable-Transport-Skeletons-WoS-Interactive-PDE]] - WoS 可复用传输 DAG；Poisson 核有界挂接 + Doob h-变换几何修复 ⭐⭐⭐⭐

**图元设计 / 效率**
- [[2026-10-29_Honeycomb-Surfels-Hexagonal-Primitive]] - 六边形支撑 + 一阶颜色场，20 参数 vs 2DGS 58，PSNR +4.5~7.4 dB、VRAM 少至多 7× ⭐⭐⭐⭐⭐
- [[2026-10-29_CTBakeGS-Training-Free-Baking-CT-Volume-Rendering-3DGS]] - 免训练烘焙；不透明度解析映射 + 1/255 地板随机保留通用技巧 ⭐⭐⭐⭐

**场景合成 / 纹理**
- [[2026-10-29_DomeGS-Background-Completion-VR-3DGS]] - 高斯 skydome 补全进 3DGS 表示内，N=36 用户研究 p=0.042 ⭐⭐⭐⭐
- [[2026-10-29_Texture-Consolidation-Generated-MultiView-Renderings]] - CGF；置信度感知曲面域光流 + 梯度域融合生成纹理 ⭐⭐⭐⭐

**物理仿真（邻接域）**
- [[2026-10-29_Total-Deformation-MPM-Perfectly-Elastic-Solids]] - RWTH；总形变反算消数值断裂，兼容网格碰撞 ⭐⭐⭐

- [[2026-10-29-daily-search-report]] - 📋 每日论文搜索报告 2026-10-29

### 2026-10-28
> ⚠️ 本节条目的笔记文件**尚未创建**（MOC 索引已写但笔记缺失）。其中与 arXiv 收录重叠的 GraftRay / Honeycomb-Surfels / CTBakeGS / DomeGS / Texture-Consolidation 已于 **2026-10-29** 补建（见上一节）；下列 ReSTIR 系列与 Wave-Tracing 仍待补。

**ReSTIR / 实时路径追踪**
- [[2026-10-28_ReSTIR-PT-Enhanced]] - ReSTIR PT 工程强化：37.1→12.6 ms，FLIP 0.321→0.263 ⭐⭐⭐⭐⭐ I3D Best Paper
- [[2026-10-28_ReSTIR-Compatibility-Neighbor-Selection]] - 兼容性引导邻居选择：SMAPE −6~29%，协方差 −22~49% ⭐⭐⭐⭐⭐ HPG Best Paper
- [[2026-10-28_ReSTIR-Multi-Layer-Reservoir-Splatting]] - 多层 reservoir 解决 disocclusion 噪声 ⭐⭐⭐⭐
- [[2026-10-28_ReSTIR-Level-of-Detail]] - 表面点映射实现跨 LOD 拓扑的 ReSTIR 复用 ⭐⭐⭐⭐
- [[2026-10-28_ReSTIR-Gradient-Domain]] - 首个实时梯度域渲染方法 ⭐⭐⭐⭐ EG 2026
- [[2026-10-28_ReSTIR-Stochastic-Pairwise-MIS]] - 随机 pairwise MIS，大核无偏空间复用 ⭐⭐⭐⭐

**全局光照 / 物理渲染**
- [[2609.11430-gaussian-light-transport]] - 13D 高斯混合表示 GI，训练快 10~23×，模型 1~6 MB ⭐⭐⭐⭐⭐ SA 2026
- ~~[[2026-10-28_GraftRay-Path-Tracing-Mesh-Insertion]]~~ → 已补建为 [[2026-10-29_GraftRay-Physically-Based-Mesh-Insertion-GS-Scenes]]
- [[2026-10-28_Wave-Tracing-Path-Integral-Wave-Optics]] - 双线性路径积分 + 椭圆锥，波动光学 ⭐⭐⭐ EG Best Paper HM *(笔记待补)*

**图元设计 / 场景合成**
- ~~[[2026-10-28_Honeycomb-Surfels-Hexels]]~~ → 已补建为 [[2026-10-29_Honeycomb-Surfels-Hexagonal-Primitive]]
- ~~[[2026-10-28_CTBakeGS]]~~ → 已补建为 [[2026-10-29_CTBakeGS-Training-Free-Baking-CT-Volume-Rendering-3DGS]]
- ~~[[2026-10-28_DomeGS]]~~ → 已补建为 [[2026-10-29_DomeGS-Background-Completion-VR-3DGS]]
- ~~[[2026-10-28_Texture-Consolidation]]~~ → 已补建为 [[2026-10-29_Texture-Consolidation-Generated-MultiView-Renderings]]
- [[2026-10-28_VISTA-Differentiable-Viewpoint-Planning]] - 可微视角规划，闭环 SR 提升 2.1× ⭐⭐⭐ *(笔记待补；arXiv:2610.36111)*
- ~~[[2026-10-28-daily-search-report]]~~ → 笔记待补

### 2026-10-27
- [[2026-10-27_CVTSplat-Adaptive-Centroidal-Voronoi-Tessellation]] - 自适应 CVT 模板的 3DGS 重建
- [[2026-10-27_GaussianSpline-Adaptive-Bezier-4D-Gaussian-Splatting]] - 自适应 Bézier 样条 4DGS

## 2026-08

### 2026-08-01
- [[2607.28047-volume-rendering-neural-inr]] - 时变隐式神经体数据的查询高效随机体绘制 @30-40FPS ⭐神经渲染
- [[2607.27943-gtc-svbrdf-compression]] - GTC: 2D 高斯压缩 mipmapped SVBRDF，超越 ASTC ⭐PBR
- [[2607.26525-atlaslc-3dgs-compression]] - AtlasLC: 3DGS 对象压缩，atlas 准备时间 25x 提升 ⭐实用
- [[2607.26506-global-pass-barriers-rhi]] - 全局 Pass 屏障无逐资源追踪，跨 6 GPU 厂商测试 ⭐GPU 优化

## 2026-06

### 2026-06-23
- [[2606.22880-DJM-Displacement-Mapping]] - Displacement Mapping 的 Jacobian 度量基网格简化 ⭐SIGGRAPH 2026
- [[2606.22481-DOT3D-Lighting-Consistent-Transfer]] - 3DGS 光照一致物体迁移 ⭐EGSR 2026
- [[2606.21898-Mesh2GS-Plenoptic-Sampling]] - Plenoptic Sampling 理论驱动 Mesh→3DGS 转换 ⭐
- [[2606.21791-SEU-3DGS-Rendering]] - 3DGS 渲染单粒子翻转 fault tolerance ⭐实用

## 2026-05

### 2026-05-05
- [[Power-Foam-Unifying-Real-Time-Differentiable-Ray-Tracing-and-Rasterization]] - 统一 ray tracing 与 rasterization 的有界幂图 ⭐高优先级
- [[Real-time-Global-Illumination-for-Dynamic-3D-Gaussian-Scenes]] - 动态 3D Gaussian 场景实时 GI (40+ fps) ⭐高优先级
- [[Vertex-Features-for-Neural-Global-Illumination]] - 顶点特征神经 GI，内存降至 1/5 ⭐高优先级
- [[Rethinking-Collision-Detection-on-GPU-Ray-Tracing-Architecture]] - Mochi GPU RT 架构碰撞检测优化

## 2026-04

### 2026-04-04
- [[LightHarmony3D-2603.29209]] - 3DGS 全局光照与阴影的网格插入 ⭐高优先级
- [[PhyGaP-2603.14001]] - 偏振线索物理接地 Gaussian Splatting ⭐高优先级
- [[GTSR-2603.22036]] - 半透明表面重建的次表面散射 3DGS ⭐高优先级
- [[Ref-DGS-2603.07664]] - 反射双 Gaussian Splatting（中/远场镜面）
- [[PolGS++-2603.10801]] - 偏振引导快速反射表面重建
- [[E2EGS-2603.14684]] - 事件相机无姿态 3DGS 重建 ⭐高优先级
- [[3DGEER-2505.24053]] - 通用相机精确高效 3D Gaussian 渲染 ⭐高优先级

## 2026-03

### 2026-03-17
- [[2026-03-17-Gaussian-Photon-Fields]] - 光子映射 + 3D Gaussian Splatting ⭐高优先级
- [[2026-03-17-4D-Synchronized-Fields]] - 4D Gaussian Splatting + 语言理解 ⭐高优先级
- [[2026-03-17-Qonvolution-Gaussian-Splatting]] - 超越 Zip-NeRF 的 3DGS ⭐高优先级
- [[2026-03-17-Texture-Lookup-Bezier-GPU]] - GPU 纹理查找 Bézier 曲线优化
- [[2026-03-17-GPU-Fluid-Granular-Solver]] - 流体-颗粒流模拟（传递给豆苗/菜心）

### 2026-03-16
- [[2026-03-16-NeurFrame-Continuous-Frame-Fields]] - 连续帧场

### 2026-03-14
- [[2026-03-14-4D-Facial-Expression-Synthesis]] - 4D 面部表情合成
- [[2026-03-14-High-Contrast-Projection-Mapping]] - 高对比度投影映射
- [[2026-03-14-RBF-Surface-Interpolation]] - RBF 曲面插值

### 2026-03-12
- [[2026-03-12-TopGen-Quad-Mesh-Generation]] - 四边形网格生成
- [[2026-03-12-TreeON-3D-Tree-Point-Clouds]] - 3D 树木点云
- [[2026-03-12-LiTo_Surface_Light_Field_Tokenization]] - 表面光场标记化

### 2026-03-10
- [[2026-03-10-ToF_NLOS_Imaging_Comprehensive_Study]] - ToF NLOS 成像

### 2026-03-09
- [[2026-03-09_RAF_Gaussian_Avatars]] - RAF Gaussian 头像
- [[2026-03-09_Spherical-GOF_Panoramic_Gaussian]] - 球面 Gaussian 全景

## 分类

### Gaussian Splatting
- [[2026-08-01-2607.26525-atlaslc-3dgs-compression]]
- [[2026-04-04-LightHarmony3D-2603.29209]]
- [[2026-04-04-PhyGaP-2603.14001]]
- [[2026-04-04-GTSR-2603.22036]]
- [[2026-04-04-Ref-DGS-2603.07664]]
- [[2026-04-04-PolGS++-2603.10801]]
- [[2026-04-04-E2EGS-2603.14684]]
- [[2026-04-04-3DGEER-2505.24053]]
- [[2026-03-17-Gaussian-Photon-Fields]]
- [[2026-03-17-4D-Synchronized-Fields]]
- [[2026-03-17-Qonvolution-Gaussian-Splatting]]
- [[2026-03-09_RAF_Gaussian_Avatars]]
- [[2026-03-09_Spherical-GOF_Panoramic_Gaussian]]

### Global Illumination
- [[2026-05-05-Real-time-Global-Illumination-for-Dynamic-3D-Gaussian-Scenes]]
- [[2026-05-05-Vertex-Features-for-Neural-Global-Illumination]]
- [[2026-04-04-LightHarmony3D-2603.29209]]
- [[2026-03-17-Gaussian-Photon-Fields]]
- [[2026-06-23-2606.21898-Mesh2GS-Plenoptic-Sampling]]
- [[2026-06-23-2606.22481-DOT3D-Lighting-Consistent-Transfer]]

### Ray Tracing & Real-time Rendering
- [[2026-05-05-Power-Foam-Unifying-Real-Time-Differentiable-Ray-Tracing-and-Rasterization]]
- [[2026-05-05-Rethinking-Collision-Detection-on-GPU-Ray-Tracing-Architecture]]
- [[2026-04-04-Ref-DGS-2603.07664]]
- [[2026-04-04-3DGEER-2505.24053]]
- [[2026-06-23-2606.21791-SEU-3DGS-Rendering]]
- [[2026-06-23-2606.21898-Mesh2GS-Plenoptic-Sampling]]

### PBR & Material
- [[2026-08-01-2607.27943-gtc-svbrdf-compression]]
- [[2026-04-04-PhyGaP-2603.14001]]
- [[2026-04-04-GTSR-2603.22036]]
- [[2026-04-04-PolGS++-2603.10801]]

### Event Camera & Pose-Free
- [[2026-04-04-E2EGS-2603.14684]]

### GPU Optimization
- [[2026-08-01-2607.26506-global-pass-barriers-rhi]]
- [[2026-03-17-Texture-Lookup-Bezier-GPU]]

### Geometry & Rasterization
- [[2026-06-23-2606.22880-DJM-Displacement-Mapping]]

### Fluid Simulation
- [[2026-03-17-GPU-Fluid-Granular-Solver]]

### Neural Rendering
- [[2026-08-01-2607.28047-volume-rendering-neural-inr]]
- [[2026-08-01-2607.26525-atlaslc-3dgs-compression]]
- [[2026-05-05-Power-Foam-Unifying-Real-Time-Differentiable-Ray-Tracing-and-Rasterization]]
- [[2026-05-05-Vertex-Features-for-Neural-Global-Illumination]]
- [[2026-04-04-LightHarmony3D-2603.29209]]
- [[2026-04-04-PhyGaP-2603.14001]]
- [[2026-04-04-GTSR-2603.22036]]
- [[2026-04-04-Ref-DGS-2603.07664]]
- [[2026-04-04-E2EGS-2603.14684]]
- [[2026-04-04-3DGEER-2505.24053]]
- [[2026-03-17-Gaussian-Photon-Fields]]
- [[2026-03-17-4D-Synchronized-Fields]]
- [[2026-03-17-Qonvolution-Gaussian-Splatting]]
- [[2026-06-23-2606.21898-Mesh2GS-Plenoptic-Sampling]]
- [[2026-06-23-2606.22481-DOT3D-Lighting-Consistent-Transfer]]
