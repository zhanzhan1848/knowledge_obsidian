# Dynamic Governance of Multi-LLM Agent Systems for Collaborative Conversational Outcomes

## 元信息
| 标题 | Dynamic Governance of Multi-LLM Agent Systems for Collaborative Conversational Outcomes |
| 作者 | Alexander Liss |
| 链接 | [原文](https://arxiv.org/abs/2608.11207) |
| arXiv | arXiv:2608.11207 |
| 代码 | 未在文中说明 |

## 核心贡献
1. Experience Orchestrator (EO): control-theoretic governance layer as a substitute for the missing shared goal function in multi-LLM agent systems
2. Three mechanisms: Contextual Bandit (CB) + PID Controller + POMDP belief tracker working in concert
3. **+32pp lift** in high-intent advisor contact rate (78.1% vs. 46.1% baseline) across 60,000 simulations
4. CB variant selection accounts for **97%** of between-factor outcome variance — governance policy dominates environmental initial conditions
5. Introduces "adversarial-adjacent" MARL framing: agents have structurally opposed objectives but are not zero-sum

## 模型架构

```
Visitor Agent ←→ [Experience Orchestrator (EO)] ←→ Site Agent
                         │
            ┌────────────┼────────────┐
            ↓            ↓            ↓
     Contextual     PID Controller   POMDP Belief
       Bandit                         Tracker
     (arm selection)  (behavioral    (visitor intent
     at decision      consistency    probability
      boundary p10)   enforcement)   distribution)
```

### Three Mechanisms

- **Contextual Bandit (CB):** Selects one of four content arms at the decision-boundary page (p₁₀ "Find an Advisor") based on accumulated page-trajectory context (9 preceding pages + session-level features). Arms are calibrated from real-world web analytics (SEMRush). CB→LLM direction: bandit selects actions the LLM realizes as dialogue.

- **PID Controller:** Enforces behavioral consistency in real time via dynamic schema constraints on the site agent's output. Inspired by Char & Schneider — PID mechanisms resist overfitting to simulator dynamics, making it suitable when the environment is a stochastic LLM.

- **POMDP Belief Tracker:** Maintains a full probability distribution over visitor intent states (4-state × 4-action space, exact belief tracking). Site agent observes only visitor's turn message, self-reported resistance, and current belief — not the visitor's true intent.

### POMDP Formalization
- State space: visitor intent class ιₜ ∈ ℐ, resistance ρₜ ∈ [1,5], page trajectory 𝐩 ∈ {0,1}¹⁰, session context
- Observation space: site agent observes visitor message + resistance + belief; visitor observes content arm + conversation history (not PID state)
- Action space: {Contact, Guidance, Math, Questions} — each a complete token sequence per LLM invocation
- Terminal reward: R_terminal = 1 if advisor contact + genuine resistance decline (filters sycophantic false positives)

### Simulation Environment
- Financial services website, retirement planning domain
- 6 behavioral personas with probabilistically sampled page trajectories (not fixed sequences)
- 60,425 visitor sessions
- Decision boundary at page p₁₀ — site agent initiates structured dialogue
- "Adversarial-adjacent" setting: conversion (advisor contact) vs. resistance, but not zero-sum

## 实验结果
- **60,425 simulations** (factorial design)
- **High-intent advisor contact rate: 78.1% vs. 46.1%** (+32pp vs. naive LLM with only system prompt)
- **CB variant selection = 97%** of between-factor outcome variance vs. 3% for friction model choice
- Two distinct regimes identified:
  - **Non-convertible visitors:** governance layer is the difference between functional and non-functional system
  - **Near-alignment visitors:** naive LLM empathetic defaults are largely sufficient
- Outcome variance dominated by governance policy, not environmental initial conditions

## 局限性
- All findings are **conditional on LLM-to-LLM simulation** — not validated with live human visitors
- PID controller has **not been calibrated** against real human unpredictability
- CB arm probabilities conditioned on PID state and SEMRush-calibrated simulation priors (domain-specific)
- Validating EO on **live production traffic** is the critical next step
- Governance framework extension to broader calibration of independent LLM agents toward shared goals remains open

## Tags
#LLM #multi-agent #control-theory #governance #RL #Contextual-Bandit #POMDP #PID-control #persuasion #conversational-AI
