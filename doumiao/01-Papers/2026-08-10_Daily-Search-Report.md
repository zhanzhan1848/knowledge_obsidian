# 每日流体渲染论文搜索报告

**日期**: 2026-08-10  
**搜索范围**: arXiv cs.GR (最近24小时), SIGGRAPH 2026 / SIGGRAPH Asia 2026  
**关键词**: fluid rendering, water rendering, smoke rendering, fire simulation, ocean rendering, particle system, volume rendering

---

## 搜索结果摘要

### arXiv cs.GR 新增论文 (最近24小时)
- **无新论文** - 搜索时间窗口内无新增流体渲染相关论文

### arXiv cs.GR 近期重要论文 (近两周)

| 论文ID | 标题 | 类别 | 日期 |
|--------|------|------|------|
| 2607.28047 | A Query-Efficient Stochastic Volume Rendering Framework for Time-Varying Implicit Neural Volumes | 体积渲染 | 2026-07-30 |
| 2607.13691 | Drawing with water waves | 水波渲染 | 2026-07-15 |

### SIGGRAPH 2026 流体相关论文 (已确认)

| 论文标题 | 类别 | 状态 |
|----------|------|------|
| GauSmoke: Hybrid Physics-Optical Gaussian Splatting for Sparse Smoke Reconstruction | 烟雾渲染 | Emerging Technologies Demo |
| LagrangianSplats: Divergence-Free Transport | 流体传输 | Technical Paper |
| Gabor Fields: Orientation-Selective Level-of-Detail for Volume Rendering | 体积渲染 | Top 10 Fast Forward |
| Fluid Simulation with the Lattice Boltzmann Method | 流体模拟 | Course |

---

## 论文详情

### 1. A Query-Efficient Stochastic Volume Rendering Framework for Time-Varying Implicit Neural Volumes

**arXiv**: [2607.28047](https://arxiv.org/abs/2607.28047)  
**类别**: cs.GR (体积渲染)  
**日期**: 2026-07-30  
**作者**: Alper Sahistan, Valerio Pascucci (University of Utah), Haichao Miao, Peer-Timo Bremer (LLNL), Zhimin Li (Vanderbilt)

**核心创新**:
- 基于 delta tracking 的高效随机体积渲染框架
- 四阶段管线利用异构并行：光线追踪核心用于遍历，张量核心用于批量神经评估
- 提出光线预算和查询剪枝策略减少INR查询
- RTX 4090上 1024×1024 分辨率可达 ~30-40 FPS

**技术要点**:
- 解决了时变隐式神经表示(INR)的交互式体积渲染问题
- 避免了传统ray marching密集采样的高成本
- 支持直接从原始表示渲染时变INR
- 时间步更新仅需约1-2ms

**渲染方法**: 体积渲染 (Volume Rendering)  
**性能**: ~30-40 FPS @ 1024×1020 RTX 4090

---

### 2. Drawing with water waves

**arXiv**: [2607.13691](https://arxiv.org/abs/2607.13691)  
**类别**: physics.flu-dyn (流体动力学)  
**日期**: 2026-07-15  
**作者**: Taiga Kanehira et al.

**核心创新**:
- 使用瞬态多向聚焦波在水面上绘制任意2D曲线和3D体积形状
- 集成Bézier曲线参数化、等弧长采样和迭代振幅校正(IAC)算法
- 有效抑制波高过冲，实现谱分量的精确空间叠加

**验证方法**:
- 线性波理论和SPH模拟验证
- 成功复现2D字符和3D人脸
- FloWave圆形波池物理实验验证2D星形和3D金字塔

**适用场景**: 海洋工程中的波场控制

---

### 3. GauSmoke: Hybrid Physics-Optical Gaussian Splatting for Sparse Smoke Reconstruction

**会议**: SIGGRAPH 2026  
**类别**: 烟雾渲染 / Gaussian Splatting  
**状态**: Emerging Technologies Demo

**核心创新**:
- 混合物理-光学Gaussian Splatting方法
- 稀疏烟雾重建
- 结合物理仿真与光学渲染

---

### 4. Gabor Fields: Orientation-Selective Level-of-Detail for Volume Rendering

**会议**: SIGGRAPH 2026  
**类别**: 体积渲染 LOD  
**状态**: Top 10 Technical Papers Fast Forward

**核心创新**:
- 方向选择性的体积渲染细节层次控制
- 基于Gabor场的技术

---

## 已有笔记覆盖

以下论文已在之前扫描中创建笔记:
- ✅ 2026-08-06-Stochastic-Volume-Rendering-Time-Varying-INR.md (2607.28047)
- ✅ 2026-08-01-siggraph2026-gausmoke.md
- ✅ 2026-08-01-siggraph2026-lagrangiansplats.md
- ✅ 2026-07-21-Drawing-with-Water-Waves.md (2607.13691)

---

## 结论

**今日搜索状态**: 无新增24小时内论文

**待关注**:
- SIGGRAPH Asia 2026 投稿截止日期为2026年5月，录用名单尚未公布
- 建议持续关注2026年8月后续arXiv投稿

---

*搜索完成时间: 2026-08-10 14:14 UTC*
