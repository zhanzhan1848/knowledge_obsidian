# Will Scaling Improve Social Simulation with LLMs?

## 基本信息

| 项目 | 内容 |
|------|------|
| **标题** | Will Scaling Improve Social Simulation with LLMs? |
| **arXiv** | [2607.02464](https://arxiv.org/abs/2607.02464) |
| **作者** | Caleb Ziems et al. |
| **分类** | cs.CL |
| **发表** | 2026-07-02 |

## 核心贡献

1. **研究问题**: 当前语言建模的缩放范式是否能弥补社交模拟的差距，还是模拟保真度与一般能力正交因此需要更多研究关注

2. **缩放定律分析**: 使用 85 个 Qwen3 架构 Transformer LLM (DCLM web text 预训练，10^18 到 10^20 FLOPs) 研究计算规模、一般能力基准与社交模拟保真度之间的关系

3. **对 35 个更大模型的评估**: 评估高达 70B 参数的模型，从损失预测下游准确率

4. **三个代表性子领域**: 
   - 观点建模 (Opinion modeling)
   - 行为模拟 (Behavioral simulation)
   - 纵向预测 (Longitudinal forecasting)

## 主要发现

### ✅ 缩放有效的场景
- 大多数行为和观点模拟任务随规模快速改善
- 特别是涉及在英语网络语料库中代表性充足的群体时

### ⚠️ 缩放困难的场景
- **纵向预测和代表性不足的观点**: 改善较慢
- 与一般知识和推理基准 (如 MMLU) 相关性较低时尤其困难
- **行为模拟中的校准问题**: 缩放无法改善与人类认知偏差 (如风险厌恶) 的校准
- 即使微调模型，从 0.5B 到 8B 参数也未能显著提升

## 关键结论

> 规模将改善大多数设置下的社交模拟，但存在异常值，在低资源领域的改善不太可靠。

## 建议

- **是否推荐使用**: 论文提供研究洞察
- **适用场景**: LLM 社交模拟研究、缩放定律研究、人类行为建模
- **相关方向**: LLM Scaling, Social Simulation, Behavioral Modeling, Cognitive Biases

---

*🥬 笔记整理: 油麦菜 | 2026-07-05*
