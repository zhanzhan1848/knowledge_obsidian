---
type: paper
created: 2026-10-15
updated: 2026-10-15
tags: [paper, geometry-processing, quad-mesh, mesh-generation, autoregressive-model, transformer, tokenization, quad-only]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2610.19777
venue: arXiv cs.GR (submitted 2026-10-14)
arxiv_id: "2610.19777"
---

# Q-MAGIC: Quad-only Mesh Autoregressive Generation via Singularity-Aware Circular Relative Offset Tokenization

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Q-MAGIC: Quad-only Mesh Autoregressive Generation via Singularity-Aware Circular Relative Offset Tokenization |
| **作者** | Yuming Zhao, Zezeng Li, Weimin Wang, Xiang Wu, Na Lei |
| **发表** | arXiv cs.GR, 2026-10-14 |
| **链接** | [arXiv:2610.19777](https://arxiv.org/abs/2610.19777) |
| **领域** | 四边网格生成 / Autoregressive Transformer / 几何 tokenization |

---

## 核心贡献

> 把三角网格的 "next face" 自回归生成范式扩展到 quad-only mesh：解决 quad 拓扑约束 (≥2 新顶点) 导致的串行化和解串行化两个难题。

1. **Singularity-aware 串行化**：每个下一个 quad 需 ≥2 个新顶点，比三角网格更不灵活；优先从奇异点开始 wire traversal，连贯性更好
2. **Circular Relative Offset Tokenization**：相对偏移编码 (避免绝对坐标依赖)，主存几何信息
3. **完整的 Autoregressive Transformer**：next-token prediction 学习 quad mesh 的分布
4. **实验结果**：序列更紧凑，几何保真度 + mesh quality 一致优于 SOTA

---

## 技术方案

### 核心思想

Tri mesh → Token 的范式 (`MeshGPT` 等) 把"下一面预测"序列化。Quad mesh 的两个新难题：

1. **Wiring 约束更严**：每个新 quad 需要至少 2 个新顶点，不能随意选择下一面
2. **解串行化需无歧义**：确定的拓扑重建

Q-MAGIC 解决策略：

| 步骤 | 创新点 |
|------|--------|
| 串行化 | 优先围绕奇异点展开 traversal |
| Token 编码 | 相对偏移 (circular) 替代绝对坐标 |
| 预测 | Autoregressive Transformer |
| 重建 | 由 token 序列反推拓扑 (无歧义) |

### 关键技术

| 技术 | 说明 |
|------|------|
| Singularity-aware traversal | 优先从奇异点 (irregular valence) 出发 wire quad |
| Circular relative offset | 用局部相对坐标编码几何，减少 token 长度 |
| Autoregressive Transformer | next-token prediction 建模 mesh 分布 |
| Unambiguous de-serialization | token → unique mesh，无歧义 |
| Comparison with tri baseline | 与 MeshGPT 类方法在 quad 上做 head-to-head |

### Singularity-aware 串行化

理论动机：
- 三角网格自由度高 → greedy 下一面解码可行
- 四边网格每个新面至少 2 个新顶点 → 必须考虑"顶点的拓扑角色"

解决方案：先检测奇异点（valence ≠ 4 的顶点），从那里开始构造。

```python
# pseudo-code
singularities = detect_singular_vertices(mesh)  # valence != 4
traversal_order = prioritize_around_singularities(singularities)
serialized = serialize_quads(mesh, traversal_order)
```

### Circular Relative Offset Tokenization

每个新 quad 的几何由"起始边 + 偏移向量"序列编码：
- 偏移是局部坐标系下的相对量
- Circular: 闭合回路上各偏移形成环
- 减少 token count，提升 compactness

---

## 实验结论

- **数据集**: 标准 quad mesh benchmark（具体细节见论文）
- **基线**: MeshGPT 类 (tri) + 直接 quad 化方法 + 现有 quad-only 工作
- **结果**:
  - 序列长度：更紧凑（相对 token 数下降）
  - 几何保真度：Chamfer / F-score 一致优于 SOTA
  - Mesh quality：edge length / angle / regularity 指标改善

---

## 局限性

- **依赖训练数据分布**：自回归模型对训练集外的几何拓扑泛化能力有限
- **流式生成效率**：每个新 quad 至少 2 token → 推理时间比 tri 长
- **奇异点选择启发式**：人为设定的优先级策略未必对所有 quad mesh 最优
- **未涵盖工业 mesh 评估**：未在 CAD 类 quad mesh (catmull-clark 输出) 上验证
- **无拓扑保证**：对最终生成的 mesh 是否 manifold 没有显式约束

---

## 与本知识库其他笔记的关系

- [[MeshGPT]] - 三角网格自回归生成（Q-MAGIC 的直接前置工作）
- [[QuadRemeshing]] - 通用 quad remeshing 基础
- [[Catmull-Clark Subdivision]] - quad 拓扑的根本来源
- [[Tokenization for 3D Shapes]] - 3D shape 的 token 化方法家族

---

## 实现建议

- **实现难度**: 高（需要自回归框架 + quad 拓扑理解）
- **依赖项**:
  - PyTorch + Transformer (Decoder-only 类似 MeshGPT)
  - 三角网格/Quad mesh 库 (`trimesh`, `gpytoolbox`, `wildmeshing`)
  - 训练数据：OBJ/PLY quad mesh 集合
- **可复用模块**:
  - `pymeshlab` 的 quad mesh 处理
  - `wildmeshing` 的 quad soup → manifold mesh 流水线
- **预期性能**: 单 quad mesh 生成 1-10 秒（依分辨率）
- **适用场景**:
  - CAD / 工程设计 quad mesh 自动生成
  - text-to-quad-mesh（如有 text conditioning 扩展）
  - 资产 quad retopology

---

## 🥬 可行性结论

✅ **推荐关注** — quad-only 自回归生成是 quad mesh 自动化的新范式。

- **学术价值**：把"next face prediction"从三角扩展到 quad，tokenization + serialization 都做了适配
- **工程价值**：subdivision surface 设计 chain 的上游自动化工具
- **下一步**：
  - 跟踪作者是否开源
  - 评估对 Catmull-Clark 控制 cage 自动生成的可用性（结合 [[SubDGuide-Mesh-to-SubD]] 做端到端 pipeline）
  - 集成到 libigl quad meshing pipeline

已传递给 @墨鱼丸 评估 quad mesh 生成集成可行性。
