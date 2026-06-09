# MARUT: An Exascale-Ready, GPU-Accelerated High-Order CFD Framework with AMR for High-Speed Flows and Finite-Rate Chemistry

> 日期: 2026-06-09
> 来源: arXiv (arXiv:2605.26388)
> 搜索关键词: CFD, GPU, AMR, high-speed flow, finite-rate chemistry, compressible flow

---

## 基本信息
- **arXiv ID:** 2605.26388
- **作者:** Ameya Jagtap et al.
- **领域:** 计算流体动力学 / GPU加速

---

## 核心创新

### 系统目标
- 可扩展的多 GPU 计算流体动力学框架
- 高保真模拟可压缩流（亚音速到高超声速）
- 化学反应非平衡流（有限速率化学）
- 自适应网格细化 (AMR)

### 技术架构
1. **分布式内存 MPI 并行基础设施**
2. **原生 NVIDIA GPU 实现**
3. **高阶谱间断伽辽金离散化 (Spectral Discontinuous Galerkin)**
4. **强稳定性保 Runge-Kutta 时间积分**
5. **动态 AMR**

### 技术细节
- **方法:** 间断伽辽金 (DG)、AMR、MPI + GPU
- **物理:** 可压缩流、化学反应流、多物种非平衡化学
- **性能:** 近线性强扩展（多 GPU）

### 验证案例
- 亚音速、跨音速、超音速、高超声速配置
- 多物种非平衡化学
- 与参考解高度一致

---

## URL
https://arxiv.org/abs/2605.26388

---

## 关键词标签
#CFD #GPU-accelerated #AMR #high-speed-flow #finite-rate-chemistry #discontinuous-Galerkin