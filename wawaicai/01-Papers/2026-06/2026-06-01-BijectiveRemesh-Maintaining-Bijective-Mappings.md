---
tags: [几何, remeshing, parametrization, 双射映射]
created: 2026-06-01
---

# BijectiveRemesh: Maintaining Bijective Mappings Across Remeshed Manifolds

## 论文信息
- **arXiv**: [2605.30744](https://arxiv.org/abs/2605.30744)
- **作者**: Leyi Zhu
- **日期**: 2026-05-29
- **分类**: cs.GR
- **PDF**: [pdf](https://arxiv.org/pdf/2605.30744)

## 核心方法

### 问题定义
在复杂重网格化序列中，如何在 2D 三角表面和 3D 四面体网格上保持连续的双射映射。

### 核心创新
1. **BijectiveRemesh 算法** - 通过链接局部双射 atlases 构建复合映射
2. **Shared Scaffold 结构** (2D) - 通过局部方向保持强制全局双射性
3. **Steinitz 定理 + Maxwell-Cremona 提升** (3D) - 确保有效嵌入

### 支持操作
- 边折叠 (edge collapses)
- 边分裂 (edge splits)
- 边交换 (edge swaps)
- 顶点平滑 (vertex smoothing)

## 算法框架

```
输入网格 → 局部双射atlases链 → 复合映射 → 输出网格
                    ↑
              自参数化迭代
```

## 应用场景
- 纹理迁移 (texture transfer)
- 体积模拟 (volumetric simulations)
- 精确几何实体追踪（点、曲线、曲面）

## 开源实现
- 期待官方代码发布

## 相关笔记
[[几何, 参数化]]
[[几何, remeshing]]