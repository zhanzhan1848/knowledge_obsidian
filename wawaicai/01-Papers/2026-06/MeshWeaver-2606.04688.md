---
tags: [几何, 网格生成, 自回归, 体素]
type: 论文
created: 2026-06-16
source: arXiv cs.CV
venue: CVPR 2026
---

# MeshWeaver: Sparse-Voxel-Guided Surface Weaving for Autoregressive Mesh Generation

## 核心方法

**问题**: 现有自回归网格生成存在两个根本限制：
1. Token化效率低 → 长序列 → 无法扩展到高多边形网格
2. 缺少几何感知引导 → 仅依赖全局形状嵌入而非局部表面线索

**解决方案 - MeshWeaver**:
- 将网格生成视为"表面编织"过程，直接预测下一个顶点而非独立坐标
- **多级稀疏体素编码器**注入几何上下文：
  - 提供体素特征作为顶点表示
  - 通过交叉注意力引导token预测
  - 作为结构脚手架约束表面生成
- 层次化设计支持单次解码中的粗到细顶点预测

## 关键指标
- **压缩率**: 18% (SOTA)
- **最大面数**: 16K faces
- 几何保真度显著提升

## 创新点
1. 表面编织范式 - 预测相对顶点位置而非绝对坐标
2. 多级稀疏体素引导的三重机制
3. 粗到细生成与3D几何紧耦合

## 开源参考
- 代码: https://github.com/facebookresearch/meshflow (MeshWeaver)

## 相关笔记
[[MeshFlow]] - MeshVAE + Flow-based 方法
[[MeshGraphNerualNetwork-FEA]] - 网格 + GNN + 有限元

## 可行性评估
✅ **推荐实现**

稀疏体素引导策略对网格重拓扑(mesh re-topology)有重要参考价值。其压缩率和面数规模适合集成到几何处理管线。
