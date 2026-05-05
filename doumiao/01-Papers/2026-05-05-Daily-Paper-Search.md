# 流体渲染领域论文日报 - 2026-05-05

## 📊 今日搜索概况
- **搜索范围**: arXiv cs.GR (最近24小时) + SIGGRAPH/SIGGRAPH Asia
- **关键词**: fluid rendering, water rendering, smoke rendering, fire simulation, ocean rendering, particle system, volume rendering
- **结果**: cs.GR 今日更新 7 篇新论文，找到 1 篇相关论文

---

## 📄 今日论文

### 1. Orbit-Space Particle Flow Matching for Generative Modeling
- **arXiv ID**: [2605.02222](https://arxiv.org/abs/2605.02222)
- **作者**: Jinjin He et al.
- **发表**: arXiv pre-print (2026-05-04)
- **分类**: cs.GR, cs.CV
- **日期**: 2026-05-04 提交

**核心创新**
- 提出 OGPP (Orbit-Space Geometric Probability Paths)
- 粒子原生 flow-matching 框架用于粒子系统生成建模
- 解决粒子置换对称性问题

**三大关键组件**
1. Orbit-space probability-path 端点规范化
2. 粒子索引嵌入用于角色专门化
3. 几何概率路径 + arc-length-aware 终端速度

**技术亮点**
- minimal-surface benchmarks 上单步推理误差降低两个数量级
- ShapeNet 上 5x 更少步数达到 SOTA
- 产生法线作为 flow 的副产品

**相关性**: ⭐⭐⭐ **粒子系统相关 — 可用于流体粒子生成**

---

## 📊 搜索结论

### 今日发现
1. **cs.GR 今日更新量较少** — 仅 7 篇新论文
2. **SIGGRAPH 2026** — 会议 2026 年 7 月举行，论文尚未公布
3. **SIGGRAPH Asia 2026** — 会议 2026 年 12 月举行，论文尚未公布
4. **FieryGS** — 已在昨日报告 (2026-05-04) 中详细记录

### 相关性分类

| 论文 | 相关性 | 原因 |
|------|--------|------|
| 2605.02222 Orbit-Space Particle Flow | ⭐⭐⭐ | 粒子系统生成模型，可用于流体粒子 |
| 2605.02770 Implicit Minimal Surfaces | ⭐ | 几何映射，非流体渲染 |
| 2605.02742 Motion In-Betweening | ⭐ | 动画插值，非流体 |
| 2605.02302 Medial Axis | ⭐ | 几何处理，非流体 |
| 2605.01919 SDF Interpolation | ⭐⭐ | SDF 相关，可用于流体表面 |
| 2605.01536 Generalized Winding Numbers | ⭐ | 几何inside/outside测试 |
| 2605.01456 Visualization Taxonomy | ⭐ | 可视化研究，非流体 |

### 领域趋势观察
- **3DGS + 流体/燃烧模拟** 持续火热 (FieryGS)
- Flow matching 开始应用于粒子系统生成
- 神经渲染与传统流体模拟融合

### 下一步建议
- 持续监控 ICLR/ECCV 新论文 (FieryGS 已被 ICLR 2026 接收)
- 关注 flow matching 在流体模拟中的应用
- 关注 3DGS 与流体模拟结合方向

---

## 📁 文件信息
- **创建时间**: 2026-05-05 14:19 UTC
- **Agent**: Doumiao (豆苗) 🌱
- **搜索关键词**: fluid rendering, water rendering, smoke rendering, fire simulation, ocean rendering, particle system, volume rendering
- **搜索范围**: 最近 24 小时 (2026-05-04 14:17 UTC - 2026-05-05 14:17 UTC)
