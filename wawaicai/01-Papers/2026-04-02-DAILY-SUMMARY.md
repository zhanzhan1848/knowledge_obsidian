# 几何处理论文日报 — 2026-04-02

## 扫描范围
- arXiv cs.GR：最近 7 天（38 篇）
- ACM Digital Library / SIGGRAPH / Eurographics：近期预录用/预印本

## 关键词覆盖
`mesh processing`, `geometry processing`, `point cloud`, `subdivision surface`, `parametrization`, `remeshing`, `simplification`

---

## 🥇 最相关论文

### 1. Dual Contouring of Signed Distance Data
- **arXiv**: 2604.00157 | **日期**: 2026-03-31
- **作者**: Xiana Carrera et al.
- **领域**: 表面重建 / SDF / 锐利特征
- **核心**: 在离散 SDF 数据上重建多边形网格，无需 Hermite 数据即可恢复锐利特征
- **可行性**: ✅ 推荐实现 — 局部二次优化，完全并行化，无需训练

### 2. MeshTailor: Cutting Seams via Generative Mesh Traversal  
- **arXiv**: 2603.27309 | **日期**: 2026-03-28
- **作者**: Xueqi Ma et al. (Shenzhen Univ)
- **领域**: UV 映射 / 接缝生成 / 网格处理
- **核心**: 首个网格原生生成式接缝框架，Pointer Network + 双流编码器
- **可行性**: ⚠️ 谨慎评估 — 需大量训练数据，实现复杂

---

## 🥈 相关论文

| 论文 | arXiv | 领域 | 简要 |
|------|-------|------|------|
| DiffSoup | 2603.27151 | 网格简化/辐射场 | 三角形Soup可微栅格化 |
| TopoCtrl | 2603.26926 | 拓扑编辑 | 潜扩散拓扑优化编辑 |
| SPREAD | 2603.27573 | 点云/场景生成 | 几何感知扩散模型 |

---

## 本次未发现

- ❌ subdivision surface 新论文
- ❌ 经典 remeshing / simplification 方法
- ❌ 参数化新算法
- ⏳ SGP 2026 论文（会议未到截稿期）

---

## 下一步

- 🔔 建议关注 **Dual Contouring SDF** — 可作为 libigl 扩展实现
- 📅 Eurographics 2026 论文征集中（截稿 2026-01，已过）
- 📅 SGP 2026 截稿 2026-03，尚未公布

## 笔记文件

- `2026-04-02/2026-04-02-Dual-Contouring-Signed-Distance-Data.md`
- `2026-04-02/2026-04-02-MeshTailor-Cutting-Seams-Generative-Mesh-Traversal.md`
- `2026-04-02/2026-04-02-Other-Geometry-Related-Papers.md`
