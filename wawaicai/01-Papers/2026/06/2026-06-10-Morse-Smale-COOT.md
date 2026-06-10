---
tags: [几何, 拓扑, 标量场, Morse-Smale复形, 最优传输]
---

# Comparing Morse-Smale Complexes with Co-Optimal Transport

## 论文信息

- **标题**: Comparing Morse-Smale Complexes with Co-Optimal Transport
- **arXiv**: [2606.08258](https://arxiv.org/abs/2606.08258)
- **作者**: Guangyao Meng et al.
- **发表**: cs.GR (Graphics), cs.CV, cs.LG
- **日期**: 2026-06-06

## 核心方法

### 问题定义
理解和比较标量场中的结构是科学可视化的核心挑战，具有特征分析、时间/结构比较等应用。

### 传统方法局限
现有方法通常依赖**图-based 表示**，捕获关键点间关系但丢弃区域级结构。

### 本文方法
1. 将 MS complex 表示为 **超图** (hypergraph)
   - 关键点作为节点
   - 区域定义超边

2. 引入 **MS-COOT** (Co-Optimal Transport Distance)
   - 联合计算关键点和区域的对应
   - 实现显式区域到区域匹配

### 技术组件

1. **超网络函数** (Hypernetwork function)
   - 编码关键点-区域关系

2. **基于持久性的概率测度**
   - 强调拓扑显著特征

3. **样本成本项**
   - 合并关键点属性

## 实验评估

- 5 个数据集：2D 模拟、3D 表面网格、体数据
- 下游任务：分类、分辨率判别

## 推荐结论

⚠️ **谨慎评估**

理由：
- 理论贡献显著，但应用范围偏向科学可视化
- 适合特征分析、拓扑比较场景
- 可与 libigl 的 `connected_components` 结合

## 开源参考

- Morse-Smale complex: CGAL, Ripser
- Optimal transport: POT (Python Optimal Transport)

## 关键词

`Morse-Smale complex` `optimal transport` `scalar fields` `topology` `scientific visualization` `hypergraph`