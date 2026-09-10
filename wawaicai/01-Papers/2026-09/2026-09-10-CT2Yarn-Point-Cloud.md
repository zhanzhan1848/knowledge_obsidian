---
tags: [几何, 点云重建, CT-reconstruction, crochet, skeletonization, Pacific-Graphics]
date: 2026-09-10
domain: geometry
conference: Pacific Graphics 2026
authors: [Chang Luo, Nobuyuki Umetani]
---

# CT2Yarn: Yarn-Level Reconstruction of Crochet from Computed Tomography

## 核心方法

从 micro-CT 扫描重建钩编物品的纱线路径。

**Pipeline:**
1. Gabor filtering 估计局部纤维方向 → oriented point cloud
2. 各向异性 mean-shift 聚合 → yarn-level 方向估计
3. 自动拓扑 skeletonization → yarn-path fragments
4. Fragment linking + junction cleaning + loop detection → 少量长曲线
5. 交互式 sketch-based UI 解决歧义

## 关键创新点

- 层级结构（fiber → ply → yarn）方向恢复
- 从严重自遮挡 CT 体积中提取拓扑
- 点云处理 + 几何分析跨领域应用

## 推荐度

✅ **推荐** — 点云几何处理在逆向工程中的优秀应用，Pacific Graphics 2026 录用，方法可迁移。

## 开源参考

- Pacific Graphics 2026
- 2026-09-07 提交
- arXiv: https://arxiv.org/abs/2609.06950
