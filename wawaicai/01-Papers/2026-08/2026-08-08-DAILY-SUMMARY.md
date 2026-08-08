# 每日论文收集报告 - 2026-08-08

## 收集范围
- arXiv cs.GR (Geometry Processing)
- ACM Digital Library
- SIGGRAPH/SIGGRAPH Asia/Eurographics 会议

## 关键词
mesh processing, geometry processing, point cloud, subdivision surface, parametrization, remeshing, simplification

---

## 📄 本次收集论文 (6 篇)

### 1. Meshy T2 (arXiv:2607.28675)
**Fast Native Mesh Generation with Flow Matching**
- Flow Matching 框架直接从图像生成高质量紧凑网格
- Vertex-Set Mesh VAE 保留艺术家拓扑
- 端到端 6 秒生成，比自回归快一个数量级
- ✅ 推荐实现

### 2. LATO.2 (arXiv:2607.10623)
**Factorized 3D Mesh Generation with Vertex and Topology Flow**
- 因子化：顶点流 + 连接性流
- 支持 part-wise 高分辨率生成
- 支持 topology-adaptive editing
- ✅ 推荐实现

### 3. CCFR (arXiv:2607.26901)
**Convex Collision-Free Regions for Collision Handling**
- 显式凸可行区域处理碰撞
- 兼容 XPBD 等模拟框架
- ✅ 推荐实现

### 4. PointRSP (arXiv:2608.02432)
**Point Cloud Generation via Recursive Spectral Partitioning**
- ECCV 2026 录用
- 保拓扑的自回归点云生成
- ✅ 推荐关注

### 5. CASA-SDF (arXiv:2607.13492)
**Curriculum-Aware Spatial Adaptation for Neural Implicit Surface Reconstruction**
- 解决室内场景几何异质性问题
- SAUA + CALADT 双机制
- ✅ 推荐实现

### 6. SCALP (arXiv:2608.00187)
**Semi-Supervised Statistical Shape Modeling from Imperfect 3D Photogrammetry**
- 医学图像形状建模
- 半监督 Point Transformer + Laplace-Beltrami 谱变形
- ✅ 推荐关注

---

## 🔍 趋势观察

### 网格生成
- **Flow Matching** 成为网格生成新范式
- 因子化方法（顶点/拓扑分离）是重要方向
- 交互速度（<10s）成为实际应用门槛

### 点云处理
- 拓扑感知生成受到重视
- 递归谱分割提供结构化方法
- 自回归 + 级联生成是主流

### 神经隐式
- 课程学习和局部自适应策略
- 曲率感知密度变换
- 室内场景细节恢复

---

## 📁 笔记存储
`~/knowledge-vault/wawaicai/01-Papers/2026-08/`

## ⏰ 下次收集
2026-08-09 02:00 UTC
