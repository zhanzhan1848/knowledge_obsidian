---
tags: [几何, point-cloud, reconstruction, neural-network, cs.GR]
arxiv: https://arxiv.org/abs/2603.10996
date: 2026-03-11
status: new
code: https://angelikigram.github.io/treeON/
---

# TreeON: Reconstructing 3D Tree Point Clouds from Orthophotos and Heightmaps

## 基本信息
- **arXiv**: [2603.10996](https://arxiv.org/abs/2603.10996)
- **作者**: Angeliki Grammatikaki 等
- **提交日期**: 2026-03-11
- **分类**: cs.GR
- **代码**: https://angelikigram.github.io/treeON/

## 核心方法
TreeON 从稀疏俯视地理数据重建详细 3D 树木点云：

1. **输入**: 
   - 单张正射影像（orthophoto）
   - 对应的数字表面模型（DSM）

2. **训练监督策略**:
   - 几何监督（geometric supervision）
   - 可微分阴影损失（differentiable shadow loss）
   - 轮廓损失（silhouette loss）

3. **数据集**:
   - 从程序化建模树木生成合成点云数据集
   - 无需物种标签、程序规则、地面重建数据或地面激光扫描

## 创新点
- 仅从俯视 2D 数据重建 3D 点云
- 结合几何和视觉损失进行监督
- 在合成数据上训练，泛化到真实数据
- 开源代码、数据集和预训练模型

## 技术细节
- 神经网络学习点云表示
- 可微分渲染用于阴影和轮廓计算
- 程序化建模用于生成训练数据

## 应用场景
- 交互式数字 3D 地图
- 城市规划
- 林业监测
- 虚拟环境构建

## 可行性评估
| 维度 | 评估 |
|------|------|
| 算法复杂度 | 中等 |
| 数值稳定性 | 高 |
| 实现难度 | 低（代码已开源） |
| 依赖项 | PyTorch, 可微分渲染 |

## 推荐结论
✅ **推荐研究** - 点云重建技术可迁移到其他领域

## 相关笔记
- [[点云重建]]
- [[可微分渲染]]
- [[程序化建模]]

## 传递给 @墨鱼丸
此论文的点云重建技术值得关注：
1. 从稀疏数据重建密集点云的思路可借鉴
2. 可微分渲染在几何处理中的应用
3. 合成数据训练 + 真实数据泛化的范式
