---
type: paper
created: 2026-04-28
updated: 2026-04-28
tags: [paper, ray-tracing, neural-rendering, deformation, AMD]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.24666
---

# Voxel Deformation-Aware Neural Intersection Function

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Voxel Deformation-Aware Neural Intersection Function |
| **作者** | Chih-Chen Kao, Grzegorz Makowski, Shin Fujieda, Takahiro Harada |
| **发表** | arXiv cs.GR (2026) |
| **链接** | [原文](https://arxiv.org/abs/2604.24666) |
| **DOI** | 10.48550/arXiv.2604.24666 |
| **代码** | - |
| **机构** | AMD |

---

## 核心贡献

> 将 LSNIF (Locally-Subdivided Neural Intersection Function) 扩展支持参数化可变形和动画几何体

1. 提出 rest-space 和 deformed-space 双空间 formulation，灵感来自 meshless rendering
2. 引入 scale-invariant distance regression 和 uncertainty-weighted multi-task learning
3. 提出 hybrid positional-grid encoding，结合位置编码与多分辨率 hash grid

---

## 技术方案

### 核心思想

将神经交点预测扩展到动态几何：**神经网络的训练在 rest space（静止空间）进行，而光线追踪和数据生成在 deformed space（变形空间）进行**。通过将变形空间的射线采样点映射回静止空间，实现单一网络跨多种姿态的泛化，无需每个姿态重新训练。

### 关键技术

| 技术 | 说明 |
|------|------|
| 双空间 formulation | rest space 训练，deformed space 追踪 |
| 本地线性近似 | 假设单个小体素内变形场近似线性，避免弯曲射线追踪的计算开销 |
| Scale-invariant distance regression | 变形下保持距离预测准确性 |
| Uncertainty-weighted multi-task | 动态调整多任务损失权重 |
| Hybrid PECS encoding | 组合 positional encoding 和 hash grid encoding |

### 体素遍历

变形导致非均匀体素大小，标准 DDA 遍历失效。方法：
1. 使用 BVH 找到包含射线原点的初始体素
2. 通过显式确定射线穿出的体素面来遍历

### 距离累加

分段射线距离累加公式：
$$D=\sum_{j=0}^{k-1}(\delta_j+\ell_j)+\delta_k+t_k$$

---

## 公式

### 位置编码 (PECS)

```math
\gamma(\mathbf{x}) = [\mathbf{x}, \{\sin(2^k\mathbf{x}), \cos(2^k\mathbf{x})\}_{k=0}^{F-1}]
```

### Hash Grid Encoding

```math
\phi(\mathbf{x}) = \bigoplus_{l=1}^{L} \phi_l(\mathbf{x}), \quad \psi(\mathbf{x}) = \phi(\gamma(\mathbf{x}))
```

---

## 实验结论

- 在变形几何上保持 LSNIF 的紧凑性和效率
- 支持动态/动画几何的鲁棒神经交点预测
- 无需 per-pose retraining

---

## 局限性

- 限于参数化变形，不支持任意拓扑变化
- 依赖体素分辨率

---

## 相关工作

- LSNIF (原始神经交点函数)
- N-BVH (神经与 BVH 混合方法)
- D-NeRF, Deformable NeRF (动态神经渲染)
- Meshless rendering

---

## 实现建议

- **实现难度**: 高
- **预期性能**: 高效，适合动态几何的神经光线追踪
- **适用场景**: 游戏角色变形、动画几何的实时光线追踪

---

## 标签

#渲染 #光线追踪 #神经渲染 #变形几何 #AMD
