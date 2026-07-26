---
type: paper
created: 2026-07-26
updated: 2026-07-26
tags: [paper, mesh-generation, flow-matching, topology-aware]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2607.10623
---

# LATO.2: Factorized 3D Mesh Generation with Vertex and Topology Flow

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | LATO.2: Factorized 3D Mesh Generation with Vertex and Topology Flow |
| **作者** | Hang Long, Tianhao Zhao, Junkai Lin, Youjia Zhang, Huipeng Guo, Rendong Liang, Jiale Xu, Jozef Hladký, Matthias Nießner, Yuanming Hu, Wei Yang |
| **发表** | arXiv cs.GR (v2 2026-07-20) |
| **链接** | [原文](https://arxiv.org/abs/2607.10623) |
| **DOI** | 10.48550/arXiv.2607.10623 |

---

## 核心贡献

> 将网格生成分解为顶点流匹配 + 连通性流匹配两阶段，解决顶点与连接结构纠缠问题

1. **因子分解框架**：首创将网格生成分解为 vertex flow + connectivity flow 两个独立阶段
2. **共享粗粒度 Voxel Scaffold**：两阶段共享 coarse voxel scaffold 作为锚点
3. **专用 VAE**：顶点 VAE 恢复亚体素精度，连通性 VAE 将离散拓扑嵌入连续空间
4. **独特优势**：part-wise generation + topology-adaptive editing

---

## 技术方案

### 核心思想

现有方法将顶点和连接结构在联合潜空间中联合建模，导致连续几何与离散组合结构的纠缠。LATO.2 提出因子分解范式：
- **Stage 1 (Vertex Flow)**: 基于 voxel scaffold 生成顶点位置
- **Stage 2 (Connectivity Flow)**: 基于已生成顶点条件生成连接结构

### 关键技术

| 技术 | 说明 |
|------|------|
| Flow Matching | 用于顶点位置和连通性的分布学习 |
| Voxel Scaffold | 共享的粗粒度空间结构 |
| Vertex VAE | 顶点位置编码/解码 |
| Connectivity VAE | 连通性嵌入连续空间 |

---

## 实验结论

- **数据集**: 未明确
- **基线**: State-of-the-art topology-aware mesh generators
- **结果**: 几何保真度和连通性质量均超越 SOTA

---

## 局限性

- 生成分辨率受限于 voxel scaffold 粒度
- 需要预定义的 scaffold 结构

---

## 相关工作

- [[LATO]] - 联合建模的早期版本
- [[MeshFlow]] - Flow Matching 网格生成

---

## 实现建议

- **实现难度**: 高 (需要设计两阶段 VAE + Flow Matching)
- **预期性能**: 顶点精度 sub-voxel，连通性质量高
- **适用场景**: 拓扑感知网格生成、编辑应用

---

## 知识点

- #flow-matching #mesh-generation #topology-aware #VAE #geometry-processing
