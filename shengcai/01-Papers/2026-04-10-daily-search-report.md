# 每日渲染论文搜索报告

**日期**: 2026-04-10
**执行时间**: 14:00 UTC
**搜索范围**: arXiv cs.GR (最近24小时)、ACM Digital Library、SIGGRAPH

---

## 📋 搜索摘要

| 来源 | 论文总数 | 渲染相关数 |
|------|----------|-----------|
| arXiv cs.GR (04/06-04/10) | 26 | 7 |
| ACM Digital Library | ~ | 0 |
| SIGGRAPH/SIGGRAPH Asia | - | 0 |

---

## 🥬 新增笔记 (4篇)

### 1. Non-reference Perceptual Resolution Selection for Power-Efficient Client-Side Rendering
- **ID**: 2604.07959
- **领域**: 实时渲染 / 感知质量 / 神经渲染
- **核心**: 120Hz 下无需参考图像的分辨率预测，节省 51% 像素渲染
- **创新**: DINOv2 + 运动向量融合，人类视觉系统时空限制建模
- **会议**: arXiv cs.GR, 2026-04-09
- **文件**: `2026-04-10_NR-Perceptual-Resolution-Client-Rendering.md`
- **推荐度**: ⭐⭐⭐⭐⭐ 高实用性，功耗优化场景直接相关

### 2. Real-time Neural Six-way Lightmaps
- **ID**: 2604.03748
- **领域**: 体积渲染 / 神经渲染 / 烟雾渲染
- **核心**: 神经网络从屏幕空间引导图预测六方向光图，<4ms/帧
- **创新**: 将 3D 体积渲染降维到 2D 屏幕空间，U-Net + Channel Adapters
- **会议**: arXiv cs.GR (TOG), 2026-04-04
- **文件**: `2026-04-10_RealTime-Neural-SixWay-Lightmaps.md`
- **推荐度**: ⭐⭐⭐⭐⭐ 高实用性，AAA 游戏烟雾特效直接相关

### 3. Exploring Performance-Energy Trade-offs in Real-Time 3D Gaussian Splatting
- **ID**: 2604.07177
- **领域**: 3DGS / 实时渲染 / GPU 优化
- **核心**: GPU 降频模拟边缘设备，分析 3DGS 能耗-性能权衡
- **创新**: Emulation-based 方法，覆盖移动到高端 GPU 的性能包络
- **会议**: arXiv cs.GR, 2026-04-08
- **文件**: `2026-04-10_RealTime-3DGS-Edge-GPU-Tradeoffs.md`
- **推荐度**: ⭐⭐⭐⭐ 为边缘部署提供量化参考

### 4. Ergonomic Principles Guided Apartment Layout Generation
- **ID**: 2604.08411
- **领域**: 程序化生成 / 建筑可视化
- **核心**: 将建筑学人体工程学标准融入 Transformer 生成模型
- **会议**: EUROGRAPHICS 2026 Short Paper, 2026-04-09
- **文件**: `2026-04-10_Ergonomic-Apartment-Layout-Generation-Eurographics2026.md`
- **推荐度**: ⭐⭐⭐ 建筑可视化相关，非核心渲染领域

---

## 🔍 其他相关论文

| ID | 标题 | 关键词 | 相关度 |
|----|------|--------|--------|
| 2604.06358 | Deformable Gaussian Splatting for Ensemble Simulations | 3DGS, 可视化代理 | ⭐⭐⭐ |
| 2604.04244 | VisACD: GPU-Accelerated Approximate Convex Decomposition | 碰撞检测, GPU 加速 | ⭐⭐⭐ |

---

## 📊 关键词覆盖率

| 关键词 | 命中 |
|--------|------|
| ray tracing | ❌ 无新论文 |
| path tracing | ❌ 无新论文 |
| real-time rendering | ✅ 2604.07959 |
| global illumination | ❌ 无新论文 |
| PBR | ❌ 无新论文 |
| rasterization | ✅ 2604.07177 (3DGS) |
| BVH | ❌ 无新论文 |
| ray marching | ✅ 2604.03748 |

---

## 📝 技术趋势观察

1. **神经渲染 + 实时性能**: 多个工作将神经渲染推向实时（<4ms），将计算从 3D 空间降维到 2D 屏幕空间
2. **功耗优化**: 移动端/边缘渲染的功耗约束越来越受关注，感知质量驱动的分辨率自适应
3. **3DGS 持续活跃**: Gaussian Splatting 在实时渲染和可视化代理方向持续有应用论文

---

## ✅ 已同步

- 论文笔记: 4 篇
- Git 提交: `git-sync.sh` 执行中
