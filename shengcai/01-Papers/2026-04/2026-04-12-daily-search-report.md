# Daily Search Report — 2026-04-12

## 搜索范围
- **时间窗口**: 最近 24 小时 (2026-04-10 ~ 2026-04-12)
- **来源**: arXiv cs.GR, ACM Digital Library, SIGGRAPH/SIGGRAPH Asia
- **关键词**: ray tracing, path tracing, real-time rendering, global illumination, PBR, rasterization, BVH, ray marching

---

## 来源概况

### arXiv cs.GR
本周（Apr 6-12, 2026）共 **26 篇** 新投稿，过往几天分布：
- Apr 10: 8 篇（含 4 篇 cross-list from cs.CV）
- Apr 9: 5 篇（含 4 篇 cross-list from cs.CV）
- Apr 8: 5 篇（含 cross-list）
- Apr 7: 6 篇（含 cross-list）
- Apr 6: 2 篇

### SIGGRAPH 2026
SIGGRAPH 2026（7 月19 日，美国洛杉矶）论文征集已于 1 月截止，目前处于评审阶段，尚未公布 accepted papers。暂无新论文可抓取。

### SIGGRAPH Asia 2026
SIGGRAPH Asia 2026（12 月1-4 日，马来西亚吉隆坡）论文截止日期为 8 月 26 日，尚未到截止日期，无已录用论文。

### ACM Digital Library
今日搜索未发现近 24 小时内发表的图形学相关新论文。

---

## 渲染领域相关论文筛选

### ✅ 核心渲染论文（已创建笔记）

| 论文 | 日期 | 关键词 | 创新性 | 推荐度 |
|------|------|--------|--------|--------|
| [NR-Perceptual-Resolution-Client-Rendering](2026-04-10_NR-Perceptual-Resolution-Client-Rendering.md) | Apr 10 | 感知分辨率、客户端渲染 | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| [RealTime-Neural-SixWay-Lightmaps](2026-04-10_RealTime-Neural-SixWay-Lightmaps.md) | Apr 10 | ray marching、参与介质、光照贴图 | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| [RealTime-3DGS-Edge-GPU-Tradeoffs](2026-04-10_RealTime-3DGS-Edge-GPU-Tradeoffs.md) | Apr 10 | 3DGS、光栅化、边缘设备 | ⭐⭐⭐ | ⭐⭐⭐ |
| [VisACD-GPU-Approximate-Convex-Decomposition](2026-04-12_VisACD-GPU-Approximate-Convex-Decomposition.md) | Apr 12 | GPU、碰撞检测、凸分解 | ⭐⭐⭐ | ⭐⭐⭐ |
| [CrowdVLA-Embodied-VLA-Crowd-Simulation](2026-04-12_CrowdVLA-Embodied-VLA-Crowd-Simulation.md) | Apr 12 | 群体模拟、VLA agent | ⭐⭐⭐⭐ | ⭐⭐⭐ |

### ❌ 非渲染论文（已过滤）

| 论文 | 原因 |
|------|------|
| Ergonomic-Apartment-Layout-Generation | 建筑布局生成，无渲染技术 |
| Investigating-Performance-with-Univariate-Distribution-Charts | 可视化图表研究 |
| Physics-Based-Motion-Tracking-of-Contact-Rich-Characters | 运动追踪，非渲染 |
| Deformable-Gaussian-Splatting-for-Ensemble-Simulations | 科学可视化 surrogate，非核心渲染 |

---

## 重点论文分析

### 🥩 重点关注：Real-time Neural Six-way Lightmaps (2604.03748)

**核心创新**：将六方向光照贴图技术与神经网络结合，实现参与介质（烟雾等）的实时动态渲染。

**技术亮点**：
1. 使用 **ray marching** 生成 guiding map（大步长采样近似散射和轮廓）
2. 训练神经网络预测六方向光照贴图
3. 可直接集成到现有游戏引擎管线

**可行性评估**：✅ 推荐
- 属于 ray marching 在实时渲染中的典型应用
- 工程实现路径清晰，有游戏集成价值
- 适合传递给 @墨鱼丸 进行算法设计

### 🥩 重点关注：Non-reference Perceptual Resolution for Client Rendering (2604.07959)

**核心创新**：无参考感知分辨率选择，实现功耗高效的客户端渲染。

**技术亮点**：
1. 利用人眼时空感知极限
2. 仅从渲染视频本身预测最低感知可区分分辨率
3. codec-agnostic，最小基础设施改动

**可行性评估**：⚠️ 谨慎评估
- 创新性高，但需要大规模训练数据集
- 实际部署依赖感知质量标签

---

## 搜索执行时间
2026-04-12 14:00 UTC

## 下次搜索计划
2026-04-13 02:00 UTC
