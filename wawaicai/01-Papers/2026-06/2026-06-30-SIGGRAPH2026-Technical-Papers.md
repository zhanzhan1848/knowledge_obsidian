---
tags: [几何, SIGGRAPH2026, 会议论文]
date: 2026-06-30
source: SIGGRAPH 2026
---

# SIGGRAPH 2026 技术论文亮点

会议时间：2026年7月19-23日，美国洛杉矶

## 几何处理相关论文

### 1. Robust Planar Maps for 3D Vectorization
- **作者**：Carnegie Mellon University
- **奖项**：Best Papers Award
- **核心方法**：
  - 几何无关的3D场景转2D矢量图像方法
  - 精确遮挡处理
  - 解决长期可靠性问题：用曲线-直线相交替代数值困难的曲线-曲线相交
- **创新点**：处理不完善、断开的曲线描述 реальных文件， orders of magnitude faster
- **应用**：3D矢量化生产管道

### 2. Better Bending: Analysis, Construction and Verification of Discrete Bending Models for Kirchhoff-Love Shells
- **作者**：Zhen Chen, Danny Kaufman (Adobe Research), Etienne Vouga (UT Austin)
- **核心方法**：
  - 系统性审视薄壳弯曲行为离散化问题（40多年未解决）
  - 提出10个最常用弯曲模型的"排行榜"基准测试
  - 发现理论与实践的关键差距
  - 提出 Bending-Active Cosserat (BAC) 新壳模型
- **关键发现**：理论上准确的模型在高分辨率生产网格上仍会失效
- **应用**：布料、纸张、橡胶、金属薄板仿真

### 3. Spatiotemporal FLIP for Fast Free-Surface and Two-Phase Simulation
- **作者**：TU Munich, RWTH Aachen University
- **奖项**：Honorable Mention
- **核心方法**：
  - 时空FLIP：四维空间-时间粒子采样
  - 时间步比传统求解器大一个数量级
  - 单工作站多十亿粒子模拟提速数倍
- **应用**：大规模流体模拟

## 技术趋势

1. **几何与生产的深度结合**
   - 3D矢量化为生产管道带来突破
   - 壳体弯曲模型标准化

2. **可微分几何处理**
   - 拓扑自适应
   - 参数化与UV维护

3. **物理仿真与几何的交叉**
   - 薄壳弯曲
   - 流体表面

## 会议信息

- 官网：https://s2026.siggraph.org/
- 技术论文日程：2026年7月19-23日

## 相关笔记

[[2026-06-30-ExMesh-EXplicit-Mesh-Reconstruction]]
[[2026-06-30-Blended-Chart-Surfaces-Seamless-Explicit-Representation]]
