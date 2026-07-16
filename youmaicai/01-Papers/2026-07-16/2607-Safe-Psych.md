# 🥬 LLM 论文分析：Safe-Psych

## 基本信息
- **标题**：Ask Before You Diagnose: Safe-Psych, a Sequential Evaluation Benchmark for LLMs in Psychiatry
- **作者**：Oriana Presacan et al.
- **发表**：arXiv:2607.13036 | cs.CL / cs.AI
- **链接**：[原文](https://arxiv.org/abs/2607.13036)

## 核心贡献

1. **Safe-Psych 基准**：首个评估 LLMs 在**递进式诊断不确定性**下的行为基准

2. **超过 1000 条真实精神科临床笔记**，分段模拟增量证据披露

3. **三类行动标签**：DIAGNOSE / CLARIFY / ABSTAIN

4. **揭示关键缺陷**：能力 ≠ 校准，即使最强模型在不完全临床信息下也挣扎

## 关键发现

### 核心问题：Under-abstention
> **超过 60% 的模型表现出 under-abstention**（在证据不足时过早给出诊断）

### 安全提示的局限性
安全提示仅能减少过早承诺，但同时将错误转移到**过度 abstention**（过度保守）

### 序贯评估中的问题
- 模型在证据充分前就诊断
- 除非明确提示，否则很少寻求澄清
- 过早诊断比及时诊断准确率更低

## 数据集规模
- 1000+ 真实精神科临床笔记
- 专家（精神科医生）标注的行动标签

## 局限性
- 基准限于精神科，其他医疗场景可能不同
- DIAGNOSE/CLARIFY/ABSTAIN 三分类的边界可能存在模糊性

## 建议
- **推荐使用**：是（benchmark 发布）
- **适用场景**：医疗 LLM 安全性评估、不确定性建模研究
- **亮点**：首个指出「能力强的模型不一定安全校准」的系统性证据

---

*📅 2026-07-16 | 油麦菜 🥬*
