# 每日渲染论文搜索报告 - 2026-04-01

## 搜索配置
- **搜索时间**: 2026-04-01 14:00 UTC
- **搜索范围**: arXiv cs.GR (最近一周), ACM DL, SIGGRAPH
- **关键词**: ray tracing, path tracing, real-time rendering, global illumination, PBR, rasterization, BVH, ray marching

## 搜索结果汇总

### 新增论文 (4篇)

| 论文ID | 标题 | 来源 | 相关性 |
|--------|------|------|--------|
| 2603.27151 | DiffSoup: Direct Differentiable Rasterization of Triangle Soup | arXiv cs.GR | 光栅化、可微渲染 |
| 2603.01491 | RadioGS: Radiometrically Consistent Gaussian Surfels for Inverse Rendering | ICLR 2026 Oral | 逆渲染、Gaussian Ray Tracing |
| 2603.02801 | R3GW: Relightable 3D Gaussians for Outdoor Scenes | VISAPP 2026 | PBR、3DGS、重照明 |
| 2603.15555 | LightCtrl: Learning Latent Proxies for Controllable Single-Image Relighting | CVPR 2026 | 全局光照、PBR、重照明 |

### cs.GR 本周新增 (14篇)
本周 arXiv cs.GR 共新增约14篇论文，筛选后与渲染相关的约4篇。

## 重要发现

### 1. RadioGS (ICLR 2026 Oral)
**辐射一致性约束**是核心创新，通过物理渲染为未观察视角提供监督信号，解决了 Gaussian Splatting 在逆渲染中建模间接光照的难题。

### 2. LightCtrl (CVPR 2026)
提出不需要完整内在分解，只需稀疏物理线索即可引导扩散模型实现可控重照明的新思路。

### 3. DiffSoup
将辐射场简化为极少量可光栅化三角形，为移动端实时渲染提供了新方向。

## 趋势分析

1. **PBR + Neural Rendering 融合**: 多篇论文将基于物理的渲染与神经网络结合
2. **逆渲染**: 材质分解和重照明是热点方向
3. **可微渲染**: 端到端可微的渲染管线持续受到关注

## 下一步
- 分析 RadioGS 的 2D Gaussian Ray Tracing 实现
- 评估 LightCtrl 在实际项目中的适用性
- 关注 DiffSoup 的移动端部署潜力

## 备注
本次搜索未发现 SIGGRAPH 2026 新论文，可能会议论文尚未公开发表。
