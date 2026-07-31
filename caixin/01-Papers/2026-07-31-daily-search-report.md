# 每日论文搜索报告

**日期**: 2026-07-31
**搜索范围**: arXiv physics.flu-dyn, cs.FL (最近24-48小时)
**关键词**: CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence

---

## 搜索结果统计

| 类别 | 数量 |
|------|------|
| physics.flu-dyn 新论文 | ~22 篇 |
| cs.FL 新论文 | ~6 篇 |
| 筛选相关论文 | 10 篇 |
| 创建笔记 | 10 篇 |

---

## 新增论文列表

### 1. 随机流体力学
| 论文 | arXiv ID | 标签 |
|------|----------|------|
| Compressible solved-volatility stochastic fluid thermodynamics | 2607.28333 | stochastic-fluid, thermodynamics |
| Gaussian non relativistic spontaneously stochastic hydrodynamics | 2607.27540 | stochastic-hydrodynamics, RG |

### 2. 湍流与LES
| 论文 | arXiv ID | 标签 |
|------|----------|------|
| Modified Dynamic Mixed SGS Models for Geophysical Flows | 2607.27567 | LES, SGS-model, backscatter |
| Disentangling intermittent flow structure contributions to anomalous scaling | 2607.26896 | turbulence, intermittency, multifractal |

### 3. 网格与数值方法
| 论文 | arXiv ID | 标签 |
|------|----------|------|
| Mesh Adaptation on Hybrid Unstructured Meshes for IBM | 2607.27580 | mesh-adaptation, immersed-boundary |
| Kinetic Linear Stability Theory for Compressible Flows | 2607.27440 | kinetic-theory, shock-wave, HPC |

### 4. 粒子与多相流
| 论文 | arXiv ID | 标签 |
|------|----------|------|
| Role of gravity on preferential clustering of microparticles | 2607.27459 | particle-turbulence, DNS, void-structure |
| Learning Backward Transport for Source Localization | 2607.26892 | source-localization, Schrödinger-bridge |

### 5. 对流与热传导
| 论文 | arXiv ID | 标签 |
|------|----------|------|
| Thermal convection in 1, 2, 3 and 4 dimensions | 2607.26372 | thermal-convection, DNS, JFM upcoming |

### 6. AI + CFD
| 论文 | arXiv ID | 标签 |
|------|----------|------|
| Generative Diffusion Model for 3D Turbomachinery Design | 2607.27093 | generative-AI, diffusion-model, inverse-design |

---

## 重点论文摘要

### 🥇 高影响力论文

#### Compressible solved-volatility stochastic fluid thermodynamics (2607.28333)
- **创新点**: 将随机粒子路径方法扩展到可压缩 Navier-Stokes-Fourier 方程
- **方法**: 有限相关储层 + Green-Kubo 标定
- **意义**: 为随机流体力学提供严格的低 Mach 数极限

#### Kinetic Linear Stability Theory for High-Speed Compressible Flows (2607.27440)
- **创新点**: 首次将 Boltzmann-BGK 动力学理论应用于激波线性稳定性分析
- **方法**: kLST + HPC 并行特征值求解
- **意义**: 揭示高速激波中连续介质假设的局限性

#### Disentangling intermittent flow structure contributions (2607.26896)
- **创新点**: 使用 Biot-Savart 反演选择性移除间歇性效应
- **方法**: 涡量阈值化 + 滤波速度场分析
- **意义**: 定量揭示间歇性涡旋对反常标度和多重分形的贡献

### 🥈 技术创新论文

#### Modified Dynamic Mixed SGS Models (2607.27567)
- 提出 Gram-based 框架平衡 LES 中结构-功能分量
- 顺序耦合策略改善长期准确性

#### Mesh Adaptation for Immersed Boundary Methods (2607.27580)
- 混合非结构化网格的自适应策略
- 支持多部件工业应用

---

## 知识库更新

```
caixin/01-Papers/
├── 2026-07-31-compressible-solved-volatility-stochastic-fluid-thermodynamics.md
├── 2026-07-31-mesh-adaptation-immersed-boundary-methods.md
├── 2026-07-31-modified-dynamic-mixed-sgs-models-geophysical-turbulence.md
├── 2026-07-31-gaussian-nonrelativistic-stochastic-hydrodynamics.md
├── 2026-07-31-generative-diffusion-turbomachinery-design.md
├── 2026-07-31-intermittent-flow-anomalous-scaling-turbulence.md
├── 2026-07-31-gravity-preferential-clustering-microparticles.md
├── 2026-07-31-kinetic-linear-stability-theory-compressible-flows.md
├── 2026-07-31-learning-backward-transport-source-localization.md
├── 2026-07-31-thermal-convection-1-2-3-4-dimensions.md
└── 2026-07-31-daily-search-report.md
```

---

## 趋势观察

### 本次搜索的主要趋势
1. **随机流体力学**：多篇关于随机方法和统计力学的论文，连接湍流理论
2. **AI + CFD 融合**：生成式扩散模型用于叶轮机械设计
3. **LES 亚网格模型**：改进的反向散射和耗散平衡
4. **动力学理论**：Boltzmann 方法应用于高速流动稳定性

### 值得关注的方向
- 随机 PDE 在 CFD 中的应用
- 高阶矩方法与 kinetic theory 结合
- 生成式 AI 在流体设计中的应用

---

*报告生成时间: 2026-07-31 14:10 UTC*
*Agent: 鲜毛肚 (Xianmaodu) | 流体力学专家*
