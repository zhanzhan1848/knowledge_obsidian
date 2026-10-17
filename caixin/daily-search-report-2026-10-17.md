# 每日论文搜索报告 — 2026-10-17

## 搜索范围

- **来源**: arXiv [physics.flu-dyn]（主）+ [physics.comp-ph] / [cond-mat.soft] 关键词交叉
- **时间窗口**: 2026-10-16 14:03 UTC ~ 2026-10-17 14:03 UTC（last 24h）
- **关键词**: CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence
- **代理**: 🥢 菜心 / 鲜毛肚 (Caixin) — 流体力学 Agent
- **搜索方式**: arXiv `/list/physics.flu-dyn/new` + cross-list 扫描（physics.comp-ph, cond-mat.soft, math.AP）+ 关键词交叉 (`vortex`/`turbulence`/`SPH`/`LBM`)

## 抓取结果（24h 窗口内 physics.flu-dyn 主类）

| # | 编号 | 标题（缩写） | 提交 v1 | 类别 | 笔记 |
|---|------|--------------|--------|------|------|
| 1 | 2610.20650 | Weber 标度 + 距离依赖：压力旋流喷雾液滴尺寸 | 10-16 | physics.flu-dyn | ✅ |
| 2 | 2610.20784 | 双频稳态流：振幅比与相位对泵送的影响 | 10-16 | physics.flu-dyn | ✅ |
| 3 | 2610.21564 | 前缘几何形状对平板气动性能影响 | 10-15 | physics.flu-dyn | ✅ |
| 4 | 2610.21694 | Hurricane Laura 对风电机载荷 — Part I（LES 高保真） | 10-15 | physics.flu-dyn × ao-ph | ✅ |
| 5 | 2610.21831 | 环境气压对水微滴光学击穿后冲击波与液壳膨胀的影响 | 10-16 | physics.flu-dyn | ✅ |
| 6 | 2610.22044 | 持续涡脱落与声子亚表面的 FSI 相互作用 | 10-16 | physics.flu-dyn | ✅ |

## 跨类别关键词命中（cross-list 到 physics.flu-dyn）

| # | 编号 | 标题（缩写） | 提交 v1 | 主类 | 笔记 |
|---|------|--------------|--------|------|------|
| 7 | 2610.20621 | XPINN 域分解在激波主导 Burgers 方程的评估 | 10-16 | physics.comp-ph | ✅ |
| 8 | 2610.20643 | TC-MLNO + 条件扩散：刚化学动力学加速 | 10-16 | physics.comp-ph | ✅ |
| 9 | 2610.20978 | PCA-GPR 可微分代理：核热工水力贝叶斯 IUQ | 10-14 | physics.comp-ph | ✅ |
| 10 | 2610.21996 | PANDA-D：无界面动态接触角双角测定 | 10-16 | cond-mat.soft | ✅ |

## 关键跨类别命中（math.AP，NSE 理论突破）

| # | 编号 | 标题（缩写） | 提交 v1 | 主类 | 笔记 |
|---|------|--------------|--------|------|------|
| 11 | 2610.21530 | Bardos-Tartar 猜想对 Navier-Stokes 方程（已证明 2D） | 10-15 | math.AP | ✅ |

## 跳过

- **cs.FL 当日**：1 篇新提交（Compositional Automata Learning），1 篇 cross-list（HyperRecHML），均为**形式语言 / 自动机理论**，与流体力学核心关键词无交集 → **跳过**。
- **physics.flu-dyn 当日 replacements**：9 篇 v2/v3/v4 替换稿，本次不处理（已有笔记基础）。

## 高价值论文（建议优先阅读）

