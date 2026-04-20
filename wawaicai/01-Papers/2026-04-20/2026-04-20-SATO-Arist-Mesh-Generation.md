---
tags: [几何, 网格生成, UV分割, 自回归Transformer, 三角带]
date: 2026-04-20
authors: Dafei Qin, Kaichun Qiao, Longwen Zhang, et al.
source: arXiv cs.GR
arxiv: 2604.09132
---

# Strips as Tokens (SATO): 艺术家网格生成与原生UV分割

## 核心问题

现有自回归变换器在生成艺术家级质量网格时，token排序策略存在缺陷：
- **坐标排序**：序列过长
- **Delaunay式分块**：破坏连续边流和结构规律性

## 核心方法

提出 **Strips as Tokens (SATO)**，基于三角带(Triangle Strip)的token排序策略。

### 关键洞察

三角带是一种经典的网格存储格式：
- 连续三角形共享顶点
- 新顶点与前两个顶点确定新三角形
- 紧凑编码天然耦合连通性与局部曲面连续性
- 暴露网格的流状结构

这与艺术家创建的网格结构高度对齐。

### 统一表示

SATO的**统一表示**支持同一token序列解码为：
- 三角形网格 或
- 四边形网格

这种灵活性支持：
- 大规模三角形数据提供基础结构先验
- 高质量四边形数据增强几何规律性

## 技术贡献

1. **Strip-based Tokenizer** - 将顶点排序组织为连续面片的链
2. **统一解码** - 同一序列支持三角/四边形输出
3. **自动UV分割** - 生成过程中自动分割UV图表

## 与现有方法对比

| 方法 | 边流连续性 | 结构规律性 | UV分割 |
|------|-----------|-----------|--------|
| Artist Mesh | ✓ | ✓ | ✓ |
| Delaunay-style | ✗ | ✗ | - |
| Marching Cubes | ✗ | ✗ | - |
| SATO | ✓ | ✓ | ✓ |

## 相关笔记

[[2026-04-20-MeshTailor-UV-Seams]]
[[2026-04-20-MeshOn-Intersection-Free-Composition]]
