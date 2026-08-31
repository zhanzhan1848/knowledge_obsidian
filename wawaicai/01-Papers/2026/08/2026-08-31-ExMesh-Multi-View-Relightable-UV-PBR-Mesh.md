---
tags: [几何, 参数化, UV展开, 网格重建, PBR材质]
date: 2026-08-31
venue: arXiv cs.GR
---

# ExMesh++: From Multi-View Images to Relightable UV-PBR Mesh Assets

## 核心方法

**ExMesh++** 是一个分阶段框架，从多视图图像重建**可编辑、可打光的UV-PBR网格资产**。

### 两阶段架构

**第一阶段**: 自适应网格几何与拓扑优化
- 通过自适应顶点分割 (vertex splitting) 和合并 (merging) 优化网格几何
- 在拓扑变化过程中保持UV一致性
- 输出: 良好拓扑的mesh + 稳定UV carrier

**第二阶段**: UV空间PBR贴图与环境光照优化
- 固定mesh-UV carrier
- 在UV空间中联合优化PBR贴图和环境光照
- 通过二次光线追踪 (secondary-ray tracing) 建模一次反弹漫反射间接光照
- 使用共享的UV-PBR材质

## 关键创新点

1. **拓扑自适应**: 自适应顶点分割/合并，而非固定拓扑
2. **UV一致性维护**: 拓扑变化时保持UV参数化一致
3. **联合优化**: 几何、材质、光照联合优化，避免分量互相补偿
4. **可导出资产**: 导出的mesh可直接用于标准DCC工作流

## 算法复杂度

- 时间复杂度: O(n log n) 顶点优化
- 空间复杂度: O(n) 网格数据

## 开源实现

- arXiv: https://arxiv.org/abs/2608.24109
- Authors: Chuanjin Fan et al.

## 相关笔记

[[2026-08-26-ExMesh-Multi-View-Relightable-UV-PBR-Mesh]]
[[SIGGRAPH2026-Nexus-Native-Mesh-Generation-Diffusion]]

## 可行性评估

✅ **推荐实现**

- 问题定义清晰: 多视图→可用游戏/影视资产
- 算法可分解: 两阶段各有明确目标
- 开源预期: 代码即将发布
- 应用场景: 影视、游戏、VR/AR

**实现建议**:
1. 先实现顶点分割/合并的基础版本
2. 参考libigl的remeshing函数
3. UV优化部分可参考Harmonic maps相关工作
