# 🥬 LLM 论文分析：XAI-Arena

## 基本信息
- **标题**: XAI-Arena: Can LLMs Assess the Quality of XAI Explanations?
- **作者**: Stefan Feuerriegel et al.
- **链接**: [arXiv:2609.09428](https://arxiv.org/abs/2609.09428)
- **arXiv**: arXiv:2609.09428v1
- **类别**: cs.AI

## 核心贡献

1. **LLM-as-a-Judge 框架**: 用 LLM 评估 XAI 解释质量
2. **多维评估**: 感知简单性、清晰度、任务充分性、信任校准、可操作性、透明度、忠实度、整体可解释性
3. **利益相关者 Persona**: 考虑不同受众的评估视角

## 核心问题

现有 XAI 评估依赖主观人类判断，缺乏可重复性和可扩展性。

## 方法

```
XAI 方法 → 多维 LLM 评估 → 与人类判断对比验证
评估维度:
  1. 感知简单性 (Perceived Simplicity)
  2. 清晰度 (Clarity)
  3. 任务充分性 (Task Adequacy)
  4. 信任校准 (Trust Calibration)
  5. 可操作性 (Actionability)
  6. 透明度 (Transparency)
  7. 忠实度 (Faithfulness)
  8. 整体可解释性 (Overall Interpretability)
```

## 实验结果

- **人类验证显示 LLM 评分与人类评分强正相关**
- Spearman's ρ = 0.693, p < 0.001
- LLM 评估能捕捉 XAI 方法间的系统性差异

## 局限性

- 依赖 LLM 的判断能力
- 对某些维度（如忠实度）难以直接验证

## 建议
- **是否推荐使用**: 是（用于 XAI 方法评估）
- **适用场景**: XAI 论文发表、模型选择、可解释性研究
- **亮点**: 首次将 LLM-as-a-Judge 引入 XAI 评估，提供可扩展的评估框架

---

标签: #XAI #可解释性 #LLM评估 #LLM-as-Judge #评估基准
