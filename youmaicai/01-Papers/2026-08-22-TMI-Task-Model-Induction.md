---
type: paper
created: 2026-08-22
updated: 2026-08-22
tags: [task-model, computer-use, trajectory-learning, agent]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2608.20319
---

# Inducing Task Models from Computer-Use Traces

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Inducing Task Models from Computer-Use Traces |
| **作者** | Yucheng Jiang, Zora Zhiruo Wang, Ruishi Chen, Diyi Yang |
| **发表** | arXiv 2026 |
| **链接** | [原文](https://arxiv.org/abs/2608.20319) |
| **arXiv** | arXiv:2608.20319 |

---

## 核心贡献

> 提出任务模型归纳（TMI），首次从未标注的计算机使用轨迹中同时发现潜在任务并构建结构化任务模型（目标模型 + 过程模型），实现工作知识的可审计和可复用表示。

1. **任务模型表示**：将工作知识表示为（目标模型，过程模型）对，前者捕获"为什么"，后者捕获"怎么做"
2. **交错任务恢复**：能够处理非连续的任务活动（如任务A→任务B→任务A）
3. **下游迁移验证**：TMI 任务模型生成的技能相比基线提升 30% 留出任务准确率

---

## 技术方案

### TMI 三阶段框架

**Stage 1: 事件落地与活动分割**
- VLM 将原始事件（如 `click(1900.8, 29.5)`）与截图配对推理语义
- 活动分割为语义动作和活动两层抽象

**Stage 2: 潜在任务归纳**
- 增量分配活动到任务，维护摘要和引用标识符
- 处理多线程：活动被处理时与现有任务比较

**Stage 3: 任务模型构建**
- **目标模型**：递归分解目标为子目标，叶子节点对应观察到的活动
- **过程模型**：使用 SEQ/FOR/WHILE 操作符表达控制流

---

## 实验结论

- **数据集**: 受控人类和智能体轨迹
- **内在评估**:
  - 任务归纳 ARI：**0.974**
  - 任务数预测 MAE：**0.48**
  - 步骤描述准确率：**74.9%** vs 基线 30.3%
- **外在评估（SkillLearnBench）**:
  - 无技能基线：8.57%
  - TMI 任务模型：**18.57%**（相对提升 **30.0%**）

---

## 局限性

1. **隐私问题**：截图和键盘事件可能含个人信息
2. **数据脱敏影响未知**：未研究脱敏对归纳质量的影响
3. **领域覆盖有限**：主要针对桌面计算机使用场景

---

## 实现建议

- **实现难度**: 高（需构建 VLM 事件理解系统）
- **预期性能**: 工作流知识提取准确率 75%+
- **适用场景**: 流程挖掘、代理技能自动化、审计追踪

---

## 相关工作

- [[Workflow Mining]] - 工作流挖掘
- [[Agent Skill Learning]] - 智能体技能学习
- [[Trajectory Modeling]] - 轨迹建模
