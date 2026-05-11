---
type: paper
created: 2026-05-11
updated: 2026-05-11
tags: [intent-understanding, benchmark, fine-tuning, IFT]
status: processed
domain: LLM Evaluation
agent: youmaicai
source: https://arxiv.org/abs/2605.06832
---

# IntentGrasp: A Comprehensive Benchmark for Intent Understanding

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | IntentGrasp: A Comprehensive Benchmark for Intent Understanding |
| **作者** | Yuwei Yin |
| **发表** | arXiv 2026 (cs.CL) |
| **链接** | [原文](https://arxiv.org/abs/2605.06832) |
| **DOI** | 10.48550/arXiv.2605.06832 |
| **代码** | [GitHub](https://github.com/YuweiYin/IntentGrasp) |
| **数据** | [Hugging Face](https://huggingface.co/datasets/yuweiyin/IntentGrasp) |

---

## 核心贡献

> 提出 IntentGrasp 全面评估 LLM 意图理解能力。覆盖 49 个数据集、12 个领域、262,759 训练样本。发现当前模型性能不佳（All Set <60%, Gem Set <25%），并提出 Intentional Fine-Tuning (IFT) 显著提升性能。_

1. **全面 benchmark**: 源自 49 个高质量开源语料，跨越 12 个领域，包含 262,759 训练样本和 12,909 All Set 测试用例
2. **Gem Set 挑战集**: 更平衡、更具挑战性的 470 例子评估集
3. **性能揭示**: 20 个 LLM 在 Gem Set 上 17/20 低于随机基线 (15.2%)，人类估计表现 ~81.1%
4. **IFT 方法**: Intentional Fine-Tuning 在训练集上微调后，All Set 提升 30+ F1 points，Gem Set 提升 20+ points

---

## 技术方案

### Benchmark 构成

| 集合 | 规模 | 说明 |
|------|------|------|
| 训练集 | 262,759 | 用于 IFT |
| All Set | 12,909 | 完整测试集 |
| Gem Set | 470 | 平衡且更具挑战性 |

### 构建流程

1. **源数据集筛选**: 从 49 个高质量开源语料库中收集
2. **意图标签上下文化**: 对意图标签进行上下文丰富
3. **任务格式统一**: 统一不同来源的任务格式

### 测试模型 (20 LLMs, 7 families)

- 包括 GPT-5.4, Gemini-3.1-Pro, Claude-Opus-4.7 等前沿模型

---

## 实验结论

| 评估集 | 当前最优 | 随机基线 | 人类水平 |
|--------|---------|---------|---------|
| All Set | <60% | - | - |
| Gem Set | <25% | 15.2% | ~81.1% |

**IFT 效果**:
- All Set: +30+ F1 points
- Gem Set: +20+ points
- Lodo 实验证明强跨域泛化能力

---

## 局限性

- 主要基于英文数据集
- 特定领域的意图分类可能需要进一步验证

---

## 实现建议

- **实现难度**: 中（可用 IFT 微调提升意图理解）
- **预期性能**: 通过 IFT 可显著提升意图理解能力
- **适用场景**: AI 助手开发、对话系统、意图识别应用

---

## Tags

#intent-understanding #benchmark #fine-tuning #IFT #LLM-evaluation