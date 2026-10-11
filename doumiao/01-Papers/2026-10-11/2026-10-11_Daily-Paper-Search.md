---
type: report
created: 2026-10-11
updated: 2026-10-11
tags: [report, daily-search, fluid-rendering, arxiv, cs.GR]
status: processed
domain: fluid-rendering
agent: doumiao
---

# 每日论文搜索报告 — 2026-10-11 (UTC)

## 搜索范围

- **时间窗口**：最近 24–72 小时（2026-10-08 → 2026-10-10 arXiv 批次）
- **来源**：arXiv cs.GR（含 cross-list from cs.CV）、SIGGRAPH 2026 / SIGGRAPH Asia 2026
- **关键词**：fluid rendering, water rendering, smoke rendering, fire simulation, ocean rendering, particle system, volume rendering
- **当前 arXiv 状态**：2026-10-09 (Fri) 周五批次为最近发布（周末无新论文发布）

---

## 候选论文（21 篇 cs.GR 新提交）

### 严格匹配流体渲染的论文（3 篇）

| arXiv ID | 标题 | 匹配方向 | 笔记 |
|----------|------|----------|------|
| [2610.12461](https://arxiv.org/abs/2610.12461) | OuroWorld: 3D Cinemagraphs (Fri 2026-10-09) | 多样动态含类流体、烟雾、水波 | [[2026-10-11-OuroWorld-3D-Cinemagraphs-Gaussian-Splatting]] |
| [2610.10554](https://arxiv.org/abs/2610.10554) | GaussianBench & GaussianFlesh (Fri 2026-10-09) | MPM 多材料耦合、热相变、流-固-粒统一评测 | [[2026-10-11-GaussianBench-GaussianFlesh-Physics-Evaluation]] |
| [2610.09822](https://arxiv.org/abs/2610.09822) | Simulation Methods for Multiphysics Phenomena (Thu 2026-10-08) | 流体/颗粒/可形变体综述 EUROGRAPHICS 课程 | [[2026-10-11-Multiphysics-Simulation-Methods-Eurographics-Course]] |

### 相关但弱匹配的论文（不详细分析，列入观察）

| arXiv ID | 标题 | 备注 |
|----------|------|------|
| [2610.04689](https://arxiv.org/abs/2610.04689) | Neuroll: Neural Strand-Based Hair Simulation | Simulator-in-the-Loop，邻近物理仿真技术 |
| [2610.07609](https://arxiv.org/abs/2610.07609) | PhysLDM: Latent Diffusion Deformable Simulation | 体积可形变仿真，邻近流体/软体 |
| [2610.10061](https://arxiv.org/abs/2610.10061) | TRACK (Racing Telemetry) | 非流体渲染，仅做记录 |

### SIGGRAPH 2026 已发表相关论文（再观察，非本次新发现）

- [[LagrangianSplats-Divergence-Free-Fluid-Reconstruction]]
- [[GauSmoke-3D-Gaussian-Smoke-Reconstruction]]
- [[Fluid-Gen-Zero-Video-Generation]] (arXiv 2610.10984, Oct 7)
- [[WorldParticle-Lagrangian-Particle-Dynamics-Transformer]]

### 候选但排除的论文（方向不匹配）

- 数字人/角色动画：MACE-Dance / DreamActor-M2 / 4D-HOF
- 几何 / 网格：PrimitiveCAD / OctMesh / CurveCodec 2 / StyleFields
- 神经辐射缓存：NRC / SteadySplats
- 数字孪生机器人：InterMimicGen / Co²Skill / StableGrasp
- 其他

---

## 搜索方法

1. **arXiv 直接查询**：`https://arxiv.org/list/cs.GR/new` & `/recent` 列出近 5 个工作日
3. **关键词匹配**：标题+摘要过滤含 fluid / water / smoke / fire / volume / particle / ocean / fluid-like / multiphysics / MPM / SPH 等
5. **SIGGRAPH 2026 / Asia 2026**：通过 kesen.realtimerendering.com 验证官方收录
7. **手工评估**：逐一查看 21 个新提交 + cross-list + replacements 摘要

---

## 今日重点收获

🩸 **可行性分析：物理集成高斯场景表示的评测空白**

1. **GaussianBench + GaussianFlesh（最强信号）**
   - 首个 physics-fidelity 评测协议，对流体渲染领域意义：
       - 提供统一守恒/响应/相变/耦合 基准
       - 揭示了 6 款现有系统在 counterfactual 干预下的失败模式
       - **推荐度 ✅**：可作为流体-颗粒-软体耦合仿真器的标准评测

2. **OuroWorld（多样动态 Cinemagraph）**
   - **不是物理流体**，但演示中包含烟雾/水波等类流体效果
   - 突破 LoopGaussian / 3D-MOM 等 Eulerian 流体的运动类型限制
   - **推荐度 ⚠️**：仅适合离线"以假乱真"应用

3. **Multiphysics Simulation Course（EUROGRAPHICS 2026）**
   - 流体渲染方向的方法论综述手册
   - 覆盖刚体/可形变/流体/颗粒 + 耦合 + ML 趋势
   - **推荐度 ✅✅**：作为新论文撰写与入门必备参考

---

## 待跟进

- 2026-10-13 (Tue) arXiv 新批次：可能有新 SIGGRAPH Asia 2026 投稿
- SIGGRAPH Asia 2026 论文正式录用通知（参考 [physicsbasedanimation.com](https://www.physicsbasedanimation.com/2026/09/08/siggraph-asia-2026/)）
- 关注 LagrangianSplats / GauSmoke / Fluid-Gen-Zero 的后续工作与代码发布

---

## Git 同步

执行 `~/knowledge-vault/.scripts/git-sync.sh` 提交至 https://github.com/zhanzhan1848/knowledge_obsidian.git