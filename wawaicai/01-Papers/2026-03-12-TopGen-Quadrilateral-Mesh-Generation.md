---
tags: [几何, 网格生成, 四边形网格, cross-fields, 深度学习]
arxiv_id: 2603.10606
date: 2026-03-12
status: new
---

# Learning Structural Layouts and Cross-Fields for Quadrilateral Mesh Generation

## 元信息
- **arXiv ID**: [2603.10606](https://arxiv.org/abs/2603.10606)
- **发布日期**: 2026-03-12
- **作者**: Yuguang Chen et al.
- **分类**: cs.GR (Graphics)
- **PDF**: [Link](https://arxiv.org/pdf/2603.10606)
- **页数**: 14 pages, 9 figures

## 核心问题
如何生成高质量的四边形网格，同时保留结构布局并提高计算效率？

## 核心方法
### TopGen框架
- **输入**: 三角网格
- **预处理**: 点云采样 + Shape Encoder
- **创新**: 模仿专业手动建模工作流

### 架构
1. **Dual-Query Decoder**:
   - Edge-based sampling points → 结构线分类
   - Face-based sampling points → Cross-field 回归
   
2. **并行预测**:
   - Structural layouts (结构布局)
   - Cross-fields (交叉场)

### 数据集
- **TopGen-220K**: 大规模四边形网格数据集
- 包含配对数据:
  - 原始三角网格
  - 结构布局
  - Cross-fields
  - 对应的四边形网格

## 算法复杂度
- **训练**: O(n) n为网格数量（220K样本）
- **推理**: O(m) m为输入网格顶点数
- **鲁棒性**: 对非流形几何和低质量拓扑鲁棒

## 创新点
1. **联合预测**: 同时预测结构布局和cross-fields
2. **Dual-Query**: 边+面双查询解码器
3. **可编辑性**: 保留几何骨架，提供直观编辑基础
4. **大规模数据集**: TopGen-220K (首个此类数据集)

## 实验结果
- ✅ 几何保真度显著优于SOTA
- ✅ 拓扑边流合理性更好
- ✅ 对低质量输入网格鲁棒
- ✅ 计算效率优于优化方法

## 局限性
- 需要大规模训练数据
- 模型训练时间长
- 可能需要针对特定领域微调

## 可行性评估
### 实现难度: **中高**
- **算法复杂度**: 高（dual-query架构）
- **数值稳定性**: 中高
- **依赖项**: PyTorch, libigl, CGAL

### 推荐度: ✅ **强烈推荐**
- 数据集已公开，可复现
- 性能显著优于现有方法
- 可与现有quad meshing流程集成

## 开源参考
- **libigl**: `igl::quad_planarize`, `igl::orient_halfedges`
- **CGAL**: Surface mesh, Polygon mesh processing
- **Instant Meshes**: 开源quad meshing工具
- **论文代码**: 待发布

## 相关工作
- Instant Meshes (Jakob et al., 2015)
- QuadriFlow (Huang et al., 2018)
- Cross field computation
- Neural mesh processing

## 应用场景
1. CAD/CAE网格生成
2. 角色和道具建模
3. 3D打印预处理
4. 有限元分析

## 技术关键词
```
#quadrilateral-mesh #cross-field #structural-layout
#dual-query-decoder #deep-learning #mesh-generation
#topological-quality #remeshing #point-cloud-sampling
```

## 笔记链接
- [[四边形网格化]]
- [[Cross Fields]]
- [[深度学习在网格处理中的应用]]
- [[网格重建]]

## 与NeurFrame对比
| 维度 | TopGen | NeurFrame |
|------|--------|-----------|
| 目标 | Quad mesh | Quad + Hex mesh |
| 表示 | 离散 | 连续 |
| 预测 | Layout + Cross-field | Frame field |
| 数据集 | 220K | 未公开 |

---
*创建时间: 2026-03-16 14:07 UTC*
*创建者: 娃娃菜 (wawaicai)*
