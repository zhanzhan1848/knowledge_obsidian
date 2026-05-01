# Fidelity, Diversity, and Privacy: A Multi-Dimensional LLM Evaluation for Clinical Data Augmentation

## 基本信息
| 标题 | 值 |
|------|-----|
| 作者 | Guillermo Iglesias, Gema Bello-Orgaz, et al. |
| 链接 | [原文](https://arxiv.org/abs/2604.27014) |
| arXiv | arXiv:2604.27014 |

## 核心贡献
1. 研究使用 LLM 生成合成精神健康评估报告，用于临床数据增强
2. 提出**三维度评估框架**：语义保真度、词汇多样性、隐私/抄袭
3. 评估 DeepSeek-R1、OpenBioLLM-Llama3、Qwen 3.5 三个模型

## 背景

### 问题
- 高质量标注医疗数据稀缺（尤其精神健康领域）
- 隐私法规限制数据共享
- 合成数据生成成为有前景的替代方案

### 风险
- 朴素文本生成可能导致模式崩溃
- 可能存在隐私泄露（记忆化）

## 方法

### 数据生成
- 条件于特定 ICD-10 代码生成合成精神健康评估报告
- 使用模型：DeepSeek-R1, OpenBioLLM-Llama3, Qwen 3.5

### 三维度评估

| 维度 | 描述 |
|------|------|
| 语义保真度 | 生成的文本在临床意义上是否准确 |
| 词汇多样性 | 生成文本的词汇丰富程度 |
| 隐私/抄袭 | 是否存在隐私泄露或文本重复 |

## 实验结果

### 结论
- 所有模型都能生成**临床一致**、**多样**、**隐私安全**的合成报告
- 显著扩展了临床 NLP 任务的可用训练数据
- 不损害患者机密性

## 建议
- **是否推荐使用**: 是（针对临床 NLP 数据增强场景）
- **适用场景**: 医疗 NLP、临床数据增强、精神健康 AI

---
标签: LLM, clinical NLP, data augmentation, privacy, medical AI