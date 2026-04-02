# 🥬 CrossTrace: 科学推理轨迹与假设生成数据集

> **日期**: 2026-04-02
> **RSS来源**: cs.CL (arXiv:2603.28924)
> **原始链接**: [arXiv:2603.28924](https://arxiv.org/abs/2603.28924)

---

## 元信息

| 标题 | 值 |
|------|-----|
| 标题 | CrossTrace: A Cross-Domain Dataset of Grounded Scientific Reasoning Traces for Hypothesis Generation |
| 作者 | Andrew Bouras, OMS-II Research Fellow |
| 类别 | cs.CL |
| arXiv | arXiv:2603.28924v1 |
| 提交 | 2026-03-30 |

---

## 核心贡献

1. **CrossTrace 数据集**: 1,389 条跨领域 grounded 科学推理轨迹，涵盖：
   - 生物医学研究 (518)
   - AI/ML (605)
   - 跨领域工作 (266)

2. **结构化推理链**: 从已有知识 → 中间逻辑步骤 → 创新假设，每步都有源论文文本 grounding

3. **Input/Trace/Output Schema**: 扩展了 Bit-Flip-Spark 框架，包含：
   - 步级验证
   - 8 种发现模式分类学
   - 多领域覆盖

4. **Qwen2.5-7B-Instruct 微调**: 通过 QLoRA 在 CrossTrace 上微调

---

## 微调效果

| 指标 | 基线 | 微调后 |
|------|------|--------|
| IAScore (GPT-4o judge) | 0.828 | **0.968** |
| IAScore (Claude Opus 4.5) | 0.716 | **0.888** |
| Structural Compliance | 0% | **100%** |
| Spark Cosine Similarity | 0.221 | **0.620** |

---

## 关键发现

1. **领域转移有效**: 平衡的跨领域训练（生物医学 + AI/ML + CS）优于单一领域训练，证明科学推理模式可跨领域迁移

2. **步级 grounding 准确**: 150 条分层记录人工验证确认 **99.7%** 步级 grounding 准确率，**0.0%** 伪造率

3. **首个大规模跨领域数据集**: CrossTrace 是首个具有步级 grounded 推理轨迹的大规模跨领域假设生成数据集

---

## 局限性

- 仅覆盖三个领域
- 假设新颖性评估仍有主观性

---

## 建议

- **推荐程度**: ⭐⭐⭐⭐ (强烈推荐)
- **适用场景**: 科学推理、科学假设生成、科学发现、LLM reasoning
- **相关方向**: 科学 AI、假设生成、Chain-of-Thought、RAG、科学发现

---

*CrossTrace 为科学假设生成提供了高质量的训练数据和评估基准，对 AI for Science 有重要价值。*
