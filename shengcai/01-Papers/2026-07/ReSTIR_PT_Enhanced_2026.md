---
type: paper
created: 2026-07-19
updated: 2026-07-19
tags: [paper, rendering, real-time, path-tracing, ReSTIR]
status: processed
domain: rendering
agent: shengcai
source: https://research.nvidia.com/labs/rtr/publication/lin2026restirptenhanced/
---

# ReSTIR PT Enhanced: Algorithmic Advances for Faster and More Robust ReSTIR Path Tracing

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | ReSTIR PT Enhanced: Algorithmic Advances for Faster and More Robust ReSTIR Path Tracing |
| **作者** | NVIDIA Research (Lifan Wu, et al.) |
| **发表** | Proc. ACM Comput. Graph. Interact. Tech. (I3D), 2026 - 🏆 Best Paper |
| **链接** | [NVIDIA Page](https://research.nvidia.com/labs/rtr/publication/lin2026restirptenhanced/) |
| **DOI** | - |

---

## 核心贡献

> 利用 ReSTIR 空间-时间重要性采样提升实时路径追踪的效率和鲁棒性

1. **2-3x 性能提升**：通过算法优化实现 2-3 倍的速度提升
2. ** reciprocal neighbor selection**：将空间复用成本减半
3. **shift mapping 鲁棒化**：基于 footprint 的重连标准提高稳定性
4. **duplication maps**：减少时空相关性
5. **统一直接/全局光照**：将 DI 和 GI 统一到相同的 reservoir 中

---

## 技术方案

### 核心思想

ReSTIR (Resampled Importance Sampling) 通过时空重要性采样大幅提升实时光线追踪的有效采样数。本论文聚焦于算法工程优化，弥补了理论与实践之间的差距。

### 关键技术

| 技术 | 说明 |
|------|------|
| Reciprocal Neighbor Selection | 减半空间复用成本 |
| Footprint-based Reconnection | 增强 shift mapping 稳定性 |
| Duplication Maps | 减少时空相关性 |
| Unified DI/GI Reservoirs | 统一直接光照和全局光照采样 |
| Color/Disocclusion Noise Reduction | 减少色噪和视差噪点 |

---

## 算法流程

```
1. Reciprocal neighbor selection → 减少空间采样开销
2. Robustify shift mappings → 提高重连质量
3. Reduce correlation with duplication maps → 减少噪点
4. Unify direct/indirect illumination → 简化管线
5. Optimize for performance → 整体加速
```

---

## 实验结论

- **性能提升**: 2-3x faster
- **视觉质量**: 减少色噪和数值误差
- **鲁棒性**: 更接近生产就绪

---

## 局限性

- 需要 hardware-accelerated ReSTIR 支持
- 针对特定场景类型优化

---

## 相关工作

- [[Conditional Resampled Importance Sampling and ReSTIR]]
- [[Generalized Resampled Importance Sampling: Foundations of ReSTIR]]
- [[Gradient-Domain ReSTIR Path Tracing]]

---

## 实现建议

- **实现难度**: 中高 (需要 GPU shader 经验)
- **预期性能**: 2-3x 提升实时渲染性能
- **适用场景**: 游戏实时渲染、交互式路径追踪
