---
tags: [渲染, 光线追踪, 3DGS, I3D2026]
date: 2026-07-05
status: 新论文
---

# GRay: Ray Tracing 3D Gaussians Near the Speed of Splats

## 元信息

| 标题 | 值 |
|------|-----|
| 作者 | George Drettakis et al. (INRIA) |
| 链接 | [arXiv:2606.30869](https://arxiv.org/abs/2606.30869) |
| 代码 | [repo-sam.inria.fr/nerphys/gray](https://repo-sam.inria.fr/nerphys/gray) |
| 会议 | I3D 2026 (Proc. ACM Comput. Graph. Interact. Tech.) |

## 核心贡献

1. **快速3DGS光线追踪**: GRay提出针对3D高斯的高效光线追踪算法，接近光栅化速度
2. **密集初始化策略**: 利用光线追踪的对数复杂度特性，密集初始化反而加速
3. **10倍加速优化**: 相比3DGRT，优化速度快近10倍，渲染速度快近4倍

## 技术方案

### 核心思想
- 光线追踪只计算与光线相交的高斯，而光栅化需处理所有图元
- 密集场景（大量小高斯）时，光线追踪复杂度趋近对数级而非线性
- 密集初始化创建大量小高斯 → 减慢光栅化，但**加速光线追踪**

### 算法流程
```python
# 伪代码框架
for ray in rays:
    # 只追踪与光线相交的高斯
    intersected_gaussians = ray.intersect(scene)
    for gaussian in intersected_gaussians:
        color += gaussian.evaluate(ray)
```

### 性能对比
| 方法 | 渲染速度 | 优化速度 |
|------|----------|----------|
| 3DGS (光栅化) |基准|基准|
| 3DGRT | ~10x 慢 | ~10x 慢 |
| **GRay** | **接近3DGS** | **~10x快于3DGRT** |

## 关键公式

光线-高斯相交利用椭球体包围盒：
```math
\text{光线} = \mathbf{o} + t\mathbf{d}
\text{高斯} = e^{-\|\Sigma^{-1/2}(\mathbf{x} - \boldsymbol{\mu})\|^2}
```

## 实验结论

- 渲染质量与3DGRT相当
- 渲染速度接近3DGS（略低质量换取速度）
- 优化速度比3DGRT快约10倍
- 密集初始化对光线追踪友好

## 局限性

- 渲染质量略低于光栅化3DGS
- 需要密集初始化才能发挥优势

## 标签

#光线追踪 #3DGS #加速结构 #I3D2026
