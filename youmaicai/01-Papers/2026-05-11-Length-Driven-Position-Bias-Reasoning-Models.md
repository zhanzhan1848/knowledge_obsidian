---
type: paper
created: 2026-05-11
updated: 2026-05-11
tags: [reasoning, position-bias, chain-of-thought]
status: processed
domain: LLM Reasoning
agent: youmaicai
source: https://arxiv.org/abs/2605.06672
---

# More Thinking, More Bias: Length-Driven Position Bias in Reasoning Models

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | More Thinking, More Bias: Length-Driven Position Bias in Reasoning Models |
| **作者** | Xiao Wang |
| **发表** | arXiv 2026 (cs.AI) |
| **链接** | [原文](https://arxiv.org/abs/2605.06672) |
| **DOI** | 10.48550/arXiv.2605.06672 |
| **代码** | - |

---

## 核心贡献

> _chain-of-thought (CoT) reasoning 和 reasoning-tuned 模型（如 DeepSeek-R1）被认为能减少浅层启发式偏差，但本论文发现推理轨迹长度与位置偏差之间存在显著正相关。_

1. **发现长度驱动的位置偏差**: 在 13 种推理模式配置中，12 种显示推理轨迹长度与 Position Bias Score (PBS) 显著正相关 (r: 0.11-0.41, p < 0.05)
2. **因果证据**: 截断干预实验表明，从轨迹后期恢复的续写更倾向于位置偏好选项（R1-Qwen-7B 在绝对位置桶间从 16% 升至 32%）
3. **双偏差机制**: 直接回答模式的位置偏差与 CoT 推理模式下的长度累积偏差是两种截然不同的现象

---

## 技术方案

### 核心思想

_chain-of-thought reasoning 并不能消除位置偏差，而是将其从直接偏差转化为长度累积偏差。推理越长，位置偏差越明显。_

### 实验设置

- **测试配置**: 2 个 R1-distilled 7-8B 模型 + 2 个 base 模型 + DeepSeek-R1 671B
- **基准测试**: MMLU, ARC-Challenge, GPQA
- **关键指标**: Position Bias Score (PBS), commitment change point, effective switching, truncation probes

### 主要发现

| 模型 | PBS vs 轨迹长度相关性 |
|------|---------------------|
| R1-distilled 7-8B | r = 0.11-0.41 (正相关, p<0.05) |
| DeepSeek-R1 671B | 聚合 PBS=0.019，但最长四分位数 PBS=0.071 |

---

## 实验结论

- CoT 推理替换了基线偏差（直接回答时的位置偏好），将其转化为长度累积偏差
- 准确率会掩盖而非消除长度驱动的偏差机制
- 推理模型在 MCQ 评估中不应默认被视为顺序鲁棒的
- 提供了诊断工具包 (PBS, commitment change point, effective switching, truncation probes) 用于审计推理模型中的位置偏差

---

## 局限性

- 仅测试多选题场景，开放性问题的结论待验证
- 671B 大模型仍存在长度效应（虽然被准确率压制）
- 未探索缓解策略

---

## 实现建议

- **实现难度**: 低（评估框架，不涉及模型训练）
- **预期性能**: 适用于检测推理模型的位置偏差
- **适用场景**: 推理模型评估、MCQ 评估流程优化

---

## Tags

#reasoning #position-bias #chain-of-thought #DeepSeek-R1 #evaluation