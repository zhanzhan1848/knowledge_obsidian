# 每日论文搜索报告 — 2026-10-12

## 搜索范围
- **来源**: arXiv [physics.flu-dyn] & [cs.FL]（cs.FL 是形式语言，与流体仿真无关，已排除）
- **时间窗口**: 2026-10-11 14:10 UTC ~ 2026-10-12 14:10 UTC（last 24h）
- **关键词**: CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence
- **代理**: 🥢 菜心 / 鲜毛肚 (Caixin) — 流体力学 Agent
- **搜索方式**: arXiv /list/{cat}/new + 每篇 abs 抓取摘要

## 抓取结果

| # | 编号 | 标题（缩写） | 提交 v1 | 类别 | 笔记 |
|---|------|--------------|--------|------|------|
| 1 | 2610.12634 | RMI 在 Kelvin-Voigt 黏弹性界面 early-time | 10-08 | physics.flu-dyn | ✅ |
| 2 | 2610.12709 | 湍流管流周向非均匀加热共轭传热（低 Pr） | 10-08 | physics.flu-dyn | ✅ |
| 3 | 2610.13425 | 基于物理的不可压缩流参数化非侵入式 ROM (OpInf) | 10-09 | physics.flu-dyn | ✅ |
| 4 | 2610.13457 | Binormal flow：湍流 toy model（讲义笔记） | 10-09 | physics.flu-dyn | ✅ |
| 5 | 2610.13533 | 凝固中液态金属滴指状结构 re-emergence | 10-09 | physics.flu-dyn | ✅ |
| 6 | 2610.13615 | 剪切 2D Euler 流体最终 stationary 态预测 | 10-09 | physics.flu-dyn | ✅ |
| 7 | 2610.13796 | 微流控 T 型结涡流颗粒动力学中 Basset 历史力 | 10-09 | physics.flu-dyn | ✅ |

> 注意：physics.flu-dyn 共 21 条（新 7 + 交叉 3 + 替换 11）；其中 **3 个 cross-list 来自 med-ph/soft**，**11 个 replacements** 不是新论文，均**未纳入笔记**。cs.FL 为形式语言与自动机理论，与本次搜索范围无关，**跳过**。

## 高价值论文（建议优先阅读）

1. **2610.13425** — 非侵入式参数化 ROM，含 pressure / velocity 双基 + 解耦 LS，工程可立即借鉴
2. **2610.13615** — 2D Euler stationary state 的 Vlasov 框架，可作为团队 turbulence ROM 范式
3. **2610.13533** — 凝固液态金属流动：金属增材制造的物理基础

## 🥢 传递给 @墨鱼丸 的算法/实现建议

| 论文 | 实现路径 | 难度 |
|------|---------|------|
| 2610.13425 (OpInf) | PyTorch LS + 双 POD 基 → 工程模板 | 中 |
| 2610.13615 (Vlasov 2D) | 谱方法 + 能量积分 | 中 |
| 2610.13796 (历史力) | OpenFOAM 扩展 PISO + Lagrangian 耦合 | 中-高 |
| 2610.13533 (凝固 + RT) | OpenFOAM + VOF + multi-region CHT | 高 |

## 同步状态

- ✅ 7 篇笔记已写入 `~/knowledge-vault/caixin/01-Papers/`
- ⏳ 下一步：`~/.scripts/git-sync.sh` 推送 GitHub
