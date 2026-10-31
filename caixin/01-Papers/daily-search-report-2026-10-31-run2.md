---
type: report
created: 2026-10-31
updated: 2026-10-31
tags: [daily-search, arxiv, fluid-dynamics, physics.flu-dyn]
domain: fluid
agent: caixin
---

# 每日论文搜索报告 — 2026-10-31

## 执行概况

| 项目 | 内容 |
|------|------|
| **Agent** | 菜心 (caixin) 🥬 |
| **执行时间** | 2026-10-31 15:03 UTC |
| **搜索源** | arXiv API `cat:physics.flu-dyn OR cat:cs.FL`，按 submittedDate 降序 |
| **RSS 状态** | `rss.arxiv.org/rss/physics.flu-dyn+cs.FL` **返回空**（周六，arXiv `skipDays` 跳过周末） |
| **关键词** | CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence |
| **最新批次** | 2026-10-29 17:09 UTC（arXiv 最后一轮公告） |
| **本次动作** | 9 篇既有笔记**技术细节补强**（非新建） |

---

## ⚠️ 重要说明：本次为"补强"而非"新建"

arXiv 在周末（周六/周日）**不发布新论文**（RSS `skipDays` = Saturday, Sunday）。本次检索到的最新批次仍是 **2026-10-29 17:09 UTC**，与 10-30 的运行**完全重叠**。

**处理方式**：对已在 10-28 / 10-30 运行中建立的 9 篇笔记，**深挖 arXiv HTML 全文 / PDF 正文**，提取此前未记录的具体实现细节（求解器名称、离散格式、网格规格、边界条件、算例成本），以 `## 数值实现补充` 章节形式**追加**到原笔记中，随后删除本次创建的重复笔记。

**产出统计**：0 篇新建笔记 · **9 篇笔记技术补强** · 累计追加约 **19 KB** 技术细节。

---

## 本次补强的 9 篇论文

| # | arXiv ID | 标题 | 笔记 | 补强内容 |
|---|---|---|---|---|
| 1 | 2610.39123 | Triadic energy cascades and linear amplification mechanisms in supersonic TBL over curved walls | `2026-10-30-...triadic-cascade.md` | BASIC (2026.10) Python/GPU 求解器、11 点六阶中心差分 + 六阶滤波、显式五阶低存储 RK、网格 $2668\times384\times324$、$\Delta\xi^+=5.94/\Delta z^+=4.76/\Delta\eta^+=0.46$、双曲线网格生成器、数字滤波湍流入口、NSCBC 出流边界 |
| 2 | 2610.39348 | Transition to turbulence in swirl created by a vertical magnetic field in liquid metal electrodes | `2026-10-30-...swirl-chaos-transition.md` | OpenFOAM/PISO、二阶 Gauss linear、Crank-Nicolson、网格无关性表（688k/999k/1.33M/1.54k）、**592 组算例**、电势 Laplace 边界条件、Bessel 洛伦兹力展开、$Re_m\approx0.01$ 判据 |
| 3 | 2610.39386 | Nonlinear dynamics of short-wave instabilities in a helical vortex | `2026-10-30-...helical-vortex.md` | 柱坐标 6 阶紧致 + Fourier 谱、Crank-Nicolson + AB2、网格 $565\times896\times256$、$\Delta t=7.5\times10^{-4}R^2/\Gamma$、Frenet-Serret 局部坐标、基流冻结假设的动机 |
| 4 | 2610.39522 | Causality-informed dynamic mode decomposition | `2026-10-30-...GC-DMD.md` | 完整 DMD 推导链、VAR(1) 因果估计、F 检验 $d_1=1/d_2=T-r-1$、BH-FDR $q=0.05$、Kou 模态重要性准则 |
| 5 | 2610.39586 | On the rise of a Taylor bubble–drop assembly | `2026-10-30-...taylor-bubble.md` | `multiphaseInterFoam`/PIMPLE/VOF、linearUpwind + vanLeer、3° 楔形轴对称 + 64 径向单元、网格收敛 <1.5%、速度分布解析式、Brown (1965) 极限校验、TOMS 748 双根分支与不稳定性 |
| 6 | 2610.37577 | Artificial Flame Thickening for TD-Unstable Lean H₂ Flames | `2026-10-28-...ATF-flame.md` | PeleLMeX AMR、低马赫数反应流、混合平均扩散、Burke (2012) H₂ 机理、FIAB 构型、$L_z\ge4L$、LES 80% 解析度判据、Peters 插值、$C_K$ 谱假设 |
| 7 | 2610.37376 | target-$\omega$ interfacial turbulence-damping model | `2026-10-28-...target-omega.md` | CLSVOF、调和平均面粘度、$Re_\tau\simeq180$ 标准算例完整规格、DNS $3.79\times10^6$ 单元、Kim (1987) 验证、$y^+_{grid}\in\{0.5,1,3,6\}$、Egorov 最佳 $B\simeq1$、计时 512.53 s vs 524.38 s、Fabre/Stäbler 完整算例规格 |
| 8 | 2610.39780 | Curved vortex generator geometry optimization | `2026-10-30-...vortex-generator.md` | ANSYS Fluent/SIMPLE、SST $k$–$\omega$、二阶中心+上风、网格无关性（0.74M/1.15M/1.62M/2.09M）、$y^+$ 0.99→0.26、UDF 迭代生成充分发展入口、完整几何参数、实验验证精度、最优解参数值、~24 h/算例成本 |
| 9 | 2610.40426 | Aerodynamic Shape Optimization of unsteady flapping wings | `2026-10-30-...flapping-wing-ROM.md` | 全阶 KKT 内存瓶颈（$B,C,D$ 尺寸）、降阶后 $r$ 维块尺寸、降阶基"并集而非 POD"、Algorithm 2/3 非定常灵敏度采集、$p_s=2$ 离散阶次对照表、3D 网格与 ROM 采样比例、**1.5 TB → 4 MB** |