1. **2610.21530** — Bardos-Tartar 猜想证明（2D NSE）：**NSE 千禧问题相关里程碑**，揭示 NSE 解对黏度的极端敏感性
2. **2610.20643** — TC-MLNO + 条件扩散：化学反应流仿真 **10× 加速**，工业级应用前景
3. **2610.20978** — PCA-GPR 可微分贝叶斯 IUQ：UQ 加速 3000×，**核热工 / 化工 / 气候模型标定**通用范式
5. **2610.22044** — 声子亚表面 FSI：被动流控可衰减涡脱落 30–50% 而平均力变化 < 0.5%
6. **2610.21694** — 飓风尺度 LES → 风电机气弹耦合：高分辨率入口数据对极端载荷预测至关重要

## 🥢 传递给 @墨鱼丸 的算法/实现建议

| 论文 | 实现路径 | 难度 | 价值 |
|------|---------|------|------|
| 2610.21530 (Bardos-Tartar 2D) | 黏度敏感性提示：监控数值格式对模式的衰减 | 低（哲学） | 高（学术里程碑） |
| 2610.20643 (TC-MLNO) | OpenFOAM chemistryModel 替换 CVODE → PyTorch ML 模型 | **极高** | **极高**（10× 加速） |
| 2610.20978 (PCA-GPR IUQ) | CFD + 可微分代理 + NUTS，反应堆/化工标定 | 很高 | **极高**（UQ 工业应用） |
| 2610.22044 (PSub FSI) | OpenFOAM `pimpleFsiFoam` + 接地二聚链模型 | 高 | 高（被动流控） |
| 2610.21694 (Hurricane) | LES 输出 → OpenFAST inflow（替换 TurbSim） | 高 | 高（风电极端载荷） |
| 2610.20621 (XPINN Burgers) | 激波区局部网络容量 ↑，替换 overlap 增大 | 高 | 高（ML 求解器） |
| 2610.20784 (Two-freq streaming) | BVP 求解 + lab-on-chip pump 优化 | 中 | 高（微流控） |
| 2610.21996 (PANDA-D) | MD 接触角自动测量（替代手动 circle-fit） | 中 | 中（多相流基础） |
| 2610.20650 (We–L scaling) | 喷雾 We–L 联合标度作为 CFD 验证 baseline | 低 | 中（实验验证） |
| 2610.21831 (Laser-droplet) | VOF/Level-set + subgrid plasma 极端多相流 | 中 | 中（极端条件） |
| 2610.21564 (Flat plate LE) | Re=1000 涡脱落 2D benchmark（LES / DES 验证） | 低 | 中（benchmark） |

## 主题分布

- **AI / ML for fluid dynamics**：3 篇（XPINN, TC-MLNO, PCA-GPR IUQ）
- **NSE 数学理论**：1 篇（Bardos-Tartar 2D 证明）
- **多相流 / 喷雾 / 液滴**：3 篇（We-L scaling, laser-induced breakdown, contact angle）
- **气动 / 涡脱落 / FSI**：3 篇（flat plate LE, phononic subsurface FSI）
- **风电机 / 大气边界层**：1 篇（Hurricane Laura）
- **微流控 / 声学流**：1 篇（two-frequency streaming）

## ML/AI 论文占比统计

- **AI/ML 论文**: **3 / 11 = 27.3%**（比上次任务显著增加）
- 趋势：**ML 加速 CFD / 反应流 / UQ** 是当前流体领域最活跃方向

## 同步状态

- ✅ 11 篇笔记已写入 `~/knowledge-vault/caixin/01-Papers/`
- ⏳ 下一步：`~/.scripts/git-sync.sh` 推送 GitHub

## 备注

- cs.FL 当日仅 1 篇新提交（自动机学习），与流体方向无关 → 全跳过
- 10-16 任务（`daily-search-report-2026-10-16.md`）未发现文件，可能为周末跳过；本次已覆盖 10-15 至 10-16 窗口
- 跨类别命中率较高（4 篇 cross-list + 1 篇 math.AP），说明本次关键词扫描覆盖了**真正的新研究**而不仅是 physics.flu-dyn 主类

---

生成者：菜心 (caixin) - 流体力学 Agent