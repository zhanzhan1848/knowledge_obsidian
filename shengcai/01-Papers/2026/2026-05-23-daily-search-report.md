---
title: 2026-05-23 Daily Search Report
date: 2026-05-23
tags: [rendering, daily-search, 2026]
status: complete
---

# 🥬 每日渲染论文搜索报告 - 2026-05-23

## 搜索概况
- **搜索时间**: 2026-05-23 14:00 UTC
- **搜索范围**: 最近24小时
- **关键词**: ray tracing, path tracing, real-time rendering, global illumination, PBR, rasterization, BVH, ray marching
- **数据源**: arXiv cs.GR, SIGGRAPH 2026, ACM Digital Library

## 📰 arXiv 新论文

### 1. Power Foam: Unifying Real-Time Differentiable Ray Tracing and Rasterization
- **arXiv**: [2604.24994](https://arxiv.org/abs/2604.24994)
- **作者**: Daniel Rebain, Dor Verbin, Kwang Moo Yi, Anish Prabhu, Andrea Tagliasacchi (Simon Fraser University, UBC, Google DeepMind, U of Toronto)
- **日期**: 2026-04

**核心贡献**:
1. 提出 Bounded Power Diagrams，可控单元范围，兼顾光线追踪和光栅化效率
2. 引入有向表面建模 (Oriented Surface Formulation)，显式区分内部/外部区域
3. 几何与外观解耦，在表面上嵌入可微分纹理

**技术方案**: 
- 将 Voronoi foam 泛化为受限幂图 (restricted power diagram)
- 每个站点参数化为可控半径的加权 α-complex
- 常数时间光线遍历 + 高效 tile-based 光栅化

**初步评估**:
- 创新性：⭐⭐⭐⭐⭐ (统一两种渲染范式)
- 实用性：⭐⭐⭐⭐ (保留 SOTA 效率)
- 难度：中高

---

### 2. Mochi: Rethinking Collision Detection on GPU Ray Tracing Architecture
- **arXiv**: [2604.23520](https://arxiv.org/abs/2604.23520)
- **作者**: Durga Mandarapu, Isaac Fuksman, Artem Pelenitsyn, Gilbert Bernstein, Milind Kulkarni (Purdue, UW)
- **会议**: ICS 2026
- **日期**: 2026-04

**核心贡献**:
1. 利用碰撞关系的对称性重构 DCD，仅需一个物体检测碰撞
2. 引入 per-object proxy spheres，解耦 BVH 包围盒与碰撞搜索半径
3. 支持均匀和非均匀球体的高效碰撞检测

**技术方案**:
- 利用 GPU 射线追踪架构加速 BVH 遍历
- 更紧致的包围盒减少不必要的相交测试
- 数学可证明的正确性保证

**初步评估**:
- 创新性：⭐⭐⭐⭐ (新型归约方法)
- 实用性：⭐⭐⭐⭐ (粒子模拟实用)
- 难度：中

---

### 3. RadioGS: Radiometrically Consistent Gaussian Surfels for Inverse Rendering
- **arXiv**: [2603.01491](https://arxiv.org/abs/2603.01491)
- **作者**: Kyu Beom Han, Jaeyoon Kim, Woo Jae Kim, Jinhwan Seo, Sung-Eui Yoon (KAIST)
- **日期**: 2026-03

**核心贡献**:
1. 提出 Radiometric Consistency Loss，物理约束从未观测方向监督 Gaussian 原语
2. 使用 Gaussian Surfels 和 2D Gaussian Ray Tracing 的逆渲染框架
3. 快速微调重光照策略，渲染时间 <10ms

**技术方案**:
- 通过最小化学习辐射率与物理渲染辐射率的残差进行自纠正
- 准确建模间接光照和 inter-reflection
- 新颖视图合成 + 物理渲染的联合监督

**初步评估**:
- 创新性：⭐⭐⭐⭐⭐ (新物理约束)
- 实用性：⭐⭐⭐⭐⭐ (高效逆渲染)
- 难度：高

---

### 4. BVH-Accelerated Ray Tracing for High-Frequency Electromagnetic Backscattering
- **arXiv**: [2604.09243](https://arxiv.org/abs/2604.09243)
- **作者**: Marco Pasquale, Andong Hu, Luca Pennati, Ivy Peng, Stefano Markidis (KTH)
- **日期**: 2026-04-10

**核心贡献**:
1. 将 BVH 加速结构应用于高频电磁散射计算
2. 结合几何光学射线传输与物理光学面积分
3. GPU 并行化 (NVIDIA/AMD) + MPI 分布式

**技术方案**:
- Shooting and Bouncing Rays (SBR) 方法
- BVH 减少大规模射线-表面相交搜索空间
- 验证了 PEC 球体的解析 Mie 解和飞机几何的雷达截面预测

**初步评估**:
- 创新性：⭐⭐⭐ (应用导向)
- 实用性：⭐⭐⭐⭐ (GPU 加速实用)
- 难度：中

---

## 🏆 SIGGRAPH 2026 获奖论文

### Best Papers

**Inverse Rendering for Discrete X-Ray Computed Tomography**
- 基于梯度的离散断层扫描方法
- 每个体素建模为已知材料的概率分布
- 支持散射，在稀疏和有限角度场景表现优异
- 作者: Lovro Nuic, Ziyi Zhang, Korbinian Sager, Wenzel Jakob

**Walk on Decomposed Subdomains: Hybrid Monte Carlo-Deterministic Solver for Elliptic PDEs**
- 混合蒙特卡洛-确定性求解器
- 区域分解为简单子域，蒙特卡洛估计局部算子
- 无需体网格生成，低方差解

**Spatio-Temporal Control Variates with ReSTIR for Real-Time Rendering**
- 时空控制变量 + ReSTIR
- 实时渲染噪声减少

---

### Honorable Mentions (渲染相关)

**Photons × Force: Differentiable Radiation Pressure Modeling**
- 可微分辐射压力建模
- 耦合光子与力学

**Sample Matching for Joint Extinction Gradient Estimation in Differentiable Volume Rendering**
- 联合消光梯度估计
- 可微分体积渲染

---

## 📊 搜索统计

| 类别 | 数量 |
|------|------|
| arXiv cs.GR 新论文 | 4+ |
| SIGGRAPH 2026 Best Papers | 5 |
| Honorable Mentions | 10+ |
| 总计 | 20+ |

## 🔬 渲染领域趋势

1. **统一渲染范式**: Power Foam 试图统一光线追踪和光栅化
2. **Gaussian Splatting 持续火热**: RadioGS, GRTX 等不断涌现
3. **GPU 架构利用**: Mochi 等工作挖掘 GPU 射线追踪架构的计算潜力
4. **可微分渲染**: 物理约束、可微体积渲染持续进展
5. **逆渲染**: 从 NeRF 到 Gaussian 的逆渲染方法不断完善

## 📝 已创建笔记

- `2026-05-23-Power-Foam-Unifying-Ray-Tracing-Rasterization.md`
- `2026-05-23-Mochi-Collision-Detection-GPU-Ray-Tracing.md`
- `2026-05-23-RadioGS-Radiometrically-Consistent-Gaussian-Surfels.md`
- `2026-05-23-BVH-Accelerated-Ray-Tracing-EM-Backscattering.md`
- `2026-05-23-SIGGRAPH-2026-Awards-Summary.md`

## ⏭️ 下一步

- 深入分析各论文技术细节
- 评估实现可行性
- 传递给 @墨鱼丸 进行算法设计