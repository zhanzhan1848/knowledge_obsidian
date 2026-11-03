# MEMENTO: Learning Context Management for Long Context Processing Agents

## 元信息
| 属性 | 值 |
|------|-----|
| 标题 | MEMENTO: Learning Context Management for Long Context Processing Agents |
| 作者 | Yunfan Zhang, Taehoon Hwang, Kathleen McKeown, Smaranda Muresan |
| 链接 | [原文](https://arxiv.org/abs/2611.00244) |
| arXiv | arXiv:2611.00244 |
| 类别 | cs.CL, cs.IR |
| 发表时间 | 2026-10-30 |
| 会议 | arXiv preprint |
| 评分 | 8 |

## 核心贡献
1. **MEMENTO**：基于 **Qwen3-8B** 构建的长上下文 agent，专门学习**上下文管理**——在固定大小 context window 中决定保留什么。
2. **两阶段训练**：先用 hindsight 标注的合成轨迹 SFT **bootstrap** 记笔记能力，再用组合奖励做 RL 强化。
3. **组合奖励**：answer correctness + note-quality heuristics + confidence calibration 三者合成。
4. **测试时策略泛化**：仅训练"压缩到新窗口"这一种行为，却能在测试时自发扩展出 **context folding** 与 **confidence-based backtracking** 等策略。

## 问题背景
在长输入上工作的 LLM agent 必须做上下文管理：在固定大小的 context window 中决定保留哪些内容。常见做法是 **compaction**（压缩）——模型用自己生成的 note 替换自己的历史。但现成的 agentic 模型（如 **GPT-5.5** 和 **GLM-5.3**）往往写不出有效的笔记；而**单独的 RL 几乎无法发现有用的记笔记行为**（稀疏、延迟且难以探索）。

## 方法
**基座**：Qwen3-8B。

**1. SFT bootstrap 阶段**
- 构造**合成轨迹**（synthetic trajectories）；
- 这些轨迹中的 note 由 **hindsight（事后）标注**生成——即在已知正确答案后回溯生成理想笔记；
- 用其做监督微调，先让模型学会"笔记长什么样"。

**2. RL 阶段**
- 奖励由三部分组合：

```math
r = w_c \cdot r_{\text{correctness}} + w_q \cdot r_{\text{note-quality}} + w_{conf} \cdot r_{\text{calibration}}
```

  - **answer correctness**：最终答案对错；
  - **note-quality heuristics**：笔记本身的质量启发式打分；
  - **confidence calibration**：模型置信度校准程度。

（摘要未给出各权重与具体启发式定义。）

**3. 测试时策略涌现**
- 训练目标仅为"压缩到全新窗口"；
- 但在测试时 MEMENTO 自发表现出：
  - **context folding**（上下文折叠）；
  - **confidence-based backtracking**（基于置信度的回溯）。

**4. 评测设定**
- 任务：**book-level question answering**（整本书级别问答）；
- 4 个基准；
- 书籍长度最高 **2.5M tokens**；
- 上下文占用上限：**从不超过 20K tokens**；
- 对比对象：同一 harness 下的 GPT-5.5 agent、全书上下文（full book context）设置、GLM-5.3 agent 及其 full context。

摘要未给出四个基准名称、具体 token 预算设置、训练所用的 RL 算法与奖励权重。

## 实验结果
**主结果（book-level QA，4 个基准平均）**

| 设置 | 准确率 | 上下文占用 | 成本 |
|------|--------|-----------|------|
| Qwen3-8B baseline | 36.9% | — | — |
| **MEMENTO** | **67.8%** | **≤ 20K tokens** | — |
| GPT-5.5 agent（同一 harness） | 13.1% | — | MEMENTO < 1/50 成本 |
| GLM-5.3 full book context | 56.7% | 全书 | MEMENTO 1/26 成本，差 6.4 分 |
| GLM-5.3 agent（~100× 更大） | 69.3% | — | MEMENTO 1/9 成本 |

**关键对比解读**：
- 相对自身基座 Qwen3-8B：36.9% → 67.8%（+30.9 分），且上下文占用 ≤20K；
- 相对 GPT-5.5 agent（同一 harness）：67.8% vs 13.1%，成本不到 1/50；
- 相对 ~100× 更大的 GLM-5.3 agent：67.8% vs 69.3%（接近），成本 1/9；
- 相对 GLM-5.3 全书上下文（56.7%）：高 6.4 分，成本 1/26。

摘要未给出逐基准拆分的准确率。

## 关键洞察
1. **上下文管理比上下文长度更值钱**：MEMENTO 用 ≤20K tokens 的窗口拿到 67.8%，不仅超过喂全书的 GLM-5.3（56.7%），还比 ~100× 大的 GLM-5.3 agent（69.3%）只低 1.5 分——说明"全量塞入"在长文档上劣于"摘要保留"，LLM 用长上下文反而受干扰。
2. **零训练策略会从单一目标中涌现**：只训练"压缩到新窗口"，却在测试时自发用出 context folding 与 confidence-based backtracking——一个足够好的笔记行为目标能泛化出未显式训练的策略族。
3. **SFT bootstrap 是 RL 的必要前置**：纯粹 RL 难以发现写笔记这种稀疏行为，用 hindsight 合成轨迹先做行为塑形，再交给 RL 优化，是可行的"冷启动"范式。
4. **agent 的失效点常在中间产物质量**：GPT-5.5 在同一 harness 上只有 13.1%，说明大模型 agent 在长上下文任务中并非因容量不足，而是因为自生成的笔记无效——这是可以针对性训练修补的短板。

## 局限性
- 摘要未给出四个基准名称、逐基准结果与样本规模，也未说明 QA 是何形式（生成式 / 多选 / 抽取）。
- 仅在 Qwen3-8B 上验证，跨基座的泛化性（换更大或更小 base）未验证。
- 对比 GPT-5.5 / GLM-5.3 时依赖同一 harness，但摘要未说明 harness 配置是否对闭源模型调优过。
- 成本比较基于美元估算（1/50、1/9、1/26），未说明计价口径与是否包含训练成本。
- 奖励中 note-quality heuristics 与 confidence calibration 的具体设计未公开，复现难度高。
- 任务仅限书籍类长文本；代码库、财报、多文档推理等长上下文场景未验证。
- 合成轨迹的 hindsight 标注由何模型生成、如何防止答案泄漏到笔记中，未说明。

## 适用场景
- 长文档（书籍、论文集、档案）问答系统的架构选择：与其扩窗口，不如训练压缩策略。
- 成本敏感的 agent 部署：需要在有限 context 预算内保持高准确率。
- Agent 框架中的 context 管理模块设计（compaction / folding / backtracking）。
- 研究"摘要笔记质量 vs 上下文长度"权衡的实验设计参考。

## 相关工作
- [[Long Context]] · [[Context Window]]
- [[Compaction]] · [[Context Management]]
- [[Chain-of-Thought]] · [[Reinforcement Learning]]
- [[Synthetic Trajectories]] · [[Hindsight Replay]]
- [[Confidence Calibration]]
- [[Qwen3]] · [[GPT-5.5]] · [[GLM-5.3]]

---
#LLM #Research #Long-Context #Agent #Context-Management #arXiv-2611
