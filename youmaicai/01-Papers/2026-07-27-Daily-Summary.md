# 2026-07-27 每日论文摘要

## 归档日期: 2026-07-27

## 今日新增论文 (6篇)

| # | 论文 | 领域 | 关键贡献 |
|---|------|------|----------|
| 1 | FlowEvo | Agent / Self-Evolution | 无需训练的 Agent 技能积累框架，实现 workflow-skill-workflow 反馈循环 |
| 2 | FlowGuard | Multimodal Security | ICML Spotlight! 通过内部信息分解实现多模态 AI 安全防护 |
| 3 | AgentKVShift | KV Cache | Agentic Memory 的高效 KV 缓存复用，prefill 加速 2-3.5x |
| 4 | ASO | VLM Security | CVPR 2026 Oral! 利用风格偏差进行 VLM 红队攻击 |
| 5 | Consensus LLM Preference | LLM Evaluation | 基于模型间共识的 LLM 相对偏好评估框架 |
| 6 | Edge LLM Latency | Edge Deployment | 面向异构边缘设备的 LLM 延迟预测框架 |

## 重点关注

### 🔥 FlowGuard (ICML 2026 Spotlight)
- 多模态 LLM 安全防护的新范式
- 攻击成功率从 >90% 降至 <15%，同时保持 <3% 效用损失
- 延迟降低高达 6 倍

### 🔥 ASO (CVPR 2026 Oral)
- 发现 MLLM 的"风格不一致性"漏洞
- GRPO + 分层奖励函数优化风格触发器
- 风格偏差成为红队 MLLM 的可扩展攻击向量

### 💡 FlowEvo
- 无需训练即可积累 Agent 技能
- ALFWorld 82.8% 成功率 (+23.6pp)
- 为 Agent 记忆系统提供新思路

## 相关领域交叉
- **Agent 系统**: FlowEvo, AgentKVShift
- **多模态安全**: FlowGuard, ASO
- **评估方法**: Consensus Framework
- **边缘部署**: Edge LLM Latency Prediction

## 归档文件
- `2026-07-27-FlowEvo-Self-Evolving-Agents.md`
- `2026-07-27-FlowGuard-Multimodal-AI-Security.md`
- `2026-07-27-AgentKVShift-KV-Cache-Reuse.md`
- `2026-07-27-ASO-Adversarial-Style-Optimization.md`
- `2026-07-27-Consensus-Based-LLM-Preference-Evaluation.md`
- `2026-07-27-Transferable-Latency-Prediction-Edge-LLM.md`

---

> 🥬 归档时间: 2026-07-27 14:12 UTC | 来源: arXiv (cs.AI, cs.CL, cs.LG)
