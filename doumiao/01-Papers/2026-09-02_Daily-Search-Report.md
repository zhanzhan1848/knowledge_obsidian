# 每日搜索报告 - 2026-09-02

## 搜索概况
- **搜索时间**: 2026-09-02 14:00 UTC
- **搜索范围**: arXiv cs.GR, SIGGRAPH/SIGGRAPH Asia 2026
- **关键词**: fluid rendering, water rendering, smoke rendering, fire simulation, ocean rendering, particle system, volume rendering

## 发现论文

### SIGGRAPH 2026 论文

#### 1. GauSmoke: Hybrid Physics-Optical Gaussian Splatting for Sparse Smoke Reconstruction
- **会议**: SIGGRAPH 2026
- **arXiv**: TBD (Pending publication)
- **作者**: Zhang, W.; Cai, Y; Huang, L; Ye, D; Guo, J; Ren, B
- **分类**: 烟雾渲染 / 3D Gaussian Splatting

**核心创新**:
- 提出一种物理感知方法，从稀疏视角视频重建动态流体
- 结合体积渲染与物理引导的 Gaussian 优化
- 强制密度和运动一致性，减少伪影并提高真实感

**技术要点**:
- 体积渲染 (Volumetric Rendering)
- 物理引导优化 (Physics-Guided Optimization)
- 稀疏视角重建 (Sparse-View Reconstruction)

**评估**:
- ✅ 高视觉和物理保真度的烟雾重建
- ✅ 准确、稳定的 3D 重建

**链接**: https://dl.acm.org/doi/10.1145/3799902.3811148

---

### arXiv 近期论文

#### 2. VersaGauss: A Versatile Framework for Generating Multiphase Dynamics with 3D Gaussians
- **arXiv**: [2608.28069](https://arxiv.org/abs/2608.28069)
- **日期**: 2026-08-28
- **作者**: Ruijie Su et al.
- **分类**: cs.CV / cs.AI

**核心创新**:
- 统一的多相交互生成、模拟和渲染框架
- 输入少量图像即可生成具有多对象物理驱动动态的3D场景
- 开发粒子剪枝算法优化高斯核分布
- 提出 CMPM (Coupled Multiphase Point Method) 有效建模多相交互
- 谐波插值和高斯进化策略实现逼真流体渲染

**技术要点**:
- 3D Gaussian Splatting
- 多相流体模拟 (流体、橡胶、沙、雪等)
- 粒子剪枝算法
- CMPM 方法

**链接**: https://github.com/Elowen-surj/VersaGauss

---

#### 3. Physics-Grounded Fluid Video Generation with a Simulation Dataset and Dual-Stream Optical-Flow Supervision
- **arXiv**: [2607.25321](https://arxiv.org/abs/2607.25321)
- **日期**: 2026-07-28
- **分类**: 流体生成 / 视频扩散

**核心创新**:
- 解决视频扩散模型在涉及流体场景时违反基本物理的问题
- 引入双流光流监督
- 提供仿真数据集

**技术要点**:
- 视频扩散模型
- 物理约束
- 双流光流监督

---

## 现有知识库相关论文 (参考)

以下论文已在知识库中，与流体渲染相关:

| 论文 | 日期 | 关键词 |
|------|------|--------|
| Gaussian Fluids | 2025-07 | Gaussian 流体求解器 |
| FluidGaussian | 2026-03 | 模拟不确定性传播 |
| LagrangianSplats | 2026-05 | 无散度传输 |
| GauSmoke | 2026-07 | 烟雾重建 |
| VersaGauss | 2026-08 | 多相动力学 |
| Mixwell (Best Paper) | 2026 | 2D 流体画笔 |

---

## 搜索统计
- **搜索 API 调用**: 多次 (部分遇到频率限制)
- **发现论文**: 3 篇新论文
- **SIGGRAPH 2026 论文**: 1 篇 (GauSmoke)
- **arXiv 论文**: 2 篇

## 备注
- SIGGRAPH Asia 2026 (12月1-4日, 吉隆坡) 的论文列表尚未完全公布
- arXiv cs.GR 类别最近没有新的流体渲染相关提交
- 搜索 API 遇到频率限制 (429)，部分搜索受影响

## 下一步
- 持续关注 SIGGRAPH Asia 2026 论文公布
- 监控 arXiv cs.GR 每日更新
- 等待 GauSmoke 的完整 arXiv 链接
