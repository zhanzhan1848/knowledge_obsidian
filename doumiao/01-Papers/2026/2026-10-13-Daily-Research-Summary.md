# 2026年10月13日 流体渲染领域研究日报

## 📊 今日概览

**搜索时间**: 2026-10-13 14:08 UTC  
**搜索范围**: arXiv cs.GR 最近7天 (Mon Oct 12 → Tue Oct 6) + 关联 cross-list (cs.CV/cs.LG/cs.AI)  
**关键词**: fluid rendering, water rendering, smoke rendering, fire simulation, ocean rendering, particle system, volume rendering  
**发现论文**: 9 篇与流体渲染/物理仿真/可微渲染/体积渲染强相关（71 篇 cs.GR 提交中筛选）

## 🔍 主要发现

### SIGGRAPH Asia 2026 (Kuala Lumpur, Dec 1–4) 接受论文

#### 1.1 ResLRB: Stochastic Graph Compression for Constant-Memory Differentiable Light Tracing
- **论文ID**: arXiv:2610.10847 · DOI 10.1145/3829339.3847837
- **作者**: Linas Beresna 等
- **核心创新**: Streaming Weighted Reservoir 把反向 light tracing 的内存降到**常数**（与路径长度、传感器连接数均解耦），首次让光追踪/光子映射可微管线实用
- **技术分类**: 可微渲染 / 体积可微
- **推荐度**: ✅ 强烈推荐（做参与介质可微反演的必备工具）

#### 1.2 Sensitivity as an Arbitrary Output Variable for Differentiable Rendering
- **论文ID**: arXiv:2610.10852 · DOI 10.1145/3829339.3847832
- **作者**: Linas Beresna 等
- **核心创新**: 把 sensitivity（导数）做成第一类 AOV，类似 deferred shading 的延迟可视化
- **技术分类**: 可微渲染 / 调试基础设施
- **推荐度**: ✅ 推荐

#### 1.3 Differentiable Ray Tracing in Ultrasound for Shape Optimization (UltraDiff)
- **论文ID**: arXiv:2610.07941 · DOI 10.1145/3829339.3847840
- **核心创新**: 超声信号按飞行时间分 bin（瞬态渲染），首次让 path tracing 的可微范式扩展到医学成像
- **技术分类**: 可微光线追踪 / 体积可微
- **推荐度**: ✅ 推荐（启发其他物理成像领域）

### 高影响 arXiv (cs.GR / cross-list cs.CV)

#### 2.1 Make It Flow: Animating Water in 3D Gaussian Splatting Scenes
- **论文ID**: arXiv:2610.13860 (cs.CV)
- **作者**: Florian Hahlbohm 等
- **核心创新**:
  - 2D 光学流 + 3D Eulerian 速度场提升
  - Cinemagraph-inspired Gaussian 形变
  - 野外瀑布数据集
- **技术分类**: 水面渲染 + 3DGS
- **推荐度**: ✅ 推荐（瀑布/河流 3DGS 场景的实用方案）

#### 2.2 Fluid-Gen-Zero: Grounding Pretrained Video Generators in Physics without Training
- **论文ID**: arXiv:2610.10984 (cs.CV)
- **作者**: Hong Huang 等
- **核心创新**:
  - 免训练：物理仿真器管运动，预训练视频生成器管外观
  - VLM agent 两级 workflow
  - 流体端点误差降低 67.9–84.0%
- **技术分类**: 神经流体渲染 + 物理仿真
- **推荐度**: ✅ 强烈推荐

#### 2.3 Simulation Methods for Multiphysics Phenomena in Visual Computing (Course Notes)
- **论文ID**: arXiv:2610.09822 · DOI 10.2312/egt.20261002
- **作者**: Jan Bender 等
- **核心创新**: Eurographics 2026 课程笔记，**完整系统**介绍 CG 多物理仿真（刚体/可变形/流体/颗粒 + 耦合）
- **技术分类**: 仿真方法综述
- **推荐度**: ✅ 强烈推荐（难得完整教程笔记）

#### 2.4 FeatureZ: A General Framework for Feature-Preserving Compression
- **论文ID**: arXiv:2610.12371 (IEEE Vis 2026)
- **核心创新**: 单一压缩框架保留**等值面、合并树、Morse–Smale 等多种**几何拓扑特征
- **技术分类**: 体积渲染 / 科学可视化
- **推荐度**: ✅ 推荐（对大规模流体体数据存档/远程流送非常实用）

