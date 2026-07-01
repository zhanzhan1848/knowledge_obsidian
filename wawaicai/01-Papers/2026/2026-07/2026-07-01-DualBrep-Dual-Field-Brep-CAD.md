---
type: paper
created: 2026-07-01
updated: 2026-07-01
tags: [B-rep, CAD, dual-field, SDF, UDF, flow-matching, generative-model]
status: new
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2606.31579
---

# DualBrep: A Dual-Field Continuous Representation for B-rep Modelling

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | DualBrep: A Dual-Field Continuous Representation for B-rep Modelling |
| **作者** | Yilin Liu, Pradeep Jayaraman, Chinthala Reddy, Xiang Xu, Hooman Shayani |
| **发表** | SIGGRAPH 2026 |
| **链接** | [原文](https://arxiv.org/abs/2606.31579) |
| **DOI** | 10.48550/arXiv.2606.31579 |
| **代码** | https://github.com/AutodeskAILab/DualBrep |

---

## 核心贡献

> 将异构 B-rep 几何和拓扑统一到完全结构化的欧几里得域中

1. **双场表示 (Dual-Field Representation)**: 使用 SDF 表示全局形状几何，UDF 通过表面元素 Voronoi 划分隐式编码拓扑结构
2. **统一潜空间**: 将 SDF 和 UDF 压缩到单一潜空间，使生成变得 tractable
3. **Flow Matching 生成**: 从单一 code 联合采样几何和拓扑，避免顺序预测的错误累积
4. **神经重建器**: 从连续双场提取显式 B-rep 模型（棱柱和自由形式图元）

---

## 技术方案

### 核心思想

B-rep 是 CAD 中最常用的数据格式，但其异构结构（连续参数几何 + 离散拓扑图）给深度学习带来根本挑战。现有方法直接预测异构图，使用固定大小 padding 或顺序 tokenization 处理可变图元数量，这些方法难以应对 CAD 模型的组合复杂性。

**关键洞察**：不需要分别处理几何和拓扑，而是将两者编码到统一的连续场表示中。

### 关键技术

| 技术 | 说明 |
|------|------|
| SDF (Signed Distance Function) | 表示全局形状几何 |
| UDF (Unsigned Distance Field) | 通过 Voronoi 划分隐式编码拓扑 |
| Shared Latent Space | SDF+UDF 压缩到单一潜空间 |
| Flow Matching | 联合采样几何和拓扑 |
| Neural Rebuilder | 从双场提取显式 B-rep |

### 公式

- SDF: $d_{\Omega}(x) = \min_{y \in \partial \Omega} \|x - y\|$ (signed)
- UDF: $D_{\Omega}(x) = \min_{i} \|x - S_i\|$ where $S_i$ are surface elements partitioned by Voronoi

---

## 应用场景

- Point Cloud Reverse Engineering
- Generative CAD Modeling via Latent Flow Matching

---

## 实验结论

- 在点云逆向工程和生成式建模上均表现出色
- 避免了顺序 B-rep 预测器的错误累积问题

---

## 局限性

- 需要大量 CAD 模型数据训练
- 自由形式图元的提取质量依赖于神经重建器的精度

---

## 相关工作

- [[B-rep Modeling]]
- [[CAD Deep Learning]]
- [[SDF Representation]]

---

## 实现建议

- **实现难度**: 高（需 SDF/UDF 计算 + Flow Matching + 神经重建）
- **预期性能**: 联合生成几何和拓扑，避免错误累积
- **适用场景**: CAD 模型生成、逆向工程
- **开源参考**: AutodeskAILab/DualBrep (GitHub)