---
type: paper
created: 2026-04-14
updated: 2026-04-14
tags: [paper, 3dgs, gaussian-splatting, performance-energy, edge-computing, real-time]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.07177
---

# Exploring Performance-Energy Trade-offs in Real-Time 3D Gaussian Splatting under Constrained GPU Budgets

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Exploring Performance-Energy Trade-offs in Real-Time 3D Gaussian Splatting under Constrained GPU Budgets |
| **作者** | Anand Bhojan et al. |
| **发表** | arXiv cs.GR 2026 |
| **链接** | [原文](https://arxiv.org/abs/2604.07177) |

---

## 核心贡献

> 通过模拟方法研究边缘客户端实时 3DGS 光栅化的实际下限和能源约束环境中的部署潜力

1. 采用模拟方法在单一高端 GPU 上近似不同 GPU 能力层级
2. 通过降低 GPU 核心频率和功率限制模拟不同性能水平
3. 测量不同 Gaussian Splat 数量和 GPU 计算预算下的帧率、运行时行为和功耗
4. 分析 FPS-功率曲线、每帧能量、性能/瓦特等 power-performance 关系

---

## 技术方案

### 核心思想

不评估多个物理设备，而是采用模拟方法在单一高端 GPU 上近似不同 GPU 能力层级。通过系统地降低 GPU 核心频率和施加功率限制，模拟从嵌入式/移动级到高端消费级系统的性能包络。

### 关键指标

| 指标 | 说明 |
|------|------|
| FPS-功率曲线 | 帧率与功耗的关系 |
| 每帧能量 | 能源效率 |
| 性能/瓦特 | 能耗比 |
| 场景复杂度 | 不同复杂度场景的性能表现 |
| 管线与优化 | 不同渲染管线的影响 |

---

## 实验结论

- **目标**: 探索客户端 3DGS 光栅化的实际下限
- **环境**: 能源受限环境、独立头显、瘦客户端
- **洞察**: 提供性能-能源权衡的早期洞察

---

## 实现建议

- **实现难度**: 低 (实验测量为主)
- **适用场景**: 移动 AR/VR、云游戏、边缘渲染
- **价值**: 为移动/嵌入式设备上的 3DGS 部署提供指导

---

## 相关工作

- [[3D Gaussian Splatting]]
- [[Edge Computing]]
- [[Power Efficiency]]
- [[Real-time Rendering]]