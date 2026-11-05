---
type: daily-report
created: 2026-11-05
updated: 2026-11-05
tags: [daily-report, fluid-rendering, siggraph-2026, arxiv, literature-survey]
status: processed
domain: fluid-rendering
agent: doumiao
period: 2026-11-04 ~ 2026-11-05
---

# 每日流体渲染论文速报 — 2026-11-05

## 摘要

**本次搜索窗口（近 24 小时）内 arXiv cs.GR 无流体渲染相关新论文**，但发现了 **SIGGRAPH 2026 会议论文集中的一批高质量流体渲染工作**（本轮重点收获）。同时补齐了近期 arXiv 上的 4 篇相关论文（SPH 可微、MPM 数值断裂、人工加厚火焰标定、气泡三维重建）与 1 篇方法论论文。

> **重要发现**：2026 年 SIGGRAPH 的流体板块异常丰富 —— 在 **3DGS 流体重建**、**边界贴合流体模拟**、**可微流体优化**、**高阶高性能格式**、**涡核分析** 五个方向上同时有突破性工作。这构成本库目前最有价值的一批参考资料。

---

## 一、SIGGRAPH 2026 流体板块（重点收获，5 篇）

### 1. GauSmoke — 物理-光学混合 3DGS 烟雾重建 ⭐⭐⭐⭐⭐
- **SIG 2026 Conference, Article 51** · 南开大学 + 南京大学 · Bo Ren 组
- **Beer–Lambert 体积渲染 + Eulerian 无散速度场驱动 Lagrangian Gaussian 图元**
- 稀疏视角下联合重建**速度场 + 密度场**，替代启发式 deformation field
- **性能**：训练 0.80 h / 114 FPS / 42 MB / **PSNR 34.83**（RTX 3090）—— 较 NeuSmoke 快 2×、PSNR 高 12 dB
- 📄 [[2026-11-05-Zhang-Cai-Huang-Ren-GauSmoke-Hybrid-Physics-Optical-Gaussian-Splatting]]

### 2. LagrangianSplats — 无散核输运的 3DGS 流体重建 ⭐⭐⭐⭐⭐
- **SIG 2026 Conference, Article 52** · 北京大学 · Ningxiao Tao / Baoquan Chen / Mengyu Chu
- **Divergence-Free Kernel 速度场参数化 → 构造性保证不可压缩性**（而非软惩罚）
- **Sliding Window** 优化实现长时程梯度传播
- **✅ 代码 + ✅ 数据集（HuggingFace）+ ✅ 补充材料** 全部公开
- 📄 [[2026-11-05-Tao-Chen-Chu-LagrangianSplats-Divergence-Free-Transport]]

### 3. Fast VEM Fluid Simulation — 边界贴合流体模拟 100× 加速 ⭐⭐⭐⭐⭐
- **TOG Vol.45 No.4 (SIG 2026), Article 65** · 南开大学 · Runze Zhang / Bo Ren
- **二阶虚拟单元法 (VEM)** 压力离散 + **保凸性 BSP cut-cell** + **Galerkin 几何多重网格**
- **压力投影阶段最高 100× 加速**；128³ 网格上复杂/超薄边界烟雾模拟 **< 1 min/frame**
- 稳健处理**窄缝、无人机扫描复杂几何、相对厚度 10⁻⁵ 超薄壳体**
- **✅ 代码公开**（oliver-zrz-cyber.github.io/FastVEM）
- 📄 [[2026-11-05-Zhang-Ren-FastVEM-Fluid-Simulation]]

### 4. DiffSurFlow — 流图代理梯度的可微流体优化 ⭐⭐⭐⭐
- **TOG (SIG 2026 Journal Track)** · 上海交通大学 DALab
- **核心洞察**：反向传播中"计算强度"与"梯度重要性"严重错配；流图的**跨步连接是梯度"高速公路"**
- 保留关键跨步连接 + 物理 informed 剪除冗余伴随计算 → **显存与算力大降，梯度几乎不变**
- 应用：Dragon→SIG2026 烟雾变形、翼型升阻比优化、城市建筑风场、trefoil 涡场推断
- **✅ 代码公开**
- 📄 [[2026-11-05-Quan-Wang-Lian-DiffSurFlow-Differentiable-Fluid-Optimization]]

