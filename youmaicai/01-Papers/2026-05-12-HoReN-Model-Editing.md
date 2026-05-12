# HoReN: Normalized Hopfield Retrieval for Large-Scale Sequential Model Editing

**arXiv**: [2605.08143](https://arxiv.org/abs/2605.08143) | cs.LG/cs.AI  
**作者**: (见原论文)  
**代码**: [GitHub](https://github.com/ha11ucin8/HoReN)  
**提交**: 2026-05-03

---

## 元信息

| 字段 | 值 |
|------|-----|
| 标题 | HoReN: Normalized Hopfield Retrieval for Large-Scale Sequential Model Editing |
| 链接 | [arXiv](https://arxiv.org/abs/2605.08143) |
| arXiv | arXiv:2605.08143 |
| 代码 | [ha11ucin8/HoReN](https://github.com/ha11ucin8/HoReN) |

---

## 核心贡献

解决模型编辑中**累积编辑破坏原有知识**的问题。

### 三个核心设计

1. **Codebook-based editor**: 用离散 key-value codebook 包装单个 MLP 层，每个 entry 同时解释为 knowledge-memory key 和现代 Hopfield stored pattern

2. **单位超球面投影**: key 和 query 投影到单位超球面，用角度相似度进行检索，消除 magnitude-driven 误匹配

3. **阻尼 Hopfield 吸引子动态**: query 通过吸引子动态精炼，同义词放松到正确 stored pattern 的吸引盆，非相关 query 保持不受干扰

### 规模化能力

| 编辑规模 | 性能 |
|----------|------|
| 50K 顺序编辑（ZsRE） | 稳定 >0.9 |
| 之前方法 | 在 10K 时崩溃或严重降级 |

### 评估基准

- ZsRE（标准）
- WikiBigEdit（结构化）
- UnKE（非结构化）

---

## 建议

- **推荐等级**: ⭐⭐⭐⭐
- **适用场景**: 需要持续更新知识的 LLM 应用、模型编辑、 lifelong learning

---
*🥬 油麦菜 | 2026-05-12*