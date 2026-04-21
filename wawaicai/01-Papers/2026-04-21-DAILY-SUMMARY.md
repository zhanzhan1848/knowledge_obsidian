# 每日几何处理论文摘要 — 2026-04-21

## 📊 搜索概况
- **搜索时间**：2026-04-21 14:06 UTC
- **搜索范围**：arXiv cs.GR (最近7天)、SIGGRAPH 2026、Eurographics 2026
- **关键词**：mesh processing, geometry processing, point cloud, subdivision surface, parametrization, remeshing, simplification
- **结果**：共扫描 30 篇 arXiv cs.GR 论文，其中 **6 篇**与几何处理直接相关

---

## 🥬 今日重要论文

### 1. 【几何分割】STEP-Parts — Geometric Partitioning of Boundary Representations
| 属性 | 值 |
|------|-----|
| arXiv | [2604.14927](https://arxiv.org/abs/2604.14927) |
| 作者 | Shen Fan et al. |
| 日期 | 2026-04-16 |
| 标签 | CAD, B-Rep, 几何分割, 深度学习 |

**核心**：从 STEP B-Rep 提取几何实例分区，解决 CAD 学习中三角化丢失拓扑结构的问题。ABC 数据集 180K 模型 < 6 小时处理。

**推荐度**：⭐⭐⭐⭐⭐

---

### 2. 【简化】Progressive Convex Hull Simplification
| 属性 | 值 |
|------|-----|
| arXiv | [2604.14468](https://arxiv.org/abs/2604.14468) |
| 作者 | Alec Jacobson |
| 日期 | 2026-04-15 |
| 标签 | 凸包, 简化, 碰撞检测 |

**核心**：O(n log n) 贪心对偶优化，将凸包简化为指定半空间数，最小化体积增加。保守简化保证真凸包上界。

**推荐度**：⭐⭐⭐⭐⭐

---

### 3. 【体素化】Fast Voxelization and Level of Detail for Microgeometry Rendering
| 属性 | 值 |
|------|-----|
| arXiv | [2604.13191](https://arxiv.org/abs/2604.13191) |
| 作者 | Javier Fabre |
| 日期 | 2026-04-14 |
| 标签 | 体素化, LOD, 微几何, SGGX |
| 收录 | The Visual Computer |

**核心**：CUDA 并行体素化 + 层次 SGGX 聚类，为纤维织物等各向异性散射材质提供高效 LoD 渲染。

**推荐度**：⭐⭐⭐⭐

---

### 4. 【拓扑】Twisted Edges — Linked Knot Structures
| 属性 | 值 |
|------|-----|
| arXiv | [2604.12023](https://arxiv.org/abs/2604.12023) |
| 作者 | Tolga Yildiz |
| 日期 | 2026-04-13 |
| 标签 | 非流形网格, 拓扑, 链接结 |

**核心**：将 edge twist 从二进制推广到任意整数标签，揭示 knotted surfaces 理论，用于编织/关节结构设计。

**推荐度**：⭐⭐⭐⭐

---

### 5. 【体渲染】VVGT — Visual Volume-Grounded Transformer
| 属性 | 值 |
|------|-----|
| arXiv | [2604.12217](https://arxiv.org/abs/2604.12217) |
| 作者 | Youcheng Cai |
| 日期 | 2026-04-14 |
| 标签 | 体渲染, 3DGS, 体积可视化 |

**核心**：前馈体积可视化框架，消除逐场景优化，Volume Geometry Forcing 机制，零样本泛化。

**推荐度**：⭐⭐⭐

---

### 6. 【碰撞】DAT — Divide and Truncate Multi-physics
| 属性 | 值 |
|------|-----|
| arXiv | [2604.15513](https://arxiv.org/abs/2604.15513) |
| 作者 | Anka He Chen |
| 日期 | 2026-04-16 |
| 标签 | 碰撞检测, 多物理场, 穿透避免 |

**核心**：空间分区 + 位移截断，保证穿透自由；Planar-DAT 变体解决阻尼和死锁问题。

**推荐度**：⭐⭐⭐

---

## 📅 会议动态

| 会议 | 日期 | 状态 |
|------|------|------|
| SIGGRAPH 2026 | 2026-07-19, Los Angeles | 论文已截稿，结果未公布 |
| SIGGRAPH Asia 2026 | 2026-12-01, Kuala Lumpur | 截稿 2026-05-12 |
| EGSR 2026 | 2026-07-01, Bordeaux | 截稿 2026-04-15 |

---

## 📁 笔记文件
- `2026-04-21-DAT-Penetration-Free-MultiPhysics.md`
- `2026-04-21-VVGT-Volume-Grounded-Transformer.md`
- `2026-04-21-Twisted-Edges-LK-Structures.md`

---
*🥬 黄喉 · 几何知识专家 · 2026-04-21*
