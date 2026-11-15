---
title: "Do Large Language Models Show Racial and Sex Bias in Pain Management? A Counterfactual Audit of GPT, Claude, Gemini, Llama, DeepSeek and Qwen"
authors: ["Richard J. Young", "Alice M. Matthews"]
date: "2026-11-13"
arxiv: "2611.14935"
arxiv_url: "https://arxiv.org/abs/2611.14935"
pdf_url: "https://arxiv.org/pdf/2611.14935"
categories: ["cs.CL", "cs.AI", "cs.CY"]
tags: ["bias-audit", "clinical-nlp", "fairness", "counterfactual-audit", "llm-evaluation"]
venue: ""
status: "已读"
---

# Do Large Language Models Show Racial and Sex Bias in Pain Management? A Counterfactual Audit of GPT, Claude, Gemini, Llama, DeepSeek and Qwen

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Do Large Language Models Show Racial and Sex Bias in Pain Management? A Counterfactual Audit of GPT, Claude, Gemini, Llama, DeepSeek and Qwen |
| 作者 | Richard J. Young, Alice M. Matthews |
| 链接 | [原文](https://arxiv.org/abs/2611.14935) |
| arXiv | arXiv:2611.14935 |
| 分类 | cs.CL, cs.AI, cs.CY |
| 发表 | 摘要未披露（comment 为空） |
| 篇幅 | 31 pages, 5 figures, 14 tables |
| 代码 | https://github.com/ricyoung/qpain-llm-counterfactual-audit |

## 核心贡献
1. 对 **GPT、Claude、Gemini、Llama、DeepSeek、Qwen** 等家族（含商用与开源权重模型）做**疼痛管理（pain management）**场景下的**反事实审计（counterfactual audit）**。
2. 方法学改进：使用**多个姓名暗示身份**（每组 2 个名字）、**固定随机种子做配对比较**、显式测量**模型自身的响应不稳定性（response instability）**、以及**逐部署配置（deployed configuration）检验**——直接针对既往审计"只测少数专有模型、显式声明种族、极少测噪声"的缺陷。
3. **主要发现为阴性且带噪声地板量化**：单次提示 + JSON 约束任务下，**没有任何差异在多重比较校正后存活**；所有疼痛严重度差异都在 0–10 量表上**等价于零**（误差在 1 分以内）。

## 方法 / 技术细节

### 研究设计（探索性、非预注册）
- **Study 1**：4 个 open-weight LLM 评估 **6 个急性疼痛（acute-pain）vignette**，覆盖 **4 个种族 × 2 个性别**的全部组合。
  - 身份处理：**显式声明** vs **仅通过姓名暗示**（每组 2 个名字）。
  - 比较方式：每个身份与**同 case、同 sampling seed** 下的 White male 参考个体做**配对比较**。
- **Study 2**：**24 种配置 × 17 个模型**（含 OpenAI GPT-4.1 mini 与 gpt-oss、Anthropic Claude Haiku 4.5、Google Gemini 2.5 Flash、Meta Llama、DeepSeek、Qwen），配置维度包括 **reasoning 开/关** 与 **两种精度（precisions）**；回答同样的 vignettes 加上 **50 个临床医生撰写的 Q-Pain 病例**。
- 任务形式：**单次提示、JSON 约束**（single-prompt, JSON-constrained）。

### 统计处理
- Study 1：任何差异**未通过校正**。
- Study 2：**1,386 次比较**中**没有任何一次**通过 **false discovery rate (FDR)** 校正。
- 疼痛严重度差异：等价于零，容差 **1 分**（0–10 量表）；在 **238 次 Q-Pain 比较中的 237 次**，容差甚至收窄到 **0.25 分**。

### 噪声地板的量化
**不同模型之间、以及同一模型在不同自身设置之间的差异，远大于患者身份之间的差异**。极端例子：参考患者（White male）在 **6% 到 93%** 的回答中被分配到**高剂量阿片类药物**。

### 阴性结果的正确读法
阿片类决策的界定精度**明显更差**（Study 1 **无法排除约 20 个百分点的差异**），因此只能说"未检测到差异"，而**不能证明不存在差异**。

### 少数存活差异的方向
在单个模型内部、校正后仍存活的少数差异，**偏向 Black 患者**。

## 实验结果
- Study 1：**无差异通过校正**。
- Study 2：**1,386 次比较，0 次通过 FDR**。
- 疼痛严重度：所有差异在 0–10 量表上 **±1 分内等价于零**；**238 次 Q-Pain 比较中的 237 次在 0.25 分内等价于零**。
- 阿片类决策：Study 1 **无法排除约 20 个百分点**的差异 → 报告为"未检测到差异"，而非"无差异"。
- 存活差异：偏向 **Black 患者**。
- 噪声：参考患者获高剂量阿片类的比例跨模型/设置在 **6%–93%** 之间。
- 原始模型回答总量：**58,080** 条。

## 关键数字速览
| 指标 | 数值 |
|------|------|
| Study 1 模型数 / vignette 数 | 4 / 6 |
| 身份组合 | 4 races × 2 sexes |
| 每组姓名数 | 2 |
| Study 2 模型数 / 配置数 | 17 / 24 |
| Study 2 比较总数 | 1,386（FDR 后 0 存活） |
| 疼痛严重度等价容差 | 1 分（0–10 量表） |
| Q-Pain 容差 | 0.25 分（238 次比较中的 237 次） |
| 阿片类决策不可排除差异 | 约 20 个百分点（Study 1） |
| 参考患者获高剂量阿片类比例 | 6% – 93% |
| 原始响应数 | 58,080 |
| Q-Pain 临床病例数 | 50 |

## 局限性
- **探索性、非预注册**（exploratory, non-preregistered），作者自己承认这一设计弱点。
- 单一提示、JSON 约束的**单次生成**任务；多轮对话、思维链、工具增强的临床使用形态未被覆盖（推测）。
- Study 2 的不同配置同时改变了 serving software、provider 与 prompt format，因此"模型间差异"与"部署环境差异"**混杂**，难以归因（作者自己也指出）。
- 阿片类决策的统计功效不足（20pp 不可排除），阴性结论在**药物决策这一关键维度上并不确定**。
- 仅覆盖急性疼痛 vignettes 与 Q-Pain 病例，未覆盖慢性疼痛、疼痛评估量表偏倚等（推测）。

## 与已有工作的关系 / 启示
本文在 LLM 公平性审计文献中属于"**方法学纠偏 + 阴性结论**"这一类：它不主张"LLM 无偏"（明确区分未检测到差异 vs 无差异），而是主张既往审计的**噪声地板被严重低估**——6% 到 93% 的参考患者高剂量比例说明单次提示下的模型输出更像随机噪声，任何基于少量比较的偏见结论都不成立。

## 相关论文
- [[Bias Audits of LLMs in Healthcare]]
- [[Counterfactual Evaluation of Model Fairness]]
- [[Q-Pain Benchmark]]

## 我的评注
这篇论文最值得称道的是它的**自我克制**：在一个高度政治敏感、媒体极易过度解读的题目上，作者给出了阴性结论，并且明确标注了阴性结论的**精度边界**（阿片类决策上无法排除 20pp 差异，所以只能说"未检测到"，而不是"没有"）。这种"未检测到 ≠ 不存在"的表述在 LLM 公平性研究中极其稀缺。方法上，三个设计是真正有价值的贡献：每组**两个名字**避免了单名混淆（如"Chen"并非种族指示词）、**同 seed 配对比较**消除了采样噪声这一最大混淆源、以及**逐部署配置检验**（reasoning 开关 × 精度 × provider）——后者在我看来才是最有价值的发现，因为它把"模型偏见"这个概念重新定义为"部署配置的偏见"，而 6%–93% 的参考患者高剂量比例几乎是整篇论文最惊人的数字：**模型自身的不稳定性比它对患者身份的差异大一个数量级**。这意味着此前大量"XX 模型对黑人患者给出更低疼痛评分"的报告，很可能测量的是采样噪声而非身份效应。实践结论很直接：在临床场景部署 LLM 之前，先把噪声地板测出来，用配对同 seed 协议做审计，并且**必须逐配置测**——因为换供应商或开关 reasoning 就足以改变结果。

---
*采集时间：2026-11-13 | 油麦菜 🥬 自动精读*
