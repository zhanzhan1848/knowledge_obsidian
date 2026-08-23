# 📅 每日流体渲染论文速览 - 2026-08-23

## 搜索摘要
- **搜索时间**: 2026-08-23 14:00 UTC
- **搜索范围**: arXiv cs.GR (最近7天) + SIGGRAPH 2026
- **关键词**: fluid rendering, water rendering, smoke rendering, fire simulation, ocean rendering, particle system, volume rendering
- **结果**: 本周 cs.GR 无直接流体渲染新论文，发现1篇流体动力学神经算子论文；SIGGRAPH 2026 发现 LBM 流体模拟相关演讲

---

## 🔬 相关论文

### 1. From Fixed Grids to Moving Particles: A Transferable Latent Operator for Fluid Dynamics

| 属性 | 内容 |
|------|------|
| **arXiv** | [2608.14120](https://arxiv.org/abs/2608.14120) |
| **作者** | Huaxi Huang et al. |
| **分类** | cs.LG / cs.GR |
| **日期** | 2026-08-14 (v2: 2026-08-17) |
| **会议** | Preprint |

#### 核心创新点

**问题**: 大多数神经算子仅在欧拉表征下训练和评估，但拉格朗日轨迹（粒子追踪）在流体动力学中同样重要。如何实现从欧拉场预测到拉格朗日粒子rollout的零样本迁移？

**方案**: 提出 **Transferable Latent Operator (TLO)**，学习统一流场表示，同时支持：
- **欧拉场预测**: 在固定空间坐标查询隐式表示 → 获得欧拉场
- **拉格朗日rollout**: 在粒子位置查询速度，递归更新粒子位置

#### 技术要点

- **解耦设计**: 将隐式流场演化与坐标相关解码分离
- **统一表示**: 同一隐式表示既可用于欧拉预测，也可用于粒子追踪
- **零样本迁移**: 仅在欧拉观测上训练的模型可泛化到拉格朗日粒子rollout
- **微调增益**: 有限拉格朗日微调可进一步提升性能

#### 实验结果
在5个流体动力学基准上，TLO 在欧拉场预测和零样本拉格朗日rollout均超越现有神经算子。

#### 渲染相关启示
- 粒子系统与欧拉网格的统一表示可用于混合流体渲染管线
- 神经算子方法可能用于快速流体模拟 → 实时渲染

#### BibTeX
```bibtex
@article{huang2026tlo,
  title={From Fixed Grids to Moving Particles: A Transferable Latent Operator for Fluid Dynamics},
  author={Huang, Huaxi et al.},
  journal={arXiv:2608.14120},
  year={2026}
}
```

---

### 2. SIGGRAPH 2026: Fluid Simulation with the Lattice Boltzmann Method

| 属性 | 内容 |
|------|------|
| **来源** | SIGGRAPH 2026 Technical Sessions |
| **讲者** | Kui Wu (LightSpeed Studios) |
| **领域** | 流体模拟 |

#### 核心内容

LBM (Lattice Boltzmann Method) 作为传统求解器的 GPU 友好替代方案：
- 工业模拟、游戏制作、可视化特效应用
- GPU 并行友好，适合实时模拟

#### 相关性
- LBM 可用于烟雾/火焰等体积效果模拟
- GPU 友好特性 → 适合游戏/实时应用

---

## 📊 近期 arXiv cs.GR 论文分类 (非流体渲染但相关)

| arXiv ID | 标题 | 关键词 |
|----------|------|--------|
| 2608.17390 | Six Ways to Draw Vangers with WebGPU | Height Field Ray Marching, 地形渲染 |
| 2608.17298 | 3D Gaussian Accelerated Ray Tracing | 粒子反向传播, 3DGS |
| 2608.15934 | Differentiable Voxelization of Surface Representations | SIGGRAPH 2026, 体素化 |
| 2608.14409 | Uncertainty-Aware Jacobi Set Computation | 流体动力学应用 |

---

## 🔍 观察与趋势

1. **神经流体模拟**: TLO 等工作将神经算子扩展到拉格朗日粒子领域
2. **GPU 流体**: LBM 方法在 SIGGRAPH 受到关注，GPU 友好是重点
3. **可微体素化**: SIGGRAPH 2026 论文涉及表面-体素转换，与体积渲染相关
4. **3DGS + 流体**: 3D Gaussian Splatting 的光线追踪加速与粒子系统结合

---

## 📁 文件信息
- **创建时间**: 2026-08-23 14:00 UTC
- **搜索源**: arXiv cs.GR, SIGGRAPH 2026
- **下一步**: 持续关注本周新提交
