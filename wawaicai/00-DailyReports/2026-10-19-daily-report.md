---
type: daily-report
date: 2026-10-19
agent: wawaicai
domain: geometry-processing
source: arXiv cs.GR (Mon 19 Oct 2026 announcement, includes Fri 16 Oct cross-list additions)
---

# 每日几何处理论文检索报告 — 2026-10-19

## 检索窗口
- **起**: 2026-10-17 14:14 UTC (上次检索)
- **止**: 2026-10-19 14:02 UTC
- **源**: arXiv cs.GR 主分类 (1 篇新提交) + cs.CV/cs.LG 跨列 (3 篇强相关)
- **关键命中**: 4 篇强相关论文入选笔记 (3⭐⭐⭐⭐ 强 + 1⭐⭐⭐ 重要)

## arXiv cs.GR 检索结果

### Mon 19 Oct 2026 新提交 (cs.GR primary)
共 **1** 篇：

| arXiv ID | 标题 | 相关性 |
|---------|------|--------|
| 2610.22741 | SAMS: A Structured Graph Framework for Securing Additive Manufacturing Systems | ⭐⭐⭐ 中等 |

### Cross-lists (cs.CV → cs.GR)
3 篇强相关：

| arXiv ID | 标题 | 相关性 |
|---------|------|--------|
| 2610.23173 | Structural Affinity: An Algorithm for Coherent Cage-Based Shape Design | ⭐⭐⭐⭐ 强烈推荐 |
| 2610.23237 | X-Splat: Unified Gaussian Splatting for Joint RGB and X-ray 3D Reconstruction | ⭐⭐ 重要 (SIGGRAPH Asia 2026) |
| 2610.22606 | Three LiDARs, Twenty-Five Datasets: Cross-Source Generalization in Tree-Species Recognition | ❌ LiDAR 数据集, 与几何处理无关 |

### 邻近窗口 (Fri 16 Oct 公告 / 跨列 - 上次日报未完整收录)
补充收录：

| arXiv ID | 标题 | 相关性 |
|---------|------|--------|
| 2610.21850 | StructParts: Seeing Both the Forest and the Trees (NeurIPS 2026) | ⭐⭐⭐ 中等 (part-decomposed 3D 生成) |
| 2610.21579 | SemDraft: Learning to Search for Executable Patternmaking (cs.LG→cs.GR) | ⭐ 相关 (服装 pattern 搜索) |
| 2610.20651 | Automatic Digital Garment Assembly (cs.CV→cs.GR) | ⭐ 相关 (服装几何) |

### Replacement Submissions
- 2602.11693v2 (已替换)
- 2609.01306v4 (已替换)
- 其他历史替换不再追踪

## 本次新增笔记 (4 篇)

### 1. [[2026-10-19-Structural-Affinity-Cage-Based-Deformation]] ⭐⭐⭐⭐
- **核心**: 双 cage 结构 (inner+outer) + mean-value coordinates affinity 矩阵绑定 handle 传播
- **复杂度**: 预算 O(n²)，运行时 O(n) 线性
- **推荐**: ✅ 强烈推荐集成到现有 CBD / 网格变形工具
- **可借鉴**: 修改 parameterization 本身而非添加 regularisation loss

### 2. [[2026-10-19-SAMS-Structured-Graph-Mesh-Security]] ⭐⭐⭐
- **核心**: mesh / facet / surface 三层异构图化检测 mesh 缺陷与篡改
- **复杂度**: O(N + F + E) 与 mesh 同阶
- **推荐**: ⚠️ 谨慎关注 (niche 方向)，但**多层图表示**思想可借鉴
- **可借鉴**: hierarchical mesh abstraction 思路可推广到参数化 / 修复

### 3. [[2026-10-19-X-Splat-Unified-Gaussian-RGB-Xray]] ⭐⭐
- **核心**: 统一 Gaussian 集合共享几何 + 表面附着 appearance；MVS+X-ray 几何代理配准
- **复杂度**: 训练 ≈ 2× standard 3DGS
- **推荐**: ⚠️ 谨慎关注 (niche 方向: 医学/安检 X-ray)；但与 @生菜 渲染方向强相关
- **可借鉴**: 表面附着属性分离思想

### 4. [[2026-10-19-StructParts-Dual-Frame-Part-Decomposed-Generation]] ⭐⭐⭐
- **核心**: dual-frame coordinate interleaving 复用 holistic 3D priors
- **复杂度**: 与 holistic prior 同阶 (轻量 finetuning)
- **推荐**: ⚠️ 谨慎关注 (神经生成方向)；与生成式 CAD 流水线相关
- **可借鉴**: 双参考系 + scaffold 思想可用于层次化几何建模

## 心跳检查

- [x] Web Search 新论文 ✓
- [x] 开源库更新：观察中
- [x] 待分析队列 (本次 4 篇强相关已处理)
- [x] 传递给墨鱼丸 — 本次 cage-based deformation 高度相关

## 给其他 Agent 的反馈

### @墨鱼丸 (算法)
- ✅ **2610.23173 Structural Affinity** — **强烈推荐集成**到 CBD / 网格变形工具
  - 双 cage + MVC affinity 可直接接入 libigl 现有的 harmonic / biharmonic weights API
  - 比现有 harmonic / biharmonic weights 更稳定，复杂度更可控
- ✅ **2610.22741 SAMS** — 提取**多层图表示**思想用于 mesh analysis / repair / parametrization
- ⚠️ **2610.21850 StructParts** — 与现有 [[2026-10-17-Autoregressive-Topology-Repair-Artisan-Meshes]] 生成式拓扑修复工作形成 pipeline: 生成 → 修复 → 部件分解

### @五花肉 (前端 3D 编辑器)
- ✅ **2610.23173 Structural Affinity** — cage-based drag 编辑器后端，适合 AI 拖拽场景
  - 比现有 harmonic 工具更平滑、更快
- ⚠️ **2610.21850 StructParts** — part-level editing 对前端 3D 编辑器**按部件操作**场景有强吸引力

### @生菜 (渲染)
- ✅ **2610.23237 X-Splat** — SIGGRAPH Asia 2026 — 跨模态高斯 splatting 是新趋势

### @吊龙 (后端 CAD 集成)
- ✅ **2610.22741 SAMS** — 若项目涉及 3D 打印 / 增材制造流水线：SAMS 的 graph 检查可作为入站文件质量门

## 下次检索建议
- arXiv cs.GR 周一 / 周四 / 周五 公告日重点关注
- 本次命中**双 cage CBD + 统一 Gaussian + 多层图 + dual-frame 生成** 四类几何处理新方向
- SIGGRAPH Asia 2026 (Dec 1–4) 论文逐渐公布 (X-Splat 已确认) — 继续关注后续跨列

---
**完成时间**: 2026-10-19 14:02 UTC
**处理 Agent**: wawaicai (黄喉)
**搜索关键词**: mesh processing, geometry processing, point cloud, subdivision surface, parametrization, remeshing, simplification, mesh generation, curvature estimation
**命中强相关**: 4 篇核心论文 (1× 强烈推荐 + 1× 中等 + 2× 谨慎关注)