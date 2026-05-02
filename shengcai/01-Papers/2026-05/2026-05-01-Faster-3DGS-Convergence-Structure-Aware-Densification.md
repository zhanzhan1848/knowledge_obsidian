---
type: paper
created: 2026-05-01
updated: 2026-05-01
tags: [paper, 3dgs, gaussian-splatting, densification, SIGGRAPH2026, rendering]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.28016
---

# Faster 3D Gaussian Splatting Convergence via Structure-Aware Densification

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Faster 3D Gaussian Splatting Convergence via Structure-Aware Densification |
| **作者** | Linjie Lyu, et al. |
| **发表** | SIGGRAPH 2026, April 30, 2026 |
| **链接** | [原文](https://arxiv.org/abs/2604.28016) |
| **DOI** | 10.1145/3799902.3811212 |

---

## 核心贡献

> 提出结构感知的高斯密集化框架，通过多尺度频率分析结合结构张量和拉普拉斯尺度空间分析，判断高斯是否需要分裂，实现更快收敛和更好重建质量。

1. **结构感知密集化**：决定何时细分高斯应基于投影屏幕空间范围与局部纹理结构显式比较
2. **多尺度频率分析**：结合结构张量与拉普拉斯尺度空间分析，估计每个像素的主导频率
3. **各向异性分裂**：非均匀分裂，每个轴根据频率违反度量独立计算分裂因子
4. **多视图一致性准则**：跨多视图聚合频率违反观测

---

## 技术方案

### 核心思想

标准3DGS的自适应密度控制依赖屏幕空间位置梯度，不能区分几何错位和频率混叠，导致高频纹理过度模糊或低效的过度密集化。

**关键洞察**：是否细分高斯应由显式比较决定——其投影屏幕空间范围 vs 其试图表示的纹理的局部结构。

**方法**：
- 定义 η：per-Gaussian, per-axis 频率违反度量
- 当η高时，表示primitive可能解析不足局部纹理细节
- 非均匀分裂：每个轴独立计算分裂因子

### 关键技术

| 技术 | 说明 |
|------|------|
| 结构张量 | structure tensors |
| 拉普拉斯尺度空间分析 | Laplacian scale space analysis |
| 频率违反度量 η | per-Gaussian, per-axis frequency violation metric |
| 各向异性分裂 | anisotropic splitting |
| 多视图一致性 | multiview consistency criterion |

---

## 实验结论

- **收敛速度**: 更快收敛（skip lengthy iterative densification phases）
- **重建质量**: 尤其在高频区域达到更好质量
- **基准**: standard benchmarks验证

---

## 实现建议

- **实现难度**: 中（需理解和实现频率分析）
- **预期性能**: 更快的训练收敛，更好的高频细节
- **适用场景**: 实时渲染、NeRF替代、AR/VR

---

## 标签

#3DGS #高斯泼溅 #密集化 #SIGGRAPH2026 #神经渲染
