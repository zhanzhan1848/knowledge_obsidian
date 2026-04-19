# NeuVolEx: Implicit Neural Features for Volume Exploration

## 文献信息
- **arXiv**: [2604.11172](https://arxiv.org/abs/2604.11172)
- **日期**: 2026-04-14
- **类别**: cs.GR, cs.CV
- **状态**: Under review

## 核心创新点

### 问题背景
- Direct Volume Rendering (DVR) 帮助用户识别和检查体积数据中的 ROI
- 特征表示对 ROI 分类和聚类至关重要
- 现有方法局限：
  - 显式局部特征表示：捕获更广泛几何模式和空间相关性有限
  - 隐式卷积特征表示：实践中用户监督有限时性能不稳健

### 核心贡献
NeuVolEx 将隐式神经表示 (INR) 的角色从体积压缩扩展到体积探索：

1. **利用 INR 训练期间学习的特征表示**作为体积探索的鲁棒基础
2. **结构编码器**: 增强空间一致性
3. **多任务学习方案**: 改进 ROI 表征的空间一致性

### 技术应用场景

| 任务 | 效果 |
|-----|------|
| 图像传输函数 (TF) 设计 | 稀疏用户监督下准确 ROI 分类 |
| 视角推荐 | 无监督聚类识别紧凑互补视角 |

## 与流体渲染关联

| 技术 | 关联度 | 说明 |
|-----|-------|------|
| 体积渲染 | ⭐⭐⭐⭐⭐ | 烟雾/云层/次表面散射的核心 |
| INR | ⭐⭐⭐⭐ | 连续体积场参数化能力 |
| 多任务学习 | ⭐⭐⭐ | 体积分割/特征提取 |

## 关键词
`volume rendering` `implicit neural representation` `volume exploration` `transfer function`

## 备注
- 论文尚未正式发表 (Under review)
- 可关注体积数据可视化与艺术化渲染的交叉应用
