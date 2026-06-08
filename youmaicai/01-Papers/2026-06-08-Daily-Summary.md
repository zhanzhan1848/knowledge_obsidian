# 2026-06-08 LLM/NLP 每日论文总结

## 📅 日期：2026-06-08

## 📊 搜索范围
- arXiv cs.AI, cs.CL, cs.NE, cs.LG
- 最近 24 小时新论文

## 📝 今日发现论文（7篇）

### 1. SafeGene: 可迁移安全对齐的可复用适配器
- **arXiv**: [2606.06519](https://arxiv.org/abs/2606.06519)
- **领域**: cs.AI, cs.LG
- **核心**: 提出 SafeGene，将安全能力解耦为独立可复用适配器，解决开源 LLM 下游微调后的安全对齐弱化问题
- **亮点**: few-shot layer-wise 系数重校准，跨任务复用安全适配

### 2. Lean4Agent: Agent 工作流的形实验证
- **arXiv**: [2606.06523](https://arxiv.org/abs/2606.06523)
- **领域**: cs.AI, cs.LG, cs.LO, cs.SE
- **核心**: 首个使用 Lean4（依赖类型形式语言）建模和验证 LLM Agent 行为的框架
- **亮点**: FormalAgentLib + LeanEvolve，验证通过的工作流优于失败 11.94%

### 3. PolyFact: 通过 GRPO 改善跨语言事实一致性
- **arXiv**: [2606.06586](https://arxiv.org/abs/2606.06586)
- **领域**: cs.CL (EMNLP 2026 under review)
- **核心**: 100K 多语言事实 QA 数据集（12 种语言），GRPO 优于 SFT，重组多语言路由
- **亮点**: 机制分析揭示 GRPO 减少语言专门化，促进共享跨语言表示

### 4. Re-Centering Humans: LLM 个性化的人类中心评估
- **arXiv**: [2606.06614](https://arxiv.org/abs/2606.06614)
- **领域**: cs.CL, cs.AI, cs.HC
- **核心**: 揭示合成数据 vs 真实人类数据的系统性差距（550 对话，3 阶段判断）
- **亮点**: 模型个性化在人类判断上并不优于通用回复，存在 judge self-preference 偏差

### 5. UnpredictaBench: LLM 分布随机性评估
- **arXiv**: [2606.06622](https://arxiv.org/abs/2606.06622)
- **领域**: cs.CL
- **核心**: 448 个问题测试 LLM 分布采样能力，KS@N 指标，无模型超过 40%
- **亮点**: 揭示简单分布模拟仍是挑战，为 LLM 作为复杂系统模拟器提供评估基础

### 6. Token-Level Reasoning Failures: LLM 推理失败的 token 级签名
- **arXiv**: [2606.06635](https://arxiv.org/abs/2606.06635)
- **领域**: cs.CL, cs.AI
- **核心**: 区分两种失败模式：Committed Failure（承诺点后额外 token 有害）和 Persistent Uncertainty（不确定性累积）
- **亮点**: 23 配置验证，20/23 可证伪预测成立，影响 self-consistency 应用

### 7. Piggyback Hypothesis: 解释和缓解新兴误对齐
- **arXiv**: [2606.06667](https://arxiv.org/abs/2606.06667)
- **领域**: cs.CL
- **核心**: chat-template tokens "背负"微调行为泛化到域外，提出 TReFT 正则化方法
- **亮点**: TReFT 在 Llama-3.1-8B 法律域减少 33.5% EM，off-topic generalization 减少 54.3%

## 🏷️ 主题分布
- 安全对齐：1 篇 (SafeGene, Piggyback)
- Agent 系统：1 篇 (Lean4Agent)
- 多语言：1 篇 (PolyFact)
- 个性化：1 篇 (Re-Centering Humans)
- 推理能力：1 篇 (Token-Level Failures)
- 评估基准：1 篇 (UnpredictaBench)
- 分布建模：1 篇 (UnpredictaBench)

## 🔬 关键技术趋势
1. **形式化验证进入 LLM Agent**：Lean4 等形式语言用于 Agent 行为验证
2. **安全适配器可复用化**：SafeGene 代表安全模块跨任务复用方向
3. **GRPO 在多语言任务中表现优异**：PolyFact 证实 RL 方法优于 SFT
4. **人类评估 vs 合成数据差距**：Re-Centering Humans 揭示系统性差异
5. **推理失败机制研究**：从 token 级别理解失败过程

---
*🥬 油麦菜 — LLM/NLP 知识管理 | 2026-06-08*