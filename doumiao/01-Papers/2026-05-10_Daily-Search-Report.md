# 每日论文搜索报告

**日期**: 2026-05-10
**Agent**: 豆苗 (doumiao)
**搜索范围**: arXiv cs.GR (最近7天) + SIGGRAPH 2026 会议
**关键词**: fluid rendering, water rendering, smoke rendering, fire simulation, ocean rendering, particle system, volume rendering

---

## 搜索结果摘要

### 流体渲染相关论文

本次搜索在 arXiv cs.GR (2026-05-04 ~ 2026-05-10) 共发现 **35 篇** 新论文，其中与流体渲染领域直接相关的有：

#### 1. Orbit-Space Particle Flow Matching (OGPP)
- **arXiv**: [2605.02222](https://arxiv.org/abs/2605.02222)
- **日期**: 2026-05-04
- **领域**: 粒子系统生成模型
- **核心**: 解决粒子系统生成中的置换对称性问题，轨道空间规范化 + 几何概率路径
- **标签**: `particle-system` `generative-model` `flow-matching`

#### 2. AI CFD Scientist
- **arXiv**: [2605.06607](https://arxiv.org/abs/2605.06607)
- **日期**: 2026-05-07
- **领域**: 计算流体动力学 (CFD)
- **核心**: AI Agent 自动发现 CFD 物理模型，视觉-语言物理验证门
- **注意**: 分类在 physics.flu-dyn，非 cs.GR
- **标签**: `CFD` `AI-agent` `OpenFOAM`

---

### SIGGRAPH 2026 相关论文 (来自 arXiv 注释)

| arXiv ID | 标题 | 领域 | 备注 |
|---------|------|------|------|
| 2605.06593 | ReActor: RL for Physics-Aware Motion Retargeting | 机器人/动画 | SIGGRAPH 2026 |
| 2605.05095 | Bayesian Next-Best-View Selection | 重建/PDE引导物理模拟 | SIGGRAPH 2026 |
| 2605.04773 | Adaptive In-Solve Algebraic Coarsening for GPU IPC | 物理仿真/GPU | 隐式积分器 |
| 2605.03235 | Random Sampling of Occupancy Functions | 隐式曲面采样 | SIGGRAPH 2026 |
| 2605.02742 | Adaptive Interpolation-Synthesis for Motion In-Betweening | 动画 | SIGGRAPH 2026 |

---

### 领域相关性评估

| 论文 | 流体渲染相关性 | 说明 |
|------|--------------|------|
| OGPP | ⭐⭐⭐⭐⭐ | 直接相关：粒子系统生成，可用于流体粒子渲染 |
| AI CFD Scientist | ⭐⭐⭐ | 相关：涉及CFD但属于模拟而非渲染 |
| Bayesian NBV | ⭐⭐ | 弱相关：PDE引导物理模拟可关联流体 |
| GPU IPC | ⭐⭐ | 弱相关：物理仿真通用方法 |

---

## 观察与趋势

1. **粒子系统生成建模热度上升**: OGPP 等工作将流匹配扩展到粒子系统，与流体渲染中的粒子可视化直接相关

2. **AI for Science in CFD**: AI CFD Scientist 展示 AI Agent 在计算流体动力学中的应用

3. **SIGGRAPH 2026 论文陆续公开**: 5月起逐步有 SIGGRAPH 2026 论文在 arXiv 上出现

4. **Implicit Surface 方法持续**: ADS (Adaptive Delaunay Scaffolding) 等采样方法与流体表面渲染相关

---

## 笔记创建

已为以下论文创建结构化笔记：
- `2026-05-10-OGPP-Orbit-Space-Particle-Flow-Matching.md`

---

**下次搜索时间**: 2026-05-11 02:00 UTC