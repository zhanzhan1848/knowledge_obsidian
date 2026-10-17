---
type: daily-report
date: 2026-10-17
agent: wawaicai
domain: geometry-processing
source: arXiv cs.GR (Sun 11 Oct – Fri 16 Oct 2026 announcement)
---

# 每日几何处理论文检索报告 — 2026-10-17

## 检索窗口
- **起**: 2026-10-11 (上次检索)
- **止**: 2026-10-17 14:14 UTC
- **源**: arXiv cs.GR 主分类（37 篇新提交 / 跨列）+ SIGGRAPH Asia 2026 公告
- **关键命中**: 6 篇强相关论文入选笔记

## arXiv cs.GR 检索结果

### 2026-10-11 ~ 2026-10-16 新提交 (cs.GR primary)
共 49+ 篇新提交，重点筛选几何处理相关：

| arXiv ID | 标题 | 相关性 |
|---------|------|--------|
| 2610.14113 | Autoregressive Topology Repair for Generated Artisan Meshes | ⭐⭐⭐⭐ 强烈推荐 |
| 2610.11721 | SubDGuide: A Modeler-Inspired Agentic Workflow for Mesh-to-SubD Reconstruction | ⭐⭐⭐⭐ 强烈推荐 |
| 2610.17803 | Construction of Simple Quadrangulations of the Sphere at Skeletal Joints | ⭐⭐⭐ 核心 |
| 2610.15301 | Topology Optimization for Subtractive Machining Using Trimmed Neural Fields | ⭐⭐⭐ 核心 |
| 2610.21584 | Geometric Queries on Tessellation-Free Displaced Surfaces | ⭐⭐⭐ 核心 |
| 2610.15573 | WoAP: Solver-Adapted Isometric Embeddings for Projected Walk on Spheres | ⭐⭐ 重要 |
| 2610.22052 | Compression of Uniformly Distributed Unit Quaternions | ⭐ 相关 |
| 2610.17671 | Integrating 3D Posture Neutralization with Statistical Shape Modeling (HNS) | ⭐ 相关 |
| 2610.11702 | Neural Caching of Prefiltered Radiance for Specular Lighting | ⭐ 渲染 |
| 2610.16423 | Low-Cost Deep Learning for Automated Keyframe Interpolation in Sprite Animation | ⭐ 动画非几何 |
| 2610.17474 | HoOPOE: Holography-Optimized Perceptual ObjectivE function (SIGGRAPH Asia 2026) | ⭐ 显示 |
| 2610.17905 | Content-Edited Layout Generation for Graphic Design | ⭐ 设计 |
| 2610.20625 | Decoupling Appearance and Geometry in Diffusion World Models | ⭐ 神经场 |
| 2610.21121 | Residual-Sensitive Dual-Stream Gaussian Splatting | ⭐ 渲染 |
| 2610.22352 | SUPRA-TEX: 3D Generation with Super-Aligned Texture | ⭐ 纹理 |
| 2610.21865 | From Sketch to Scene: Relightable Garment Reconstruction | ⭐ 服装 |

### SIGGRAPH Asia 2026 (Kuala Lumpur, Dec 1–4 2026)
- 论文收录进展中，重点关注 Pacific Graphics 2026 + SGP 2026 track 的 mesh / remeshing / subdivision 工作
- CADKnitter (Keio / SoLa) — compositional CAD generation (前几周已收录)

## 本次新增笔记 (6 篇)

### 1. [[2026-10-17-Autoregressive-Topology-Repair-Artisan-Meshes]] ⭐⭐⭐⭐
- **核心**: face-level prefix-LM 修复网格拓扑（删除+添加两阶段）；保留 draft 几何 layout
- **算法复杂度**: O(N²·d) 训练；推理 decode steps 显著少于完整生成
- **推荐**: ✅ 强烈推荐集成（生成式 CAD 后处理）
- **可借鉴**: deletion/addition 解耦；edit-only decoding

### 2. [[2026-10-17-SubDGuide-Mesh-to-SubD-Reconstruction]] ⭐⭐⭐⭐
- **核心**: agentic workflow（plan A → verify B）调度几何工具恢复 SubD 控制笼
- **关键设计**: LLM 决策但不直接生成几何；checkpoint 回滚；6 个多模态规划器通用
- **推荐**: ✅ 推荐关注（agentic CG 趋势；CAD 反向建模利器）
- **可借鉴**: "规划者不直接生成几何"原则；状态反馈闭环

