---
type: paper
created: 2026-07-01
updated: 2026-07-01
tags: [mesh-generation, flow-matching, topology-embedding, generative-model]
status: new
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2606.30673
---

# PolyFlow: Continuous Topology Embedding Flow Matching for Artist-style Mesh Generation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | PolyFlow: Continuous Topology Embedding Flow Matching for Artist-style Mesh Generation |
| **作者** | Chunshi Wang, Haohan Weng, Junliang Ye, Biwen Lei, Yang Li, Zibo Zhao, Zeqiang Lai, Kaiyi Zhang, Yunhan Yang, Zhuo Chen, Chunchao Guo, Yawei Luo |
| **发表** | arXiv cs.GR (2026-06-25) |
| **链接** | [原文](https://arxiv.org/abs/2606.30673) |
| **DOI** | 10.48550/arXiv.2606.30673 |
| **代码** | 未提供 |

---

## 核心贡献

> 解决离散网格拓扑与连续扩散/流匹配框架之间的根本不兼容性

1. **拓扑嵌入器 (Topology Embedder)**: 将离散网格顶点位置和法线投影到连续每顶点嵌入，通过时空间距阈值恢复原始邻接信息
2. **连续网格表示**: 统一位置、法线和隐式拓扑属性为连续每顶点状态空间
3. **PolyFlow 框架**: 基于 Transformer 的流匹配框架，支持完全并行顶点状态去噪，通过 ODE 求解器快速推理
4. **精确分辨率控制**: 直接指定目标顶点数即可控制输出网格分辨率

---

## 技术方案

### 核心思想

Autoregressive Transformers 在高质量网格生成中占主导地位，但其顺序解码带来巨大计算开销。而连续扩散和流匹配方法虽然支持高效并行合成，但无法直接应用于网格——因为网格连通性本质上是离散的，与标准连续噪声注入和去噪操作不兼容。

**解决方案**：设计一个紧凑的拓扑嵌入器，将离散网格投影到连续空间，再基于此表示构建流匹配框架。

### 关键技术

| 技术 | 说明 |
|------|------|
| Topology Embedder | 将顶点位置+法线投影为连续嵌入，邻接信息通过时空间距阈值恢复 |
| Per-vertex State Space | 统一位置、法线、拓扑属性的连续状态空间 |
| Flow Matching | Transformer-based 并行去噪，条件于点云特征 |
| ODE Solver | 推理时快速生成 |

---

## 实验结论

- **数据集**: Toys4K benchmark
- **指标**: Chamfer Distance, Hausdorff Distance
- **结果**: 在 Chamfer Distance 和 Hausdorff Distance 上均超越 state-of-the-art 自回归基线

---

## 局限性

- 需要预训练拓扑嵌入器
- 对复杂拓扑结构的恢复效果有待验证
- 代码未公开

---

## 相关工作

- [[Mesh Generation]]
- [[Flow Matching]]
- [[Topology Embedding]]

---

## 实现建议

- **实现难度**: 高（需预训练嵌入器 + Transformer 流匹配）
- **预期性能**: 并行生成，速度远快于自回归方法
- **适用场景**: 高质量网格快速生成、艺术风格拓扑控制