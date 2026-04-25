# Escaping the Agreement Trap: Defensibility Signals for Evaluating Rule-Governed AI

## 元信息
| 标题 | Escaping the Agreement Trap: Defensibility Signals for Evaluating Rule-Governed AI |
|------|------|
| 作者 | Michael O'Herlihy, Rosa Català (Reddit, Inc.) |
| 链接 | [原文](https://arxiv.org/abs/2604.20972) |
| arXiv | arXiv:2604.20972 |
| 发表 | cs.AI, cs.CY |

## 核心贡献
1. **Agreement Trap 识别**：在规则治理环境中，多个决策在逻辑上均符合策略，但 agreement 指标惩罚所有非标签决策
2. **Defensibility Index (DI)**：衡量策略可捍卫性（L1/L2 决策占比），目标 DI ≥ 0.90
3. **Ambiguity Index (AI)**：量化策略模糊性（逆向检查率），目标 AI ≤ 0.15
4. **Probabilistic Defensibility Signal (PDS)**：从 audit model token logprobs 提取，无需额外审计
5. **Governance Gate**：基于 DI/AI 阈值的自动化决策门控，实现 78.6% 自动化覆盖率，同时降低 64.9% 风险

## 核心概念

### Agreement Trap
当正确结果是集合值（多个策略可捍卫决策）时，agreement 指标无法区分三类失败：
- 模型错误
- moderator 分歧  
- 策略模糊性

### 防御性等级
- **L1 (Robustly Defensible)**：显式规则直接、明确地授权该决策
- **L2 (Plausibly Defensible)**：规则确实模糊，但合理支持该决策
- **L3 (Indefensible)**：无显式规则授权，或内容符合规则字面要求

### 公式
```math
DI = |{i: level(i) ∈ {L1, L2}}| / N  (目标: DI ≥ 0.90)

AI = |{i: inverse_check(i) = Yes}| / N  (目标: AI ≤ 0.15)
```

## 审计实现
审计模型接收 (C, R, P, ŷ)，生成 JSON reasoning trace：
```
logic_chain → policy_citation(κ) → precedent_weight(ω) → inverse_check(ι) → defensibility_level(ξ)
```
关键设计：先承诺规则引用，再分配防御性等级，确保分类以显式治理引用为锚。

## 实验结果
- 193,000+ Reddit moderation decisions，覆盖多个社区
- Agreement-based 和 policy-grounded 指标差距达 33-46.6 百分点
- 79.8-80.6% 的模型 false negatives 实际是策略可捍卫决策（非真正错误）
- 37,286 个相同决策在三级规则下审计：AI 降低 10.8pp，DI 保持稳定
- Governance Gate：78.6% 自动化覆盖率 + 64.9% 风险降低

## 与 LLM-as-Judge 的区别
传统 LLM-as-Judge 要求模型判断输出是否"好"或"偏好"；本文 audit model 不做判断，而是验证 proposed decision 是否能从显式规则体系中逻辑推导——有形式化答案。

## 局限性
- 论文尚未在 Reddit 生产环境实际部署
- Governance Gate 阈值基于场景敏感性分析，需针对具体应用调整
- PDS 方差主要来自治理模糊性而非解码噪声

## 建议
- **适用场景**：内容审核 AI 评估、规则治理 AI、AI 合规性审计
- **推荐程度**：⭐⭐⭐⭐⭐ — Agreement Trap 概念极具洞察力，方法论严谨
