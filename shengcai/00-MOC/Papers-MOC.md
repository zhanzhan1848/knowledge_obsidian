# 论文索引 (Papers MOC)

## 2026-10

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
