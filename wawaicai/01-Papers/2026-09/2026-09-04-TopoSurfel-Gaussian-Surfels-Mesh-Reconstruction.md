---
tags: [几何, 表面重建, 3DGS, 高斯溅射, 网格提取]
date: 2026-09-04
source: arXiv cs.CV/cs.GR
---

# TopoSurfel: Closing the Loop between Gaussian Surfels and Meshes for Surface Reconstruction

## 核心方法

解决 3D Gaussian Splatting (3DGS) 直接提取高保真表面的难题。

**问题：** 3DGS 的离散非结构化特性导致表面提取困难，纹理缺失或遮挡区域易产生伪影

**解决方案：**
1. **可微分等值面提取**：非训练的可微分等值面过程，提取连续代理网格
2. **网格引导的高斯演化**：
   - 法向量对齐（normal alignment）
   - 几何感知密度控制（geometry-aware density control）
3. **空间感知混合重初始化**：解决大规模场景初始化挑战

## 关键创新

1. **闭环框架**：高斯 surfels ↔ 连续网格双向连接
2. **无需辅助网络**：区别于其他方法，不引入额外神经网络
3. **网格引导优化**：利用等值面约束引导高斯演化

## 性能指标
- 几何重建精度：具有竞争力
- 视图合成质量：保持高质量

## 开源实现
- GitHub: https://github.com/Fan-Treasure/TopoSurfel
- Project Page: https://fan-treasure.github.io/TopoSurfel_page/

## 相关技术
[[3D Gaussian Splatting]], [[表面重建]], [[等值面提取]], [[SDF]], [[网格提取]]

## 可行性评估

✅ **推荐实现**

- 可微分等值面 + 高斯优化耦合有创新性
- 网格引导演化策略值得参考
- 代码已开源，便于复现

**技术风险：**
- 等值面提取稳定性需调优
- 密度控制阈值选择影响结果
