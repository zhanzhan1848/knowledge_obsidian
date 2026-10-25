# 每日论文搜索报告 — 2026-10-25

## 任务概览

- **执行时间**: 2026-10-25 14:08 UTC
- **Agent**: 菜心 (Caixin) 🥬 · 流体力学专家
- **搜索源**: arXiv API + `arxiv.org/list/{physics.flu-dyn,cs.FL}/recent`（双重校验）
- **时间窗口**: 严格 24 小时（2026-10-24 14:08 → 2026-10-25 14:08 UTC）
- **检索关键词**: CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence, computational fluid dynamics, lattice Boltzmann, smoothed particle
- **配置来源**: `~/knowledge-vault/.knowledge-config.json` → `agents[caixin]`

---

## ⚠️ 窗口状态：周末无新提交

**关键发现**：严格 24 小时窗口内 **arXiv 无任何新提交**。

| 项目 | 结论 |
|------|------|
| 最新公告日 | **Fri, 23 Oct 2026**（physics.flu-dyn 16 篇，cs.FL 1 篇） |
| 10-24（周六） | **无公告** |
| 10-25（周日） | **无公告** |
| 原因 | arXiv **周末不发布**（公告周期为周一至周五） |
| API 校验 | feed `<updated>` = 2026-10-25T14:08:22Z（查询实时，但最新条目为 10-22/10-23） |

**结论**：严格窗口为空属**正常现象**，非检索失败。已通过 `arxiv.org/list/recent` 页面独立复核确认。

---

## 执行策略：窗口补齐 + 缺口收敛

既然严格窗口为空，本次转为**双轨补齐**：

| 轨 | 内容 | 数量 |
|----|------|------|
| **A. 缺口收敛** | 核查 10-19 → 10-23 公告批次中此前**未入库**的论文 | **11 篇** |
| **B. 深度升级** | 对已入库但**深度不足**的论文，用 v2 全文重写 | **1 篇** |

---

## 已处理论文（12 篇）

### A 轨 — 缺口收敛（11 篇）

| # | arXiv ID | 标题 | 主题 | 笔记文件 | 结论 |
|---|----------|------|------|----------|------|
| 1 | **2610.26631** | Bridging the Lattice Boltzmann Method and Moment Methods | LBM/矩方法 | `2026-10-25-arXiv-2610.26631_Bridging-LBM-and-Moment-Methods.md` | ✅ **深度重写**（v1→v2 全文） |
| 2 | **2610.27906** | DeHNSSo-v2: compressible, curvilinear, efficient harmonic NS solver | 稳定性分析/开源工具 | `2026-10-25-arXiv-2610.27906_DeHNSSo-v2-Compressible-Curvilinear.md` | ✅ 强烈推荐 |
| 3 | **2610.26931** | Matrix-Free Resolvent Analysis for Large-Scale Aerodynamic Systems | resolvent/AD | `2026-10-25-arXiv-2610.26931_Matrix-Free-Resolvent-Analysis.md` | ✅ 强烈推荐 |
| 4 | **2610.27475** | Predicting trigger in streak breakdown via Picard-Chebyshev (plane-Poiseuille) | 转捩预测 | `2026-10-25-arXiv-2610.27475_Picard-Chebyshev-Streak-Breakdown.md` | ✅ 推荐 |
| 5 | **2610.26984** | ISAT-ANN: NN-aided adaptive tabulation of phase equilibria (transcritical) | 相平衡/加速 | `2026-10-25-arXiv-2610.26984_ISAT-ANN-Transcritical-Multiphase.md` | ✅ 推荐 |
| 6 | **2610.29072** | Multi-grain-size sediment transport and sorting (LES coupled) | 泥沙输运 | `2026-10-25-arXiv-2610.29072_LES-MultiGrain-Sediment-Transport-Sorting.md` | ✅ 推荐 |
| 7 | **2610.27840** | Influence of Ideal/Cubic/Helmholtz EOS on porous aerostatic journal bearings | EOS/热力学闭合 | `2026-10-25-arXiv-2610.27840_EOS-Impact-Porous-Aerostatic-Bearings.md` | ✅ 推荐 |
| 8 | **2610.31245** | TCC ranking criterion for target-related flow structures | DMD/POD 后处理 | `2026-10-25-arXiv-2610.31245_TCC-Target-Related-Flow-Structures.md` | ✅ 推荐 |
| 9 | **2610.31220** | QCM impedance of discrete adsorbates with lubricated contact | 润滑理论/Stokes | `2026-10-25-arXiv-2610.31220_QCM-Impedance-Lubricated-Contact.md` | ✅ 推荐 |
| 10 | **2610.30171** | Evaporative Cooling & Secondary Combustion in RDE with dual-purpose head-end injection | 燃烧/多相 | `2026-10-25-arXiv-2610.30171_RDE-DualPurpose-HeadEnd-Injection.md` | ⚠️ 谨慎 |
| 11 | **2610.30330** | Shear-induced mechanical yielding controls cluster morphology (PASD) | 软物质/流变 | `2026-10-25-arXiv-2610.30330_Shear-Induced-Mechanical-Yielding-Suspensions.md` | ⚠️ 谨慎 |
| 12 | **2610.29193** | Liquid jet breakup & droplet size distribution in crossflow | 射流破碎/雾化 | `2026-10-25-arXiv-2610.29193_Crossflow-Jet-Breakup-DSD.md` | ✅ 推荐 |
| 13 | **2610.27330** | Formation of a Vorticity Singularity in Axisymmetric Poloidal Flow | 奇点/正则性 | `2026-10-25-arXiv-2610.27330_Vorticity-Singularity-Axisymmetric-Poloidal.md` | ⚠️ 谨慎（超算门槛） |
| 14 | **2610.30407** | Predicting droplet landing in angle-controlled SAW jetting | 声驱动液滴 | `2026-10-25-arXiv-2610.30407_SAW-Angle-Controlled-Droplet-Landing.md` | ⚠️ 谨慎 |

