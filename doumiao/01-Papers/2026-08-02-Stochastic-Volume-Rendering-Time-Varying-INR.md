---
type: paper
created: 2026-08-02
updated: 2026-08-02
tags: [volume-rendering, neural-rendering, time-varying, INR]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2607.28047
---

# A Query-Efficient Stochastic Volume Rendering Framework for Time-Varying Implicit Neural Volumes

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | A Query-Efficient Stochastic Volume Rendering Framework for Time-Varying Implicit Neural Volumes |
| **作者** | Alper Sahistan 等 |
| **发表** | arXiv cs.GR (2026-07-30) |
| **链接** | [原文](https://arxiv.org/abs/2607.28047) |

---

## 核心贡献

> 针对时变隐式神经表示的高效随机体积渲染框架

1. **Delta Tracking + 四阶段管道**：利用异构并行性
2. **Ray Tracing Cores**：光线遍历
3. **Tensor Cores**：批量神经评估
4. **Ray Budgeting + Query Pruning**：减少 INR 查询

---

## 技术方案

### 核心思想

时变隐式神经表示 (INR) 是科学体积数据（如动态 X-ray CT）的紧凑表示，但交互式体积渲染需要昂贵的神经推理。传统 ray marching 代价过高。

### 关键技术

| 技术 | 说明 |
|------|------|
| Delta Tracking | 随机体积渲染基础 |
| 四阶段管道 | 异构并行架构 |
| Ray Budgeting | 光线预算管理 |
| Query Pruning | 查询剪枝策略 |

---

## 实验结论

- **硬件**: RTX 4090 GPU
- **分辨率**: 1024x1024
- **帧率**: ~30-40 FPS
- **时间步更新**: ~1-2 ms
- **收敛性**: 收敛至高保真图像

---

## 局限性

- 依赖于特定硬件 (RTX 4090)
- 对时变数据需要特殊处理管道

---

## 相关工作

- [[体积渲染]]
- [[隐式神经表示]]
- [[Ray Marching]]

---

## 实现建议

- **实现难度**: 高
- **预期性能**: 30-40 FPS @ 1024x1024
- **适用场景**: 科学体积数据可视化、时变 CT 重建、流体体积渲染
