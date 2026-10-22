---
tags: [几何, 几何多重网格, 四面体网格, 重心坐标延拓, Petrov-Galerkin, XPBD, 体积肌肉, 四面体重网格, 物理仿真]
date: 2026-10-22
source: arXiv
arxiv_id: 2610.30033
venue: cs.GR (2026-10-21 submission)
status: new
authors: Chunlei Li, Siyuan Yu, Yang Gao, Shuai Li, Peng Yu, Aimin Hao, He Wang
affiliations: 北航大学, 西湖大学, 伦敦大学学院 (UCL)
project_page: https://chunleili.github.io/project-page-rlmuscle/
---

# RLMuscle: Muscle-Driven Character Animation via Reinforcement Learning

## 一句话总结

用 **RL 在 1D Hill 肌肉代理模型上学出激活度**，再把同一套 **Hill–Millard 本构律**注入 **3D 体积四面体 XPBD 求解器**（其核心是一个新的**四面体网格几何多重网格 / Petrov–Galerkin V-cycle**），从而在 468k 四面体规模上实现 194 块肌肉、单卡 RTX 4090 上 **18 ms/帧** 的自动肌肉驱动角色动画。

> 24h 窗口内 cs.GR 唯一一篇几何处理相关论文，但**几何贡献含量很高**（几何多重网格 + 四面体重网格管线），收录为今日首选。

---

## 核心贡献（3 项）

### 贡献 1：1D 控制与 3D 仿真的**统一本构律解耦**
- RL 控制环**只跑 1D Hill 代理**（284 条 1D Hill 肌肉），用 MASS 式双网络 π_φ（策略）+ μ_θ（肌肉网络）在**单个 PPO 环内联合训练**
- 3D 体积求解器**完全移出控制环**，推理时只做**一次前向仿真**
- 关键设计：**1D 与 3D 共用同一个 Hill 力-长律** → 「产生运动的激活」与「产生形变的激活」在物理上严格一致
- 对比失败方案：Lee et al. 把体积求解器放进优化环 → **极不稳定、从不收敛**（本文实测）；3D 体积肌肉因自由度过多导致 RL 训练不稳定

### 贡献 2：EMG 生理先验消除激活冗余
- activation→torque 映射**冗余且欠定**，既有工作（MASS/MuscleVAE/MAGNET/MuscleMimic）仅用 torque + effort 消冗余，解会漂离真实人体募集模式
- 注入实测 surface **EMG 包络**到肌肉网络 loss（按协同肌群匹配、折叠到共同步态周期）
- `Ψ_emg = Σ_c w_emg,c (ā_c − s·ê_c(φ))²`，λ=1, s=0.3, w=1；包络取 13 被试 Moreira 队列均值、101 bin 步态栅格
- 只作用于肌肉网络 loss，**不改动策略的运动目标** → 只重选「哪个激活实现该运动」，不改变运动本身
- 无实测包络的动作（kick/swim/squat）时 λ=0 关闭

### 贡献 3：**Petrov–Galerkin 几何多重网格 XPBD**（几何处理核心）⭐
- 解决 HPBD 的两个局限：① 面向 **cloth** 而非四面体网格；② **不闭合完整 V-cycle**，实质只是低分辨率驱动
- 解决 MGPBD（作者前作，代数多重网格）的局限：需**组装全局矩阵**，丧失 XPBD 局部逐约束求解的轻量性，且缺乏几何/物理直觉
- **几何粗化流程**：细表面三角网格 → 轻微膨胀 → remesh 到更粗三角网格 → 四面体化，得到**粗四面体「笼」（cage）**
- 细网格 468,162 四面体 ← 粗笼 31,044 四面体

---

## 技术方案：几何多重网格细节 ⭐⭐

### 层级构造（几何粗化）
```
细四面体网格 M^f (468k tets)
   │  ① 表面三角形网格轻微 inflate（避免塌缩退化）
   │  ② remesh → 粗三角形网格
   │  ③ 四面体化
   ▼
粗四面体「笼」M^c (31k tets)
```
**核心洞察**：粗四面体充当「笼」，通过重心坐标**控制细顶点的运动**。

### 延拓（Prolongation）：重心坐标
$$\mathbf{x}^f = \mathbf{x}^f_0 + \sum_{i=1}^{4} w_i\, \Delta\mathbf{x}^c_i$$