### B 轨 — 深度升级（1 篇）

**2610.26631** 此前于 10-20 以 v1 摘要入库（4.7KB，内容偏浅）。论文已于 **10-20 更新 v2**。本次以 **v2 全文**重写为 **14.2KB** 深笔记，含完整推导链（DVBE → 矩投影 → 完全离散形式）、通用矩闭合的三个 Remark、MEGKS 有限体积格式、全 Kn 验证与四大能力扩展。旧笔记已归档为 `2026-10-19_arXiv-2610.26631_Bridge-LBM-Moment-Methods.v1-abstract-only.superseded.md`。

---

## 主题分布

```
稳定性分析 / 转捩 (Stability/Transition):  ████  3 篇  (21%)
动理学方法 (LBM/Kinetic):                   ███   2 篇  (14%)  ★ 含今日最高价值
ML 加速 / 后处理 (ML-accel/Post-proc):      ███   3 篇  (21%)
多相流 / 输运 (Multiphase/Transport):       ███   3 篇  (21%)
流变 / 软物质 (Rheology/Soft matter):      ██    1 篇  (7%)
实验流体力学 (Experimental):               ██    1 篇  (7%)
奇点理论 (Singularity theory):             █     1 篇  (7%)
```

---

## 核心观察

### ★ 1. LBM 与矩方法的统一 —— 今日最高价值（2610.26631）

**这是本周最值得关注的流体数值方法论文**（PRL Letter, AMU + TUM）。

- 严格推导出**与 LBM 完全等价的离散矩方程**（连续形式 + 完全离散形式），关键是**显式保留全部高阶矩**（既有「从 LBM 导出矩方程」的工作都修改了隐式闭合）
- 由此识别出**所有 DVBE 类动理学方法共享的通用矩闭合**：
$$M_{x^m y^n} = \bra{A^{(m,n)}}[P]^{-1}\ket{M}, \qquad m>N-1 \text{ or } n>N-1$$
即高阶矩是主矩的**线性组合** —— 无需精确重构高阶矩，只需**控制其误差对低阶矩的影响**
- **打破高 Kn 瓶颈**：MEGKS 格式用 **D2Q18² → 324 个耦合矩方程**扫过全 Kn 区间（$k$ = 0.001 → 100），与 **DSMC + DUGKS** 双重对照吻合。传统矩方法在此规模**不可行**
- **四大能力扩展**：① 均匀网格下与 LBM 严格等价（保留极低声学耗散）② 独立碰撞步 → 支持**各矩独立弛豫率**（BGK/Shakhov/ESM 都做不到）③ 非结构网格 + 离格速度集 ④ 局部自适应速度集（**在矩空间直接交换信息**，避免分布函数反复投影）
- **方法论隐喻**：Remark 3 承认高阶矩偏差普遍存在，但**沿矩层级被约束** → 「不追求完美高阶矩，而是管住误差传播」—— 这是一个值得迁移到其它降阶/闭合问题的思路

### ★ 2. 线性稳定性分析的两条路线现已互补（2610.27906 + 2610.26931）

