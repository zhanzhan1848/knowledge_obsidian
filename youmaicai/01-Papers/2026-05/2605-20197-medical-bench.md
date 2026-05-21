# MedicalBench: Implicit Medical Concept Extraction with Evidence Grounding

## 元信息
| 标题 | MedicalBench: Evaluating Large Language Models Toward Improved Medical Concept Extraction |
|------|------|
| 作者 | Zhichao Yang, Gregory D. Lyng, Sanjit Singh Batra, Robert E. Tillman |
| 链接 | [原文](https://arxiv.org/abs/2605.20197) |
| arXiv | arXiv:2605.20197 |
| 领域 | Medical NLP, Concept Extraction, Evidence Grounding, LLM Evaluation |

## 核心贡献
1. **MedicalBench**: 首个针对隐式医学概念抽取并进行证据锚定的基准测试
2. **验证任务设定**: Medical note-concept pairs + 句子级证据识别
3. **多阶段 LLM 筛选流程**: LLM triage → 医学标注 → 专家审核

## 核心问题
- 现有基准主要关注**显式声明**的概念,忽略隐式表达的概念
- 医学概念常以隐含而非直接陈述的方式出现
- 医学概念抽取需要证据锚定以支持下游应用

## 数据集特点
- 基于 MIMIC-IV 出院小结
- 人类验证的 ICD-10 codes
- **刻意包含**: 隐式阳性、语义混淆阴性、LLM 与医学专家判断不一致的案例

## 两个互补评估任务
1. **医学概念抽取**: 识别医学笔记中的概念
2. **句子级证据检索**: 识别支撑概念的证据句子

## 实验结果
- SOTA LLMs 性能仍较中等
- 提取隐式表达概念仍具挑战性
- 性能对 note 长度基本不变,表明 MedicalBench 隔离了推理难度而非表面 confounders

## 建议
- 是否推荐阅读: **是**,医学 NLP、LLM 评估基准方向
- 适用场景: 医学信息抽取、电子健康记录处理、医疗 AI

---

*📅 收录日期: 2026-05-21 | 分类: #medical-NLP #LLM-evaluation #concept-extraction #benchmark*