# 每日论文搜索报告 — 2026-10-08

## 搜索配置
- **时间范围**: 2026-10-07 ~ 2026-10-08 (UTC)
- **数据源**: arXiv cs.GR, SIGGRAPH Asia 2026 (TC track), Eurographics 2026/2027
- **关键词**: ray tracing, path tracing, real-time rendering, global illumination, PBR, rasterization, BVH, ray marching
- **任务 agent**: shengcai (嫩牛肉)
- **运行**: cron: shengcai-daily-paper-search @ 2026-10-08 14:00 UTC

## 搜索结果摘要
- **arXiv cs.GR (10月7日+8日)**: 20 篇新论文
- **arXiv cs.GR (10月初)**: 23 篇新论文 (10/1 ~ 10/6)
- **SIGGRAPH Asia 2026**: 至少 2 篇渲染相关 (TC track)
- **EG 2027**: 1 篇投稿 (preprint)
- **ACM TOG**: 1 篇已接收

## 渲染领域相关论文

### ⭐⭐⭐⭐⭐ UltraDiff (2610.07941) — Differentiable Ray Tracing in Ultrasound
- **创新性**: ⭐⭐⭐⭐⭐ | **实用性**: ⭐⭐⭐ | **难度**: 高
- SIGGRAPH Asia 2026 TC；把可微路径追踪扩展到医学超声成像（瞬态渲染）
- 基于 Mitsuba 3；path-space 积分 + 时间门控
- **推荐**: 领域前沿参考，团队不需要直接实现

### ⭐⭐⭐⭐⭐ NEF (2610.06762) — Neural Emission Fields
- **创新性**: ⭐⭐⭐⭐⭐ | **实用性**: ⭐⭐⭐⭐⭐ | **难度**: 中-高
- 用神经网络预积分面光源；单次评估 = 无噪直接光照
- 可作为**离线预积分模块**集成到 PBR 引擎
- **推荐**: 强烈推荐可行性评估（适合 moyuwan）

### ⭐⭐⭐⭐⭐ Dirichlet Splatting (2610.00618) — Wave-Based Inverse Problems
- **创新性**: ⭐⭐⭐⭐⭐ | **实用性**: ⭐⭐⭐ | **难度**: 高
- ACM TOG；Dirichlet 核替换 Gaussian 足迹用于相干波成像
- 比波形级 AD 快 10-50×
- **推荐**: 非光波渲染，但思路可启发物理精确化

### ⭐⭐⭐⭐⭐ Budgeted-GS (2610.03162) — Real-Time Large-Scale 3DGS
- **创新性**: ⭐⭐⭐⭐⭐ | **实用性**: ⭐⭐⭐⭐⭐ | **难度**: 高
- EG 2027 投稿；factoring tree + capacity floor；城市级单 GPU 实时
- **推荐**: **强烈推荐** 作为大规模 3DGS 渲染管线参考

### ⭐⭐⭐⭐ Windfoil (2610.02468) — Closed-Form Coverage for Vector Graphics
- **创新性**: ⭐⭐⭐⭐ | **实用性**: ⭐⭐⭐⭐ | **难度**: 高
- WebGPU；闭式 Bézier winding number
- **推荐**: 2D 渲染 / 可微 SVG 场景参考

### ⭐⭐⭐⭐ Multiphysics Simulation (2610.09822) — Eurographics 2026 Course Notes
- **创新性**: ⭐⭐⭐ | **实用性**: ⭐⭐⭐⭐ | **难度**: N/A (讲义)
- Eurographics 2026 课程；多物理场仿真方法系统化
- **推荐**: 团队物理仿真知识地图；与鲜毛肚/鸭血协作

### ⭐⭐⭐⭐ Neural Strand-Based Hair (2610.04689)
- **创新性**: ⭐⭐⭐⭐ | **实用性**: ⭐⭐⭐⭐ | **难度**: 高
- Simulator-in-the-loop 自监督训练神经时间积分器
- **推荐**: 数字人 / 游戏角色场景

### ⭐⭐⭐ Local Content-Style Control (2610.08704) — SIGGRAPH Asia 2026 TC
- **创新性**: ⭐⭐⭐ | **实用性**: ⭐⭐⭐⭐ | **难度**: 低
- 把 ControlNet + IP-Adapter 权重升级为空间图
- **推荐**: 即插即用，零训练成本

## 重点推荐传递给 moyuwan

1. **NEF (Neural Emission Fields)** — 离线预积分面光源模块，⭐⭐⭐⭐⭐ 推荐评估
2. **Budgeted-GS** — 大规模 3DGS 实时渲染，⭐⭐⭐⭐⭐ 推荐集成

## 本次新增论文笔记
- `2026-10-08-UltraDiff-Differentiable-Ray-Tracing-Ultrasound.md`
- `2026-10-08-NEF-Real-time-Pre-integrated-Neural-Emitters.md`
- `2026-10-08-Multiphysics-Simulation-Visual-Computing-CourseNotes.md`
- `2026-10-08-NeuralStrand-Hair-Simulation.md`
- `2026-10-07-Local-Content-Style-Control-Diffusion-Stylization.md`
- `2026-10-08-Dirichlet-Splatting-Wave-Imaging.md`
- `2026-10-08-Budgeted-GS-Large-Scale-Gaussian-Splatting.md`
- `2026-10-08-Windfoil-Closed-Form-Coverage-Vector-Graphics.md`

## 摘要统计
- 共提炼 8 篇论文
- SIGGRAPH Asia 2026: 2 篇
- ACM TOG: 1 篇
- EG 2027 投稿: 1 篇
- 课程/讲义: 1 篇
- 核心渲染主题分布: 神经场/预积分、Gaussian Splat、2D 光栅化、神经积分器、可微渲染

---
*搜索时间: 2026-10-08 14:00 UTC*
*执行: shengcai (嫩牛肉) / cron: shengcai-daily-paper-search*