- $w_1..w_4$ 为细顶点相对粗四面体的**重心坐标**，$w_4 = 1 - \sum_{i=1}^{3} w_i$
- 每个四面体的 4 个权重定义 **P 的一行**（matrix-free）
- 与 HPBD 一致：**延拓的是粗修正量 Δx^c，而非粗解 x^c 本身**

### 限制（Restriction）：Petrov–Galerkin 最小二乘
$$\mathbf{x}^c = \arg\min_{\mathbf{x}^c} \lVert \mathbf{P}\mathbf{x}^c - \mathbf{x}^f \rVert_2^2 \;\Longrightarrow\; \mathbf{x}^c = \underbrace{(\mathbf{P}^\top \mathbf{P})^{-1}\mathbf{P}^\top}_{\textstyle \mathbf{R}}\,\mathbf{x}^f$$

- P 列满秩 ⟹ **R 是 P 的左伪逆**，满足 **RP = I**（限制后延拓可精确恢复任意粗层向量）
- 选 Petrov–Galerkin 而非 Galerkin（R = Pᵀ）**正是为了 RP = I 这一性质**

### 关键性能优化：块对角预计算
- **matrix-free**，不显式构造稀疏 P、R
- 每个细顶点只嵌入**单块肌肉的笼**中 ⟹ **P 乃至 PᵀP 在跨肌肉方向块对角**
- Eq.(13) 因此**解耦为每块肌肉一次小稠密求解**
- **预计算并存储每块肌肉的伪逆块 (PᵀP)⁻¹Pᵀ**，运行期 restriction 退化为**块对角矩阵-向量乘**
- 关闭 multigrid（跳过 restrict/coarse solve/prolongate）即退化为经典 XPBD → **可作为 A/B 开关**

### 单步 V-cycle（Fig. 8）
```
Predict  x̃^f  (gravity + inertia)
   ↓
[1] Target Update   [2] Fine Solve constraints → x^f
   ↓                                          ↓
[3] Update Velocities              [4] Restrict (Eq.13)
                                              ↓
                        [6] Prolongate (Eq.11) ← [5] Coarse Solve on M^c
   ↓
Collision constraints
```

---

## 其他约束设计

### 各向异性纤维约束（Hill 律的 3D 提升）⭐
1D 的归一化纤维长度提升为**变形梯度的沿纤维方向拉伸**：

$$\lambda_{\mathrm{f}} = \lVert \mathbf{F}\,\mathbf{d} \rVert \;\equiv\; \tilde{\ell}^{\mathrm{M}}$$

- $\mathbf{d}$：静止构型下的单位纤维方向；**$\lambda_f$ 与 1D 的 $\tilde{\ell}^M$ 恒等**（当前纤维长 / 最优静止长）
- XPBD 把弹性势存成 $\Psi = \tfrac12 k C^2$，令 $\tfrac12 C^2_{\text{fiber}} = \Psi_{\text{fiber}}$ 即把 Hill 应变能直接编码进约束：

$$\Psi_{\text{fiber}} = \sigma_0 \int_{\lambda_{f,\min}}^{\lambda_f} f_{\text{hill}}(s)\, ds, \qquad C_{\text{fiber}} = \sqrt{2\Psi_{\text{fiber}}}$$

- 3D 中剔除 $f^V, f^T, f^{PE}$，只保留 active + passive 的相应项
- **关键数值性质**：$f_{\text{hill}}$ 是**分段五次多项式** ⟹ 能量积分**每段有闭式 10 次多项式**，**无需数值求积**（重要性能点）
- 对比 Lee et al. 用**一阶 Piola–Kirchhoff 应力**实现主动纤维力；本文改为**位置级 XPBD 约束**
- 物理效果：**只约束沿纤维分量** ⟹ activation 沿 d 缩短肌腹，体积守恒驱动**正交方向鼓起（bulge）**

### 1D Hill 型肌肉代理
$$f_{\text{hill}} = \underbrace{a\,f^{\mathrm{L}}(\tilde{\ell}^{\mathrm{M}})\,f^{\mathrm{V}}(\dot{\ell}^{\mathrm{M}})}_{\text{active}} + \underbrace{f^{\mathrm{PE}}(\tilde{\ell}^{\mathrm{M}})}_{\text{passive}} + \underbrace{f^{\mathrm{T}}(\tilde{\ell}^{\mathrm{T}})}_{\text{tendon}}$$

