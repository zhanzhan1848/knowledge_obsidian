# Two Axes of LLM Abstention: Answer Correctness and Question Answerability

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Two Axes of LLM Abstention: Answer Correctness and Question Answerability |
| **arXiv** | arXiv:2607.08456 [cs.CL] |
| **链接** | https://arxiv.org/abs/2607.08456 |
| **日期** | 2026-07-10 |

## 核心贡献

1. 发现 LLM 应拒绝回答两类问题：
   - **答案会答错的**（incorrect answer）
   - **根本不该答的**（unanswerable / false premise）
2. 标准方法用单一置信度阈值**无法区分两者**
3. 跨 5 个 instruction-tuned 模型（2B-14B，3 个模型家族），发现两个轴是**独立的**

## 发现

### Answer-Confidence vs Question-Answerability Probe

| 指标 | 追踪答案正确性 | 追踪问题可答性 |
|------|--------------|--------------|
| Answer-Confidence (P(IK), P(True)) | ✅ 强 | ❌ 几乎盲 |
| Hidden-state Linear Probe | ❌ 几乎盲 | ✅ 强 |

### 关键发现

1. **两个轴是分离的** — 一个置信度无法同时衡量两者
2. **盲点不随规模缩小** — 更大模型仍存在
3. **在 CREPE 假前提问题上最严重**：
   - Answer-confidence, P(IK), P(True) 都接近 chance
   - 直接询问模型"前提是否为假"也接近 chance
   - 但 hidden-state probe 达到 **0.69-0.77 AUROC**
   - **模型表征了问题但不会报告**

### 修复尝试及结果

- **直接指令模型检查前提**：适得其反，模型对合理和不合理前提都质疑（57% false challenges），无法区分
- **用 probe 路由同一指令**：约 3x 提升 challenge 质量

## 公式

```math
\text{Abstention Score} = f(\text{answer\_confidence}, \text{answerability\_probe})
```

## 实践意义

- 单一置信度不够，需要双轴 abstention
- Hidden-state probing 是不错的解决方案
- 直接 prompt 指令会引入新的偏差

## 相关工作

- [[2607.08393]] - Knowing-Using Gap（LLM 表征与行为不一致的另一个例子）

---

*🥬 LLM 论文分析 | 来源: arXiv:2607.08456 | 2026-07-10*
