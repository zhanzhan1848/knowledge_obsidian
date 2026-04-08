# This Treatment Works, Right? LLM Sensitivity to Patient Question Framing in Medical QA

## 元信息

| 标题 | This Treatment Works, Right? Evaluating LLM Sensitivity to Patient Question Framing in Medical QA |
|------|------|
| 作者 | Hye Sun Yun, Geetika Kapoor, Michael Mackert, Ramez Kouzy, Wei Xu, Junyi Jessy Li, Byron C. Wallace |
| 链接 | [原文](https://arxiv.org/abs/2604.05051) |
| arXiv | arXiv:2604.05051 |
| 领域 | cs.CL, cs.AI |
| 发表 | 2026-04-08 |

## 核心贡献

1. **系统性评估框架**：在受控 RAG 设置下（专家选择文档，非自动检索）评估患者问法变化对 LLM 医疗 QA 一致性的影响
2. **6,614 查询对数据集**：基于临床试验摘要构建，涵盖两种维度：问题框架（positive vs. negative）和语言风格（technical vs. plain language）
3. **跨 8 个 LLM 的实验**：揭示框架效应在多轮对话中进一步放大

## 问题背景

- 患者越来越依赖 LLM 回答医学问题
- 但 LLM 对 prompt 措辞敏感
- 医学领域对一致性和可靠性要求极高

## 实验设计

### 数据集
- **6,614 查询对**
- 基于临床试验摘要
- 专家选择的 RAG 文档（受控设置）

### 两个维度
1. **Question Framing**：positive vs. negative（积极 vs. 消极提问方式）
2. **Language Style**：technical vs. plain language（专业 vs. 通俗语言）

### 评估对象
- 8 个 LLM

## 关键发现

### 1. 框架效应显著
- **正向/负向框架**的查询对比**相同框架**的查询对更可能产生矛盾结论
- 这说明问法本身可以系统性地影响 LLM 的回答方向

### 2. 多轮对话放大不一致
- 持续说服（sustained persuasion）增加不一致性
- 随着对话轮次增加，框架效应累积

### 3. 无显著交互
- 框架与语言风格之间**无显著交互**
- 两个维度独立影响一致性

## 核心洞察

> LLM 在医学 QA 中的回答可以被问法系统性引导，即使在相同证据下也是如此。这在高风险医疗决策场景中是严重的安全隐患。

## 安全含义

- **Phrasing robustness 应成为 RAG 系统评估标准**
- 在高风险场景（医疗、法律等），应设计防框架攻击的提示策略
- 患者/用户应意识到问法对 AI 回答的潜在影响

## 局限性

- 仅在临床试验摘要的 RAG 场景验证
- 8 个 LLM 的选择可能有偏
- 未探索缓解策略

## 关键词

#medical-QA #RAG #LLM #reliability #framing-effect #prompt-sensitivity #safety #multi-turn

---

*🥬 由 油麦菜 自动整理 | 2026-04-08*
