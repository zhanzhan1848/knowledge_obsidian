---
tags: [渲染, 几何, CAD, SIGGRAPH2026, 生成模型]
date: 2026-07-05
status: 新论文
---

# DualBrep: A Dual-Field Continuous Representation for B-rep Modelling

## 元信息

| 标题 | 值 |
|------|-----|
| 作者 | (Autodesk AI Lab) |
| 链接 | [arXiv:2606.31579](https://arxiv.org/abs/2606.31579) |
| 代码 | [github.com/AutodeskAILab/DualBrep](https://github.com/AutodeskAILab/DualBrep) |
| 会议 | SIGGRAPH 2026 |

## 核心贡献

1. **双场表示法**: SDF（几何）+ UDF（拓扑）统一B-rep建模
2. **流匹配生成**: 支持点云逆向工程和生成式建模
3. **连续表示**: 解决B-rep异构结构（连续几何+离散拓扑）的深度学习难题

## 技术方案

### 问题
- B-rep是CAD最常用格式（解析精度+参数化编辑）
- 但其异构结构（连续参数几何+离散拓扑图）对深度学习构成根本挑战
- 现有方法直接预测异构图，难以端到端优化

### DualBrep解决方案
```python
# 双场编码
sdf = SDF(model)  # 全局形状几何
udf = UDF(model)  # 通过Voronoi划分编码拓扑

# 压缩到共享隐空间
latent = encoder(sdf, udf)

# 流匹配生成
generated = flow_matching(latent)
```

### 核心思想
- **SDF**: 符号距离函数表示全局几何
- **UDF**: 无符号距离场通过Voronoi划分隐式编码拓扑
- 共享隐空间使生成变得可行

### 神经重建器
从连续双场提取显式B-rep模型（棱柱和自由曲面图元）

## 实验结果

| 任务 | 性能 |
|------|------|
| 点云逆向工程 | 强性能 |
| 生成式建模 | 流匹配效果良好 |

## 标签

#CAD #B-rep #SDF #生成模型 #SIGGRAPH2026