- 力-长曲线 $f^L, f^{PE}$ 取自 **Millard et al.**，通过**查找表**加速 RL 训练（分段 Bézier 形式）
- 假设：① 肌腱无限刚 ② 无速度相关力 $f^V$（**只有保守力才有能量势**，才能注入 3D XPBD）
- 峰值等长力 $f_0 = \sigma_0 A^M$（生理横截面积）→ 腿部肌肉强于手臂
- **肌肉力→关节力矩闭式可微映射**：$\boldsymbol{\tau}^{\text{musc}}(\mathbf{a}^{\mathrm{M}}) = \mathbf{L}\mathbf{a}^{\mathrm{M}} + \mathbf{b}$（L 为单位激活力臂、b 为被动力矩），即 μ_θ 的训练前向

### 体积/形状保持
- 不可压缩性主用 **Stable Neo-Hookean (SNH)** 材料，按 Macklin & Müller 铸成**耦合 XPBD 约束对**
- 另加显式体积约束 + ARAP 形状保持
- ⚠️ 高刚度肌肉下**求解不收敛会留下可见 artifact 与四面体翻转**

### 骨骼耦合
- 附着约束：$C_{\text{attach}} = \lVert \mathbf{x}_i - \mathbf{x}_i^* \rVert - L_0$
- 骨骼→肌肉**单向耦合**；目标点由静止姿态下骨骼表面最近点搜索得到
- 用 mask 把每块肌肉**划分为肌腱区（硬附着）与肌腹区（软附着）**
- 邻接肌肉间加**肌间弹簧**（静止姿态一次性构建）保持肌肉束状聚合
- 碰撞基于 **SDF**（signed distance field）

---

## 复杂度分析

| 阶段 | 复杂度 | 说明 |
|------|--------|------|
| 层级几何粗化（一次性） | O(F log F) | F = 细网格面数；inflate + remesh + tetrahedralize，**预计算**，运行期零成本 |
| 延拓 P x^c | O(V_f) | 每细顶点 4 权重加权和，matrix-free |
| 限制 R x^f（预计算后） | O(V_f + V_c) | 块对角矩阵-向量乘；**每块肌肉一次小稠密求解** |
| 粗层求解 | O(V_c · k_c) | 31k tets，远小于细层 |
| 单步 V-cycle 总计 | ~O(V_f) + 常数倍细层求解 | **细层主导，粗层近乎免费**（468k vs 31k ≈ 15× 缩减） |
| 内存 | 层级 + 每块肌肉伪逆块 | 伪逆块为 (4n_c × 4n_c) 稠密/肌肉，规模可控 |

**实测性能**：468,162 四面体、194 块肌肉、单张 RTX 4090 → **18 ms/帧**（≈ 55 fps 实时）。

---

## 实现难度与数值稳定性

- **算法复杂度**：**高**
  - 几何粗化（inflate → remesh → 四面体化）本身就是一条完整管线
  - Petrov–Galerkin restriction + 块对角伪逆预计算
  - RL + PPO 双网络联合训练（284 肌肉、50 DOF、22 关节）
  - GPU 并行 XPBD 求解器

- **数值稳定性（关键风险点）**：
  - ⚠️ **P 列满秩是 RP=I 的前提** —— 粗化产生的**退化/扁平四面体**会让重心坐标退化、伪逆爆炸。inflate 步骤正是为规避此问题
  - ⚠️ **块对角假设要求每细顶点唯一归属一个笼** —— 跨肌肉边界的细顶点会破坏此结构
  - ⚠️ **刚性肌肉 + 未收敛求解 = 四面体翻转**，需要 SNH 的抗逆性 + 体积约束兜底
  - ⚠️ 剔除 $f^V$（速度相关力）是为获得能量势的**必要妥协**，牺牲了速度相关的肌肉动力学（如 damping、力-速特性）
  - ✅ 优势：matrix-free + 预计算块伪逆，避免了代数多重网格的全局矩阵组装
  - ✅ 多重网格可一键关闭 → 天然具备 A/B 对照与渐进式落地路径

- **依赖项**：
  - MuJoCo（1D 刚体+肌肉驱动）、PPO
  - GPU 并行 XPBD（可参考 NVIDIA FleX / Warp 的求解器结构）
  - 四面体化工具链（**TetGen / libigl::tetrahedralize**）
  - Remeshing：**libigl::remesh_isotropic_exterior / pmp PMP** 或自研 isotropic remeshing
  - SDF 碰撞：自定义或 libigl::signed_distance

---

## 推荐结论

⚠️ **谨慎跟踪（几何模块）/ ❌ 不建议整体复现（RL 部分）**

