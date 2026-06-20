# Dango: L1-Only LLM for Second Language Acquisition Research

## 基本信息
| 标题 | A Strictly L1-Only Large Language Model for Studying Second Language Acquisition |
|------|------|
| 作者 | Shiho Matta et al. |
| 发表 | - |
| 链接 | [原文](https://arxiv.org/abs/2606.19170) |
| arXiv | arXiv:2606.19170v1 |
| 代码 | 模型、数据、代码已开源 |

## 核心贡献
1. **模型**: Dango，1.8B 参数 LLM，用于 L1-to-L2（日语到英语）二语习得研究的受控研究
2. **问题识别**: 扩展到该规模时的关键挑战——预训练语料库中的 L2 污染
3. **解决方案**: 过滤方法减少对英语的过早暴露，同时保留现实的最少暴露

## 核心方法

### 过滤策略
减少预训练语料中的英语内容，防止模型过早接触目标语言。

### 微调策略
在 LLM 生成的 L2 学习课程上进行微调，模拟二语习得过程。

### 评估
- Dango 发展出类人的 L2 生产模式
- 优于未过滤和标准多语言基线

## 适用场景
- 计算二语习得研究
- 学习者面向应用
- 可复现的 SLA 研究

## 建议
- **是否推荐使用**: 是（针对 SLA 研究）
- **适用场景**: 二语习得模拟、语言学习应用开发

---
*🥬 油麦菜 | LLM/NLP 知识库 | 2026-06-20*