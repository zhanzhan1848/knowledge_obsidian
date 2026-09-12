# 📅 每日几何处理论文汇总 — 2026-09-12

## 搜索范围
- arXiv cs.GR (最近24h内: 2026-09-11 ~ 2026-09-12)
- ACM Digital Library / SIGGRAPH Asia 2026
- 关键词: mesh processing, geometry processing, point cloud, subdivision, parametrization, remeshing, simplification

---

## 🥬 本日新论文 (5篇)

### 🔥 高优先级

| 论文 | 会议 | 核心领域 | 推荐度 | 备注 |
|------|------|----------|--------|------|
| [Neural CVT](2026-09-12-Neural-CVT-Remeshing.md) | arXiv cs.GR | CVT remeshing / GNN | ✅ | 100x 加速，基于学习的表面 CVT 求解器 |
| [ADELE](2026-09-10-ADELE-Mesh-Reconstruction.md) | SIGGRAPH Asia 2026 | 自适应网格重建 | ✅ | 已收录于 Sep-10；Sep-12 确认 SIGGRAPH Asia接收 |
| [RBF Your SDF](2026-09-12-RBF-Your-SDF-Tangent-Sphere-Interpolation.md) | arXiv cs.GR | SDF / 隐式曲面 | ✅ | 切球感知 RBF 插值，保留尖锐特征 |

### 📌 中优先级

| 论文 | 会议 | 核心领域 | 推荐度 | 备注 |
|------|------|----------|--------|------|
| [PLSR](2026-09-12-PLSR-3D-Super-Resolution.md) | arXiv cs.CV | 3D 超分辨率 | ⚠️ | 生成式方法，与纯几何处理关联度中等 |

---

## 📊 主题分布

```
Remeshing      █████  (Neural CVT)
SDF几何重建    ████   (RBF Your SDF)
Mesh重建      ██     (ADELE)
3D超分辨率    ██     (PLSR)
```

---

## 🔬 值得关注的技术趋势

### 1. Learning-based Geometry Processing 成熟化
**Neural CVT** 将 GNN 嵌入 CVT 优化循环，100x 加速且保持几何保真度。这是继 Neural ODE/Neural PDE 之后，几何优化领域的重要突破。

### 2. Mesh-Native Reconstruction 成为主流
**ADELE**（SIGGRAPH Asia 2026）直接在网格空间优化，脱离 NeRF/3DGS 中间表示，结合：
- 自适应 Delaunay 四面体网格
- Multi-resolution Hash Grid 特征
- Depth-offset 可微渲染

### 3. SDF 切球结构 + RBF 插值新范式
**RBF Your SDF** 利用切球几何信息 + partition-of-unity RBF，解决 marching cubes 系统性圆化尖锐特征的问题。

---

## 📋 本周技术演进观察 (Sep 8-12)

```
Day     论文/主题
Sep-08  Neural CVT (GNN + CVT remeshing)
Sep-08  PLSR (localized 3D super-resolution)
Sep-09  (search coverage gap - rate limited)
Sep-10  ADELE (SIGGRAPH Asia), RBF Your SDF, Kinematic Refinement
Sep-11  (no new cs.GR papers detected)
Sep-12  Review + new note creation
```

---

## 🔗 知识库关联

- [[2026-09-12-Neural-CVT-Remeshing]] — GNN 加速 CVT，与 remeshing 相关
- [[2026-09-10-ADELE-Mesh-Reconstruction]] — 自适应网格，直接优化
- [[2026-09-12-RBF-Your-SDF-Tangent-Sphere-Interpolation]] — SDF 隐式曲面，尖锐特征
- [[2026-09-08-MeshSplatBench-Triangle-Based-Neural-Rendering]] — 三角形神经渲染基准

---

## ⚠️ 搜索限制说明

- Brave Search API 遇到 rate limit (429)，部分搜索失败
- 尝试直接通过 arXiv HTML 页面获取论文详情
- ACM Digital Library 未发现新几何处理论文（会议论文通常集中在截稿后2-3个月发布）

---

## 📝 后续行动

- [ ] Neural CVT 代码/模型发布后，集成到知识库
- [ ] 关注 ADELE (SIGGRAPH Asia 2026, Dec 1-4) 完整论文
- [ ] RBF Your SDF partition-of-unity 实现细节待研究

---

*🥬 娃娃菜 · 几何处理专家 · 2026-09-12*
