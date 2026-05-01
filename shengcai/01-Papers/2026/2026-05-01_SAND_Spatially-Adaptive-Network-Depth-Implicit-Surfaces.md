---
type: paper
created: 2026-05-01
updated: 2026-05-01
tags: [neural-implicit, SDF, adaptive-computation, ray-marching, efficiency]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.25936
---

# SAND: Spatially Adaptive Network Depth for Fast Sampling of Neural Implicit Surfaces

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | SAND: Spatially Adaptive Network Depth for Fast Sampling of Neural Implicit Surfaces |
| **作者** | Chuanxiang Yang (et al.) |
| **发表** | arXiv cs.GR, 2026 |
| **链接** | [原文](https://arxiv.org/abs/2604.25936) |
| **DOI** | 10.48550/arXiv.2604.25936 |

---

## 核心贡献

> 观察到隐式表示中不同空间区域的精度需求不同，提出 SAND 框架： volumetric network-depth map + tailed MLP，实现自适应网络深度评估，显著加速神经隐式表面的推理。

1. **空间自适应网络深度**：观察到离表面越远的 query point 精度需求越低，同一 iso-surface 内不同区域复杂度也不同
2. **Volumetric Network-Depth Map**：记录每个空间区域达到足够精度所需的网络深度
3. **Tailed MLP (T-MLP)**：modified MLP，在每个隐藏层 attach tail output branch，允许提前终止
4. **显著加速**：保持高保真表示的同时，大幅降低推理计算量

---

## 技术方案

### 观察

- 离目标表面越远，精度需求越低
- 同一 iso-surface 内，局部几何复杂度不同，表征难度也不同
- 传统 MLP 对所有 query point 使用相同深度，浪费计算资源

### 方法

```
Query Point → Volumetric Depth Map → 所需网络深度
                       ↓
              T-MLP 评估（tail 提前输出）
                       ↓
              自适应精度输出
```

### T-MLP 结构

- 每个隐藏层 attach 输出分支（tail）
- 可在任意深度提前终止，不强制走完整网络
- 计算资源导向几何复杂区域

---

## 实验结论

- **任务**: 神经隐式表面（SDF）推理加速
- **结果**: 显著提升推理时 query 速度，preserving high-fidelity representations

---

## 局限性

- 需要预先训练 volumetric depth map
- 精度-速度权衡需调参

---

## 实现建议

- **实现难度**: 中（T-MLP 结构相对简单，depth map 训练需额外步骤）
- **预期性能**: 推理速度大幅提升，精度损失可控
- **适用场景**: 实时渲染（ray marching SDF）、大规模场景重建、交互式应用
- **可借鉴点**: 自适应计算深度的思想可迁移到其他神经渲染任务（如 NeRF 加速）

---

## 相关工作

- [[Neural Implicit Surfaces]]
- [[SDF Ray Marching]]
- [[Adaptive Computation]]
- [[Efficient Neural Rendering]]
