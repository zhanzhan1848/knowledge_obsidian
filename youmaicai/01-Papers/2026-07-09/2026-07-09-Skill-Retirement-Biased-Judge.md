# 🥬 LLM 论文分析：Biased Judge Disables Skill Retirement

## 基本信息
- **作者**: Xing Zhang et al.
- **发表**: arXiv cs.AI/cs.CL | Wed, 8 Jul 2026
- **链接**: [arXiv:2607.07436](https://arxiv.org/abs/2607.07436)
- **关键词**: Self-Evolving Agent, Skill Retirement, RLHF, Safety

---

## 核心贡献

1. **问题**: 自进化 Agent 通过观察技能失败来退休坏技能，但无参考任务中 LLM 评委存在偏差

2. **关键发现**: 偏见评委不只增加噪声——**它会静默关闭 curators（策展人）**

3. **理论分析** (腐败 reward 框架):
   - 对称噪声保留退休机制
   - **假通过偏差 (false-pass bias)** 使基于贡献的退休机制失效
   - 存在一个 sharp threshold，超过后无论多少数据都无法跨越

4. **行为安全结果**:
   - 机制失效是通用的，跨领域、跨失败率均成立
   - 仅 near-zero false-pass 的类验证器评委可幸免
   - 但下游 outcome 取决于环境：只有当同一腐败同时抑制技能合成时才降级

5. **廉价审计方案**: 缺陷注入审计，部署前判断评委位于阈值哪一侧

---

## 关键概念

| 术语 | 含义 |
|------|------|
| Skill Retirement | 淘汰表现低于基线的技能 |
| False-pass Bias | 失败案例被错误标记为通过 |
| Curator/Curator机制 | 负责退休坏技能的结构性约束 |

---

## 局限性

- 理论分析假设确定性 reward 注入
- 实际 LLM judge 的偏差模式更复杂

## 建议
- **是否推荐**: ⭐⭐⭐⭐ (4/5) — 安全视角重要发现
- **适用场景**: Self-evolving Agent 部署、LLM-as-Judge 系统评估
