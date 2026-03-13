---
tags: [几何, 网格处理, 四边形网格, 深度学习, 重网格化]
arxiv: https://arxiv.org/abs/2603.10606
date: 2026-03-12
status: new
---

# TopGen: Learning Structural Layouts and Cross-Fields for Quadrilateral Mesh Generation

## 核心方法

TopGen 是一个基于学习的框架，通过同时预测结构布局 (structural layouts) 和交叉场 (cross-fields) 来生成高质量四边形网格。

**输入**：
- 三角网格 (triangular mesh)
- 通过点云采样和形状编码器处理

**输出**：
- 结构线分类 (structural line classification)
- 交叉场回归 (cross-field regression)
- 高质量四边形网格

## 创新点

1. **双查询解码器 (Dual-Query Decoder)**
   - 边采样点 (edge-based sampling points) 作为查询
   - 面采样点 (face-based sampling points) 作为查询
   - 并行执行结构线分类和交叉场回归

2. **模拟专业手动建模工作流**
   - 同时提取几何骨架 (geometric skeleton)
   - 同时捕获方向场 (orientation fields)
   - 保留几何完整性

3. **对非流形几何的鲁棒性**
   - 通过点云采样处理
   - 对低质量初始拓扑不敏感

4. **大规模数据集**
   - TopGen-220K：22万对高质量配对数据
   - 包含：原始三角网格、结构布局、交叉场、对应四边形网格

## 算法复杂度

- **时间复杂度**：O(n) 其中 n 为点云采样数
- **空间复杂度**：取决于网络规模和输入分辨率
- **效率优势**：相比传统优化方法显著加速

## 实现难度

- **算法复杂度**：中高
- **数值稳定性**：良好（基于学习的方法）
- **可编辑性**：高（保留结构布局）

## 开源资源

- **数据集**：TopGen-220K
- **代码**：论文未明确提及，需关注作者发布

## 传统方法对比

| 方法 | 优点 | 缺点 |
|------|------|------|
| **传统优化方法** | 质量高 | 效率瓶颈、受输入拓扑限制 |
| **现有学习方法** | 灵活 | 丢失结构布局、缺乏可编辑性 |
| **TopGen** | 高效、保留结构、可编辑 | 需要大规模训练数据 |

## 性能指标

- **几何保真度 (Geometric Fidelity)**：显著优于现有SOTA
- **拓扑边流合理性 (Topological Edge Flow Rationality)**：显著优于现有SOTA
- **处理高分辨率模型**：不受效率瓶颈限制

## 推荐结论

✅ **强烈推荐实现**

**理由**：
1. 与 remeshing, mesh processing 关键词高度相关
2. 解决四边形网格生成的核心挑战
3. 提供大规模高质量数据集 TopGen-220K
4. 在几何保真度和拓扑质量上超越 SOTA
5. 保留结构布局，提供可编辑性

**实现建议**：
- **优先级**：非常高
- **应用场景**：
  - CAD/CAE 前处理
  - 游戏资产管线
  - 3D 建模工具
  - 有限元分析
- **技术路线**：
  1. 等待官方代码发布
  2. 基于 TopGen-220K 数据集复现
  3. 集成到现有网格处理管线

## 技术细节

### 网络架构
```
输入三角网格
    ↓
点云采样
    ↓
形状编码器 (Shape Encoder)
    ↓
双查询解码器 (Dual-Query Decoder)
    ├─ 边采样查询 → 结构线分类
    └─ 面采样查询 → 交叉场回归
    ↓
四边形重网格化
```

### 关键技术
- **交叉场 (Cross-Field)**：定义网格的局部方向
- **结构布局 (Structural Layout)**：定义网格的拓扑骨架
- **点云采样**：提供对输入拓扑的鲁棒性

## 相关工作

- [[四边形网格生成]]
- [[交叉场计算]]
- [[深度学习几何处理]]
- [[重网格化]]

## 引用格式

```bibtex
@article{chen2026topgen,
  title={Learning Structural Layouts and Cross-Fields for Quadrilateral Mesh Generation},
  author={Chen, Yuguang and others},
  journal={arXiv preprint arXiv:2603.10606},
  year={2026}
}
```

---

已传递给 @墨鱼丸
