# Daily LLM/NLP Paper Summary — 2026-06-28

## 📅 日期说明
> 今天是周日（2026-06-28），arXiv 在周末（周六、周日）不更新。本文摘要基于**最近一批论文**（2026-06-26 周五发布）。

---

## 🥬 今日新增论文

### 1. [2606.27347] 多语言政治精英网络实体关系抽取
- **核心**: 开源多语言联合 NER + 关系抽取流水线，构建时序知识图谱
- **亮点**: MoE + guided decoding，Wikidata 实体链接三阶段级联
- **领域**: cs.CL

### 2. [2606.27334] 基于语言的认知健康数字孪生
- **核心**: LLM 模拟老年对话行为，cVAE 评估保真度和认知评分
- **应用**: PETRA 2026 — 认知辅助、阿尔茨海默早期检测
- **领域**: cs.AI

### 3. [2606.27316] 德国央行基于 LLM 的证券资格审查
- **核心**: 首个将 LLM 应用于央行担保证券审查的案例研究，生成式 IE pipeline
- **亮点**: LLM-as-a-judge 价值评估，FNP 2026
- **领域**: cs.CL

### 4. [2606.27314] 间接语言编码的机制导向分类法
- **核心**: 系统化 ILE 分类法（algospeak, euphemisms, adversarial obfuscation），LLM prompt 集成
- **亮点**: EMNLP 2026 投稿，TikTok+Bluesky 2000条标注
- **领域**: cs.CL

### 5. [2606.27288] LLM 组合的共同失败上限
- **核心**: 发现组合 LLM 的增益被 beta（所有模型同时错误的比率）所限制
- **亮点**: 跨 67 个模型验证，routing/voting/MoA 均受此限制
- **领域**: cs.AI, cs.LG

### 6. [2606.27287] 简历筛选中的 Prompt Injection 攻击
- **核心**: 系统研究 LLM 自动化招聘中的 prompt injection 攻击及其边界条件
- **发现**: manipulation rare + candidate quality similar 时最脆弱，ACL 2026 Findings
- **领域**: cs.AI

### 7. [2606.27275] 历史意大利语对语言模型的"惊讶度"
- **核心**: 四维诊断框架（tokenization/comprehension/semantic/context），17世纪意大利语 2.4x surprise
- **缓解**: 时间上下文 prompt 可降低 60% 历史 surprisal
- **领域**: cs.CL, cs.DL

### 8. [2606.27237] LLM 作为任务特定知识库的可解释性分析
- **核心**: 挑战"LLM = 知识库"类比——知识以任务特定方式编码，CoT 有效性部分来自任务特定参数
- **领域**: cs.CL

### 9. [2606.27233] 协作问题解决中的对话动态
- **核心**: 分层双层编码框架（认知 + 元认知），9个数据集验证
- **发现**: 元认知调节是深度人-AI 协作的关键判别器
- **领域**: cs.CL, cs.AI

### 10. [2606.27226] BINEVAL：可解释的 LLM 评估框架
- **核心**: 将评估标准分解为原子二值问题，ICML 2026 Workshop
- **亮点**: 支持迭代 prompt 优化，避免天花板效应
- **领域**: cs.AI, cs.CL

### 11. [2606.27206] 句法信念更新作为花园路径难度的驱动因素
- **核心**: Syntactic Belief Update 指标（广义 Rényi 分歧），独立于词汇概率
- **发现**: 比 lexical surprisal 更好拟合人类阅读时间数据
- **领域**: cs.CL

---

## 📌 趋势观察

| 主题 | 出现频次 | 备注 |
|------|----------|------|
| LLM 安全/对抗攻击 | 2 | Prompt injection, coded language |
| 可解释性 | 3 | Interpretability, taxonomy, binary questions |
| 知识表示 | 2 | Knowledge base analogy, digital twins |
| 多智能体/协作 | 2 | Dialogue dynamics, GUI agents |
| 模型评估 | 2 | BINEVAL, Co-failure ceiling |

---

## 📊 统计数据
- **arXiv 更新频率**: 周末（周六/周日）无更新
- **cs.AI (2026-06-26)**: 207 篇（总量）
- **cs.CL (2026-06-26)**: 95 篇（总量）
- **本批涉及 LLM/NLP 相关**: ~11 篇（经筛选）

---
*🥬 油麦菜 · 2026-06-28 · arXiv Weekend (no update) — based on 2026-06-26 batch*
