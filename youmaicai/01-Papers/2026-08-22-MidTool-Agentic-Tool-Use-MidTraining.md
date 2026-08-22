---
type: paper
created: 2026-08-22
updated: 2026-08-22
tags: [mid-training, tool-use, agent, llm]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2608.20314
---

# MidTool: Mid-training Data Synthesis for Agentic Tool Use

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | MidTool: Mid-training Data Synthesis for Agentic Tool Use |
| **作者** | Fengqing Jiang, Yite Wang, Boyi Liu, Zhaoyang Wang, Canwen Xu, Zhewei Yao, Radha Poovendran, Yuxiong He |
| **发表** | arXiv 2026 |
| **链接** | [原文](https://arxiv.org/abs/2608.20314) |
| **arXiv** | arXiv:2608.20314 |
| **代码/数据** | https://hf.co/collections/MidTool/midtool-release |

---

## 核心贡献

> 提出首个开源的工具使用中训练（mid-training）数据和生成管道 MidTool，揭示工具使用能力应在后训练前通过中训练建立基础。

1. **首个开源工具使用中训练管道**：填补通用工具使用中训练数据的空白
2. **MidTool-Mix 数据集**：20.3B token，结合 Web、PDF、代码和工具工件
3. **能力边界发现**：通用工具迁移有效，深度搜索类探索行为提升有限

---

## 技术方案

### 中训练流程

```
Stage 1: 数据收集（Web/PDF/Code/Tool APIs + MCP Skills）
    ↓
Stage 2: 预处理（多阶段过滤、启发式规则、SHA-256 + MinHash LSH 去重）
    ↓
Stage 3: 智能体轨迹合成
    ├─ Branch 1: Context-grounded Trajectory Augmentation（文档→工具识别、参数推断）
    └─ Branch 2: Native Agentic Trajectory Synthesis（API/MCP→可执行轨迹）
```

### 训练配置

| 阶段 | 硬件 | 关键超参数 |
|------|------|-----------|
| 中训练 | 32× H200 | lr=3×10⁻⁵, seq_len=8192, WSD 调度 |
| SFT | 32× H200 | lr=2×10⁻⁵, seq_len=32768, cosine |
| RL | 8× B200 | GRPO, 64 steps, KL=0.001 |

---

## 实验结论

- **数据集**: BFCLv3, τ²-Bench, MCP Universe
- **模型**: Qwen3-4B-Base, Qwen3-8B-Base
- **结果**:
  - BFCLv3 Overall: 39.73% → 54.18% (+14.45 points)
  - τ²-Bench Pass@1: 8.54% → 21.31% (+12.77 points)
  - MCP-Universe Pass: 1.68% → 10.06% (+8.38 points)
  - 多轮设置下提升最显著（4B 多轮平均 +10 points）

---

## 局限性

1. **深度搜索能力不足**：Web Search 子集始终为 0%
2. **能力边界明确**：通用工具使用可迁移，但深度探索需要专门数据
3. **领域特定工具覆盖有限**：长尾工具可能未被充分覆盖

---

## 实现建议

- **实现难度**: 高（需构建大规模轨迹合成管道）
- **预期性能**: 工具调用准确性和多轮对话能力显著提升
- **适用场景**: 通用 AI 助手、代码执行代理、API 集成

---

## 相关工作

- [[Tool Learning]] - 工具学习
- [[Agent Training]] - 智能体训练
- [[Mid-training]] - 中训练策略
