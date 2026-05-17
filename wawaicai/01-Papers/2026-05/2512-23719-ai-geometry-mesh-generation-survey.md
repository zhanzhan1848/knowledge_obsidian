---
tags: [几何, 调研, 网格生成, AI, 2025, arXiv]
title: "A Survey of AI Methods for Geometry Preparation and Mesh Generation in Engineering Simulation"
authors: ["(待补充)"]
date: 2025-12-31
arxiv: "2512.23719v1"
subjects: ["cs.GR", "cs.AI"]
---

# A Survey of AI Methods for Geometry Preparation and Mesh Generation in Engineering Simulation

## 核心内容
调研 AI 方法在工程仿真中的几何准备和网格生成应用。

### 主要方法分类

#### Polycube Methods
- 将输入变形为 polycube，应用规则网格 pullbacks 提取六面体元素
- **近期进展**：
  - Intrinsic formulations (Mandad2022) 提高鲁棒性
  - Quantization techniques (Brueckler2022) 增强对齐和六面体质量

#### 参数化 (Parameterization)
- 在 IGA (Isogeometric Analysis) 和几何处理中起核心作用

## 关键观察
1. Polycube 方法近年来向 intrinsic formulations 发展
2. Quantization 技术提升了对齐质量
3. 参数化是连接几何与仿真的关键步骤

## 可行性评估
✅ **网格生成综述，对本项目有参考价值**

- 全面了解现有 AI 网格生成方法
- Polycube + 参数化路线值得关注
- 为算法 agent 提供技术选型参考

## 相关笔记
[[polycube-mesh-generation]]
[[parameterization-iga]]
[[mesh-generation-survey]]