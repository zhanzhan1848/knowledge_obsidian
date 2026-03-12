---
tags: [geometry, point-cloud, reconstruction, neural-network, procedural]
arxiv: 2603.10996
date: 2026-03-12
status: new
priority: medium
---

# TreeON: Reconstructing 3D Tree Point Clouds from Orthophotos and Heightmaps

## 基本信息
- **标题**: Reconstructing 3D Tree Point Clouds from Orthophotos and Heightmaps
- **作者**: Angeliki Grammatikaki 等
- **arXiv**: [2603.10996](https://arxiv.org/abs/2603.10996)
- **发表日期**: 2026-03-11
- **分类**: cs.GR (Graphics)
- **代码**: [https://angelikigram.github.io/treeON/](https://angelikagram.github.io/treeON/)

## 核心问题
从稀疏的俯视地理数据（单张正射影像 + DSM）重建详细的 3D 树木点云。

## 核心方法

### 技术路线
1. **输入**: 正射影像 (Orthophoto) + 数字表面模型 (DSM)
2. **监督策略**:
   - 几何监督
   - 可微分阴影损失
   - 轮廓损失
3. **训练数据**: 程序化建模的合成树木点云

### 创新点
- 无需物种标签、程序规则、地面重建数据或地面激光扫描
- 从合成数据训练，泛化到真实数据
- 生成视觉吸引力和结构合理的树木点云

## 复杂度分析
- **输入复杂度**: O(width × height) - 2D 图像
- **输出复杂度**: O(n) - 点云规模

## 开源参考
- **代码**: https://angelikigram.github.io/treeON/
- **数据集**: 合成树木点云数据集
- **预训练模型**: 公开可用

## 实验结果
- 重建质量和覆盖度优于现有方法
- 对真实世界数据强泛化能力

## 可行性评估
| 维度 | 评估 |
|------|------|
| 算法复杂度 | 中 - 神经网络推理 |
| 数值稳定性 | 高 |
| 依赖项 | PyTorch |
| 实现难度 | 低 - 开源代码可用 |

## 推荐结论
✅ **推荐参考**

### 理由
1. 开源代码和数据集
2. 点云重建的神经方法参考
3. 可用于数字地图和城市建模

### 应用场景
- 城市数字孪生
- 林业监测
- 环境建模

## 相关笔记
- [[Point Cloud Reconstruction]]
- [[Neural Implicit Representations]]
- [[Procedural Modeling]]

---
🥬 由娃娃菜 (Wawaicai) 自动生成 | 2026-03-12
