---
tags: [geometry, mesh-generation, quad-mesh, cross-field, deep-learning]
arxiv: 2603.10606
date: 2026-03-12
status: new
priority: high
---

# TopGen: Learning Structural Layouts and Cross-Fields for Quadrilateral Mesh Generation

## 基本信息
- **标题**: TopGen: Learning Structural Layouts and Cross-Fields for Quadrilateral Mesh Generation
- **作者**: Yuguang Chen, Xinhai Liu, Xiangyu Zhu, Yiling Zhu, Zhuo Chen, Dongyu Zhang, Chunchao Guo
- **arXiv**: [2603.10606](https://arxiv.org/abs/2603.10606)
- **发表日期**: 2026-03-11
- **分类**: cs.GR (Graphics)

## 核心问题
高质量四边形网格生成是计算机图形学的基础挑战。传统优化方法受限于输入网格的拓扑质量，且效率瓶颈严重。现有学习方法主要关注 cross-field 预测，往往丢失关键的结构布局且缺乏可编辑性。

## 核心方法

### 技术路线
1. **输入处理**: 三角网格 → 点云采样 → Shape Encoder
2. **双查询解码器**:
   - Edge-based sampling points → 结构线分类
   - Face-based sampling points → Cross-field 回归
3. **并行预测**: 结构布局 + 方向场

### 创新点
- 模仿专业手工建模工作流
- 对非流形几何和低质量初始拓扑具有鲁棒性
- 同时提取几何骨架和方向场
- 提供可编辑的四边形重网格化基础

## 数据集
- **TopGen-220K**: 大规模四边形网格数据集
  - 原始三角网格
  - 结构布局
  - Cross-fields
  - 对应的四边形网格

## 复杂度分析
- **优势**: 避免传统优化方法的计算瓶颈
- **输入**: 点云表示，天然支持非流形几何

## 开源参考
- **相关库**:
  - libigl: `quad_planarize`, `orient_halfedges`
  - CGAL: `Surface_mesh`
- **类似方法**: Instant Meshes, QuadriFlow

## 实验结果
- 几何保真度显著优于现有 SOTA 方法
- 拓扑边流合理性更好

## 可行性评估
| 维度 | 评估 |
|------|------|
| 算法复杂度 | 中 - 基于 Transformer 的学习框架 |
| 数值稳定性 | 高 - 点云输入避免拓扑约束 |
| 依赖项 | PyTorch, Shape Encoder |
| 实现难度 | 中 - 需要训练数据和 GPU |

## 推荐结论
✅ **强烈推荐实现**

### 理由
1. 直接解决四边形网格生成的核心痛点
2. 提供大规模数据集 TopGen-220K
3. 学习框架可扩展性强
4. 对低质量输入网格鲁棒

### 实现建议
1. 先复现论文结果
2. 与 libigl 的四边形网格函数集成
3. 考虑增量式部署

## 相关笔记
- [[Cross-field Generation]]
- [[Quad Meshing Survey]]
- [[Mesh Quality Metrics]]

---
🥬 由娃娃菜 (Wawaicai) 自动生成 | 2026-03-12
