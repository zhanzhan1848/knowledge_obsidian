# 每日流体渲染研究摘要 - 2026-05-31

## 搜索范围
- **arXiv cs.GR**: 最近一周（5月25日 - 5月31日）
- **SIGGRAPH 2026**: 技术论文
- **关键词**: fluid rendering, water rendering, smoke rendering, fire simulation, ocean rendering, particle system, volume rendering

---

## 📄 直接相关论文

### 1. FD-Bench: A Modular and Fair Benchmark for Data-driven Fluid Simulation
- **arXiv**: [2505.20349](https://arxiv.org/abs/2505.20349)
- **分类**: Fluid Simulation Benchmark
- **会议**: KDD 2026
- **作者**: Haixin Wang et al.
- **摘要**: 数据驱动流体模拟的统一基准测试平台。评估85个 baseline 模型在10个代表性流动场景下的表现，提供模块化设计、直接与数值求解器比较的框架、细粒度泛化分析。
- **创新点**:
  - 模块化设计（空间、时间、损失函数解耦）
  - 首个与数值求解器直接对比的框架
  - 覆盖分辨率、初始条件、时间窗口的泛化分析
- **链接**: [GitHub](https://github.com/WillDreamer/FD-Bench)
- **标签**: #fluid-simulation #benchmark #neural-pde #data-driven

---

### 2. Learning View-Dependent Splatting Kernels
- **arXiv**: [2605.25426](https://arxiv.org/abs/2605.25426)
- **分类**: Volume Rendering / Gaussian Splatting
- **会议**: SIGGRAPH 2026
- **作者**: Huakeng Ding
- **摘要**: 提出可微分框架自动学习视依赖的2D核函数用于 splatting 流程，提升新视角合成的重建质量和表示效率。
- **创新点**:
  - 边界椭球体 + 3D核潜在向量作为体积基元
  - 学习投影网络输出2D核潜在向量
  - 基于马氏距离的径向对称2D核
- **标签**: #gaussian-splatting #novel-view-synthesis #SIGGRAPH2026

---

### 3. Depth Peeling for High-Fidelity Gaussian-Enhanced Surfel Rendering
- **arXiv**: [2605.25345](https://arxiv.org/abs/2605.25345)
- **分类**: Rendering
- **作者**: Keyang Ye
- **摘要**: DP-GES 通过深度剥离增强不透明 surfels，支持精确的逐像素排序，消除锯齿和 popping 伪影。
- **创新点**:
  - 半透明边界 + 深度剥离
  - 无排序高斯 splatting
  - 正确的透射率调制
- **标签**: #gaussian-splatting #rendering #aliasing

---

### 4. YASPS: A Symbolic Framework for Extensible, High-Performance IPC Simulation
- **arXiv**: [2605.23088](https://arxiv.org/abs/2605.23088)
- **分类**: Physical Simulation / IPC
- **会议**: SIGGRAPH 2026
- **作者**: Xuan Tang
- **摘要**: GPU 导向的可扩展 IPC (Incremental Potential Contact) 模拟框架，使用 JOIN/UNION 运算符实现符号化可微中间表示。
- **创新点**:
  - 关系型 JOIN/UNION 运算符
  - 结构感知块稀疏存储和压缩
  - JIT 编译 CUDA 内核
  - Hessian 压缩实现近10倍 CG 迭代加速
- **标签**: #IPC #cloth-simulation #GPU #SIGGRAPH2026

---

### 5. ClothTransformer: Unified Latent-Space Transformers for Scalable Cloth Simulation
- **arXiv**: [2605.27852](https://arxiv.org/abs/2605.27852)
- **分类**: Cloth Simulation / Deep Learning
- **作者**: Yu Zhang
- **摘要**: 将 cloth 模拟重新定义为潜在空间中的自回归序列建模，使用统一 Transformer 架构处理服装、机器人操控、自由下落碰撞等多样化场景。
- **创新点**:
  - 统一 Transformer 处理多种场景（4-9倍误差降低）
  - 可扩展潜在空间公式（任意分辨率网格压缩为固定大小潜在 token）
  - 穿透-free CCD 模块
  - ~493.4k 帧高质量数据集
- **标签**: #cloth-simulation #transformer #latent-space

---

### 6. Closing Trajectories: Equation-Free Cyclic Animation via Koopman Surrogates
- **arXiv**: [2605.23462](https://arxiv.org/abs/2605.23462)
- **分类**: Animation / Physics-based
- **作者**: Siyuan Chen
- **摘要**: 方程无关框架，从观测轨迹识别 Koopman 代理，通过傅里叶参数化时变控制力计算循环轨迹（硬时间周期约束）。
- **应用场景**: N体系统、cloth、可变形物体、**浅水**等
- **标签**: #cyclic-animation #Koopman #physics-simulation

---

### 7. Enabling Real-Time Training of a Wildfire-to-Smoke Map with Multilinear Operators
- **arXiv**: [2605.04164](https://arxiv.org/abs/2605.04164)
- **分类**: Smoke Simulation / Wildfire
- **作者**: Zachary Morrow
- **摘要**: 使用数据驱动多线性算子从点火时间预测烟雾浓度场，支持 aerosol optical depth 和烟雾检测。
- **性能**: CPU上训练<30秒，单次前向传播<1ms
- **标签**: #smoke-simulation #wildfire #data-driven

---

## 📋 相关但不直接属于流体渲染的论文

| 论文 | 分类 | 备注 |
|------|------|------|
| F-RNG: Feed-Forward Relightable Neural Gaussians | Rendering | 可光照编辑的3DGS |
| Garment Particles | Cloth/Garment | 5D点云表示 |
| AnySurf | Surface Generation | 开放表面生成 |

---

## 🔍 搜索结论

本周 arXiv cs.GR 领域（5月25日-31日）共42篇论文，**直接涉及流体渲染的论文较少**。主要发现：

1. **流体模拟基准测试** (FD-Bench) - KDD 2026，评估85个数据驱动模型
2. **SIGGRAPH 2026 相关**:
   - Gaussian Splatting 改进 (View-Dependent Kernels, DP-GES)
   - IPC 物理模拟框架 (YASPS)
3. **烟雾相关**:野火烟雾预测 (2605.04164)

**待跟进**:
- SIGGRAPH 2026 完整论文列表（尚未公布）
- 关注 FD-Bench 后续与渲染方法的结合

---

## 📅 下次搜索计划
- 2026-06-01 02:00 UTC
- 重点关注: SIGGRAPH 2026 论文列表
- 扩大关键词: neural rendering, volume, particle, water surface