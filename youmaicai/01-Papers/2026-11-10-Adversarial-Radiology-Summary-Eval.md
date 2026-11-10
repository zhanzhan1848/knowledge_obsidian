---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, medical-AI, adversarial-evaluation, LLM-as-judge]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2611.10277
arxiv: 2611.10277
---

# Adversarial Evaluation of Large Language Models for Patient-Friendly Radiology Report Summarization

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Adversarial Evaluation of Large Language Models for Patient-Friendly Radiology Report Summarization |
| **作者** | Magdalini Paschali, Asad Aali, Arogya Koirala, Andrew Johnston, Katherine McNamara, Richard Gaus, Roxana Daneshjou, David B. Larson, Akshay S. Chaudhari（Stanford University 等） |
| **发表** | 投稿至 Radiology: Artificial Intelligence（版权可能转让） |
| **链接** | [原文](https://arxiv.org/abs/2611.10277) |
| **arXiv** | arXiv:2611.10277 |
| **分类** | cs.AI |
| **代码** | https://github.com/stanfordaide/adversarial-edits-llm-eval |

---

## 核心贡献

> 建立一套可规模化的"临床接地对抗评测框架"，用受控术语替换与印象段删除来考察 LLM 生成的患者友好版放射报告摘要是否忠实保留临床修饰词——结果揭示出即使是最佳模型也会漏掉近四分之一的解剖词替换。

1. **放射科医生验证的对抗词典**：247 个术语（含量词短语），分八类（pathology、descriptors、anatomy、location、confidence terms、study types、measurements、findings），由研究团队起草、迭代与放射科医生完善、最终由认证放射科医生审阅。
2. **两种对抗策略与多强度**：Term Substitution（3 个强度级别，最多 1/4/16 处替换）与 Impression Removal（2 个级别，移除医学关键词密度最高的印象点），共生成 13,801 份 CT 与 MRI 报告的对抗变体。
3. **两阶段 LLM-as-a-judge 自动评测**：先把原文与对抗印象抽取为结构化临床事实（condition/location/severity/certainty），再在四个维度打分（事实忠实性、对编辑的敏感度、确定性保真度、幻觉率）。
4. **读者研究验证**：两位住院医独立评定 105 例，GPT-5 judge 与放射科医生的 macro-F1 为 0.55–0.56，与放射科医生之间的一致度（0.53）相当。

---

## 技术方案

### 核心思想
放射报告的患者友好摘要缺乏"标准答案"，传统准确度评估难做，而临床专家人工审阅不可扩展。论文的做法是把"会不会被微小编辑改变输出"变成可规模化的鲁棒性代理：用放射科医生验证过的对抗词典对印象段做受控替换与删除，然后看摘要是否忠实地把编辑传导出去。评测的关键设计是**先结构化再比较**：judge 先把自由文本报告分解成 (condition, location, severity, certainty) 四元组的临床事实列表，再据此判断摘要是否保留未改动的原事实、是否反映了具体编辑、是否维持了诊断确定性的强度、是否引入了原文没有的发现。失败模式分析把 judge 检出的"改动列表"与真实编辑做正则比对（允许词形变化），从而量化各类术语与具体词汇的"漏改率"。所有编辑在三个公开数据集（Merlin 腹部 CT、INSPECT 胸部 CTPA、MIMIC-IV MRI）上生成；评估组合为 3 数据集 × 100 报告 × 6 个摘要模型 × 2 种 prompt × 5 个编辑级别 = 18,000 个评估对（36,000 份摘要）。

### 关键公式
```math
（1）事实忠实性判定（四个属性全保留才算忠实）：
Faithful ⇔ (condition ∧ location ∧ severity ∧ certainty) 全部与原文一致
（临床上等价的改写允许，例如用 "mild enlargement" 代替具体尺寸，只要四属性保留）

（2）对抗编辑强度（Term Substitution）：
Level 1：1 个类别中替换 1 个词
Level 2：2 个类别中各替换 2 个词（共 4）
Level 3：4 个类别中各替换 4 个词（共 16）
（测量类数值以概率 0.5 被改动，如 1.5 cm → 3.3 mm）

（3）Impression Removal 的信息量打分：
score(point) = 该编号印象点中的医学关键词计数（词表来自 scispaCy + 生物医学 NER + 放射学术语规则的混合管线）
Level 1：移除得分最高的一个印象点；Level 2：移除至多三个得分最高的印象点

（4）漏改率：
MissRate(category) = 未出现在 judge 检出的 Alterations 列表中的真实替换数 / 该类别真实替换总数
（正则匹配，允许复数与常见屈折变化）

（5）评估规模：
3 数据集 × 100 报告 × 6 summarizers × 2 prompts × (3 替换级别 + 2 删除级别) = 18,000 评估对（36,000 份摘要）
```

### 关键组件
- **数据集**：Merlin（5,125 份腹部 CT，完整官方患者级公开测试集）、INSPECT（3,676 份胸部 CTPA，预先定义的约 16% 患者级测试划分）、MIMIC-IV（5,000 份 MRI，每患者去重并取印象段最长者）；平均每份报告含 2.7±1.4 / 2.8±1.5 / 4.6±2.2 个印象点。
- **对抗词典**：247 个术语，八个语义类别；术语使用全局计数以避免过采样常见词（优先选此前使用最少的）。
- **摘要模型（6 个）**：GPT-5、GPT-5-mini、Claude Sonnet 4.5（专有）；Llama 3.1 (8B)、Llama 3.3 (70B)、Qwen 3 (4B)、MedGemma (27B)（开源）；专有模型温度 1.0、开源模型 0.8，每个查询执行一次。
- **两种 prompt**：detailed（赋予医学沟通专家人格 + 明确语气/内容/评估标准）与 concise（单句直给指令）。
- **LLM-judge**：GPT-5 为主 judge（不作为 summarizer 以避免自评偏倚），MedGemma 为备选（医学适配的开源 judge）。
- **幻觉分类（8 类）**：unsupported follow-up recommendations、added confidence qualifiers、added reasoning、added details、fabricated descriptors、fabricated location、fabricated pathology、fabricated anatomy。
- **统计**：双侧非参数置换检验（20,000 次置换）比较 prompt 风格；F1 用 800 次自助重采样估不确定性；因标签类别严重不平衡，未用 Cohen's κ（避免 prevalence paradox）。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| 数据规模 | 13,801 份报告的对抗变体；18,000 个评估对（36,000 份摘要） |
| 事实忠实性（Term Substitution，GPT-5-mini） | 0.851（detailed，95% CI 0.826–0.873）/ 0.859（concise，CI 0.835–0.880） |
| 事实忠实性（Claude Sonnet 4.5） | 0.756 / 0.703 |
| 事实忠实性（MedGemma） | 0.670 / 0.713 |
| 事实忠实性（Llama 3.1 / Qwen 3） | 均低于 0.50 |
| 事实忠实性（Impression Removal） | GPT-5-mini 0.942/0.950；Claude 0.913/0.883；MedGemma 0.832/0.870 |
| 确定性保真度（GPT-5-mini） | Term Substitution 0.849/0.848；Impression Removal 0.893/0.897 |
| 对编辑的敏感度（Term Substitution，GPT-5-mini） | 完全反映 39.9%/39.0%，部分反映 42.0%/43.4% |
| 对编辑的敏感度（Impression Removal，GPT-5-mini） | 89.8%/86.8%（Claude 为 90.2%/88.7%） |
| 幻觉率（Term Substitution，GPT-5-mini） | 28.1%/30.1% |
| 幻觉率（Claude Sonnet 4.5） | 35.3%/36.4% |
| 幻觉率（MedGemma） | 41.9%/41.4% |
| 幻觉率（Qwen 3 / Llama 3.1） | 71.2%/61.1% 与 60.7%/66.2% |
| 幻觉率（Impression Removal，GPT-5-mini） | 14.0%/18.2%（Claude/MedGemma 23.3%–27.5%） |
| 类别漏改率（GPT-5-mini / Claude） | Anatomy 23.7%/26.6%；Confidence 22.3%/19.6%；Descriptors 21.2%/23.6%；Pathology 8.1%/11.7% |
| 高风险词漏改率（GPT-5-mini） | "suspicious" 52.2%、"low" 43.2%、"adjacent" 26.9%、"substantial" 23.7% |
| Judge–放射科医生一致性（总体 macro-F1） | GPT-5 vs Rad A 0.55±0.04、vs Rad B 0.56±0.04；Rad A vs Rad B 0.53±0.06 |
| 分维度一致性 | 事实忠实性 0.52/0.59（医生间 0.54）；确定性 0.52–0.54（0.50）；敏感度 0.59–0.61（0.61）；幻觉率 0.52/0.52（0.46） |
| 幻觉人工分类（105 例中 66 例被三方中至少两方标记） | 共 100 个幻觉（每报告均 1.5±0.5，范围 1–3）；unsupported follow-up recommendations 45、added reasoning 15、added confidence qualifiers 12、added details 11、fabricated descriptors 9、location 6、pathology 2、anatomy 0 |
| Prompt 风格主效应 | 对四项指标均无显著主效应；但 prompt × summarizer 交互在四项指标上均显著 |
| prompt 风格显著的 summarizer | Llama 3.3（事实忠实性，p<0.01）、Claude Sonnet 4.5（p<0.05，term substitution）、Qwen 3（p<0.05，impression removal）；幻觉率上 Qwen 3（p<0.001 / p<0.01）、Llama 3.1（p<0.05） |

---

## 局限性

- 对抗编辑是合成的而非真实临床变异；某些替换刻意偏离分布（pathology/anatomy 类如 "embolus"→"atelectasis"）以探测边缘行为，与真实错误分布不完全对应。
- 每个查询只执行一次，未做多次采样以估计随机性；开源模型温度 0.8、专有 1.0 的设定差异本身引入混淆。
- LLM-as-a-judge 与放射科医生的一致度只有约 0.55 macro-F1，且与医生间一致度（0.53）相当——说明 judge 只达到"人类之间"水平而非绝对可靠；n=105 的 95% CI 半宽约 ±10 个百分点。
- 只评测了放射报告 impression → 患者友好摘要这一单一任务，未涵盖其他临床生成任务；判别词汇表仅在英文放射学语境下构建。
- 幻觉类型分类是事后归纳（retrospectively derived），论文自陈并非穷尽。
- 结论基于 6 个模型（且多为 2026 年新版本），模型更迭后结论可能失效；参数量与领域微调作为影响因素只做了定性讨论，未做受控实验。
- 工作已投稿 Radiology: Artificial Intelligence，版权可能转让，后续版本可能不再可访问。

---

## 建议

- **是否推荐使用**：是（作为"对抗评测框架"的方法学模板，价值高于其具体结论）
- **适用场景**：任何"LLM 输出需忠实保留原文细粒度修饰信息"的场景（临床摘要、法律文书、合同审查、结构化抽取）；构建 LLM 鲁棒性/失效模式基准；LLM-as-a-judge 方案的设计参考（先结构化再比较的四维 rubric）。
- **值得复现**：是（代码与放射科医生验证的对抗词典公开，数据为公开数据集；建议在中文或其他领域语料上重建同类词典）

---

**相关论文**：[[2026-03-12-Reasoning-LLMs-as-Judges]]
**主题标签**：#LLM #NLP #medical-AI #adversarial-evaluation #LLM-as-judge
