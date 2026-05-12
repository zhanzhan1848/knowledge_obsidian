# Weight Pruning Amplifies Bias: A Multi-Method Study of Compressed LLMs for Edge AI

**arXiv**: [2605.08137](https://arxiv.org/abs/2605.08137) | cs.LG  
**会议**: AIIoT 2026  
**作者**: (见原论文)

---

## 元信息

| 字段 | 值 |
|------|-----|
| 标题 | Weight Pruning Amplifies Bias: A Multi-Method Study of Compressed LLMs for Edge AI |
| 链接 | [arXiv](https://arxiv.org/abs/2605.08137) |
| arXiv | arXiv:2605.08137 |
| 发表 | IEEE Xplore (AIIoT 2026) |

---

## 核心贡献

首次系统研究权重剪枝对大语言模型公平性的影响，通过大规模对照实验揭示「聪明剪枝悖论」。

## 实验设计

| 因素 | 详情 |
|------|------|
| 模型 | Gemma-2-9b-it, Mistral-7B-Instruct-v0.3, Phi-3.5-mini-instruct |
| 剪枝方法 | Random, Magnitude, Wanda |
| 稀疏度 | 10%, 30%, 50%, 70% |
| 基准 | BBQ bias benchmark (12,148 项) |
| 种子数 | 5 |
| 总推理记录 | 2,368,860 |

---

## 关键发现

### 1. Smart Pruning Paradox

**Wanda（激活感知剪枝）**:
- 几乎完美保持困惑度（50% 稀疏度下 Mistral-7B 困惑度仅增 3.5%）
- 但产生最高的偏见放大
- Stereotype Reliance Score 增加 **83.7%**
- 70% 稀疏度下，**47-59%** 原本无偏项产生新刻板行为

**Random 剪枝**:
- 完全破坏语言能力（困惑度达 10^8）
- 但偏见仅为随机机会水平

### 2. 实际部署问题

- 非结构化剪枝在真实边缘硬件上 **零存储节省** 和 **零推理延迟降低**
- 完全颠覆其在 IoT 部署中的主要动机

### 3. 量化对比

| 比较 | 翻转率 |
|------|--------|
| 量化研究（已发表） | ~21% 响应在偏/无偏间翻转 |
| 本研究剪枝结果 | **47-59%**（约 3 倍） |

→ **剪枝对对齐的风险高于量化**

### 4. 统计显著性

- 180 个 dense-vs-pruned 比较中，**141 个（78.3%）** 显著（p < 0.05）
- 平均效应量 |h| = 0.305

---

## 核心警示

> **困惑度评估提供虚假的行为等效性保证。IoT 部署前需要偏见感知验证。**

「perplexity 看起来没变」≠ 「行为没变」

---

## 建议

- **推荐等级**: ⭐⭐⭐⭐⭐
- **必读原因**: 首个系统性揭示剪枝-偏见权衡的研究，对 LLM 压缩部署有直接安全指导意义
- **适用场景**: 
  - IoT/边缘 AI 部署
  - 模型压缩研究
  - 对齐与安全评估

---
*🥬 油麦菜 | 2026-05-12*