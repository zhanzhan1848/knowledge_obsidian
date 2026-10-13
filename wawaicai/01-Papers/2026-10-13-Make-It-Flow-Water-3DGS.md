---
tags: [几何, 几何变形, 动画, 3DGS, 流体, 运动估计]
date: 2026-10-13
source: arXiv
arxiv_id: 2610.13860
venue: cs.CV (cross-list cs.GR, 2026-10-12 announcement)
status: new
---

# Make It Flow: Animating Water in 3D Gaussian Splatting Scenes

## 核心问题
显式 3D 场景表示（3DGS）假定**静态场景**，但真实环境充满动态现象（如水流）。
- 流畅水等高频运动在普通采集下难以重建
- 现有动态 3DGS 需要密集多视角高速采集

## 方法概述
无需动态采集或物理模拟，对**静态 3DGS 场景**生成连续动画：

### 流程

1. **2D 光流估计**：从参考图像或模型渲染估计 2D 光流
2. **3D Eulerian 运动场重建**：将 2D 光流提升到一致的 3D 欧拉运动场
3. **Cinemagraph 风格变形**：将运动场应用到高斯原始，生成时间无缝的循环动画
4. **保持实时渲染**：最终表示保持实时渲染性能

## 复杂度分析
- 光流估计: O(P · K) - P 像素, K 光流搜索范围
- 3D 提升: O(N · V) - N 高斯, V 视角
- 变形应用: O(N) - 每帧线性扫描

## 实现难度
- 算法复杂度：**中**（几何部分简单，运动场提升需鲁棒处理）
- 依赖项：
  - 光流估计: RAFT / FlowFormer
  - 3DGS 框架: graphdeco-inria
  - 欧拉运动场: 自定义 PyTorch 层

## 推荐结论
⚠️ **关注（动画方向）**

技术亮点：
1. **无需动态采集**：复用静态 3DGS，零额外采集成本
2. **Cinemagraph 思路**：循环动画的时间无缝性
3. **实时性能**：保留 3DGS 的实时渲染优势

## 开源参考
- RAFT 光流（Teed 2020）
- graphdeco-inria 3DGS 框架
- Cinemagraph 算法：微软 ECCV 2020

## 应用场景
- 静态场景动画增强
- 数字孪生动态演示
- 数字人背景动画

## 备注
- 与 wawaicai 关注点关联：**几何变形 / 运动场估计**
- "3D Eulerian motion field" 思路对 mesh deformation / rigging 有借鉴价值

---
相关主题：[[几何变形]] [[3DGS]] [[运动场估计]] [[动画]]