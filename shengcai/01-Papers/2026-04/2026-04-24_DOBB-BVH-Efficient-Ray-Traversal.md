---
tags: [渲染, 光线追踪, BVH, 定向包围盒, 加速结构, 2025]
date: [[2026-04-24]]
status: 待读
---

# DOBB-BVH: Efficient Ray Traversal by Transforming Wide BVHs into Oriented Bounding Box Trees using Discrete Rotations

## 基本信息
| 标题 | DOBB-BVH: Efficient Ray Traversal by Transforming Wide BVHs into Oriented Bounding Box Trees using Discrete Rotations |
|------|-------|
| 作者 | Michael A. Kern, Alain Galvan, David R. Oldcorn, Daniel Skinner, Rohan Meharwal, Leo Reyes Lozano (AMD), Matthäus G. Chajdas (Intel) |
| 发表 | arXiv 2506.22849 |
| 链接 | [arXiv](https://arxiv.org/abs/2506.22849) |

## 核心贡献
1. **新型 OBB 构建技术** - 所有内部节点子节点共享一致的 OBB 变换，从固定集合的离散量化旋转中选择
2. **高效编码** - 减少 OBB 变换的计算复杂度
3. **多子节点层次扩展** - 利用离散方向多面体 (k-DOPs)，平衡遍历性能与构建时间
4. **后处理集成** - 作为后处理步骤集成到现有层次构建流程

## 技术方案

### 问题背景
- AABB 包围盒对细长、与主轴不对齐的几何（头发、树枝等）贴合度差
- OBB (定向包围盒) 可更紧密贴合任意方向几何，但构建成本高

### 解决方案
- 将预构建层次高效转换为 OBB 层次（GPU 底向上传递）
- 关键创新：离散量化旋转的 OBB 变换集合
- 减少计算复杂性和内存需求

### k-DOP 扩展
- 扩展到多子节点层次
- 限制实时应用的构建时间影响

## 实验结论
- 构建时间增加 12.6%
- 光线相交性能提升：
  - Primary rays: 平均 18.5% 提升
  - Secondary rays: 平均 32.4% 提升
  - 最大提升: 65%

## 关键词
#光线追踪 #BVH #定向包围盒 #加速结构 #GPU

## 相关链接
