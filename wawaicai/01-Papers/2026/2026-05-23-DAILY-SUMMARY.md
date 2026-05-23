# 每日几何处理论文摘要 — 2026-05-23

## 📊 今日搜索概况

- **搜索范围**：arXiv cs.GR (最近 72h)、SIGGRAPH/SIGGRAPH Asia/Eurographics 会议
- **关键词**：mesh processing, geometry processing, point cloud, subdivision surface, parametrization, remeshing, simplification
- **搜索时间**：2026-05-23 14:04 UTC

---

## 🥬 几何处理相关论文

### 1. Polycube 六面体网格生成 (⭐⭐⭐ 高优)
**A Dual-latent Diffusion Model for Polycube-Based Hexahedral Mesh Generation**
- arXiv:2605.20274 | 2026-05-21
- **核心**：条件扩散模型 + 双潜在空间，直接从点云生成 Polycube，无需表面分割
- **推荐度**：✅ 推荐（几何网格生成方向，值得传递给墨鱼丸）

### 2. 3D 点云 Chain-of-Thought 推理 (⭐⭐ 高优)
**Enhancing 3D Point Cloud Reasoning via Chain-of-Thought**
- arXiv:2605.22013 | 2026-05-21
- **核心**：两阶段 CoT 框架，55K PoCoTI 数据集，微调 PointLLM-R
- **推荐度**：✅ 推荐（点云深度学习方向）

### 3. 曲线几何加速 Winding Numbers (⭐⭐ 中优)
**Spatially Accelerated Winding Numbers for Curved Geometry**
- arXiv:2605.19200 | 2026-05-20
- **核心**：BVH + NURBS 矩量数据预计算，次线性复杂度包容查询
- **推荐度**：✅ 推荐（几何基础算法，数值稳定性需评估）

### 4. ExVCC 多尺度微结构 Catmull-Clark (⭐⭐ 中优)
**Generative and isoparametric geometric modeling of large-scale and multiscale microstructures**
- arXiv:2605.18894 | 2026-05-20
- **核心**：按需生成微结构，ExVCC 扩展体积 Catmull-Clark 样条
- **推荐度**：✅ 推荐（细分曲面方向，学术价值高）

### 5. CompoSE 部件感知 3D 形状合成 (⭐ 普通)
**Compositional Synthesis and Editing of 3D Shapes via Part-Aware Control**
- arXiv:2605.19350 | 2026-05-20
- **核心**：Diffusion Transformer，局部/全局交替处理，无需文本的部件级编辑
- **推荐度**：✅ 推荐（形状合成方向）

### 6. BodyReLux 视频重新打光 (⭐ SIGGRAPH 关注)
**BodyReLux: Temporally Consistent Full-Body Video Relighting**
- arXiv:2605.21766 | SIGGRAPH 2026 Journal Track | 2026-05-20
- **核心**：视频扩散 + OLAT 捕获 + 光源 token 条件化
- **推荐度**：⚠️ 关注（图形学方向，与网格处理关联较弱）

---

## 💾 笔记文件
- `2026/2026-05-21-Dual-Latent-Diffusion-Polycube-Hexahedral-Mesh.md`
- `2026/2026-05-21-PoCoTI-Point-Cloud-Chain-of-Thought.md`
- `2026/2026-05-20-Accelerated-Winding-Numbers-Curved-Geometry.md`
- `2026/2026-05-20-ExVCC-Multiscale-Microstructure-Catmull-Clark.md`
- `2026/2026-05-20-CompoSE-Part-Aware-3D-Shape-Synthesis.md`
- `2026/2026-05-20-BodyReLux-Video-Relighting.md`

## 📋 待分析队列
1. Polycube 扩散生成 — 高优先级（可直接传递墨鱼丸）
2. PoCoTI 点云推理 — 高优先级
3. 曲线几何 Winding Numbers — 中优先级（数值稳定性需评估）

---
*由 wawaicai 自动生成 | 2026-05-23 14:04 UTC*