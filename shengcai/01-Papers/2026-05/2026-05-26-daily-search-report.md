# 2026-05-26 日报：渲染领域论文搜索

## 搜索概要
- **搜索时间**: 2026-05-26 14:00 UTC
- **搜索范围**: arXiv cs.GR 最近24小时
- **关键词**: ray tracing, path tracing, real-time rendering, global illumination, PBR, rasterization, BVH, ray marching

## 今日发现

### 🔥 高相关性论文（渲染领域）

#### 1. Learning View-Dependent Splatting Kernels
- **arXiv**: [2605.25426](https://arxiv.org/abs/2605.25426)
- **会议**: SIGGRAPH 2026
- **领域**: 3D Gaussian Splatting / 渲染
- **摘要**: 提出可微分框架自动学习视图相关的2D核函数，提升新视角合成的重建质量和表示效率。使用包围椭球体作为体积元，投影网络输出2D核潜向量，解码器通过Mahalanobis距离产生径向对称2D核。
- **标签**: #3DGS #SIGGRAPH2026 #渲染 #核函数学习

#### 2. F-RNG: Feed-Forward Relightable Neural Gaussians
- **arXiv**: [2605.25975](https://arxiv.org/abs/2605.25975)
- **领域**: 神经渲染 / 可重光照
- **摘要**: 前馈框架直接从稀疏视角输入生成可重光照的3DGS资产。基于大重建模型(LRM)和内在分解模型(IDM)构建，无需重新训练即可利用未来更好的模型。实现~25×更快重光照，+2.0dB质量提升。
- **标签**: #3DGS #重光照 #前馈网络 #神经渲染

#### 3. Real-time Global Illumination for Dynamic 3D Gaussian Scenes
- **arXiv**: [2503.17897](https://arxiv.org/abs/2503.17897)
- **发表**: IEEE TVCG (2026年4月更新v2)
- **领域**: 实时全局光照
- **摘要**: 针对动态3D高斯场景的实时全局光照方法，结合快速复合随机光线追踪算法和优化3DGS光栅器。支持可交互编辑材质和动态光照，40+ fps。
- **标签**: #全局光照 #3DGS #实时渲染

#### 4. DP-GES: Depth Peeling for Gaussian-Enhanced Surfel Rendering
- **arXiv**: [2605.25345](https://arxiv.org/abs/2605.25345)
- **领域**: 渲染 / 高斯 splatting
- **摘要**: 使用不透明surfels和半透明边界增强Depth Peeling，实现无排序高斯splting的正确透射率调制，消除混叠和弹出伪影。
- **标签**: #3DGS #渲染 #深度剥离

#### 5. Snapshot Polarimetric Display Inverse Rendering
- **arXiv**: [2605.24915](https://arxiv.org/abs/2605.24915)
- **领域**: 逆向渲染
- **摘要**: 使用LCD投影线偏振RGB图案和偏振相机获取单帧光谱偏振测量，前馈Transformer映射到法线、反照率、粗糙度、金属度。
- **标签**: #逆渲染 #PBR #偏振成像

### 📌 其他相关（几何/动画）

#### CrossLift: Lifting Cross Fields From 2D Visual Priors
- **arXiv**: [2605.26062](https://arxiv.org/abs/2605.26062)
- **领域**: 四边形网格化 / 交叉场
- **标签**: #网格化 #交叉场

#### Closing Trajectories: Equation-Free Cyclic Animation via Koopman Surrogates
- **arXiv**: [2605.23462](https://arxiv.org/abs/2605.23462)
- **领域**: 动画 / 周期运动
- **标签**: #动画 #Koopman

### ❌ 不相关论文（已过滤）
- 视频生成、长视频、故事板草图等非渲染论文

## 行业动态

### Doom 3 RTX Path Tracing Mod
- **来源**: [DSOGaming](https://www.dsogaming.com/videotrailer-news/new-doom-3-rtx-path-tracing-video-showcases-lit-particles-pom-relief-mapping-better-gi/)
- **内容**: IceBridge - D3D12兼容层，为经典idTech 4引擎带来光线追踪/路径追踪支持
- **技术**: 全局光照改进、路径追踪粒子、POM视差映射
- **状态**: WIP，无公开下载

## 总结
今日在arXiv cs.GR发现**5篇**渲染相关论文，其中SIGGRAPH 2026论文1篇（Learning View-Dependent Splatting Kernels），重点关注前馈可重光照3DGS（F-RNG）和视图相关核函数学习方向。

---
*生成时间: 2026-05-26 14:00 UTC*
*Agent: shengcai (rendering expert)*