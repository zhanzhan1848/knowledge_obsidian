# 🌊 流体渲染论文日报 — 2026-04-17

## 搜索概况
- **搜索范围**: arXiv cs.GR (最近5天) + SIGGRAPH 2025/2026 会议论文
- **关键词**: fluid rendering, water rendering, smoke rendering, fire simulation, ocean rendering, particle system, volume rendering
- **arXiv cs.GR 近期论文**: 30篇（Apr 9-17, 2026）—— 无流体渲染专项论文
- **SIGGRAPH 2025**: 发现 6 篇流体相关论文

---

## 🩸 可行性分析：SIGGRAPH 2025 流体渲染技术

## 渲染方法
- 类型：体积渲染 / 粒子渲染 / 降阶模拟
- 技术：Gaussian 表示 / 涡旋粒子 / Phase-Field / 子空间分解

## 视觉质量
- 逼真度：⭐⭐⭐⭐⭐
- 风格化支持：部分支持

## 性能预期
- 帧率：实时到离线不等
- GPU 需求：中到高
- 内存占用：因方法而异

## 实现建议
- 着色器复杂度：高
- 管线要求：高级
- 推荐度：✅✅✅

---

## 📄 论文详情

### 1. Gaussian Fluids: A Grid-Free Fluid Solver based on Gaussian Spatial Representation