### 3. [[2026-10-17-Simple-Quadrangulations-Skeletal-Joints]] ⭐⭐⭐
- **核心**: 方向向量集 → 简单球面四边形剖分 → 有理 Bézier 体模型（关节 / 桁架）
- **算法**: 枚举候选对偶图 + lazy cyclic-order separation 分配
- **推荐**: ✅ 推荐关注（Pacific Graphics 录用）
- **可借鉴**: 枚举拓扑 + 几何实例化的两步策略

### 4. [[2026-10-17-Geometric-Queries-Tessellation-Free-Displaced-Surfaces]] ⭐⭐⭐
- **核心**: 一阶纹理空间层次（仿射高度平面 + 残差界）支持无 tessellation 的几何查询
- **应用**: 焦散渲染 / displaced emitter 采样 / 曲面 PDE
- **推荐**: ✅ 推荐关注（实时 displaced surface 场景）

### 5. [[2026-10-17-Trimmed-Neural-Fields-Topology-Optimization]] ⭐⭐⭐
- **核心**: 三隐式场乘积生成可加工几何；seamline = 场交
- **应用**: 减材制造 / 桁架 / 可展开面
- **推荐**: ✅ 推荐关注（CAD + 制造方向）

### 6. [[2026-10-17-WoAP-Walk-on-Ambient-Patch]] ⭐⭐
- **核心**: 把 embedding 作为求解器变量；解决 PWoS 折叠问题
- **应用**: 复杂几何上的 PDE 求解（电磁 / 热 / 流体）
- **推荐**: ⚠️ 谨慎关注（专业领域）

## 心跳检查

- [x] Web Search 新论文 ✓
- [x] 开源库更新：MeshInspector v0.x (新开源 mesh boolean + repair SDK)
- [x] 待分析队列 (本次 6 篇强相关已处理)
- [ ] 传递给墨鱼丸 — **本次关联显著增强！**

## 给其他 Agent 的反馈

### @墨鱼丸 (算法)
- ✅ **2610.14113 mesh topology repair** — 与生成式 CAD 流水线直接相关，**建议集成到 Artisan / MeshCarve 后处理模块**
- ✅ **2610.11721 SubDGuide** — mesh→SubD 控制笼恢复是 CAD 反向建模刚需，**建议接入传统 remesh + subdivision fitting 工具作为 LLM 决策后端**
- ✅ **2610.17803 simple quadrangulation** — 骨架关节建模可迁移到 CAD 关节 / 桁架结构生成
- ⚠️ **2610.15301 neural fields topology opt** — 仅对加工制造方向有意义，建议先观望
- **QEM 变体启发**: deletion/addition 两阶段思路可启发新 QEM 变体——按贡献度把不重要顶点挪到关键区域

### @五花肉 (前端 3D 编辑器)
- ✅ **2610.14113** 的 edit-only decoding 思路对前端**增量编辑**有强可借鉴性（不重生成整个 mesh，仅修复）
- ✅ **2610.11721** 的多规划器接口适合作为 3D 编辑器的"AI 助手"前端

### @生菜 (渲染)
- **2610.21584 tessellation-free displaced surfaces** 与你的实时渲染领域相邻，可同步关注

## 下次检索建议
- arXiv cs.GR 周一 / 周四 / 周五 公告日重点关注
- 本次命中**网格修复 / 控制笼恢复 / 四边形剖分** 三类强相关工作，下周可继续追踪相关后续工作
- SIGGRAPH Asia 2026 (Dec 1–4) 在即，关注 Pacific Graphics / SGP track 的几何处理论文

---
**完成时间**: 2026-10-17 14:14 UTC
**处理 Agent**: wawaicai (黄喉)
**搜索关键词**: mesh processing, geometry processing, point cloud, subdivision surface, parametrization, remeshing, simplification
**命中强相关**: 6 篇核心论文（mesh 修复 1 / SubD 1 / quad mesh 1 / neural field 1 / displacement 1 / PDE-on-surface 1）
