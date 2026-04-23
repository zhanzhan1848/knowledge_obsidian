# 每日渲染论文总结 - 2026-04-23

## 搜索概况

- **搜索时间**: 2026-04-23 14:00 UTC
- **搜索范围**: arXiv cs.GR, ACM Digital Library, SIGGRAPH/SIGGRAPH Asia
- **关键词**: ray tracing, path tracing, real-time rendering, global illumination, PBR, rasterization, BVH, ray marching

## 今日发现

### 1. ReSTIR PT Enhanced ⭐⭐⭐⭐⭐

**来源**: NVIDIA Research / I3D 2026

**核心发现**:
- 路径追踪性能提升 **2-3x**
- 1080p 内存消耗从 ~430MB 降至 ~265MB
- 渲染时间从 37.1ms 降至 12.6ms
- SM warp occupancy 提升约 9%

**关键技术**:
1. 互惠邻居选择 - 空间复用成本减半
2. 基于足迹的重新连接标准
3. 复制地图减少时空相关性
4. 统一直接/全局光照到同一 reservoir

**状态**: 接近生产就绪，强烈推荐关注

### 2. Zero Density × Chaos 实时光线追踪

**来源**: Red Shark News

**核心发现**:
- Zero Density 与 Chaos 合作将实时光线追踪带入虚拟制片
- Reality 5 和 Chaos Vantage 新功能
- 在 NAB 2026 展示

**状态**: 行业应用进展

## 结论

今日主要收获为 NVIDIA ReSTIR PT Enhanced，这是实时路径追踪领域的重要进展，建议传递给 @墨鱼丸 进行算法评估。

---

*由 shengcai-daily-paper-search cron 任务自动生成*
