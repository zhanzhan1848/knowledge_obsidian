---
type: paper
created: 2026-06-08
updated: 2026-06-08
tags: [paper, rendering, light-transport, path-tracing, luminaires, neural-rendering]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2606.04319
---

# Learning Complex Luminaires with Light Tracing

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Learning Complex Luminaires with Light Tracing |
| **作者** | Pedro Figueirêdo et al. |
| **发表** | arXiv cs.GR (2026-06-03) |
| **链接** | [原文](https://arxiv.org/abs/2606.04319) |
| **DOI** | 10.48550/arXiv.2606.04319 |
| **代码** | - |

---

## 核心贡献

> 使用光追迹（Light Tracing）+ 归一化流（Normalizing Flow）学习复杂灯具的外观，解决传统（双向）路径追迹难以处理的多镜面层封装灯具渲染问题。

1. **光追迹构建路径**：从发光器到出射表面构建路径，将外观估计问题转化为分布学习问题
2. **归一化流建模出射辐射率**：用大型归一化流网络建模出射表面上出射辐射率的概率密度函数（pdf），通过 pdf × flux 恢复辐射率
3. **MLP 蒸馏加速推理**：将学习到的外观蒸馏为轻量级 MLP，直接在出射表面上估计辐射率
4. **采样网络 + 混合网络**：训练采样网络计算直接光照，混合网络将灯具合成到场景中

---

## 技术方案

### 核心思想

对于具有复杂光传输的灯具（如小型发光体被多层镜面包围），传统双向路径追迹难以采样到困难路径。本文使用**光追迹**从发光器出发构建路径，利用归一化流学习出射表面的辐射率分布。

### 关键技术

| 技术 | 说明 |
|------|------|
| Light Tracing | 从发光器出发前向构建光传输路径 |
| Normalizing Flow | 建模出射表面辐射率的概率密度函数 |
| MLP 蒸馏 | 将大模型蒸馏为轻量 MLP 以支持实时推理 |
| 采样网络 | 有效计算来自灯具的直接光照 |
| 混合网络 | 将灯具合成到任意场景中 |

### 公式

通过归一化流估计出射表面的辐射率：

```math
L_o(x, \omega) = p_\theta(x, \omega) \times \Phi(x)
```

其中 $p_\theta$ 为归一化流建模的 pdf，$\Phi$ 为通过光追迹采样的 flux。

---

## 实验结论

- **方法**：在复杂灯具（多层镜面封装小型发光器）上验证
- **基线**：传统双向路径追迹
- **结果**：低采样数下即可渲染困难灯具，场景中合成效果良好

---

## 局限性

- 需要预先训练归一化流网络
- 对非稳态光学系统（如动态内部结构）可能需要扩展

---

## 实现建议

- **实现难度**: 高（需训练归一化流 + 光追迹）
- **预期性能**: 推理阶段高效（MLP），训练阶段计算量大
- **适用场景**: 离线渲染器中的复杂灯具建模、电影/建筑可视化

---

## 相关工作

- [[path-tracing]]
- [[light-transport]]
- [[neural-rendering]]