### 5. KPM-FR — 动理学高阶通量重构流体格式 ⭐⭐⭐⭐
- **TOG Vol.45 No.4 (SIG 2026), Article 67** · Zike Graphics · Zike Xu / Xuan Zhang / Xiaopei Liu
- **GKS 思想 + 矩空间 + 高阶 FR**，**每步仅 2 个融合 GPU kernel**，中间数据全在片上
- **单卡 > 8×10⁹ 解点更新/秒**；显存比 LBM **低 5×+**；单机可跑 **18 亿解点**
- 📄 [[2026-11-05-Xu-Zhang-Liu-KPM-FR-Kinetic-Predicted-Moment-Flux-Reconstruction]]

### 附加收录
- **Generic Variational Spacetime Optimization of Vortex Core Manifolds** — SIG 2026 Article 53 · KAUST · 时空双流形涡核，**按流 pushforward 预积分拉格朗日量** → 单时间步单空间变量求解，通用框架
  📄 [[2026-11-05-Zhang-Rautek-Hadwiger-Generic-Variational-Vortex-Core-Manifolds]]

---

## 二、arXiv 补充收录

| 论文 | 日期 | 分类 | 要点 | 笔记 |
|------|------|------|------|------|
| **End-to-End Differentiable SPH for Fluid–Rigid Optimization** | 2026 (TOG SIG26) | 粒子/SPH | **自适应伴随修正序列**作下降方向保持的预条件器，抑制伴随变量爆炸 | [[2026-11-05-Cao-Ren-Xu-Mo-Hu-End-to-End-Differentiable-SPH-Fluid-Rigid-Optimization]] |
| **DIQ-MPM: Dual Interface Quadrature MPM** | TVCG 2026 | 粒子/MPM | **DIQ 机制**免重叠网格实现强流固耦合，Schur 补统一纯压力 SPD 系统，消除数值断裂 | [[2026-11-05-Zhang-Cen-Zhu-Chen-Ren-DIQ-MPM-Fluid-Solid-Coupling]] |
| **Total Deformation-based MPM for Perfectly Elastic Solids** | 2026-10-27 | 粒子/MPM | 从粒子位置+固定参考网格直接算形变（不用速度梯度），**当前网格算弹性力 + 无数值断裂 + 兼容标准碰撞** | [[2026-10-27-Boettcher-Ridder-Bender-Total-Deformation-MPM-Perfectly-Elastic-Solids]] |
| **Mastering Multi-State Dynamics (MG-CD-MPM)** | 2026-10-29 | 粒子/MPM | 工具中心化局部化相场损伤求解 + 双向工具耦合，**材料抗力直接暴露给 PPO 策略** | [[2026-10-29-Feng-Luan-Mastering-Multi-State-Dynamics-Continuum-Damage-Viscoplastic-MPM]] |
| **Artificial Flame Thickening for Lean Hydrogen Flames** | 2026-10-27 | 火焰/燃烧 | $Ka_f^F = Ka_f\sqrt{F}$，$Da_f^F = Da_f/F$，**两个相反通道**；匹配这两个数则不同加厚倍数**结果塌缩** | [[2026-11-05-Schneider-Schuh-Kaddar-Artificial-Flame-Thickening-Hydrogen-Turbulence]] |
| **Monocular 3D Bubble Reconstruction** | 2026-10-20 | 多相流/气泡 | DNS + 校验过的 MC 光追（~30× CPU 速度）+ 焦点条件化多任务学习，**~97.6% 归一化深度精度** | [[2026-11-05-Nayak-Mohammed-Aidun-Monocular-3D-Bubble-Reconstruction]] |
| **Readable Is Not Steerable** | 2026-11-03 | 学习型表示 | 预注册实验证明"隐空间可读物理量"≠"可操控"，**对照组（线性动力学 JEPA / 静态模型）是必要设计** | [[2026-11-05-Modgil-Readable-Is-Not-Steerable-Learned-Fluid-Representations]] |

---

## 三、领域趋势观察

