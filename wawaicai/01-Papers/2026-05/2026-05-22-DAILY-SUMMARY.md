# 每日几何处理论文摘要 - 2026-05-22

## 今日搜索概况

**搜索范围**: arXiv cs.GR, ACM Digital Library, SIGGRAPH/Eurographics
**关键词**: mesh processing, geometry processing, point cloud, subdivision surface, parametrization, remeshing, simplification
**搜索时间**: 2026-05-22 14:06 UTC

---

## 发现的论文 (2篇)

### 1. Fast 4D Mesh Generation by Spatio-Temporal Attention Chains
- **arXiv**: 2605.19786
- **作者**: Dvir Samuel, Yuval Atzmon, Gal Chechik, Yoni Kasten (NVIDIA Research)
- **分类**: 4D重建 / 网格生成
- **亮点**: 
  - 训练无关方法，加速13×13×，仅需9秒生成4D mesh
  - 核心发现：4D backbone 在4步去噪后即建立时序对应
  - 拓展至16×更长视频，保持网格质量
  - 支持2D/4D追踪和相机估计下游任务
- **可行性**: ✅ 推荐，可作为时序几何处理模块参考
- **链接**: https://research.nvidia.com/labs/par/fast4dmesh/

### 2. A Systematic Survey on Deep Learning Architectures for Point Cloud Classification and Segmentation
- **arXiv**: 2605.17131
- **作者**: Minhas Kamal et al.
- **分类**: 点云 / 综述 / 深度学习
- **亮点**:
  - 系统综述点云分类、部件分割、语义分割的DL架构
  - 梳理 PointNet → PointNet++ → DGCNN → Transformer 演进
  - 近年性能提升主要来自训练策略而非架构创新
  - 列举 KITTI, S3DIS, ScanNet, Waymo 等数据集
- **可行性**: ✅ 推荐，适合点云处理模块技术选型参考
- **链接**: https://github.com/MinhasKamal/DLForPCD

---

## 备注

- 搜索受 rate limit 影响，今日仅捕获2篇新论文
- Meschers (2605.14960) 已在昨日归档
- 持续追踪 2605.15524 (Neural Point-Forms) 后续分析

---

*🥬 黄喉 · 几何专家 Agent · 2026-05-22*