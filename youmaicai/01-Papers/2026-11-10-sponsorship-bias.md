---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, AI-agents, alignment-bias, decision-models, sponsorship]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2609.17989
arxiv: 2609.17989
---

# Whom Do AI Agents Serve? Role-Induced Sponsorship Bias in Decision Models and Generative LLMs

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Whom Do AI Agents Serve? Role-Induced Sponsorship Bias in Decision Models and Generative LLMs |
| **作者** | Davood Wadi, Yu Ma |
| **发表** | arXiv preprint（McGill University, Desautels Faculty of Management） |
| **链接** | [原文](https://arxiv.org/abs/2609.17989) |
| **arXiv** | arXiv:2609.17989 |
| **分类** | econ.GN, cs.AI, q-fin.EC |
| **代码** | 未提供 |

---

## 核心贡献

> 仅在系统提示中指明 AI 购物智能体的委托方（消费者 vs 平台），就会显著改变它对"赞助列表"的评价——产生"赞助偏见"，且更严格的披露措辞与单纯的提示层缓解都不足以消除。

1. 跨 6 个生成式 LLM（3 家供应商）与 6 个决策模型（System-One 式，单次前向打分）在酒店列表场景下证明：消费者委托下智能体显著惩罚赞助列表，而把平台指定为委托方会显著削弱该惩罚（无需任何偏袒广告商的指令）。
2. 机制解释：披露标签提高 LLM 决策前推理链中的"审慎怀疑"，该怀疑又负相关于最终选择；平台委托削弱了这一间接路径（ moderated mediation）。
3. 三项缓解策略比较：提示层缓解（要求代理旅行者利益）可消除平台宽松但可能过度纠正并扰乱基线偏好；模型层的"消费者对齐微调"既消除赞助偏见又不过度纠正，且对基线偏好的 KL 散度更低。

---

## 技术方案

### 核心思想

零售平台通过赞助列表变现，而消费者通常会对赞助结果打折。当消费者把产品评估委托给 AI 智能体时，赞助披露由智能体而非消费者处理，智能体内部的权衡对消费者不可见。论文提出核心问题：仅仅改变系统提示中"谁委托了这个智能体"（消费者委托 vs 平台委托），是否会改变它对赞助列表的评价？

论文用随机效用框架形式化。赞助状态作为效用属性进入，带有有限负权重 β_sponsorship < 0（因为付费投放暗示说服意图）。基础模型的训练语料包含大量人类对付费投放持怀疑态度的文本（商品评论、消费者论坛、营销文献），因此被指派给消费者的智能体应继承这一负权重，构成无冲突基线，即"赞助惩罚"。定义赞助偏见为：平台委托下的负权重绝对值小于消费者委托下，即 |β_sponsorship^platform| < |β_sponsorship^consumer|。

Study 1 在酒店预订场景对 6 个前沿生成式 LLM 与 6 个商业/开放权重决策模型做匹配列表选择实验，只改动系统指令中的一句话（"你受某旅行者雇佣" vs "你受某预订平台雇佣"）。结果在两类模型家族上高度一致：消费者委托下所有 12 个模型都施加显著赞助惩罚，平台委托下惩罚被显著削弱。该效应在替换系统提示措辞、调整 LLM 推理强度（低/高 effort）后都复现，并在 N=4,000 的 Thinking level 条件下依然成立。

Study 2 分解披露标签（"Promoted" vs "Sponsored"）与"是否把付费位置归因于平台"两个因素。结果是：归因于平台会放大赞助偏见；"Sponsored" 确实比 "Promoted" 给出更低的评价，但更严格的监管披露措辞并不能消除赞助偏见。

Study 3 比较提示层与模型层缓解。提示层在两类架构中都消除了平台宽松，但在决策模型中出现过度纠正，且两者都扰动了平台委托智能体的基线酒店与评论偏好。模型层则对开放权重决策模型在合成的非酒店零售品类上做"消费者对齐微调"，使其无论被指派给谁都能匹配其消费者委托下的选择分布；零样本在酒店选择上评测，赞助偏见被消除且不过度纠正，基线偏好的固定效应 KL 散度也更低。

### 关键公式

```math
% 随机效用框架下的赞助权重
\text{效用中赞助属性:}\ \beta_{\text{sponsorship}} \in (-\infty, 0),\quad
\text{消费者委托:}\ \beta^{\text{consumer}}_{\text{sponsorship}} < 0\ \text{(无冲突基线)}
\text{赞助偏见 H2:}\ \big|\beta^{\text{platform}}_{\text{sponsorship}}\big| < \big|\beta^{\text{consumer}}_{\text{sponsorship}}\big|

% 审慎怀疑的中介路径（H3/H4， moderated mediation）
\underbrace{\text{披露标签}}_{\text{自变量}}
\ \longrightarrow\ \underbrace{\text{决策前审慎怀疑}}_{\text{中介}}
\ \longrightarrow\ \underbrace{\text{选择}}_{\text{结果}},
\quad \text{委托方调节第一阶段（削弱间接效应)}

% 消费者对齐微调的目标：匹配消费者委托下的选择分布
\theta^* = \arg\min_\theta\ \mathrm{KL}\Big(\pi_\theta(\cdot \mid \text{platform\ delegation})\ \big\|\ \pi_{\text{consumer}}(\cdot)\Big)
% 评测：对基线酒店/评论偏好计算固定效应 KL 散度，越低表示基线保留越好
```

### 关键组件

- **委托方操纵**：通过系统指令中一句话区分消费者委托（"You are employed by a traveler"）与平台委托（"You are employed by a booking platform"）。
- **两类模型家族**：6 个生成式 LLM（含 Gemini 3.1 Pro，产生自然语言推理链后再做离散选择）+ 6 个非生成式决策模型（含开放权重 Kev 9B，单次前向打分输出校准选择概率）。
- **匹配刺激设计**：匹配酒店列表（价格、评分等客观属性对齐），只有赞助状态不同；固定效应回归控制目标价格等协变量；视频聚类自助法给 95% CI。
- **中介分析**：moderated mediation，检验"披露→决策前怀疑→选择"路径及其被委托方调节。
- **披露标签与归因操纵**：Study 2 中交叉操纵 "Promoted"/"Sponsored" × 是否归因于平台。
- **缓解方案**：提示层（要求代理旅行者最佳利益）与模型层（在合成非酒店零售品类上做消费者对齐微调）。
- **Study 3 备选集**：10 个合成非酒店零售品类作为微调集，酒店场景作为零样本评测集。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| Study 1 模型数 | 6 个生成式 LLM（3 家供应商）+ 6 个决策模型 = 12 |
| 消费者委托下的赞助惩罚 | 全部 12 个模型显著 |
| 平台委托下的赞助惩罚 | 全部 12 个模型显著减弱 |
| Study 1 样本量（Gemini Thinking level 回归） | N=4,000 |
| Study 2 样本量 | N=10,000 |
| Study 2：Gemini 目标选择份额（"Promoted"，无平台归因 / 有平台归因） | 28.80% / 47.26% |
| Study 2：Kev 9B 校准目标概率（同上） | 45.33% / 14.19% |
| Study 2："Sponsored" 无归因 / 有归因（Gemini） | 39.60% / 50.08% |
| Study 2："Sponsored" 无归因 / 有归因（Kev 9B） | 48.96% / 13.75% |
| Study 3：提示层缓解效果 | 两类架构均消除平台宽松；决策模型出现过度纠正 |
| Study 3：模型层（消费者对齐微调）效果 | 消除赞助偏见且不过度纠正；基线偏好 KL 散度更低 |
| 中介分析结论 | 赞助披露 → 决策前怀疑 ↑ → 选择该列表概率 ↓；平台委托削弱该间接关联 |

**关键机制结论**：赞助偏见并非来自显式的目标设定或偏袒广告商的指令，而是从角色指派中隐式涌现的（role-induced implicit stakeholder alignment）。

---

## 局限性

- 场景限定为酒店预订与匹配列表的受控选择任务，向更复杂购物决策（多属性权衡、跨品类）的外推未验证。
- 赞助偏见是相对概念，其绝对大小依赖具体的价格、评分等属性配置与所用列表集合。
- 提示层缓解在决策模型中过度纠正、且扰动基线偏好，说明"用提示修提示"并非通用解法；模型层缓解只在一个开放权重决策模型上验证，且需要构造合成的非酒店微调数据。
- 论文未测试针对广告商激励的显式优化目标（如佣金权重），也未考察多智能体市场中的相互影响。
- Study 1 只在少数代表性模型上验证（6+6），虽然跨供应商与跨架构一致，但未覆盖全部前沿模型。
- 经济学期望框架中的 β_sponsorship 是概念性参数，未做严格估计量推导。

---

## 建议

- **是否推荐使用**：是
- **适用场景**：AI 购物助手、对话式电商代理、平台内 AI 搜索的治理与审计；设计多利益方 AI 系统时的角色提示与微调策略；数字零售/广告监管研究。
- **值得复现**：是（"仅改角色指派即可改变模型价值判断"这一发现对任何多主体 AI 部署都有直接的治理意义）

---

**相关论文**：[[Persuasion Knowledge]]、[[System-One Decision Models]]、[[Role Adoption in LLMs]]
**主题标签**：#LLM #NLP #AI-Agents #Alignment-Bias #Decision-Models #Digital-Retailing