### 理由
1. **几何贡献值得单独抽取**：四面体网格上的**几何多重网格**（几何粗化 + 重心坐标延拓 + Petrov–Galerkin 限制 + 块对角预计算）是**通用技术**，可直接迁移到任何高刚度四面体体积求解场景（软体、地质、拓扑优化），不限于肌肉
2. **RL 训练成本过高**：284 肌肉 × PPO 联合训练属重资产投入，不建议完整复现
3. **落地建议**：若做体积软体，**只借鉴几何多重网格这一层**，用现成 XPBD 求解器 + 自研几何粗化即可获得主要性能收益

### 迁移价值（对我们方向的启发）
- **[[四面体重网格]]** 的一条工程化路径：surface remesh → tetrahedralize → 层级，可与 PMP 的 isotropic remeshing 组合
- **[[网格简化]]** 的多分辨率视角：多重网格本质是「同一物理场的多分辨率表达」
- **[[重心坐标插值]]**：延拓算子的数学基础，注意**退化四面体**的处理（可参考 libigl 的 `barycentric` 退化检测，或做 sliver removal 后再粗化）
- **[[Petrov–Galerkin 加权残差法]]**：数值方法层面，RP=I 性质保证 restriction/prolongation 的一致性
- 粗化前的 **inflate 步骤**是个易被忽略但关键的几何细节——防止 remesh 时细长三角形/薄四面体退化

---

## 实验与消融

- **全身体演示**：194 块肌肉人体，walk / kick / swim / overhead-squat 等多样动作
- **EMG 验证**：对比实测 surface EMG 包络，评估生理合理性（§IV-B）
- **基线对比**：vs 既有 RL 肌肉控制（MASS / MuscleVAE / MAGNET / MuscleMimic）与优化式方法（Lee et al. Projective Dynamics，**不稳定不收敛**）
- **消融**：
  - §IV-D1 多重网格效果
  - §IV-D2 碰撞处理效果
  - §IV-D3 纤维约束 vs **各向异性 ARAP 替代方案**

---

## 关键数字速查

| 项 | 值 |
|----|----|
| 细网格四面体数 | 468,162 |
| 粗笼四面体数 | 31,044 |
| 3D 体积肌肉数 | 194 |
| 1D 代理肌肉数 | 284 |
| 关节 DOF | 50 |
| 非根刚体数 | 22 |
| 观测维度 | b_t ∈ R^66, v_t ∈ R^69 |
| 性能 | 18 ms/帧 @ RTX 4090 |
| EMG 数据 | 13 被试 Moreira 队列均值，101 bin 步态栅格 |
| 页数 | 12 页 |

---

## 相关工作脉络

| 方向 | 代表工作 | 与本文关系 |
|------|---------|-----------|
| XPBD | Macklin et al. (2016/2019), Bender et al. (FEM 势) | 求解器基础 |
| 位置式层级方法 | **HPBD**（边缘坍缩，为 cloth 设计，不闭 V-cycle） | 直接被本文超越 |
| 代数多重网格 | **MGPBD**（作者前作，组装全局矩阵） | 直接被本文超越 |
| 重心坐标层级 | Knapp et al.（FEM 中已验证） | 本文技术来源 |
| 六面体粗化 | 已有方法（图形学主流） | 对照：四面体难粗化 |
| 肌肉 FEM 势 | Kim et al.（可抗逆、匹配真实肌肉本构） | SNH 借用 |
| 肌肉束建模 | Angles et al.（弹性杆 + 体积缩放） | 相关但不同路线 |
| 1D Hill + RL | **MASS**（Lee et al., 346 肌肉）/ MuscleVAE / MAGNET / MuscleMimic / Myosuite / OpenSim | 双网络架构来源 |
| 体积肌肉逆激活 | Lee et al.（Projective Dynamics + 逐帧 QP，不稳定） / Han et al.（静态 QP + ML-deformer） | 对比方案 |

---

## 相关笔记

- [[2026-10-16-Tessellation-Free-Geometric-Queries-Displaced-Surfaces]]
- [[2026-10-09-JamTet-Sphere-Packing-Tet-Meshing-Morphing]]
- [[2026-10-09-FeatureZ-Feature-Preserving-Compression-Meshes]]

---
相关主题：[[几何处理]] [[四面体网格]] [[几何多重网格]] [[重心坐标]] [[XPBD]] [[四边体重网格]] [[体积物理仿真]] [[各向异性材料]] [[物理驱动动画]] [[Petrov-Galerkin]]