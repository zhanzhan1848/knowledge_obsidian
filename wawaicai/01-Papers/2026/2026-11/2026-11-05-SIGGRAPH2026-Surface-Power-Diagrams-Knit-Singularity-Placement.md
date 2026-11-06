---
type: paper
created: 2026-11-05
updated: 2026-11-05
tags: [paper, 几何, 幂图, 针织, 奇异性放置, 曲面映射, 制造, SIGGRAPH2026, ACM-TOG]
status: processed
domain: geometry
agent: wawaicai
source: https://doi.org/10.1145/3811401
---

# Surface Power Diagrams for Knit Singularity Placement

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Surface Power Diagrams for Knit Singularity Placement |
| **作者** | Rahul Mitra, Mattéo Couplet, Ruichen Liu (Boston University), Jonathan Ng, Ruza Markov, William Batara Jeremiah Samosir (VARIANT3D), Megan Hofmann (Northeastern), Edward Chien (Boston University) |
| **发表** | ACM Transactions on Graphics, Vol. 45, No. 4 (SIGGRAPH 2026), pp. 1-20 |
| **在线发表** | 2026-07-03 |
| **链接** | [ACM DL](https://doi.org/10.1145/3811401) · [日程页](https://s2026.conference-schedule.org/?post_type=page&p=15&id=papers_1738&sess=sess185) |
| **DOI** | 10.1145/3811401 |
| **会话** | Thursday, 23 July 2026 9:40am PDT, Room 403 B · Keywords: Fabrication / Geometry Modeling / Registration |

---

## 核心贡献

> 把**幂图（power diagram）**推广到**曲面上**，用于针织的**奇异性（singularity）放置**：全局优化奇异性位置 ⟹ 更快、更优，且能生成**无螺旋（helix-free）**的针织图，并支持多种用户约束。

1. **曲面幂图（surface power diagrams）**：把幂图这一经典平面/空间结构**推广到曲面**
2. **全局优化奇异性放置**：不是逐个局部放置，而是全局求解 ⟹ 更快更优
3. **更密的针织图**：优化后可支持**更密集**的针织图
4. **无螺旋保证**：框架鲁棒地产生**helix-free** 针织图（螺旋是针织失败的主因）
5. **多种用户约束**：支持用户约束条件下的放置

---

## 技术方案

### 核心思想

```
平面幂图：区域 = argmin_i ( ||x - c_i||² - r_i )
        ↓ 推广到曲面
曲面幂图：在曲面 S 上做同样的加权 Voronoi 划分
        ↓
应用：针织奇异性 = 纱线必须绕过的"缺陷点"
        ↓
全局优化奇异性位置（在曲面幂图约束下）
        ↓
无螺旋 + 更密 + 可约束
```

**核心洞察**：幂图天然提供**最优的分区覆盖**（每个点归属"最近"站点），这正对应针织中"每个纱线环归属哪个奇异性"的划分问题。

### 关键技术

| 技术 | 说明 |
|------|------|
| **曲面幂图** | 广义 power diagram 到流形曲面 |
| **全局奇异性优化** | 位置联合优化，而非局部贪心 |
| **无螺旋（helix-free）** | 关键制造约束 —— 螺旋会导致针织失败/不可穿戴 |
| **用户约束** | 可指定奇异性位置/数量等 |
| **密度提升** | 更密的针织图（更高织物密度） |

---

## 算法复杂度

- **时间复杂度**：曲面幂图构建 $O(n \log n)$（Voronoi 类结构）；全局优化为迭代过程，每次求解幂图
- **空间复杂度**：$O(n)$
- **配套**：本轮 [[2026-11-05-SIGGRAPH2026-Scalable-GPU-3D-Voronoi-Power-Diagrams]] 正是 GPU 版 Voronoi/幂图构建 —— **可作为本文的高性能实现后端**

---

## 实现难度

- **算法复杂度**：**中高** — 曲面幂图的构建 + 全局优化框架
- **数值稳定性**：**中高** — 幂图的等值线在曲面上需要 careful 的数值处理
- **依赖项**：CGAL（2D/3D Voronoi）；本轮 GPU 版可加速；曲面参数化（Voronoi 需在曲面度量下定义）
- **硬件**：制造验证需要针织机/3D 打印设备

---

## 实验结论

- 更快、更优的奇异性放置
- 支持**更密**的针织图
- 鲁棒产生**无螺旋**针织图
- 支持多种用户约束

---

## 局限性

- 面向特定制造工艺（针织），迁移到其他制造需重新审视约束
- 曲面幂图的实际构建需要曲面上的度量/度量近似

---

## 可行性评估

✅ **推荐实现（制造价值 + 与本轮 GPU 幂图论文形成组合）**

### 推荐理由
1. **"曲面幂图"是一个可迁移的抽象**：不止针织 —— 曲面上的 Voronoi 划分适用于任何"曲面分区 + 局部避让"问题
2. **本轮有 GPU 配套**：[[2026-11-05-SIGGRAPH2026-Scalable-GPU-3D-Voronoi-Power-Diagrams]] 可直接提供加速
3. **制造导向**：从几何处理到可制造产物的完整链条，是本库关注的"实用可复现"方向

### 实现建议
- **优先级**：**中高**
- **实现路径**：
  1. **先读 GPU 幂图论文**（本轮），确认其是否支持"曲面度量"或需先展平到平面
  2. 在参数域上实现：把曲面参数化 → 平面幂图 → 拉回曲面（注意度量畸变，需要在展平域上做各向异性加权）
  3. 实现无螺旋约束作为优化项
- **务实提示**：若曲面参数化畸变大，可考虑**直接在 3D 空间中做幂图**（用曲面内在度量近似），或用**测地距离**代替欧氏距离

---

## 相关工作

- [[2026-11-05-SIGGRAPH2026-Scalable-GPU-3D-Voronoi-Power-Diagrams]] — **配套加速**
- [[2026-11-05-SIGGRAPH2026-Better-Bending-Kirchhoff-Love-Shells]] — 同 session 相邻（同为制造/结构）
- [[2026-11-05-SIGGRAPH2026-Stress-Aware-Panelization-Freeform-Surfaces]] — 同 session 相邻（同为制造优化）
- [[Power Diagram]]
- [[Voronoi Diagram]]
- [[Knit Fabrics]]

---

**推荐度**：⭐⭐⭐⭐
