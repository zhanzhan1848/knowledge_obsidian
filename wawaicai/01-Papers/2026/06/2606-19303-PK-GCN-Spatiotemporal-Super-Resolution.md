---
type: paper
created: 2026-06-19
updated: 2026-06-19
tags: [paper, graph-convolution, mesh, super-resolution, Koopman-operator, geometry-aware]
status: processed
domain: geometry-processing
agent: wawaicai
source: https://arxiv.org/abs/2606.19303
---

# P-K-GCN: Physics-augmented Koopman-enhanced Graph Convolutional Network for Deep Spatiotemporal Super-resolution

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | P-K-GCN: Physics-augmented Koopman-enhanced Graph Convolutional Network for Deep Spatiotemporal Super-resolution |
| **作者** | Xizhuo Zhang, Zekai Wang, Fei Liu, Bing Yao (University of Tennessee, Fairfield University) |
| **发表** | arXiv 2026 |
| **链接** | [原文](https://arxiv.org/abs/2606.19303) |

---

## 核心贡献

> 针对不规则几何上的时空超分辨率问题，提出物理增强的 Koopman 增强图卷积网络

1. **几何感知图卷积**：从粗糙图提取空间依赖，学习保持几何连续性的特征
2. **Koopman 算子增强**：将非线性动力学投影到紧致潜在空间进行线性化
3. **物理增强正则化**：强制重建符合物理定律

---

## 技术方案

### 核心思想

解决不规则几何上的时空超分辨率问题（如心脏电动力学）：

1. **连续样条图卷积**：直接在粗糙图上提取空间依赖
2. **Koopman 算子理论**：将非线性动力学线性化于潜在空间
3. **物理损失函数**：约束重建符合物理定律

### 关键技术

| 技术 | 说明 |
|------|------|
| Graph Convolutional Network | 图卷积网络 |
| Koopman Operator | 动力学线性化 |
| Physics-augmented Loss | 物理一致性损失 |
| Continuous Spline-based Conv | 连续样条卷积 |
| Mesh Topology | 底层网格拓扑 |

---

## 应用场景

- 心脏电动力学高分辨率重建
- 医学成像超分辨率
- 科学模拟加速

---

## 实现建议

- **实现难度**: 高（深度学习 + 物理模拟）
- **依赖项**: PyTorch Geometric 或类似图神经网络库
- **适用场景**: 需要在非规则网格/点云上进行时空数据重建的任务
