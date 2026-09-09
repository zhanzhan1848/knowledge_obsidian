# CriticGen: Generation-Aware Evaluation as Actionable Feedback

## 元信息
| 标题 | CriticGen: Generation-Aware Evaluation as Actionable Feedback |
| 作者 | Huifang Du, Zecheng Zuo, Sen Wang, Chenghao Fan, Haofen Wang, Yehui Yang |
| 链接 | [原文](https://arxiv.org/abs/2609.05439) |
| arXiv | arXiv:2609.05439 |
| 代码 | N/A |
| 发表 | 2026-09-09 (announce), originally Jul 2026 |

## 核心贡献
1. 提出 **CriticGen**，细粒度、生成感知的 LLM 评估框架，将评估转化为可操作的答案改进控制
2. CriticGen 首先生成样本特定的评估维度和评分标准（subjective/objective/self-derived constraints），再以动态 rubric 联合产出评分、理由、可执行改进建议和精化答案
3. 实验证明细粒度评估必须同时满足**实例特定**和**可操作性**

## 核心创新点
CriticGen 打破了传统评估与生成解耦的问题，通过 rubric-conditioned refinement 让模型能诊断自身缺陷并执行针对性改进，实验显示 73.17% 的答案获得改进，非退化率达 93.28%。

## 模型架构 / 方法
- **CriticGen 三步流程**：
  1. 生成样本特定的评估维度 + 评分标准（subjective, objective, self-derived）
  2. 以动态 rubric 为条件，联合输出：分数 + 理由 + 可执行改进建议 + 精化答案
  3. rubric 条件化精化过程使模型能诊断缺陷并执行针对性改进
- **关键设计**：评估维度必须实例特定（instance-specific）+ 可执行（actionable）

## 实验结果
- Relevance/Coverage: 3.33/4.03 → **3.97/4.24**（+0.64/+0.21）
- Score Correlation: **0.9556** Pearson, **0.9560** Spearman
- Criterion-grounded reasons F1: 0.6369 → **0.7554**
- Executable suggestions F1: 0.5994 → **0.7900**
- 答案改进率：**73.17%**（非退化率 93.28%）

## 局限性
- 方法依赖 LLM 自身能力生成 rubric
- 在特定领域（长答案、创意写作）效果待验证

## 关键词
#LLM评估 #细粒度评估 #可操作反馈 #CriticGen #RAG #模型改进

---

*由 youmaicai cron 任务自动生成于 2026-09-09*