| | DeHNSSo-v2 | Matrix-Free Resolvent |
|---|---|---|
| **问的问题** | **自发**失稳（特征值） | **受迫**响应（增益） |
| **核心** | Chebyshev 谱 + Newton 伪弧长 | AD + 预条件 Krylov + Lanczos |
| **规模** | 二维贴体曲线坐标 | **1.73×10⁸ 复未知量**（此前最大值的 2.3×） |
| **亮点** | 曲线坐标保持四阶精度；**~10× 加速**；可压缩 Ma 0.5–4.5 | **内存 14–34 kB/未知量**（比稀疏分解低近 4 个数量级）；认证频率仅 **3.6 分钟**（128 核） |

**互补关系**：特征值给「哪些频率危险」，resolvent 给「扰动被放大多少」。ADflow + DeHNSSo 组合 → 完整的稳定性-响应分析工具链。

**物理发现**（2610.26931）：NASA CRM 机翼上，**网格加密把 buffet 振荡器变成了同一机制的放大器**（buffet 单元以 ~0.3 倍来流速外移），受迫模拟证实 → 对 buffet 机理有直接含义。

### ★ 3. 转捩预测的「按需付代价买精度」范式（2610.27475）

**Picard–Chebyshev 迭代**的阶次与物理近似级别**一一对应**：
- 1 阶 = 线性扰动方程
- 3 阶 = 弱非线性理论的**振幅方程**
- 更多迭代 → **系统性逼近 DNS**

在亚临界平面 Poiseuille（$M$=0.3, $Re$=3000）上与 DNS 高精度吻合，并成功识别出**导致条纹崩塌的最优平面波扰动**。给出完整转捩因果链：条纹 + 平面波 → 斜波 → 谐波 → **交替流向涡结构** → 幅值决定是否触发湍流转捩。

这是**比 DNS 便宜数个量级**的转捩代理模型。

### ★ 4. 多粒径对泥沙输运的决定性影响（2610.29072）

LES + 多粒径输运框架（追踪各级在**推移质层内的局部占比**）：

| 指标 | 均匀粒径 | 多粒径 | 改善 |
|------|---------|--------|------|
| 最大冲刷深度误差 | 37.98% | **3.83%** | **↓ 10×** |
| 最大淤积高度误差 | 48.35% | **11.54%** | **↓ 4×** |

**「多粒径」不是细节而是决定性因素** —— 物理图式合理（粗颗粒留在冲刷槽、细颗粒被带到点坝）。该思想可迁移至滑坡、泥石流、选矿等一切「级配影响输运」问题。

### ★ 5. 「代理模型兜底迭代求解器」—— 通用工程模式（2610.26984）

ISAT-ANN 解决的第一性原理相平衡计算的三大痛点（占绝大部分运行时间、经常不收敛、独立 ML 在大网格上求值慢）：

```
预训练 ANN ──(表扩展, 保证 crash-free)──> ISAT 表 ──(局部线性插值检索)──> 求解器
                    ↑
            O(N) 贪心负载均衡 (消除 AMR 并行不均)
                    ↓
                  AMR (额外 2.92×)
```

单核 **2.30×** / 并行 **2.62×**（相对独立 ANN）+ AMR **2.92×**。**这套路子可迁移到任何热力学计算昂贵的 CFD 问题**（不必限于相平衡）。

### 6. 其余要点

- **TCC 排序判据**（2610.31245）：在**固定模态展开**内按「与观测量的互响应均方范数」排序 —— 解决「全局贡献大 ≠ 与目标关联紧」的经典错配。合成流目标子场**重构误差 2.15%**。低成本高收益的后处理工具。
- **EOS 敏感性分析**（2610.27840）：**空气**下理想气体足够（差异可忽略）；**制冷剂**下理想气体偏差数个百分点，**Peng–Robinson** 是性价比最优（与 Helmholtz 参考最接近，成本相当）。
- **QCM 润滑接触**（2610.31220）：闭式解析解（任意密度颗粒）+ FEM 验证 + 32–510 nm 聚苯乙烯实测三重交叉验证 → 低成本的 Stokes 流基准算例。
- **RDE 双用途喷射**（2610.30171）：揭示**反向效应** —— 冷却流量过低会因局部爆燃**反而抬高壁温**（蒸发冷却 vs 二次燃烧的内禀竞争）；推荐「中等流量 + 细雾化」。
- **跨流向射流破碎**（2610.29193）：近场袋状破裂 → 下游边缘/液带/节点解体；建立**三区 regime map**；DSD 随下游**变宽、变多分散**。DIH 提供的体积粒径分布是罕见的定量基准。
- **涡量奇点**（2610.27330）：轴对称极向流中速度梯度在对称轴上**指数增长**、涡量梯度**超指数增长**；⚠️ 复现成本极高，且**数值耗散敏感性是必须检验的关键点**。

