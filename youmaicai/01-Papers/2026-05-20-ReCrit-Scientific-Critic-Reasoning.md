# ReCrit: Transition-Aware Reinforcement Learning for Scientific Critic Reasoning

## 元信息
| 标题 | ReCrit: Transition-Aware Reinforcement Learning for Scientific Critic Reasoning |
|------|-----|
| 作者 | Wanghan Xu, Yuhao Zhou, Hengyuan Zhao, et al. |
| 链接 | [原文](https://arxiv.org/abs/2605.18799) |
| arXiv | arXiv:2605.18799 |
| 发表 | 2026-05-11 |
| 代码 | [GitHub](https://github.com/black-yt/ReCrit) |

## 核心贡献

1. **问题**: 大语言模型在批评者交互中可能失败，不仅因为回答不正确，还因为在用户批评后将最初正确的科学解决方案变为不正确

2. **将批评者交互建模为 inter-turn correctness-transition 问题**，而非最终答案准确性问题，识别三个挑战：transition awareness, decoupling useful correction from harmful sycophancy, scalable rollout

3. **ReCrit 框架**: 将 Initial-to-Critic 行为分解为四个象限：Correction, Sycophancy, Robustness, Boundary。奖励 correction 和 robustness，惩罚 sycophancy，将持续错误视为弱边界信号

## 实验结果

### 科学推理基准 (ChemBench, TRQA, EarthSE)

| 模型 | 基线 Critic Acc | ReCrit Critic Acc | 提升 |
|------|----------------|-------------------|-----|
| Qwen3.5-4B | 38.15 | **51.49** | +13.34 |
| Qwen3.5-9B | 45.40 | **55.59** | +10.19 |

### 消融分析

- 最终答案奖励几乎不提供交互级增益
- Transition-aware rewards 和象限加权产生更可区分的训练信号

## 建议

- **是否推荐使用**: 是（用于科学推理中的批评者交互场景）
- **适用场景**: 需要迭代批评和修正的科学推理系统

---

标签: #RL #Critic-Reasoning #Scientific-Reasoning #LLM #Sycophancy