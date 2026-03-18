---
tags: [几何, mesh-generation, quad-mesh, cross-field, deep-learning, cs.GR]
arxiv: https://arxiv.org/abs/2603.10606
date: 2026-03-11
status: new
---

# TopGen: Learning Structural Layouts and Cross-Fields for Quadrilateral Mesh Generation

## 基本信息
- **arXiv**: [2603.10606](https://arxiv.org/abs/2603.10606)
- **作者**: Yuguang Chen, Xinhai Liu, Xiangyu Zhu, Yiling Zhu, Zhuo Chen, Dongyu Zhang, Chunchao Guo
- **提交日期**: 2026-03-11
- **分类**: cs.GR

## 核心方法
TopGen 是一个基于学习的四边形网格生成框架，同时预测结构布局（structural layouts）和交叉场（cross-fields）：

1. **输入处理**: 将三角网格通过点云采样和形状编码器处理，天生对非流形几何和低质量初始拓扑具有鲁棒性
2. **双查询解码器**: 使用基于边和基于面的采样点作为查询，并行执行：
   - 结构线分类（structural line classification）
   - 交叉场回归（cross-field regression）
3. **协同设计**: 显式提取几何骨架的同时捕获方向场，确保几何完整性

## 创新点
- 模仿专业手工建模工作流
- 同时预测结构布局和交叉场
- 提供可编辑的基础用于后续四边形重网格化
- 引入大规模数据集 **TopGen-220K**

## 数据集
- **TopGen-220K**: 包含高质量配对数据
  - 原始三角网格
  - 结构布局
  - 交叉场
  - 对应的四边形网格

## 复杂度分析
- **时间**: 基于学习的方法，推理速度快
- **空间**: 需要存储神经网络权重
- **与传统方法对比**: 传统优化方法在高分辨率模型上计算代价过高

## 实验结果
- 在几何保真度和拓扑边流合理性方面显著优于现有 SOTA 方法
- 提供直观、可编辑的网格生成基础

## 开源实现
- 论文提到代码和数据集将公开
- 待发布链接

## 可行性评估
| 维度 | 评估 |
|------|------|
| 算法复杂度 | 中等（需要训练神经网络） |
| 数值稳定性 | 高（基于学习） |
| 实现难度 | 中等 |
| 依赖项 | PyTorch/TensorFlow |

## 推荐结论
✅ **推荐实现** - 四边形网格生成是几何处理的核心问题，此方法提供了新的学习范式

## 相关笔记
- [[四边形网格生成]]
- [[交叉场计算]]
- [[NeurFrame - 连续帧场学习]]

## 传递给 @墨鱼丸
此论文提出的 TopGen 框架对四边形网格生成有重要意义：
1. 可考虑集成到网格处理管线
2. 数据集 TopGen-220K 可用于训练和评估
3. 双查询解码器架构值得深入研究
