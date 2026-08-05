---
type: paper
created: 2026-08-05
updated: 2026-08-05
tags: [paper, volume-rendering, ray-marching, neural-rendering, real-time-rendering, RTX]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2607.28047
---

# A Query-Efficient Stochastic Volume Rendering Framework for Time-Varying Implicit Neural Volumes

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | A Query-Efficient Stochastic Volume Rendering Framework for Time-Varying Implicit Neural Volumes |
| **作者** | Alper Sahistan (et al.) |
| **发表** | arXiv cs.GR (2026-07-30) |
| **链接** | [原文](https://arxiv.org/abs/2607.28047) |
| **DOI** | 10.48550/arXiv.2607.28047 |
| **代码** | - |

---

## 核心贡献

> 针对时变隐式神经表示(INR)的实时体渲染框架，基于delta tracking和混合并行化实现高效查询

1. 提出基于delta tracking的查询高效随机体渲染框架
2. 四阶段流水线利用异构并行：光线追踪核用于遍历，张量核用于批量神经评估
3. 引入光线预算和查询剪枝策略减少INR查询
4. 在RTX 4090上达到~30-40 FPS @ 1024x1024，支持时间步更新约1-2ms

---

## 技术方案

### 核心思想

用delta tracking替代传统dense sampling的ray marching，通过预算控制和剪枝减少神经网络的查询次数，同时利用RTX GPU的光线追踪核和张量核实现异构并行。

### 关键技术

| 技术 | 说明 |
|------|------|
| Delta Tracking | 随机体渲染技术，避免密集采样 |
| Ray Budgeting | 限制每条光线的查询预算 |
| Query Pruning | 剪枝策略减少INR查询 |
| RTX Ray Tracing Cores | 光线遍历加速 |
| Tensor Cores | 批量神经网络推理加速 |

### 公式

Delta tracking的核心思想：
```math
T_{i+1} = T_i \cdot \max(0, 1 - \sigma(x_i) \Delta t)
```

其中 $T_i$ 是透射率，$\sigma(x_i)$ 是查询点 $x_i$ 处的密度，$\Delta t$ 是步长。

---

## 实验结论

- **性能**: ~30-40 FPS @ 1024x1024 (RTX 4090)
- **收敛性**: 收敛到高质量图像
- **时间交互**: 时间步更新约1-2ms，支持连续时间域的交互式探索
- **应用**: 动态X射线CT等科学体数据的直接渲染

---

## 局限性

- 需要RTX GPU（光线追踪核+张量核）
- 对时变数据的适应性有限

---

## 实现建议

- **实现难度**: 中高
- **依赖**: RTX GPU, OptiX/DXR光线追踪, CUDA张量核
- **适用场景**: 科学可视化、体渲染、神经隐式表示
- **推荐度**: ⭐⭐⭐⭐

---

## 相关工作

- 神经体渲染 (NeRF及其变体)
- 实时体渲染技术
- RTX加速结构