#### 2.5 GaussianBench + GaussianFlesh: Physics-Fidelity Benchmark
- **论文ID**: arXiv:2610.10554 (cs.LG)
- **核心创新**: 
  - 冻结场景 + 仿真器独立打分
  - 6 大物理测试（守恒/连续介质/多材料耦合/协方差传输/热相变/反事实）
  - 4 值判定（PASS/FAIL/NA/INVALID）
  - 曝光多个 release 系统的内部物理错误
- **技术分类**: 物理集成 3DGS 评测
- **推荐度**: ✅ 推荐

#### 2.6 JamTet: Physics-based Sphere Packing for Lagrangian Mesh Morphing
- **论文ID**: arXiv:2610.08880
- **作者**: Jiong Lin 等
- **核心创新**:
  - 物理驱动 sphere packing 同时解决网格生成与形变
  - JAX 可微 GPU 仿真器
  - 软体机器人形态设计
- **技术分类**: 可微仿真 / MPM / 网格方法
- **推荐度**: ✅ 推荐

#### 2.7 Neural Emission Fields (NEF): Real-time Rendering of Pre-integrated Neural Emitters
- **论文ID**: arXiv:2610.06762
- **作者**: Arno Coomans 等
- **核心创新**: 预积分神经发光体表示 + 双头 diffuse/glossy → 单次 evaluation 出无噪声直接光照
- **技术分类**: 实时渲染 / 发光体
- **推荐度**: ✅ 推荐（复杂发光体实时场景实用工具）

---

## 📈 趋势分析

### 主导技术 1: 可微渲染（Differentiable Rendering）

本周 3 篇 SIGGRAPH Asia 2026 TC + 1 篇 arXiv 都围绕"如何把可微做得更通用":
- **ResLRB** — light tracing 常数内存
- **Sensitivity AOV** — 可视化基础设施
- **UltraDiff** — 跨模态扩展
- **Fluid-Gen-Zero** — 反向模式 + 物理引导

**含义**: 可微管线正向"光路所有节点"+"所有成像模态"渗透；参与介质/流体反演的工程门槛显著下降。

### 主导技术 2: 3D Gaussian Splatting + 物理

本周 4 篇相关：
- **Make It Flow** — 给静态 3DGS 加水流动效
- **Fluid-Gen-Zero** — 物理引导视频生成
- **GaussianBench** — 物理保真评测
- **Previous** — GauSmoke / LagrangianSplats 等延续

**含义**: 3DGS + 物理已经从"研究热点"转向"工具化、需要评测"，GaussianBench 显示领域正**规范评测**。

### 主导技术 3: 多物理耦合

Eurographics 2026 课程笔记（Multiphysics）系统梳理**刚体 + 可变形 + 流体 + 颗粒 + 耦合**，意味着耦合仿真正成为标准操作而非前沿问题。

## 📅 重大会议预告

- **SIGGRAPH Asia 2026**: 2026-12-01 ~ 12-04 · Kuala Lumpur · 19th edition
- 本周 ~30 篇已上线 arXiv，聚焦可微 + 物理 + ML + 神经渲染
- 关注：会议程序列表 https://asia.siggraph.org/2026/program/technical-papers/

## 🔗 下一步行动

- 跟踪 SIGGRAPH Asia 2026 官方程序列表，蹲守论文集
- 监测参与介质 / 流体可微反向 NN 的新工具
- 关注 NeuralSPH、NeuralMPM 等 MPM+神经方向的延伸
- 准备算力笔记（视频生成 + 反向 light tracing 的算力消耗）

## 📂 本日新加笔记

1. `2026-10-13-Make-It-Flow-Water-3DGS.md`
2. `2026-10-13-Fluid-Gen-Zero-Physics-Aware-Video-Generation.md`
3. `2026-10-13-Multiphysics-Simulation-Visual-Computing-Course.md`
4. `2026-10-13-FeatureZ-Volume-Compression.md`
5. `2026-10-13-GaussianBench-Physics-Fidelity-Benchmark.md`
6. `2026-10-13-ResLRB-Differentiable-Light-Tracing.md`
7. `2026-10-13-Sensitivity-AOV-Differentiable-Rendering.md`
8. `2026-10-13-JamTet-Mesh-Morphing-Differentiable-Sim.md`
9. `2026-10-13-UltraDiff-Differentiable-Ultrasound.md`
10. `2026-10-13-Neural-Emission-Fields-NEF.md`

---
*由豆苗自动收集于 2026-10-13 14:08 UTC*
