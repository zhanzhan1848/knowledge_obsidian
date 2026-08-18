---
tags: [AI网格生成, 几何准备, 综述, 工程仿真, IMR2026]
---

# A Survey of AI Methods for Geometry Preparation and Mesh Generation in Engineering Simulation

## 论文信息

| 属性 | 值 |
|------|-----|
| **arXiv** | [2512.23719](https://arxiv.org/abs/2512.23719) |
| **会议** | International Mesering Roundtable 2026 |
| **作者** | Steven Owen, Nathan Brown, Nikos Chrisochoides, Rao Garimella, Xianfeng Gu, Franck Ledoux, Na Lei, Roshan Quadros, Navamita Ray, Nicolas Winovich, Yongjie Jessica Zhang |
| **发布日期** | 2026-01-31 (v2) |
| **Subjects** | cs.CE, cs.AI, cs.LG |
| **页数** | 47页 |

## 核心内容

综述CAD-to-mesh流程中减少人工努力的AI方法，面向有有限AI背景的网格和几何从业者。

### 覆盖的工作流步骤

1. **Part Classification & Segmentation** - 部件分类与分割
2. **Mesh Quality Prediction** - 网格质量预测
3. **Defeaturing** - 特征移除/简化
4. **Unstructured Meshing** - 非结构化网格生成
5. **Block-Structured Meshing (2D & 3D)** - 块结构化网格
6. **Volumetric Parameterization** - 体积参数化
   - 从隐式或采样几何体重建
7. **Parallel Mesh Generation** - 并行网格生成
8. **Scripting Automation via RL & LLMs** - 通过强化学习和大语言模型的脚本自动化

### 核心观点

> AI **补充**而非**替代**传统几何和网格算法

## 实践教训与开放挑战

### 数据方面
- 训练数据获取困难
- 合成数据与真实数据分布差异

### 基准测试
- 缺乏统一评估基准

### 可信集成
- AI决策的可解释性
- 工程约束的满足

## 相关技术

[[强化学习网格生成]]
[[LLM代码生成]]
[[网格质量评估]]
[[体参数化]]

## 备注

面向工程仿真的实用综述，适合工业应用参考
