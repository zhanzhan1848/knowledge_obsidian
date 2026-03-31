# 每日几何处理论文搜索报告

**日期**: 2026-03-31  
**执行时间**: 14:06 UTC  
**搜索范围**: arXiv cs.GR (最近48h), SIGGRAPH 2026

---

## 📋 论文发现摘要

### 2026-03-31 新发表 (arXiv cs.GR)

| arXiv ID | 论文标题 | 相关度 | 可行性 |
|----------|----------|--------|--------|
| 2603.27309 | **MeshTailor: Cutting Seams via Generative Mesh Traversal** | ⭐⭐⭐⭐⭐ | ✅ 推荐 |
| 2603.27573 | **SPREAD: Spatial-Physical REasoning via geometry Aware Diffusion** | ⭐⭐⭐⭐ | ✅ 推荐关注 |
| 2603.26926 | **TopoCtrl: Post-Optimization Topology Editing** | ⭐⭐⭐ | ⚠️ 谨慎评估 |
| 2603.27013 | Physics-based Bone-driven Neural Garment Simulation | ⭐⭐ | ⚠️ 低优先级 |
| 2603.27151 | DiffSoup: Differentiable Rasterization of Triangle Soup | ⭐⭐ | ⚠️ 低优先级 |
| 2603.28365 | AI-Generated Anime Avatars | ⭐ | ❌ 不相关 |
| 2603.27862 | Stress-Testing Image Generation Models | ⭐ | ❌ 不相关 |
| 2603.27801 | Digital-Physical Framework for Public Art | ⭐ | ❌ 不相关 |

### 会议状态

- **SIGGRAPH 2026**: 论文征集已截止，评审中，2026年8月召开
- **SIGGRAPH Asia 2026**: 投稿截止 2026-05-12
- **Eurographics 2026**: 尚未公布

---

## 🥇 重点推荐

### MeshTailor (2603.27309)

**MeshTailor: Cutting Seams via Generative Mesh Traversal**

- **领域**: UV展开 / 接缝生成 / 网格处理
- **创新**: 首个网格原生生成式框架，直接在网格图上操作
- **技术**: ChainingSeams层级序列化 + 双流编码器 + Pointer Network
- **优势**: 消除投影伪影，边缘对齐，自回归生成
- **libigl 关联**: `parameterization.cpp` 相关
- **推荐度**: ⭐⭐⭐⭐⭐

### SPREAD (2603.27573)

**SPREAD: Spatial-Physical REasoning via geometry Aware Diffusion**

- **领域**: 点云场景生成 / 几何深度学习
- **创新**: 几何感知扩散 + 可微分物理引导
- **技术**: 图transformer + 扩散模型 + 碰撞/重力/关系约束
- **数据集**: 3D-FRONT, ProcTHOR
- **推荐度**: ⭐⭐⭐⭐

---

## 📁 笔记文件

- `2026-03-31-MeshTailor-Generative-Mesh-Seams.md`
- `2026-03-31-SPREAD-Point-Cloud-Scene-Generation.md`
- `2026-03-31-TopoCtrl-Topology-Editing.md`

---

## 🔄 下一步

- [ ] MeshTailor: 跟踪代码发布，评估 libigl 集成方案
- [ ] SPREAD: 关注点云处理模块，可参考其几何感知机制
- [ ] Eurographics 2026: 持续监控会议论文发布

---

*报告由 wawaicai-agent 自动生成 | 2026-03-31*
