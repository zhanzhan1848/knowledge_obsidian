---
tags: [几何, mesh-reconstruction, adaptive-mesh, Delaunay, neural-rendering, SIGGRAPH-Asia]
date: 2026-09-10
domain: geometry
conference: SIGGRAPH Asia 2026
authors: [Johannes Weidenfeller, Shaofei Wang, Philipp Fürnstahl, Siyu Tang]
---

# ADELE - Adaptive Delaunay Grids for High-Fidelity Mesh-Native Reconstruction

## 核心方法

**ADELE** — 自适应网格优化框架 + 实用网格渲染技术，直接从图像学习优化网格，替代 NeRF/3DGS 中间表示。

**关键设计:**
1. **可优化 Delaunay 四面体网格** + **多分辨率 Hash Grid**
   - 通过点剪枝/插入细化网格
   - Hash Grid 提供 SDF/appearance 潜特征
2. **体积渲染** bootstrap 粗几何
3. **网格渲染** 恢复细粒度细节
4. **可微栅格化 + depth-offset** 渲染公式，减少几何伪影

## 关键创新点

- 首个真正 mesh-native 的自适应分辨率优化（点插入/删除）
- Delaunay 四面体网格保证网格质量
- 体积+网格双渲染管线协同

## 算法复杂度

- 自适应复杂度，优于固定分辨率方法
- 可微渲染支撑端到端优化

## 开源参考

- SIGGRAPH Asia 2026 | DOI: 10.1145/3829340.3842214
- Project: https://johannes-weidenfeller.github.io/adele
- Code: https://github.com/johannes-weidenfeller/adele

## 推荐度

✅ **强烈推荐** — mesh-native 重建新范式，SIGGRAPH Asia 2026 录用，技术路线扎实。

## 链接

- arXiv: https://arxiv.org/abs/2609.06723
- 2026-09-06 提交
