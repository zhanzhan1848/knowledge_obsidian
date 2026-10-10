---
type: paper
created: 2026-10-10
updated: 2026-10-10
tags: [paper, geometry-processing, mesh-compression, octree, lossless-compression, progressive-refinement]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2610.04281
venue: arXiv cs.CV (primary) + cs.GR (submitted 2026-10-03)
arxiv_id: "2610.04281"
authors: ["Shiyu Feng", "Xihua Sheng", "Lingyu Zhu", "Chunyang Fu", "Shiqi Wang"]
---

# OctMesh: A Unified Octree-Hierarchical Framework for Lossless Triangle Mesh Compression

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | OctMesh: A Unified Octree-Hierarchical Framework for Lossless Triangle Mesh Compression |
| **作者** | Shiyu Feng, Xihua Sheng, Lingyu Zhu, Chunyang Fu, Shiqi Wang |
| **发表** | arXiv cs.CV + cs.GR, 2026-10-03 |
| **链接** | [arXiv:2610.04281](https://arxiv.org/abs/2610.04281) |
| **项目页** | https://hiddengalaxy1.github.io/octmesh-demo/ |
| **领域** | 网格压缩 / 八叉树 / 无损压缩 / 渐进细化 |

---

## 核心贡献

> 首次将"几何 + 连通性"在共享八叉树层次结构上**统一编码**的学习式无损三角网格压缩框架。

1. **共享八叉树层级**：几何与连接共用 octree pooling（父节点有 1 或 2-8 子节点）
2. **4 类连接预测**：按端点父类型分组（单父 / 双父 + 是否共享父），产生小型固定形状的预测任务
3. **图感知父特征提取器**：融合局部几何、父连接、全局形状
5. **渐进细化 9 级**：同一层级表示支持 vertex+edge 的多级 LOD 细化

---

## 技术方案

### 核心思想

**问题**：无损三角网格压缩必须同时保留顶点坐标 + 连通性；八叉树适合学习式点云几何编码，但推广到 mesh 需要兼容的连通性表示。

**关键观察**：octree pooling 后，父节点要么有 1 个子节点，要么有 2-8 个子节点。子边按端点父类型分组后，归结为 4 类固定形状预测任务。

### 连接分组与编码

```
Child edges group by:
  - endpoint parents' types (single / dual)
  - whether endpoints share a parent
  
4 categories:
  C1: connections uniquely determined by parent graph → inherited without bits
  C2: remaining candidates → 3 neural predictors estimate probabilities
       → guide arithmetic coding of edge symbols
       
Hierarchical prediction:
  - Binarized within-parent predictions → context for cross-parent predictions
  - Graph-aware parent feature extractor (local geometry + connectivity + global)
  - Coarse: dedicated weights; fine: shared weights
```

### 关键技术

| 技术 | 说明 |
|------|------|
| Octree pooling | 共享几何/连通性层级 |
| 4-category edge grouping | 按父类型分组的固定形状预测 |
| Graph-aware parent features | 局部 + 全局几何融合 |
| Arithmetic coding | 神经网络概率 → 算术编码 |
| Progressive LOD | 9 级 vertex+edge 渐进细化 |
| Finest-level face selection | 最后一级面选择 payload |

---

## 实验结论

- **数据集**: 256 帧，来自 8 个 MPEG V-DMC 测试序列
- **基线**: V-Mesh（MPEG 标准 mesh 编码器）
- **关键指标**:
  - **平均 7.033 bits/face**（无损恢复 finest-level vertex, edge, unoriented face）
  - 比 V-Mesh 低 **12.8%** 比特率
  - 9 级渐进 vertex+edge 细化支持
- **领域**: 动态网格 / 序列帧压缩（V-DMC = Video-based Dynamic Mesh Coding）

---

## 局限性

- **动态网格限制**：主要面向动态 mesh 序列，单帧静态网格可能受益有限
- **训练数据依赖**：学习式方法的泛化性需要大规模训练集
- **未对表面 / 拓扑修复**：纯压缩，无几何修复能力
- **解码速度**：未充分报告（学习式通常比传统算术编码慢）

---

## 与本知识库其他笔记的关系

- [[Draco]] (Google Draco 开源压缩)
- [[V-Mesh]] / MPEG V-PCC / V-DMC
- [[G-PCC]] (点云压缩标准)
- [[DELUGE]] - 实粒子流压缩
- [[Octree-Geometry]] (待创建)

---

## 实现建议

- **实现难度**: 高（八叉树 + 图神经网络 + 算术编码）
- **依赖项**:
  - PyTorch / TensorFlow（神经网络）
  - 八叉树库（自定义 / octomap）
  - 算术编码器（range coder）
- **开源参考**:
  - MPEG V-Mesh 参考实现
  - Draco (Google)
  - G-PCC (TMC13)
- **预期性能**: 
  - 压缩比：~7 bits/face（高质量动态 mesh）
  - 速度：编码/解码时间未明确报告
- **适用场景**: 
  - 动态网格传输（VR/AR 资材）
  - 大规模 mesh 存档
  - 渐进式 mesh 流式传输

---

## 🥬 可行性结论

✅ **推荐关注** — 无损 mesh 压缩领域的实用进展。
- 学术价值：统一几何+连通性的层级编码框架
- 工业价值：V-DMC 标准化背景，有产业化潜力
- 推荐下一步：尝试在动态 mesh 流式传输工作流中集成；与 Draco / V-Mesh 做基准对比

已传递给 @墨鱼丸。