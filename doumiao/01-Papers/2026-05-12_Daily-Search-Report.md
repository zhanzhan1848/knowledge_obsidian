# 每日论文搜索报告 - 2026-05-12

## 搜索范围
- arXiv cs.GR (计算机图形学)
- SIGGRAPH / SIGGRAPH Asia 2026
- 关键词: fluid rendering, water rendering, smoke rendering, fire simulation, ocean rendering, particle system, volume rendering

---

## 本次发现论文 (4篇)

### 1. Smoke-GS: 3D 烟雾场景重建 (arXiv:2604.05687v2)
- **发表**: 3 周前
- **方法**: Nano-Banana-Pro 图像增强 + 烟雾感知 3D Gaussian Splatting
- **特点**: 轻量级视角相关介质分支处理散射媒体；保留 3DGS 渲染效率
- **标签**: `smoke rendering` `3DGS` `neural rendering`
- **关联**: 🩸 烟雾体积渲染

### 2. 3DSS: 3D 表面 Splatting 逆渲染 (arXiv:2605.05876v1)
- **发表**: 4 天前 (SIGGRAPH '26)
- **方法**: 首个可微分表面 splatting 渲染器，EWA 覆盖度合成模型
- **特点**: 联合恢复 shape/BRDF 材质/光照；原生桥接网格工作流
- **标签**: `surface rendering` `inverse rendering` `splatting`
- **关联**: 🩸 水面/流体表面反射渲染

### 3. S2C-3D: 稀疏视角完整 3D 重建 (arXiv:2605.05664v1)
- **发表**: 5 天前 (SIGGRAPH '26)
- **方法**: 专用扩散模型 + 训练-free 视角一致性采样 + 相机轨迹规划
- **特点**: 仅需 6-8 张图像；高保真 3DGS 抗伪影
- **标签**: `3DGS` `sparse view` `reconstruction`
- **关联**: 🩸 流体场景 novel-view synthesis

### 4. Real-Time Fluid & Aeroacoustics on Sphere (arXiv:2601.15982v1)
- **发表**: 2026-01-22
- **方法**: Closest Point Method + Navier-Stokes 求解器 + FWH 声学类比
- **特点**: 球面实时无粘流体模拟；SDF 建模障碍物；实时音频生成
- **标签**: `fluid simulation` `sphere` `real-time` `aeroacoustics`
- **关联**: 🩸 球形海洋渲染/行星级流体

---

## 技术趋势分析

### 烟雾渲染方向
- **烟雾感知 3DGS**: 将散射物理模型嵌入 Gaussian 渲染管线
- **挑战**: 多视角一致性、几何退化、视角依赖外观
- **趋势**: 体积渲染 + 神经渲染深度融合

### 表面渲染方向
- **3DSS 表面 splatting**: 填补体渲染与网格渲染之间的空白
- **EWA 覆盖度模型**: 优雅解决表面分离和抗锯齿问题
- **趋势**: 物理基逆渲染成为 3DGS 下一步焦点

### 流体模拟方向
- **球面流体**: 扩展到行星/全球规模流体模拟
- **实时性**: CPM + 高阶数值方法实现稳定实时模拟
- **声学联合**: 流体模拟与气动声学统一框架

---

## 相关论文笔记

| 文件 | 主题 |
|------|------|
| 2026-05-12-Smoke-GS-3D-Smoke-Reconstruction-Gaussian-Splatting.md | 烟雾 3DGS 重建 |
| 2026-05-12-3DSS-3D-Surface-Splatting-Inverse-Rendering.md | 表面 splatting 逆渲染 |
| 2026-05-12-S2C-3D-Sparse-to-Complete-3D-Reconstruction.md | 稀疏视角 3D 重建 |
| 2026-05-12-RealTime-Fluid-Aeroacoustics-Sphere.md | 球面实时流体 |

---

*豆苗 @ 2026-05-12 14:13 UTC*