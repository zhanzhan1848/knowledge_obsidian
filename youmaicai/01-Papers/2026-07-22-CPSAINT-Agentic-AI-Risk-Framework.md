---
type: paper
created: 2026-07-22
updated: 2026-07-22
tags: [llm, agent, risk, resilience, agentic-ai]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2607.18243
---

# From Agent Failure Paths to Quantified Residual Risk: A Compositional Framework for Resilient Agentic AI

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | From Agent Failure Paths to Quantified Residual Risk: A Compositional Framework for Resilient Agentic AI |
| **作者** | Hassan Karim, Sai Sitharaman, Deepti Gupta, Danda B. Rawat |
| **发表** | arXiv cs.AI (2026) |
| **链接** | [原文](https://arxiv.org/abs/2607.18243) |
| **DOI** | 10.48550/arXiv.2607.18243 |
| **代码** | - |

---

## 核心贡献

> 提出 **CPSAINT**（七层完整性分解）+ **FRIESA-K**（残差风险函数），为 Agentic AI 提供从失效路径到量化风险评估的完整框架。

1. **CPSAINT**：七层完整性分解 — Physical, Sensors, Data, Compute, Actuators, Environment, Time
2. **FRIESA-K**：残差风险函数，将每条失效路径映射到量化风险实例
3. **基于吸收马尔可夫模型**的 resistance term K，从状态动力学推导控制有效性
4. 跨领域框架：硬实时仓库机器人 vs 金融服务代理

---

## 技术方案

### 核心思想

现有方法要么描述失效机制但不产生可转移的残差风险估计，要么产生风险估计但将内部失效路径视为黑盒。CPSAINT + FRIESA-K 耦合两种视角。

### 七层分解 (CPSAINT)

| 层级 | 说明 |
|------|------|
| Physical | 物理状态 |
| Sensors | 传感器 |
| Data | 数据 |
| Compute | 计算 |
| Actuators | 执行器 |
| Environment | 环境 |
| Time | 时间 |

---

## 实验结论

- **场景**: 仓库机器人（硬实时）、金融服务代理（治理）
- **结果**: 同一层语法和变量语义跨领域保持，支持跨领域推理

---

## 局限性

- 形式化框架，实验验证相对有限
- 分布式/多租户部署的泛化待验证

---

## 实现建议

- **实现难度**: 高（需要完整的状态动力学建模）
- **预期性能**: 提供可量化的风险估计
- **适用场景**: 高风险 Agentic AI 系统评估