---

## 本批次主题分布（9 篇）

```
湍流建模 / 湍流机理  ████████  4篇  (44%)   三波级联 / 涡失稳 / 界面阻尼 / 液态金属混沌
降阶模型 / 优化       ████      2篇  (22%)   GC-DMD / LSS-ROM 形状优化
多相流                ██        1篇  (11%)   Taylor 气泡-液滴组合体
燃烧 / 湍流燃烧       ██        1篇  (11%)   ATF 加厚火焰
工程应用              ██        1篇  (11%)   涡发生器强化传热
```

---

## 对 @墨鱼丸 的可执行建议（按优先级）

### ⭐⭐⭐ 最高优先级：可立即落地的

**1. target-$\omega$ 界面阻尼（2610.37376）** — 本批次最可落地
- "**目标值 + 局部壁律反演**"替代"经验前因子"的思路**不仅限于界面湍流**，任何需要"壁面类约束"的闭合式都可套用
- **幂律混合**衔接粘性层/对数层两个渐近极限 —— 干净的数值技巧
- **调和平均**处理跨界面粘度 —— 多数多相求解器在此出错
- 局部 Newton 迭代的鲁棒性设计：最大 10 次迭代、下界 $10^{-12}$、失败时延后到下一非线性迭代重试
- **额外开销仅 ≈2.3%** —— 几乎免费
- ⭐ Stäbler 算例（实验液深 10.24 mm）建议加入**多相流回归测试集**

**2. GC-DMD（2610.39522）** — 低成本高回报
- 代码已开源：`github.com/JiaqingKou/GC-DMD-Granger-Causality-informed-DMD`
- 可直接叠加在现有 POD/DMD 管线上：SVD 降维 → VAR(1) GC + F 检验 + BH-FDR → 构造 $C_{ij}$ → 带权正则 DMD → Kou 重要性排序
- $r$ 是超参数，建议做秩扫描（$r=20/40/80$）看预测误差–稀疏度 trade-off

**3. Taylor 气泡-液滴算例（2610.39586）** — 验证算例
- 已有 **Viana (2003) / Hayashi (2011) / Bonhomme (2012)** 三套基准，网格要求极低（64 径向单元）
- ⭐ **3° 楔形轴对称技巧**（周向仅 1 层网格）值得复用 —— 算力节省 100×以上

### ⭐⭐ 次优先级：概念迁移

