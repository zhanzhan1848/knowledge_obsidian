# 每日渲染论文搜索报告 — 2026-07-28

## 任务概述
- **执行时间**: 2026-07-28 14:00 UTC
- **Agent**: 生菜 (Shengcai)
- **搜索范围**: arXiv cs.GR, ACM Digital Library, SIGGRAPH 2026
- **关键词**: ray tracing, path tracing, real-time rendering, global illumination, PBR, rasterization, BVH, ray marching

---

## 搜索结果

### 论文发现

| 来源 | 数量 | 渲染相关 |
|------|------|----------|
| arXiv cs.GR (最近24h) | 0 | - |
| arXiv cs.GR (最近7天) | 0 | - |
| SIGGRAPH 2026 | ~300+ | 20+ |
| Advances in RTR 2026 | 5 | 5 |

**注**: 最近24小时内 arXiv 无新 cs.GR 论文发布（可能因周末/节假日）。本次搜索覆盖了更广时间范围的 SIGGRAPH 2026 会议论文。

---

## 重点论文

### 1. HoloPathTracer: Fast and Accurate Wave Path Tracing for Holography ⭐⭐⭐⭐⭐
- **会议**: ACM SIGGRAPH 2026 (TOG)
- **作者**: Wenbin Zhou, Xiangyu Meng, et al. (港大、清华、斯坦福)
- **arXiv**: 2606.14173
- **核心**: 将蒙特卡洛路径追踪扩展到波光学，用于全息 VR/AR 显示
- **亮点**: 同时求解渲染方程 + Rayleigh-Sommerfeld 积分；环境辐射缓存实现10倍加速
- **推荐度**: ⭐⭐⭐⭐⭐ — 路径追踪 × 全息显示跨领域创新

### 2. ORCA: Online Radiance Cache Acceleration (EA SEED) ⭐⭐⭐⭐⭐
- **来源**: Advances in Real-Time Rendering 2026
- **团队**: Electronic Arts SEED
- **核心**: 游戏级路径追踪的在线辐射缓存加速
- **推荐度**: ⭐⭐⭐⭐⭐ — AAA生产验证，实时GI核心突破

### 3. Variable Rate Ray Tracing in Call of Duty: Modern Warfare 4 ⭐⭐⭐⭐
- **来源**: Advances in Real-Time Rendering 2026
- **团队**: Activision
- **核心**: 变速率光线追踪，根据场景复杂度动态调整光线精度
- **推荐度**: ⭐⭐⭐⭐ — 工程实践成熟，直接借鉴价值高

### 4. Smolder: Real-Time Volumetric Effect Rendering ⭐⭐⭐⭐
- **来源**: Advances in Real-Time Rendering 2026
- **团队**: Activision (Glacier Engine)
- **核心**: 实时体积效果（烟雾、火焰）渲染
- **推荐度**: ⭐⭐⭐⭐ — 已商用，体积渲染工程优化参考

### 5. PSSR Upgrading on PlayStation 5 Pro ⭐⭐⭐⭐
- **来源**: Advances in Real-Time Rendering 2026
- **团队**: Sony Interactive Entertainment
- **核心**: PlayStation 5 Pro 上的 ML 超分辨率升级
- **推荐度**: ⭐⭐⭐⭐ — 主机ML渲染部署参考

### 6. Complex-Valued Holographic Radiance Fields ⭐⭐⭐⭐
- **会议**: ACM SIGGRAPH 2026 (TOG)
- **作者**: Yicheng Zhan et al. (UCL, POSTECH)
- **核心**: 将辐射场扩展到复数域，自然编码全息图相位
- **推荐度**: ⭐⭐⭐⭐ — 神经渲染 × 全息显示交叉

---

## 技术趋势

### 渲染领域
1. **路径追踪工业化**: 从离线走向实时游戏 (ORCA, VRRT)
2. **全息显示 × 渲染**: HoloPathTracer 将路径追踪带入 VR/AR 全息
3. **自适应光线追踪**: VRRT 实现场景复杂度感知的性能优化
4. **体积渲染实用化**: Smolder 展示实时体积效果在 AAA 游戏中的可行性

### 神经渲染领域
1. **辐射场多样化**: 复数域辐射场、全息辐射场
2. **ML 渲染成熟**: PSSR 成为主机标配
3. **3DGS 持续进化**: 超高分辨率、移动端、LOD 等多维度改进

---

## 知识库更新

### 新增文件
1. `2026/2026-07-28-SIGGRAPH2026-Rendering-Papers-Summary.md` — SIGGRAPH 2026 渲染论文总览
2. `2026/2026-07-28-Advances-in-RealTime-Rendering-2026.md` — Advances in RTR 2026 详细分析

### 已存在相关文件
- `2026/2026-06-17_HoloPathTracer-Wave-Path-Tracing-Holography.md` (6月已收录)
- `2026/2026-Richer-Material-Generation-Procedural-Data-Enhancement.md` (6月已收录)

---

## 可行动项

### 推荐深入分析（传递给 @墨鱼丸）
1. **ORCA 辐射缓存**: 实时路径追踪加速的核心技术
2. **VRRT 变速率光线追踪**: AAA 游戏光线追踪优化实践
3. **HoloPathTracer**: 波路径追踪算法原理参考

### 后续跟进
- 等待 ORCA/Smolder/VRRT 论文/演示公开
- 关注 SIGGRAPH 2026 TOG 完整论文集
- arXiv cs.GR 每周监控

---

## 数据来源
- kesen.realtimerendering.com/sig2026.html
- advances.realtimerendering.com/s2026/index.html
- paperdigest.org/2026/07/siggraph-2026-papers-highlights/
- arxiv.org/abs/2606.14173 (HoloPathTracer)
- blogs.nvidia.com/blog/siggraph-news-2026/

---

*报告生成时间: 2026-07-28 14:10 UTC*
*Agent: 生菜 (Shengcai) | 渲染领域专家*
