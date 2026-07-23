# 每日摘要 - 2026-07-23

## 扫描范围
- arXiv cs.GR (最近7天): 29篇
- ACM Digital Library / SIGGRAPH 会议: 无新增

## 几何处理相关论文 (4篇)

### 1. Points as Tori (⭐ 推荐)
- **标题**: Fast Pointwise Signed Distance for Point Clouds
- **arXiv**: 2607.16946
- **日期**: 2026-07-18
- **venue**: ACM TOG 2026
- **核心**: 用圆环(Tori)拟合点云 → 闭合形式SDF → 无需全局优化
- **标签**: 点云、有符号距离场、表面重建
- **链接**: https://nzfeng.github.io/research/PointsAsTori

### 2. UVFaceFusion
- **标题**: Fast Multi-view Topologically Consistent Face Reconstruction via UV-space Neural Fusion
- **arXiv**: 2607.18798 (cross-list cs.CV)
- **日期**: 2026-07-19
- **核心**: UV空间神经融合 → 固定拓扑mesh，<3秒重建
- **标签**: 人脸重建、UV参数化、神经融合
- **链接**: https://github.com/grignarder/UVFaceFusion

### 3. Text2Villa
- **标题**: Hierarchical Generation of 3D Indoor Environments with Physics-Aware Analysis-by-Synthesis
- **arXiv**: 2607.17145
- **日期**: 2026-07-17
- **核心**: 宏层级多楼层布局 + A-PSSG物理语义图 + 碰撞检测闭环优化
- **标签**: 3D场景生成、物理仿真、碰撞检测

### 4. MR-Compare
- **标题**: MR Framework for Visual Comparison of 3DGS and Mesh
- **arXiv**: 2607.20325
- **日期**: 2026-07-22
- **核心**: 混合现实对比框架 + 各向异性过滤
- **标签**: 3DGS、网格对比、配准

## 其他cs.GR论文 (非几何处理)
| arXiv | 标题 | 领域 |
|-------|------|------|
| 2607.20384 | Real-Time Global Illumination via Sparse Radiance Probes | 渲染 |
| 2607.19731 | Fast Wave-optics Rendering of Multiplane Images | 全息显示 |
| 2607.19599 | Exact Reduced Coulomb Friction (SCA 2026) | 物理动画 |
| 2607.19509 | Power-Constrained Tone Mapping for AR | AR渲染 |
| 2607.18187 | EVOLVE: Learned Volume Compression | 科学可视化 |
| 2607.17916 | Packet-Loss Robust 3DGS Compression | 3DGS压缩 |
| 2607.17725 | FastVEM Fluid Simulation (TOG 2026) | 流体仿真 |
| 2607.17411 | Feature-Guided Diffusion for Inverse Rendering | 逆渲染 |
| 2607.15951 | Rendering 3D Gaussians on a Graph Processor | 3DGS架构 |

## 搜索统计
- 搜索时间: 2026-07-23 14:04 UTC
- 扫描论文总数: 29 (arXiv cs.GR)
- 几何相关: 4 篇 (14%)
- 新增笔记: 4 篇

## 下一步
- [ ] 深入分析 "Points as Tori" SDF 方法 → 考虑传给 @墨鱼丸
- [ ] 关注 UVFaceFusion 的 UV融合网络可迁移性
