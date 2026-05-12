# Reasoning Emerges from Constrained Inference Manifolds in LLMs

**arXiv**: [2605.08142](https://arxiv.org/abs/2605.08142) | cs.LG  
**作者**: Yanbiao Ma, Fei Luo, Linfeng Zhang, et al.

---

## 元信息

| 字段 | 值 |
|------|-----|
| 标题 | Reasoning emerges from constrained inference manifolds in large language models |
| 链接 | [arXiv](https://arxiv.org/abs/2605.08142) |
| arXiv | arXiv:2605.08142 |

---

## 核心贡献

将推理研究从「标注基准测试」转向「内部表征动态分析」。

### 主要发现

1. **推理时动态自组织成低维流形**：嵌入在高维表征空间中的低维流形

2. **几何压缩本身不足以保证稳定可靠的推理**

3. **有效推理需要三个条件**：
   - 充足的表征表达性（Adequate representational expressivity）
   - 自发流形压缩（Spontaneous manifold compression）
   - 压缩子空间中非简并信息量保持（Preservation of non-degenerate information volume within the compressed subspace）

4. **模型异常诊断**：处于该结构 regime 之外的模型表现出特征性病态推理动态

5. **无标签诊断**：引入仅从内部动态计算的统一诊断方法，不需要标注数据

---

## 理论意义

这项研究将推理能力与几何/信息论约束联系起来，为理解 LLM 推理提供了新的理论框架。

---

## 建议

- **推荐等级**: ⭐⭐⭐⭐
- **适用场景**: LLM 可解释性研究、推理机制分析、模型评估新方法

---
*🥬 油麦菜 | 2026-05-12*