# 🥬 2026-03-25 arXiv 流体力学论文日报

> **搜索时间**: 2026-03-25 14:15 UTC
> **来源**: arXiv physics.flu-dyn
> **新论文数**: 8 篇

---

## 📊 今日论文概览

| # | arXiv ID | 标题 | 关键词 | 数值方法 |
|---|----------|------|--------|----------|
| 1 | 2603.23181 | Steady cone-jet mode of electrospray | 电喷雾, 单细胞沉积 | 实验 |
| 2 | 2603.23100 | Coefficient of restitution of wet collisions | SPH, 湿碰撞, COR | [[SPH]] |
| 3 | 2603.22927 | DNS of MILD Combustion | DNS, MILD燃烧, CEMA | [[DNS]] |
| 4 | 2603.22902 | Diffuse-interface N-phase flows with phase change | LBM, 相场, 多相流 | [[LBM]], [[相场方法]] |
| 5 | 2603.22737 | k-omega0 model for roughness | k-ω, 粗糙度, RANS | [[RANS]], [[k-omega]] |
| 6 | 2603.22556 | Vibrissa geometries for WIV | VIV, WIV, 传感器 | 实验, CPS |
| 7 | 2603.23371 | Interfacial instability in CO2 flow | 两相流, 干涸, 稳定性 | Chebyshev-τ |
| 8 | 2603.22827 | Wafer-to-Wafer Bonding FSI | FSI, FEM, Reynolds润滑 | [[FEniCSx]], [[FSI]] |

---

## 🔥 重点推荐

### 1. LBM 多相流相变模型 (2603.22902)
**亮点**: 首次提出 N 相流 + 固液相变的扩散界面模型，结合 LBM 求解
- 相场方法捕获多相界面
- 焓公式描述相变
- 满足 reduction consistent 属性
- 应用：膜冻结、液滴冻结、复合液滴冻结

### 2. SPH 湿碰撞恢复系数 (2603.23100)
**亮点**: 使用 updated-Lagrangian SPH 框架研究湿碰撞 COR 标度律
- 发现两个不同幂律区域
- COR 依赖 Stokes 数和无量纲膜厚
- 忽略表面张力（高 Weber 数）

### 3. MILD 燃烧 DNS (2603.22927)
**亮点**: 三流混合层 DNS 揭示 MILD 燃烧动力学
- 燃料-空气-热产物三流混合
- FI + CEMA 识别局部燃烧模式
- MILD 条件下以预混-自点火为主

---

## 📚 详细笔记

- [[2026-03-25-SPH-Wet-Collision-COR]] - SPH 湿碰撞恢复系数
- [[2026-03-25-DNS-MILD-Combustion]] - MILD 燃烧直接数值模拟
- [[2026-03-25-LBM-N-Phase-Phase-Change]] - LBM N 相流相变
- [[2026-03-25-k-omega-Roughness]] - k-omega0 粗糙度模型
- [[2026-03-25-CO2-Dryout-Instability]] - CO2 两相流干涸不稳定性
- [[2026-03-25-FSI-Wafer-Bonding]] - 晶圆键合 FSI

---

## 🏷️ 关键词云

`SPH` `LBM` `DNS` `RANS` `k-omega` `相场` `相变` `多相流` `燃烧` `FSI` `FEniCSx` `湍流` `粗糙度` `电喷雾` `VIV` `两相流`

---

## 🔗 相关链接

- [arXiv physics.flu-dyn recent](https://arxiv.org/list/physics.flu-dyn/recent)
- [arXiv cs.FL](https://arxiv.org/list/cs.FL/recent)
