---
tags: [渲染, 高斯泼溅, 蒙皮变形, 可微渲染, 2026]
date: [[2026-09-12]]
status: 待读
---

# Differentiable Weights for Skinned Gaussian Splat Deformation

## 基本信息

| 属性 | 内容 |
|------|------|
| 作者 | Nina Vesseron et al. |
| 发表 | arXiv cs.GR (2026-09-04) |
| 链接 | [arXiv:2609.05127](https://arxiv.org/abs/2609.05127) |
| PDF | [PDF](https://arxiv.org/pdf/2609.05127) |

## 核心贡献

1. **无网格变形管线** — 使用权重空间梯度为 Gaussian Splats 提供完整的无网格变形
2. **自适应重采样** — 可选的自适应重采样方案分裂仍产生伪影的 splats
3. **实时 WebGL 演示** — 在 WebGL 查看器中展示实时渲染能力

## 问题背景

3D 网格变形使用 rig 只需要位移顶点即可变形多边形。但 Gaussian Splats 没有连接信息，刚性变换点无法防止拉伸时产生空洞。

## 技术方案

### 核心方法
利用蒙皮权重的空间梯度来驱动 Gaussian Splats 的变形：

```cpp
// 关键思想：使用权重梯度而非顶点连接
for (each gaussian g) {
    Vector3 gradient = computeWeightGradient(g.position);
    g.position += rig_displacement + adaptive_stretch(gradient);
}
```

### 梯度计算
在用户创建 rig 结构时评估这些梯度，产生平滑的拉伸效果。

### 自适应重采样
检测仍产生伪影的 splats，通过分裂操作用更多 splats 表示变形区域。

## 实验结论

- 完全兼容实时渲染能力
- WebGL 查看器演示验证可行性
- 拉伸效果更准确，避免空洞

## 可行性分析

| 维度 | 评估 |
|------|------|
| 实现难度 | 中 |
| 创新性 | ⭐⭐⭐⭐ |
| 实用性 | ⭐⭐⭐⭐⭐ |
| 代码可用性 | 待确认 |

## 相关笔记

[[2026-03-05-5D-Spatio-Directional-Hash-Encoding]]
[[2026-05-04-GRTX-Efficient-Ray-Tracing-3D-Gaussian]]

## 标签

#高斯泼溅 #蒙皮变形 #可微渲染 #实时渲染 #WebGL
