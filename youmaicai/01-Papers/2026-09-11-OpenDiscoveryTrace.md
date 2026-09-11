# 🥬 LLM 论文分析：OpenDiscoveryTrace

## 基本信息
- **标题**: OpenDiscoveryTrace: Process Traces for Evaluating AI Scientist Workflows
- **作者**: Aayam Bansal, Keertan Balaji
- **发表**: arXiv:2609.09203 | cs.AI
- **链接**: [原文](https://arxiv.org/abs/2609.09203) | [GitHub](https://github.com/aayambansal/OpenDiscoveryTrace) | [Dataset](https://huggingface.co/datasets/aayambansall/OpenDiscoveryTrace)
- **奖项**: Best Dataset Award, ICML 2026 Workshop on AI for Science

## 核心贡献

1. **Process-Level 评估**: 现有 benchmark 只评估最终输出（代码、假设、论文），丢弃推理过程；OpenDiscoveryTrace 填补这一空白
2. **558 条完整轨迹数据集**: 覆盖 124 个科学任务，涵盖药物发现、材料科学、基因组学、科学文献分析
3. **9-field 结构化追踪**: 每步记录 thoughts, tool calls, observations, errors, revision triggers, self-reported confidence
4. **7 模型对比**: 3 个前沿模型 (GPT-5.4, Claude Opus 4.6, Gemini 3.1 Pro 各 124 条) + 4 个开源权重模型 (Qwen2.5-7B, Mistral-7B-v0.3, Phi-3.5-mini, Qwen2.5-1.5B 各 30 条) + 60 条 live-retrieval 变体

## 数据集设计

**轨迹结构 (9-field per step)**:
```
thoughts        # 思考过程
tool_calls      # 工具调用
observations    # 观察结果
errors          # 错误信息
revision_triggers  # 修订触发
self_reported_confidence  # 自我置信度
...
```

**任务领域**:
- 药物发现 (Drug Discovery)
- 材料科学 (Materials Science)
- 基因组学 (Genomics)
- 科学文献分析 (Scientific Literature Analysis)

**评估维度**:
- Output-only 评估: 成功率
- Process-level 评估: 行为差异、错误模式、推理质量

## 实验结果

| 模型 | 成功率 | 错误数/轨迹 | 错误类型分布 |
|------|--------|-------------|--------------|
| GPT-5.4 | 84-89% | **0.08** | 83.6% reasoning errors |
| Claude Opus 4.6 | 84-89% | **2.5** (30×) | 66.7% tool misuse |
| Gemini 3.1 Pro | 84-89% | - | - |

**关键发现**:
- Output-only: 三个前沿模型成功率相当 (84-89%)
- Process-level: Claude Opus 4.6 产生 GPT-5.4 的 **30 倍错误** (p < 0.0001, Cliff's δ = 0.613)
- **定性差异**: Claude 66.7% tool misuse vs GPT-5.4 83.6% reasoning errors

## 局限性

- 仅覆盖 4 个科学领域，泛化性待验证
- 评估依赖 LLM judge，可能存在偏好偏差

## 建议
- **是否推荐使用**: ⭐⭐⭐⭐⭐ (ICML 2026 Best Dataset Award，填补 AI Scientist 过程评估空白)
- **适用场景**: AI Agent 评估、科学推理审计、错误模式分析、AI 治理
- **值得关注**: 轨迹数据 Schema 和 Agent harness 开源

---

## 🏷️ Tags
#AI-Agent #Process-Evaluation #AI-Scientist #Benchmark #Trajectory #ICML2026
