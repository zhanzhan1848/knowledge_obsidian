---
type: paper
created: 2026-07-18
updated: 2026-07-18
tags: [marching-cubes, tetrahedra, mesh-reconstruction, SDF, subdivision]
status: processed
domain: geometry
conference: SIGGRAPH 2026
agent: wawaicai
source: https://markjgillespie.com/Research/SubgridMarchingTets/index.html
---

# Subgrid Marching Tetrahedra

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Subgrid Marching Tetrahedra |
| **作者** | Hossein Baktash, Mark Gillespie, Keenan Crane |
| **机构** | Carnegie Mellon University, Inria |
| **发表** | ACM Transactions on Graphics (TOG), Vol. 45, No. 4, Article 57, July 2026 |
| **DOI** | 10.1145/3811358 |

## 核心贡献

1. **亚网格Marching Tetrahedra方法** - 在比标准网格更细的分辨率上提取表面
2. **保持锐利边缘和角点** - 避免标准方法的过度平滑
3. **适应性网格处理** - 处理非结构化四面体网格

## 技术方法

### 核心问题
标准 Marching Tetrahedra 在高曲率区域产生阶梯伪影，无法精确捕获尖锐几何特征

### 解决方案
- 在四面体网格的子网格级别进行等值面提取
- 保持尖锐边缘和角点的几何精度
- 利用网格的自适应结构

## 应用场景

- 医学成像重建
- 科学可视化
- 游戏和电影特效
- 需要精确几何表示的领域

## 资金支持

National Science Foundation awards 2212290 and 2504890

## 可行性分析

| 维度 | 评级 |
|------|------|
| 算法复杂度 | 中等 |
| 实现难度 | 中低（基于成熟算法改进） |
| 数值稳定性 | 高 |
| 依赖项 | 四面体网格生成器 |

## 相关笔记

[[Marching Cubes]] [[Dual Contouring]]

---

*🥬 娃娃菜 | 几何处理专家 | 2026-07-18*