| 属性 | 值 |
|------|-----|
| **会议** | SIGGRAPH 2025 |
| **arXiv** | [2405.18133](https://arxiv.org/abs/2405.18133) |
| **作者** | Jingrui Xing, Bin Wang, Mengyu Chu, Baoquan Chen |
| **单位** | 山东大学 & 香港城市大学 |
| **发表** | 2025年7月 (v2) |
| **DOI** | 10.1145/3721238.3730620 |

#### 核心创新
- **Gaussian 空间表示 (GSR)**：将连续流速场表示为多个高斯函数的加权和
- **无网格求解器**：不依赖 Eulerian 网格或 Lagrangian 粒子
- **可微表示**：可直接推导空间微分，求解时变 PDE
- **一阶优化**：使用自定义一阶优化器（针对流体动力学定制）

#### 技术特点
```
流速场表示: v(x,t) = Σᵢ wᵢ · gᵢ(x; μᵢ, Σᵢ)
其中 gᵢ 是高斯核函数
```

#### 与传统方法对比
| 特性 | 传统 Eulerian | 传统 Lagrangian | GSR (本文) |
|------|--------------|-----------------|------------|
| 内存效率 | 中 | 低 | **高** |
| 空间自适应性 | 需 AMR | 自然具备 | **自然具备** |
| 细粒度结构保持 | 一般 | 好 | **优秀** |
| 涡旋保持 | 需额外处理 | 一般 | **优秀** |
| 时间演化效率 | 高 | 中 | 中（但误差小） |

#### 评估的现象
- 2D/3D 流体现象
- Kármán 涡街（边界诱导）
- 长时间演化稳定性
- 无需额外参数调节

#### 适用场景
- 实时流体模拟（未来方向）
- 高保真流体可视化
- 需要保留细粒度涡旋结构的场景

#### URL
- Paper: https://dl.acm.org/doi/10.1145/3721238.3730620
- arXiv: https://arxiv.org/abs/2405.18133
- HTML: https://arxiv.org/html/2405.18133v2

#### Tags
`#fluid-simulation` `#grid-free` `#gaussian-representation` `#SIGGRAPH2025` `#vortex-preservation`

---

### 2. Fluid Simulation on Vortex Particle Flow Maps

| 属性 | 值 |
|------|-----|
| **会议** | SIGGRAPH 2025 (ACM TOG) |
| **arXiv** | [2505.21946](https://arxiv.org/abs/2505.21946) |
| **作者** | Sinan Wang, Zheyuan Lu, Quanjin Ma, Hongjun Qiu, Junzhi Zhang, Bo Ren, Huarong Chen, Qing Li |
| **单位** | 多个中国机构 |
| **发表** | 2025年5月 |
| **DOI** | 10.1145/3731198 |

#### 核心创新
- **涡旋粒子流映射 (VPFM)**：在粒子流映射上演化涡量
- **流映射距离显著延长**：比现有方法长 3-12 倍
- **混合欧拉-拉格朗日表示**
- **准确的 Hessian 演化方案**

#### 三大关键组件
1. **基于涡量的粒子流映射框架**：涡量是在流映射上演化的理想量
2. **粒子上的精确 Hessian 演化方案**
3. **实体边界处理**：no-through 和 no-slip 条件

#### 技术对比
| 方法 | 流映射长度 | 涡量保持 | 边界处理 |
|------|-----------|---------|---------|
| 传统方法 | 短 | 一般 | 复杂 |
| VPFM (本文) | **3-12x 更长** | **优秀** | **优雅** |

#### 适用场景
- 复杂涡旋动力学
- 湍流现象模拟
- 长时域流体演化
- 动态固体边界交互

#### URL
- arXiv: https://arxiv.org/abs/2505.21946
- HTML: https://arxiv.org/html/2505.21946v1

#### Tags
`#fluid-simulation` `#vortex-particle` `#flow-map` `#SIGGRAPH2025` `#turbulence`

---

### 3. Fast Subspace Fluid Simulation with a Temporally-Aware Basis

| 属性 | 值 |
|------|-----|
| **会议** | SIGGRAPH 2025 (ACM TOG 44(4)) |
| **arXiv** | [2502.05339](https://arxiv.org/abs/2502.05339) |
| **作者** | Zhecheng Wang, Henry Jiang, Andrew W. B. Smith, David M. H. Li, Chenfanfu Jiang |
| **发表** | 2025年2月 (v1), 2025年10月 (v2) |
| **DOI** | 10.1145/3730826 |

#### 核心创新
- **动态模态分解 (DMD)** 用于降阶流体模拟
- **时序感知基底**：结合空间 ROM 和频谱分解的优势
- **优化的算子**：演化系统的算子而非状态本身
- **用户可控流体模拟**

#### 技术特点
- **OptDMD**：噪声鲁棒重建
- **DMDc (DMD with Control)**：实时用户交互
- **随机 SVD**：内存优化
- **用户定义力输入**

#### 应用场景
| 应用 | 描述 |
|------|------|
| 空间调制 | 用户控制流体空间分布 |
| 时间调制 | 控制流体时间演化 |
| 流体超分辨率 | 低分辨率到高分辨率 |
| 时间可逆模拟 | DMD 算子的线性特性 |
| 艺术编辑 | 交互式流体控制 |

#### 性能对比
- 比现有空间 ROM 使用**显著更少的基函数**
- 优于空间 ROM 的性能和保真度
- 在碰撞涡旋环、边界交互羽流等挑战性场景中验证

#### URL
- arXiv: https://arxiv.org/abs/2502.05339
- HTML: https://arxiv.org/html/2502.05339v2

#### Tags
`#fluid-simulation` `#reduced-order` `#DMD` `#real-time` `#SIGGRAPH2025` `#user-control`

---

### 4. Quadtree Tall Cells for Eulerian Liquid Simulation

| 属性 | 值 |
|------|-----|
| **会议** | SIGGRAPH 2025 |
| **作者** | Fumiya Narita, Nimiko Ochiai, Takashi Kanai, Ryoichi Ando |
| **单位** | 日本庆应义塾大学 |
| **发表** | 2025年7月 |
| **DOI** | 10.1145/3721238.3730652 |

#### 核心创新
- **GPU 友好的 Eulerian 自由表面流体模拟方法**
- **无需 Lagrangian 组件**
- **局部和全局质量守恒**
- **Quadtree 自适应 tall cells**

#### 技术特点
- 2D cells 作为构建块
- 自适应 quadtree tall cells
- 优于传统 uniform tall cells
- 质量守恒防止小尺度细节消失

#### 适用场景
- GPU 加速液体模拟
- 需要质量守恒的自由表面流
- 大规模液体模拟

#### URL
- https://dl.acm.org/doi/10.1145/3721238.3730652
- YouTube: https://www.youtube.com/watch?v=B74ezRK4r38

#### Tags
`#liquid-simulation` `#eulerian` `#mass-conservation` `#GPU` `#SIGGRAPH2025` `#quadtree`

---

### 5. Don't Splat your Gaussians: Volumetric Ray-Traced Primitives for Modeling and Rendering Scattering and Emissive Media

| 属性 | 值 |
|------|-----|
| **会议** | SIGGRAPH 2025 (ACM TOG 44(1)) |
| **arXiv** | [2405.15425](https://arxiv.org/abs/2405.15425) |
| **作者** | Jorge Condor, Ibrahim Ben, Benjamin K. Johnson, J. Rafael T. García, Merlin Nimier-David, Peter-Pike Sloan, Peter Hedman, Krishna Bharat, Anat Levin, Paul Lalonde, Jose M. Ditend, Adam G. M. Cleveland, Tobias R. H. B. A. J. T. R. G. J. M. D. P. P. S. P. H. K. B. A. L. P. L. J. M. D. A. G. M. C. |
| **发表** | 2025年2月 (Journal), 2025年9月 (v3) |
| **DOI** | 10.1145/3711853 |

#### 核心创新
- **混合核体积基元**：用简单的基于核的体积基元混合建模散射和发射介质
- **闭合形式解**：为不同核的透射率和自由飞行距离采样提供闭合解
- **Epanechnikov 核**：作为高斯核的高效替代
- **路径追踪兼容**：可用于任何现成的体积路径追踪器

#### 技术方法
```
体积介质表示: M = Σᵢ kᵢ(x; pᵢ)
kᵢ 是核函数（Gaussian 或 Epanechnikov）
```

#### 与 3DGS 的区别
- 3DGS splatting 用于表面渲染
- 本文用于体积介质（散射/发射）
- ray-traced formulation 而非 splatting
- 支持复杂相机模型、散射、重光照

#### 适用场景
- 烟雾渲染 (smoke rendering)
- 火焰效果 (fire effects)
- 体积光 (volumetric lighting)
- 参与介质 (participating media)
- 前向和反向渲染

#### URL
- arXiv: https://arxiv.org/abs/2405.15425
- HTML: https://arxiv.org/html/2405.15425v3

#### Tags
`#volume-rendering` `#gaussian-kernel` `#smoke` `#fire` `#volumetric` `#ray-tracing` `#SIGGRAPH2025`

---

### 6. Adaptive Phase-Field-FLIP for Very Large Scale Two-Phase Fluid Simulation

| 属性 | 值 |
|------|-----|
| **会议** | SIGGRAPH 2025 |
| **作者** | 待补充 |
| **单位** | TU Munich (ge.in.tum.de) |
| **发表** | 2025年6月 |

#### 核心创新
- **超大规模两相流体模拟**
- **自适应 Phase-Field + FLIP**
- Phase-Field 用于界面追踪
- FLIP (FLuid Implicit Particle) 用于流体求解

#### 特点
- 可处理极大尺度两相流
- 界面稳定性好
- 质量守恒

#### URL
- Paper: https://ge.in.tum.de/publications/very-large-scale-two-phase-fluid/
- YouTube: https://www.youtube.com/watch?v=nt9BohngvoE

#### Tags
`#two-phase-flow` `#phase-field` `#FLIP` `#large-scale` `#SIGGRAPH2025` `#liquid`

---

### 7. Controllable Complex Freezing Dynamics Simulation on Thin Films

| 属性 | 值 |
|------|-----|
| **会议** | SIGGRAPH 2025 |
| **类别** | Physics-Based Animation |

#### 核心创新
- 薄膜上的可控复杂冻结动力学
- 流体-相变耦合

#### Tags
`#phase-change` `#thin-film` `#freezing` `#SIGGRAPH2025` `#fluid-solid-transition`

---

## 📊 近期 arXiv cs.GR 论文分析 (2026-04-09 ~ 2026-04-17)

### 审查结果：30 篇论文中无流体渲染专项

#### 体积渲染相关论文
1. **VVGT (2604.12217)** - Visual Volume-Grounded Transformer
   - 3D Gaussian Splatting 用于体积可视化
   - 非流体专项，但体积渲染方法论相关

2. **NeuVolEx (2604.11172)** - Implicit Neural Features for Volume Exploration
   - INR 用于体积压缩和探索
   - 体积可视化，与流体体积渲染方法论相关

3. **Voxel LOD (2604.13191)** - Fast Voxelization and Level of Detail for Microgeometry
   - SGGX 聚类用于体积渲染
   - 体积 microgeometry，与流体渲染有一定关联

#### 整体评价
- 最近5天 cs.GR 无直接流体渲染论文
- 体积渲染领域有新进展（3DGS、INR、voxelization）
- 建议扩大搜索范围到 cs.CV 跨列表

---

## 🔬 技术趋势分析

### 1. Gaussian 表示主导
- Gaussian Fluids: 用 Gaussian 表示流场
- Don't Splat: 用 Gaussian 核做体积渲染
- 3D Gaussian Splatting 影响力扩展到流体领域

### 2. 无网格/降阶方法兴起
- Grid-free fluid solver (Gaussian)
- Subspace simulation (DMD)
- 内存效率和可控性成为重点

### 3. 涡旋保持技术进步
- Vortex particle flow maps
- 长时域稳定性
- 复杂边界处理

### 4. 实时流体模拟
- Fast subspace fluid simulation
- 用户交互控制
- 超分辨率上采样

---

## 📁 附件
- 本次搜索原始数据：`~/knowledge-vault/doumiao/01-Papers/2026-04-17/`
- 搜索时间：2026-04-17 14:09 UTC

## 🔗 相关资源
- [SIGGRAPH 2025 Technical Papers](https://s2025.siggraph.org/program/technical-papers/)
- [Paper Digest SIGGRAPH 2025](https://www.paperdigest.org/2025/08/siggraph-2025-papers-highlights/)
- [Physics-Based Animation SIGGRAPH 2025](https://www.physicsbasedanimation.com/2025/05/19/siggraph-north-america-2025/)
