# 每日论文搜索报告 — 2026-06-08

## 搜索配置
- **时间范围**: 2026-06-07 14:00 ~ 2026-06-08 14:00 (UTC)
- **数据源**: arXiv cs.GR, ACM Digital Library, SIGGRAPH 2026
- **关键词**: ray tracing, path tracing, real-time rendering, global illumination, PBR, rasterization, BVH, ray marching

## 搜索结果
- **arXiv cs.GR (Jun 6-8)**: 共扫描约 34 篇论文，发现 3 篇渲染相关新论文
- **ACM Digital Library**: 搜索受限，未获取到新结果
- **SIGGRAPH 2026**: 会议筹备中，2026年8月召开，尚无公开论文列表
- **SIGGRAPH Asia 2026**: 委员会已组建，投稿截止中
- **gsplat 项目更新**: 2026-07-04 有新版本发布，集成 3DGUT（支持扭曲相机和卷帘快门）

## 本次新增论文

### 🥩 新增 3 篇渲染相关论文

#### 1. Learning Complex Luminaires with Light Tracing
- **arXiv**: [2606.04319](https://arxiv.org/abs/2606.04319) | 2026-06-03
- **领域**: 离线渲染 · 光传输 · 神经渲染
- **核心创新**: 使用光追迹（Light Tracing）+ 归一化流（Normalizing Flow）学习复杂灯具外观，解决多层镜面封装灯具难以路径追迹的问题
- **推荐度**: ⭐⭐⭐⭐⭐
- **可行性**: 适合传递给 @墨鱼丸 评估在离线渲染器中实现

#### 2. Decoupling Appearance and Geometry in Gaussian Splatting
- **arXiv**: [2606.05124](https://arxiv.org/abs/2606.05124) | 2026-06-03
- **领域**: 神经渲染 · 3DGS · 新视角合成
- **核心创新**: 发现 3DGS 默认形式无法同时表示纹理和几何的本质缺陷，提出为每个 splat 添加独立几何不透明度参数实现解耦
- **推荐度**: ⭐⭐⭐⭐
- **可行性**: 中等难度，适合集成到现有 3DGS 管线

#### 3. Composable Function Systems as a General-Purpose Rendering Framework
- **arXiv**: [2606.02226](https://arxiv.org/abs/2606.02226) | 2026-06-02
- **领域**: 隐式曲面渲染 · GPU渲染框架
- **核心创新**: 提出函数系统作为免网格渲染框架，引入 Quibble 元编程框架，支持拓扑非平凡对象
- **推荐度**: ⭐⭐⭐
- **可行性**: 需要设计 DSL，中高难度

## arXiv cs.GR 扫描概览（Jun 6-8）

| 日期 | 总论文数 | 渲染相关 |
|------|---------|---------|
| Jun 8 | 12 | 0 |
| Jun 5 | 10 | 0 |
| Jun 4 | 6 | 0 |
| Jun 3 | 6 | 2 |
| Jun 2 | 19 (部分) | 1 |

### 今日（Jun 8）arXiv cs.GR 论文摘要
经逐一检查，均与渲染/光照领域无直接关联：
- Skeletal-Anchored Dual Harmonics（3D形状表示）
- AI LOD（游戏中 NPC 运动预测）
- Agentic LLM for 3D Frame Structural Analysis
- Differentiable 3D Triangle-Triangle Intersection Energy
- CADmesh/Geant4（物理模拟）
- Cubic Hermite Lattice Structures（晶格结构）
- Semantic-Structural Alignment for Pictorial Charts
- Real-Time AttentionBender（视频扩散Transformer）

## 备注
1. gsplat v2026-07-04 包含 3DGUT 集成，支持扭曲相机和卷帘快门，建议关注
2. 本次搜索发现的 3 篇论文均具有实现价值，已存入知识库
3. SIGGRAPH 2026 预计在 2026 年 8 月召开，论文列表预计 7 月开始公布
4. 建议持续关注 arXiv cs.GR，明日再次执行搜索

---
*搜索时间: 2026-06-08 14:00 UTC*