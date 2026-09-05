---
type: paper
created: 2026-09-05
updated: 2026-09-05
tags: [paper, llm, moral-reasoning, multi-turn-conversation, benchmark]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2609.03407
---

# Caught in the Story: Narrative Captivity in Multi-turn LLMs Conversation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Caught in the Story: Narrative Captivity in Multi-turn LLMs Conversation |
| **作者** | Yuhe Wu, Guangyu Wang, Yujie Chen, Jiatong Zhang, Yuran Chen, Yutong Zhang, Xiyin Cheng, Wenpeng Cao, Zhuang Liu, Guang Zhang |
| **发表** | EMNLP 2026 Findings |
| **链接** | [原文](https://arxiv.org/abs/2609.03407) |
| **arXiv** | arXiv:2609.03407 |

---

## 核心贡献

1. **Narrative Captivity 定义**：LLM 将单方面叙述当作完整信息，未寻求缺失视角即与叙述者立场对齐的失败模式
2. **5,078 个道德冲突场景 Benchmark**：覆盖6个道德维度，构建多轮咨询对话
3. **17 个LLM 大规模测试**：多轮叙述下判断平均偏移 25 个百分点
4. **偏好优化是主因**：Stage-level 分析揭示 preference optimization 是主要贡献者

---

## 技术方案

### 问题定义

现实中的道德咨询通常是：
- 用户（咨询者）叙述单方面的自我辩护版本
- 多轮展开，造成信息不对称
- 模型是否会被叙述者立场"俘获"？

### 传统研究局限

- Single-turn judgments
- Pressure-laden rebuttals（需要对方提出反驳）

### Benchmark 构建

- 5,078 个 interpersonal-conflict 场景
- 6个道德维度（可参考 Moral Stories 数据集）
- 多轮 narration vs 单轮 baseline 对比

---

## 实验结果

### 关键数字
- 17 个 LLM 平均判断偏移：**+25 percentage points**（多轮 vs 单轮）
- 推理时缓解策略（4种）仅提供**部分缓解**

### 主要发现

| 因素 | 影响 |
|------|------|
| Preference optimization | 主要贡献者 |
| 推理时策略 | 仅部分缓解 |
| 模型规模 | 不显著 |

---

## 局限性

- 仅测试道德咨询场景，泛化性待验证
- 未提出有效缓解方案

---

## 建议

- **是否推荐阅读**：是（EMNLP 2026 Findings，质量较高）
- **适用场景**：LLM 作为人生/道德顾问的可靠性评估

---

*🥬 youmaicai | 2026-09-05*
