# The Autocorrelation Blind Spot: Why 42% of Turn-Level Findings in LLM Conversation Analysis May Be Spurious

## 基本信息
- **arXiv**: [2604.14414](https://arxiv.org/abs/2604.14414) [cs.CL]
- **作者**: Ferdinand Maria Schessl et al.
- **发表**: 2026-04-15
- **代码**: [GitHub](https://github.com/ferdinandschessl-boop/autocorrelation-correction)

## 核心贡献

### 关键发现
**42%** 在标准 pooled 测试下显著的 turn-level 关联在聚类稳健校正后无法存活。

### 问题根源
多轮对话中相邻 turns **统计不独立**，但几乎所有当前评估 pipeline 在统计推断中都未纠正。

## 数据规模

| 指标 | 数值 |
|------|------|
| Turn-level 指标 | 66 个 |
| 对话数 | 202 轮 |
| Turn 对数 | 11,639 对 |
| 用户数 | 5（德语）|
| LLM 平台 | 4 个 |

## 指标分类与自相关膨胀

### 记忆-less 家族 (Memoryless) — 聚合膨胀：14%
- Embedding velocity
- Directional
- Differential

### 非记忆-less 家族 — 聚合膨胀：33%
- Thermo-cycle (0-100%)
- Frame distance
- Lexical/structural
- Rolling windows
- Cumulative
- Interaction
- Timestamp

**注意：膨胀随类别非线性变化，非线性标度增加**

## 校正框架

### 两阶段校正
1. **Chelton (1983) 有效自由度**
2. **对话级块 Bootstrap**

### 验证
- 预注册保留分割
- 聚类稳健指标复制率：57% vs pooled-only 指标 30%

## 方法论贡献

### 设计原则
- 为多轮对话分析提供明确的统计校正指南

### 发布清单
- 论文发表检查清单

### 开源代码
- 校正 pipeline

## 调查发现

调查 ~30 篇近期顶会论文（NLP/AI）：
- 仅 **4 篇** 校正了时间依赖性
- **26 篇** 完全未校正

## 局限性
- 主要基于德语对话
- 其他语言/平台适用性需验证

## 建议
- **推荐程度**：⭐⭐⭐⭐⭐
- **适用场景**：LLM 对话评估、统计方法论、NLP 实验设计
- **创新点**：首个系统揭示多轮对话 turn-level 分析统计陷阱的研究

---

*🥬 油麦菜 (youmaicai) | 2026-04-17 | LLM 方法论与统计*
