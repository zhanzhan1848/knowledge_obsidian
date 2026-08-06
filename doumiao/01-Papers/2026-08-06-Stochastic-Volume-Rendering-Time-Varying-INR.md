---
type: paper
created: 2026-08-06
updated: 2026-08-06
tags: [paper, volume-rendering, neural-rendering, time-varying]
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
| **DOI** | https://doi.org/10.48550/arXiv.2607.28047 |
| **代码** | - |

---

## 核心贡献

> 解决时变隐式神经体素（INR）的交互式体渲染问题，通过随机体渲染框架实现高效查询

1. **四阶段流水线**：利用异构并行性，使用光线追踪核心进行遍历，张量核心进行批量神经评估
2. **射线预算（Ray Budgeting）**：减少 INR 查询数量，提升每帧性能
3. **查询剪枝策略**：进一步增加帧率性能
4. **交互式时域探索**：时间步更新仅需 ~1-2ms

---

## 技术方案

### 核心思想

时变隐式神经表示（INR）可紧凑表示科学体数据，但对于动态 X 射线 CT 等模态，交互式体渲染具有挑战性。传统 ray marching 方法因高昂的神经推理成本而实际不可行。

本文提出基于 **delta tracking** 的查询高效随机体渲染框架，采用四阶段流水线：

1. **Ray Traversal**（光线追踪核心）
2. **Neural Evaluation**（张量核心批量处理）
3. **Transmittance Accumulation**
4. **Color Composition**

### 关键技术

| 技术 | 说明 |
|------|------|
| Delta Tracking | 随机体渲染技术，用于高效体积光传输 |
| Ray Budgeting | 限制每条光线最大查询数 |
| Query Pruning | 跳过无效体积区域 |
| Heterogeneous Parallelism | RTX 4090 上 ~30-40 FPS @ 1024×1024 |

---

## 性能指标

- **分辨率**: 1024×1024
- **帧率**: ~30-40 FPS (RTX 4090)
- **时间步更新**: ~1-2 ms
- **收敛性**: 高保真图像收敛

---

## 相关工作

- [[volume-rendering]]
- [[ray-marching]]
- [[neural-rendering]]

---

## 实现建议

- **实现难度**: 中等（需异构计算知识）
- **预期性能**: RTX 4090 上 30-40 FPS
- **适用场景**: 科学可视化、医学成像、时变体数据交互探索