---

## 综合可行性分析

🥢 **今日信号聚焦三条主线**

### 主线一：动理学方法的统一与非正规算子（最值得跟进）

LBM↔矩方法统一（2610.26631）与 matrix-free resolvent（2610.26931）看似无关，实质共享一个内核思想：**用「导出的算子结构」替代「显式矩阵」**。

- 2610.26631：从分布函数**导出**矩方程，使高阶矩成为主矩的线性组合 → 无需存储/重构高阶表示
- 2610.26931：从 Jacobian **导出**其作用（AD）→ 无需组装/存储矩阵

两者都在回答同一问题：**如何在问题规模膨胀时，仍保持可承受的存储与求解成本**。

### 主线二：稳定性分析的工具链正在齐备

DeHNSSo-v2（特征值 + 非线性分支 + 可压缩 + 贴体几何）+ matrix-free resolvent（受迫响应 + 增益）+ Picard-Chebyshev WNLOP（最优扰动 + 转捩触发）三篇构成**完整的线性→非线性→转捩**工具链。三者均已在开源或可实现范围内。

### 主线三：加速模式高度收敛

ISAT-ANN（代理兜底 + 查表）、POD 过滤 ML（2610.31547）、LTR 先验判据（2610.31605）、TCC 目标排序、ML 超分辨率（2610.27215/27284）—— **共同模式**：先用物理/统计方法压缩问题空间，再让 ML 只做它擅长的事（插值、代理、分类），且**给出可信度认证**（后向误差、重构误差、bootstrap CI）。

---

## 对 @墨鱼丸 的行动建议（优先级排序）

| 优先级 | 论文 | 建议动作 | 难度 | 价值 |
|-------|------|---------|------|------|
| **P0** | 2610.26631 | 实现 **D2Q9 (9 方程) MEGKS** 验证与 LBM 严格等价 → 扫全 Kn | 中 | ★★★★★ |
| **P0** | 2610.26931 | 在 ADflow 上实现预条件 Krylov + Lanczos 子空间复用 | 高 | ★★★★★ |
| **P1** | 2610.27906 | 直接采用 DeHNSSo-v2（编译即可用），不重复造轮子 | 低 | ★★★★★ |
| **P1** | 2610.27475 | 实现 Picard-Chebyshev WNLOP（**自检：3 阶=振幅方程**） | 中 | ★★★★ |
| **P2** | 2610.26984 | 移植「ANN 兜底 + ISAT 表」模式到 OpenFOAM thermo 模块 | 中 | ★★★★ |
| **P2** | 2610.31245 | TCC 判据嵌入现有 POD/DMD 后处理流水线 | 低 | ★★★ |
| **P3** | 2610.29072 | OpenFOAM 多粒径输运扩展（直槽 → 弯曲河道） | 高 | ★★★ |

**工具链建议**：将 DeHNSSo-v2（特征值/非线性）+ matrix-free resolvent（受迫/增益）+ WNLOP（最优扰动/转捩）三者串联，作为**流动稳定性与转捩研究的标准流水线**。

---

## 已忽略 / 未处理

| 项目 | 原因 |
|------|------|
| **cs.FL 全部 13 篇** | 该分类为**形式语言与自动机理论**（如 2610.30168 可分词性判定、2610.27482 分层集合可解性、2610.28682 动作字母表语义发现），**与流体无关**。持续常规忽略。 |
| **2610.31408 自旋流体**、**2610.31425 KP 孤子** | 相对论/非线性波方向，已于 10-23 批次处理并标注边缘。 |
| **2610.27215 / 2610.27284 ML 超分辨率**（反应流） | 属**渲染/ML 交叉**方向（与豆苗的流体渲染域重叠），且已由豆苗侧覆盖，不重复。 |
| **2610.27130 血流代理建模**、**2610.30498 CARS** | 医学血流方向，已于 10-24 批次入库。 |
| **2610.28908 单目 3D 气泡重建** | 属计算机视觉/重建方向（与豆苗域重叠）。 |
| **2610.28694 势流在线系统辨识**、**2610.29719 海雾微藻**、**2610.25442 剪切带** | 应用/生物/软物质方向，与 CFD 数值方法核心关联弱，留待按需补齐。 |

---

## 知识库状态

- **本次新增笔记**: 14 篇
- **深度重写**: 1 篇（2610.26631，v1→v2）
- **归档旧版**: 1 篇（`.v1-abstract-only.superseded.md`）
- **01-Papers 总数**: 856 → **870 篇**

---
*整理自 arXiv API + list 页面交叉校验 | 鲜毛 🥬 菜心 | 2026-10-25*
