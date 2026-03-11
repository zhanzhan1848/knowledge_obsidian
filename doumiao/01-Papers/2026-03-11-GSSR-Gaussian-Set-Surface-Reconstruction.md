---
title: GSSR - Gaussian Set Surface Reconstruction through Per-Gaussian Optimization
arxiv_id: 2507.18923
authors: Zhentao Huang et al.
date: 2026-03-06
tags: [surface-reconstruction, gaussian-splatting, geometry, normal-consistency]
domains: [cs.CV]
url: https://arxiv.org/abs/2507.18923
---

# Gaussian Set Surface Reconstruction (GSSR)

## 摘要
3D Gaussian Splatting (3DGS) 通过其灵活的表示有效合成新视图，但无法准确重建场景几何。虽然 PGSR 等现代变体引入额外损失来通过高斯融合确保正确的深度和法线图，但它们仍然忽略单个放置优化。

这导致高斯分布不均匀并偏离潜在表面，使重建细化和场景编辑复杂化。

GSSR 受 Point Set Surfaces 开创性工作启发，旨在沿潜在表面均匀分布高斯，同时将其主导法线与表面法线对齐。

## 核心创新

### 1. 高斯集表面对齐
- **均匀分布**: 高斯沿潜在表面均匀分布
- **法线对齐**: 主导法线与表面法线对齐
- **细粒度几何对齐**: 像素级和高斯级优化

### 2. 多视角一致性约束
- **单视图法线一致性**: 像素级和高斯级
- **多视图光度一致性**: 局部和全局视角优化

### 3. 表示细化策略
- **不透明度正则化损失**: 消除冗余高斯
- **周期性重新初始化**: 深度和法线引导的高斯重新初始化
- 更清洁、更均匀的空间分布

## 流体渲染应用价值

### 流体表面重建 ⭐⭐⭐⭐⭐
- 精确的几何重建对流体表面至关重要
- 法线一致性确保正确的光照和反射
- 均匀分布适合动态流体网格

### 波浪和涟漪建模 ⭐⭐⭐⭐
- 准确的表面法线计算
- 适合时变流体表面
- 高质量几何重建

### 泡沫和飞溅粒子 ⭐⭐⭐
- 高斯表示天然适合粒子系统
- 优化策略可用于流体粒子
- 空间分布优化

## 技术细节

### 高斯集优化
```python
class GaussianSetOptimization:
    # 细粒度几何对齐
    def single_view_normal_consistency(self, gaussians, depth_map, normal_map):
        # 像素级法线一致性
        pixel_loss = compute_pixel_normal_loss(depth_map, normal_map)
        # 高斯级法线一致性
        gaussian_loss = compute_gaussian_normal_loss(gaussians)
        return pixel_loss + gaussian_loss
    
    def multi_view_photometric_consistency(self, gaussians, views):
        # 多视图光度一致性
        pass
    
    def opacity_regularization(self, gaussians):
        # 消除冗余高斯
        return sum(g.opacity for g in gaussians if g.opacity < threshold)
```

### 周期性重新初始化
```python
def periodic_reinitialization(gaussians, depth_map, normal_map):
    # 基于深度和法线引导
    # 重新分布高斯
    # 确保清洁、均匀的空间分布
    pass
```

## 与传统 3DGS 对比

| 特性 | 标准 3DGS | PGSR | GSSR |
|------|----------|------|------|
| 表面几何精度 | ⚠️ | ✅ | ✅✅ |
| 高斯分布均匀性 | ❌ | ⚠️ | ✅ |
| 法线一致性 | ❌ | ⚠️ | ✅ |
| 场景编辑能力 | ⚠️ | ⚠️ | ✅ |
| 渲染质量 | ✅ | ✅ | ✅ |

## 几何精度提升

### Point Set Surfaces 启发
- 借鉴经典点云表面重建思想
- 应用于高斯表示
- 实现几何感知的优化

### 细粒度优化策略
1. **局部视角**: 单视图内的几何一致性
2. **全局视角**: 多视图间的几何一致性
3. **周期性细化**: 防止退化，保持分布质量

## 应用场景

### 静态流体表面
- 水池、湖面等静态水面重建
- 高质量几何恢复

### 动态流体序列
- 波浪动画的几何重建
- 时变表面的法线一致性

### 场景编辑
- 流体表面的几何编辑
- 高斯表示的直观操作

## 实验验证
- 显著提升几何精度
- 保持高质量渲染性能
- 启用直观的场景编辑

## 关键引用
```bibtex
@article{huang2026gssr,
  title={Gaussian Set Surface Reconstruction through Per-Gaussian Optimization},
  author={Huang, Zhentao and others},
  journal={arXiv preprint arXiv:2507.18923},
  year={2026}
}
```

## 相关工作
- [[3D Gaussian Splatting]]
- [[Point Set Surfaces]]
- [[Surface Reconstruction]]
- [[Normal Consistency in Reconstruction]]

## 流体渲染扩展方向
1. 时变流体表面的 GSSR 扩展
2. 与流体模拟的联合优化
3. 次表面几何重建
4. 动态高斯更新策略

## 与流体渲染的协同
- 与 [[Ref-DGS]] 结合：精确几何 + 高质量反射
- 与流体模拟器集成：几何约束的流体动画
- 与渲染增强结合：几何 + 外观优化

## 限制
- 主要针对静态场景
- 动态流体的时序一致性需要额外处理
- 计算开销与高斯数量相关

## 备注
GSSR 提供的高质量表面重建对流体渲染非常重要。精确的几何和法线是真实流体渲染（特别是反射和折射效果）的基础。

---
#表面重建 #高斯溅射 #几何优化 #法线一致性
