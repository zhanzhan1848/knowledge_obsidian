---
type: paper
created: 2026-07-07
updated: 2026-07-07
tags: [paper, 3D-gaussian, mesh, plenoptic-sampling, global-illumination]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2606.21898
---

# Mesh2GS: White-Box 3DGS Construction via Plenoptic Sampling

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Mesh2GS: White-Box 3DGS Construction via Plenoptic Sampling |
| **作者** | (USTC) |
| **发表** | arXiv cs.GR (2026) |
| **链接** | [原文](https://arxiv.org/abs/2606.21898) |
| **代码** | 待发布（接收后） |

---

## 核心贡献

> 首个基于光场采样理论的白盒 3DGS 构建框架，从网格几何直接生成 3DGS，实现高质量全局光照渲染的奈奎斯特级性能

1. **光场采样引导的 3DGS 构建策略**：理论推导最小采样率和 3D 高斯分布
2. **反照率-着色分解的 3DGS 更新程序**：高效捕捉全局光照
3. **神经光照增强 (NIE) 模块**：处理非兰伯特效应

---

## 技术方案

### 核心思想

区别于现有"黑盒"3DGS-to-mesh 重建，提出"白盒"mesh-to-3DGS 构建，基于光场采样理论确定 3D 高斯分布和采样视图密度。

### 光场采样理论

**最大相机采样间隔**：
```math
\Delta t = \frac{1}{K_v f (1/z_{min} - 1/z_{max})}
```

其中 $K_v = \min(B_v, \frac{1}{2\Delta v})$ 是最高空间频率。

### 3D 高斯定义

```math
G(x) = e^{-\frac{1}{2}(x-p)^T \Sigma^{-1} (x-p)}
```

其中 $\Sigma = RS S^T R^T$ 是协方差矩阵。

### 渲染公式

```math
C = \sum_{i \in N} c_i \alpha_i \prod_{j=1}^{i-1} (1-\alpha_j)
```

---

## 实验结论

- **理论支撑**：光场采样理论确保可靠的全局光照缓存
- **超越基线**：定性定量优于启发式 3DGS 构建方法
- **非兰伯特效应**：NIE 模块处理镜面高光
- **实时共享渲染**：多观看者环境高质量实时缓存

---

## 局限性

- 需要已知网格几何
- NIE 模块增加计算开销
- 主要验证室内场景

---

## 实现建议

- **实现难度**: 中
- **预期性能**: 实时渲染
- **适用场景**: 游戏引擎 GI 烘焙、VR/AR 共享渲染