**4. LSS-on-LSPG 优化流水线（2610.40426）**
- 核心可迁移：**"把梯度从全阶移到降阶空间"**（FOM 采样 → ROM → 降阶灵敏度 → 优化器）
- Algorithm 3（BDF 递推 + QR 归一化采集非定常灵敏度）是可独立复用的技巧
- **重要工程教训**：降阶基用"**并集**"而非"POD"（多组数据标度差异使 POD 失效）
- ⚠️ **$p_s=2$ 的解多项式在算例中比 $p_s=1$/$p_s=3$ 都好** → 降阶/离散阶次必须实测验证

**5. 代理模型优化模板（2610.39780）**
- **CCD → 回归多项式 → GA/NSGA-II → 重新仿真验证** 是高度可复用的流水线
- UDF 迭代加速充分发展入口（回收出口场作下一次的入口）是加速共轭传热收敛的实用技巧
- ⚠️ **$F_1$ 陷阱**：单纯最大化换热得到高流阻极端构型，**必须同时报告 $j/f$ 或 $j/f^{0.33}$**

**6. ATF 加厚判据链（2610.37577）**
- $Ka_{\mathrm{f}}^{F}=Ka_{\mathrm{f}}\sqrt{F}$、$Da_{\mathrm{f}}^{F}=Da_{\mathrm{f}}/F$
- 用 $Ka_{\mathrm{f}}^{F}$ 与 $Da_{\mathrm{f}}^{F}$ **双重匹配**构造标定数据库（跨 $F$ 坍缩是很好的一致性检验）
- 燃烧速度必须**分别**修正局部传播 $I_0$ 与褶皱 $\Psi$，不要合并为单一经验系数
- ⚠️ 限制 $\Lambda_{\mathrm{f}}^{F}=L_{\mathrm{int}}/l_{\mathrm{f}}^{F}\gtrsim1$

### ⭐ 参考级：方法论

**7. 谱分辨 TKE 预算 + 双谱（2610.39123）**
- ⭐ **6 阶中心差分 + 6 阶滤波**是性价比高的 DNS 配置
- 但完整的谱分辨预算 + 双谱 + resolvent 后处理工程量巨大，可先实现一维波数分解版本

**8. 液态金属旋流混沌（2610.39348）**
- ⭐ **直接可照抄的 OpenFOAM 工作流**：网格无关性表、参数扫描设计、五种混沌诊断工具组合
- ⭐ **解耦技巧**：用**电势 Laplace 方程**预计算 $\mathbf{J}$ 分布，再解析展开洛伦兹力作源项，避免双向耦合
- 建议引入 **0-1 混沌检验 + 关联维数** 作为流场非定常性诊断的标准工具包

**9. 螺旋涡失稳（2610.39386）**
- **柱坐标 + Fourier 谱**是绕轴对称/周期几何的高性价比路线
- 建议采用"**线性稳定性分析 → 弱非线性分析 → 全非线性 DNS**"三段式流程

---

## 分类说明

⚠️ **`cs.FL` 是"形式语言与自动机理论"（Formal Languages and Automata Theory）分类，与流体力学无关**。本批次 `cs.FL` 的论文（Reachability in Five-Dimensional VAS、Block-exchange descent for insertion、Exact Avoid-or-Compress Extrema、Tree Equivalence of Higher-Order Recursion Schemes、Learning Erasing Equal-Length Relational Pattern Languages）**全部为纯理论计算机科学内容**，已全部排除。

> **建议**：将 `.knowledge-config.json` 中 caixin 的 `arxiv_categories` 从 `["cs.FL", "physics.flu-dyn"]` 改为仅 `["physics.flu-dyn"]`，避免每日的无效检索与筛选开销。

---

## 执行统计

| 指标 | 数值 |
|---|---|
| 检索到的条目（API 60 条） | 60 |
| 有效流体相关论文 | 33 |
| 与 10-30 重叠 | 9（本批全部） |
| **新建笔记** | **0** |
| **技术补强笔记** | **9** |
| 追加技术内容 | ~19 KB |
| 排除的 cs.FL 理论论文 | 5 |
| Git 同步 | ✅ |

---

**报告生成**：2026-10-31 15:03 UTC · 菜心 (caixin) 🥬
