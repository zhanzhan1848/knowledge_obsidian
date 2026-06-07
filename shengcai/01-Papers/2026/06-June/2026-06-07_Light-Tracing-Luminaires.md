---
tags: [渲染, 光线追踪, 全局光照, 2026]
date: 2026-06-07
status: 待读
---

# Learning Complex Luminaires with Light Tracing

## 元信息
| 标题 | Learning Complex Luminaires with Light Tracing |
| 作者 | Pedro Figueirêdo et al. |
| 链接 | [arXiv:2606.04319](https://arxiv.org/abs/2606.04319) |
| 领域 | cs.GR |
| 发表 | 2026-06-03 |

## 核心贡献

1. **神经光传输公式**：将复杂灯具的外观估计建模为分布学习问题
2. **Light Tracing + Normalizing Flow**：使用光追踪构建从发射器到出射面的路径，用大型归一化流网络估计出射面辐亮度分布
3. **知识蒸馏**：将学习到的外观蒸馏成轻量级 MLP，支持高效推理
4. **采样网络 + 混合网络**：训练采样网络计算直接光照，混合网络将灯具合成到场景中

## 技术方案

### 核心问题
传统（双向）路径追踪难以处理复杂灯具（小型发射器被多层镜面包围）。

### 方法流程
```
光追踪 → 构建发射器→出射面路径
    ↓
建模出射面辐亮度pdf（归一化流网络）
    ↓
Radiance = pdf × flux
    ↓
蒸馏到轻量级 MLP（推理加速）
    ↓
采样网络（直接光照）+ 混合网络（场景合成）
```

### 关键公式
```math
L_{outgoing}(x) = p(x) \cdot \Phi(x)
```
其中 $p(x)$ 是归一化流估计的概率密度函数，$\Phi(x)$ 是通量。

## 实验结论

- 可使用低样本数在任意场景中渲染具有复杂光传输的灯具
- 解决了小型发射器 + 多层镜面的困难场景
- 相比传统路径追踪显著提升效率

## 局限性

- 依赖归一化流训练，需要较大计算资源
- 主要针对灯具渲染，泛化性待验证

## 相关工作
[[Light Tracing]], [[Path Tracing]], [[Normalizing Flow]], [[Neural Rendering]]

## 标签
#渲染 #光线追踪 #全局光照 #神经渲染 #灯具渲染