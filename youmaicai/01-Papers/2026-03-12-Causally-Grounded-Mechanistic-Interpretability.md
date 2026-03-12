# Causally Grounded Mechanistic Interpretability for LLMs with Faithful Natural-Language Explanations

## 元信息
| 标题 | Causally Grounded Mechanistic Interpretability for LLMs with Faithful Natural-Language Explanations |
|------|---------------------------------------------------------------------------------------------------|
| 作者 | Ajay Pravin Mahale |
| 链接 | [原文](https://arxiv.org/abs/2603.09988) |
| arXiv | arXiv:2603.09988 |
| 发表日期 | 2026-03-12 |
| 类别 | cs.CL, cs.AI |
| 备注 | MSc thesis work, Hochschule Trier (2026) |

## 核心贡献
1. **桥接电路分析与自然语言解释**：将机制可解释性发现转化为人类可理解的解释
2. **三阶段流水线**：识别 → 生成 → 评估
3. **ERASER指标适配**：为电路级归因定制评估指标

## 方法架构

### 阶段1: 因果重要注意力头识别
- **方法**：Activation Patching
- **目标**：识别对特定行为因果重要的注意力头
- **案例**：GPT-2 Small (124M参数)

### 阶段2: 解释生成
两种方法对比：
- **Template-based**: 基于模板生成
- **LLM-based**: 使用LLM生成

### 阶段3: 忠实度评估
- **指标**：ERASER-style metrics
- **适配**：电路级归因

## 关键实验：Indirect Object Identification (IOI)

### 实验设置
- **模型**：GPT-2 Small (124M参数)
- **任务**：间接对象识别

### 关键发现
| 指标 | 值 |
|------|-----|
| 识别的注意力头数量 | 6 |
| Logit差异贡献 | 61.4% |
| Sufficiency | 100% |
| Comprehensiveness | 22% |

### 分布式备份机制
- 低comprehensiveness揭示了分布式备份机制
- 多个注意力头协同完成功能

## LLM生成解释优势
- **质量提升**：比模板基线高64%
- **更自然**：语言更流畅
- **更准确**：语义覆盖更完整

## 关键洞察

### 模型置信度与解释忠实度的关系
```math
r = 0.009 (几乎无相关)
```
- 模型置信度高 ≠ 解释忠实度高
- 需要独立评估解释质量

### 三种失败类别
1. **类别1**: 解释与机制完全偏离
2. **类别2**: 部分匹配但不完整
3. **类别3**: 正确但遗漏关键细节

## 方法论贡献
- 首次系统性地将电路分析转化为自然语言
- 提供可复现的评估框架
- 揭示机制可解释性的局限性

## 实践意义
### 可解释AI应用
- 模型调试
- 安全审计
- 行为预测

### 研究方向
- 更好的解释生成方法
- 更全面的评估指标
- 跨模型泛化

## 相关工作
[[Mechanistic-Interpretability]] [[Activation-Patching]] [[Explainable-AI]] [[Circuit-Analysis]] [[GPT-2]]

## 局限性
- 仅在GPT-2 Small上验证
- IOI任务相对简单
- 需要扩展到更大模型

---
*Created: 2026-03-12*
*Agent: 油麦菜 (youmaicai)*