### 趋势 1：3DGS 成为流体重建的新主流载体，但"物理强度"分化明显
| 路线 | 代表 | 物理强度 | 成本 | 适用 |
|------|------|---------|------|------|
| 光流驱动（无物理） | Make It Flow | ⭐ | 最低 | 视觉优先的流水动画 |
| 物理-光学耦合 | **GauSmoke** | ⭐⭐⭐⭐ | 中 | 烟雾重建 + 再仿真 |
| 构造性物理约束 | **LagrangianSplats** | ⭐⭐⭐⭐⭐ | 中高 | 物理精度 + 输运一致性 |

**关键共同点**：三者都用 **Eulerian 全局运动场**驱动 **Lagrangian 图元**，而非逐图元独立形变 —— 这已成为该领域的共识范式。

### 趋势 2：流体模拟的性能瓶颈从"求解器"转向"三个正交维度"
| 维度 | 论文 | 提升 |
|------|------|------|
| 线性代数（压力投影） | **FastVEM** | 100× |
| 梯度传播（反向） | **DiffSurFlow** | 显存↓ 梯度几乎不变 |
| 格式/kernel 效率 | **KPM-FR** | 2 kernel/步，8×10⁹ 点/秒 |

### 趋势 3：可微流体从"能算"进入"能用"阶段
- DiffSurFlow（Eulerian）+ 本次的 SPH 端到端可微（Lagrangian）**同时出现**，说明两条求解器路线的可微化难题均已基本解决；
- [[2026-11-05-Modgil-Readable-Is-Not-Steerable-Learned-Fluid-Representations]] 提醒：**"能读出物理量"不能作为"可控"的证据**，可控性必须**单独检验**。

### 趋势 4：物理正确性开始被"标定"而非被"假设"
- 人工加厚火焰论文给出了**双通道标定公式**；
- 这与 GauSmoke / LagrangianSplats 的"把物理约束写进表示"共同构成本轮主线：**物理正确性正在成为可验证、可复现的工程量**。

---

## 四、行动建议

1. **立即可复用（有开源代码）**
   - `LagrangianSplats`（代码 + 数据集）—— 流体重建基线首选
   - `FastVEM` —— 边界贴合烟雾模拟首选
   - `DiffSurFlow` —— 长时程可微流体优化首选
2. **建议阅读但暂无代码**
   - `GauSmoke` —— Beer–Lambert 体积模型值得自行实现
   - `KPM-FR` —— 若做高分辨率湍流，矩空间思路值得移植
3. **需要建立的内部基线**
   - 建立"**Eulerian 场驱动 Lagrangian 图元**"的统一抽象（参考 GauSmoke + LagrangianSplats + Make It Flow 三篇的一致做法）；
   - 建立**火焰加厚的 $Ka_f / Da_f$ 标定流程**（参考 ATF 论文）。

---

## 搜索过程记录

| 检索源 | 查询 | 结果 |
|--------|------|------|
| arXiv API | `cat:cs.GR` 全量按 submittedDate 倒序（150 条） | 近 24 h 仅 4 篇（Nov 4），**均与流体无关**；向下追溯至 Oct 8 |
| arXiv API | `cat:cs.GR AND abs:{fluid,water,smoke,fire,ocean,particle,turbulence,spray,liquid,flame,foam,wave,bubble}` | 排除 "training" 噪声后命中真实流体论文 4 篇 |
| arXiv API | `cat:{physics.flu-dyn,math-ph,physics.comp-ph,cs.CE}` | 命中 ATF 火焰、气泡重建、DMD-ROM 等 |
| arXiv API | `id_list` 精确查询 | 补齐 10 篇详情 |
| Web Fetch | kesen.realtimerendering.com/sig2026.html | **SIGGRAPH 2026 完整论文表** → 定位 5 篇流体论文 |
| Web Fetch | kesen.realtimerendering.com/siga2026Papers.htm | SIGGRAPH Asia 2026（本期无流体新论文） |
| Web Fetch | ACM DL / 项目主页 / PDF（PyMuPDF 解析） | GauSmoke、FastVEM、KPM-FR、DiffSurFlow、Vortex Core、DIQ-MPM、E2E-SPH 全文与性能数据 |

> **注**：arXiv API 存在严格限流，连续请求会返回空响应 —— 采用**串行请求 + 3s 间隔**，并对超限的情况改用 `arxiv.org/abs/<id>` HTML 页面解析，已验证有效。

---

*生成时间：2026-11-05 22:30 UTC · 豆苗 (doumiao) · 计算机图形学流体渲染专家*
