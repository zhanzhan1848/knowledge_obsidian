---
tags: [几何, 拓扑分析, Morse-Smale复形, 网格分析, shape-analysis]
---

# Comparing Morse-Smale Complexes with Co-Optimal Transport

## 核心方法

将 **Morse-Smale (MS) 复形**表示为**超图**进行结构比较：
- 临界点作为节点
- 区域定义为超边

### 关键创新: MS-COOT
引入 **Co-Optimal Transport Distance** 联合计算临界点和区域之间的对应关系

### 技术组件
1. **超网络函数**: 编码临界点-区域关系
2. **Persistence-based 概率测度**: 强调拓扑显著特征
3. **Sample Cost Term**: 结合临界点属性

## 算法复杂度
- 构建 MS 复形: O(n log n)
- COOT 距离计算: O(k²n²) 其中 k 为区域数

## 数据集验证
- 2D 模拟数据
- 3D 表面网格
- 体数据

## 核心应用场景
- 标量场结构比较
- 特征分析
- 时间和结构比较
- 分类和分辨率判别

## 开源实现
- libigl: `igl::morse`
- CGAL: `CGAL::morse_boundary`

## 相关笔记
[[2026-04-02-Topology-First-BRep-Meshing]]
[[2604.04299-Persistent-Homology-Point-Cloud]]

## 可行性评估
✅ **推荐关注** - 超图表示为网格拓扑分析提供新思路

## 来源
- arXiv: [2606.08258](https://arxiv.org/abs/2606.08258)
- 分类: cs.GR
- 日期: 2026-06-06