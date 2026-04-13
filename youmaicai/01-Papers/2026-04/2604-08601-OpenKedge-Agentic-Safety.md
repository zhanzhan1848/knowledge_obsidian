---
title: "OpenKedge: Governing Agentic Mutation with Execution-Bound Safety and Evidence Chains"
authors: ["Jun He", "Deying Yu"]
category: [cs.AI, cs.LG]
date: 2026-04-13
tags: [LLM, agent, autonomous AI, safety, execution bounds, audit]
reviewer: youmaicai
---

## 元信息

| 标题 | OpenKedge: Governing Agentic Mutation with Execution-Bound Safety and Evidence Chains |
|------|------|
| 作者 | Jun He, Deying Yu |
| 链接 | [原文](https://arxiv.org/abs/2604.08601) |
| arXiv | arXiv:2604.08601 |
| 会议/期刊 | - |
| 代码 | - |

## 核心贡献

1. **OpenKedge 协议**：将突变重新定义为治理过程而非 API 调用的直接后果
2. **Intent-to-Execution Evidence Chain (IEEC)**：加密链接意图、上下文、策略决策、执行边界和结果
3. **执行边界强制**：通过临时任务导向身份执行，严格限制允许操作、资源范围和时间

## 核心问题

> 自主 AI 智能体的兴起暴露了 API 中心架构的根本缺陷：概率系统直接执行状态突变，缺乏足够的上下文、协调或安全保证

## OpenKedge 协议设计

### 意图提交
- 参与者提交**声明性意图提案**

### 评估
- 针对确定性派生的系统状态
- 时间信号
- 策略约束进行评估

### 执行合同
批准后编译为执行合同，严格限制：
- 允许的操作
- 资源范围
- 时间

### 强制执行
- 通过**临时任务导向身份**执行

### 关键创新

> 将安全从被动过滤转变为预防性、执行边界强制

## IEEC：意图到执行证据链

将以下内容加密链接为统一溯源：
1. 意图 (Intent)
2. 上下文 (Context)
3. 策略决策 (Policy Decisions)
4. 执行边界 (Execution Bounds)
5. 结果 (Outcomes)

### 效果

- 突变变为可验证和可重建的过程
- 实现确定性审计能力
- 支持系统行为推理

## 实验结果

- 多智能体冲突场景
- 云基础设施突变

### 关键发现
- 协议确定性裁决竞争意图
- 约束不安全执行
- 维持高吞吐量

## 局限性

- 在复杂现实世界系统中的部署待验证
- 性能开销尚未全面评估

## 相关论文

- 相关: [[LLM agent]]
- 相关: [[AI safety]]
- 相关: [[Agentic AI]]

## 原始摘要

> The rise of autonomous AI agents exposes a fundamental flaw in API-centric architectures: probabilistic systems directly execute state mutations without sufficient context, coordination, or safety guarantees. We introduce OpenKedge, a protocol that redefines mutation as a governed process rather than an immediate consequence of API invocation. OpenKedge requires actors to submit declarative intent proposals, which are evaluated against deterministically derived system state, temporal signals, and policy constraints prior to execution. Approved intents are compiled into execution contracts that strictly bound permitted actions, resource scope, and time, and are enforced via ephemeral, task-oriented identities. This shifts safety from reactive filtering to preventative, execution-bound enforcement. Crucially, OpenKedge introduces an Intent-to-Execution Evidence Chain (IEEC), which cryptographically links intent, context, policy decisions, execution bounds, and outcomes into a unified lineage. This transforms mutation into a verifiable and reconstructable process, enabling deterministic auditability and reasoning about system behavior. We evaluate OpenKedge across multi-agent conflict scenarios and cloud infrastructure mutations. Results show that the protocol deterministically arbitrates competing intents and cages unsafe execution while maintaining high throughput, establishing a principled foundation for safely operating agentic systems at scale.

---

*论文收录于 youmaicai/01-Papers/2026-04/*
