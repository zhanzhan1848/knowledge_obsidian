---
title: "From Business Events to Auditable Decisions: Ontology-Governed Graph Simulation for Enterprise AI"
authors: ["Hongyin Zhu", "Jinming Liang", "Mengjun Hou", "Ruifan Tang", "Xianbin Zhu", "Jingyuan Yang", "Yuanman Mao", "Feng Wu"]
category: [cs.AI, cs.CL]
date: 2026-04-13
tags: [LLM, agent, enterprise AI, ontology, decision-making, audit]
reviewer: youmaicai
---

## 元信息

| 标题 | From Business Events to Auditable Decisions: Ontology-Governed Graph Simulation for Enterprise AI |
|------|------|
| 作者 | Hongyin Zhu 等 |
| 链接 | [原文](https://arxiv.org/abs/2604.08603) |
| arXiv | arXiv:2604.08603 |
| 会议/期刊 | - |
| 代码 | - |

## 核心贡献

1. **LOM-action 框架**：企业 AI 的事件驱动本体论模拟框架
2. **事件→模拟→决策管道**：核心流程，决策完全来自模拟图
3. **揭示"虚假准确率"现象**：DeepSeek-V3.2 等模型准确率 80% 但 F1 仅 24-36%

## 核心问题

现有 LLM 智能体系统的共同架构缺陷：
- 从无限制知识空间回答
- 未先模拟业务场景如何重塑该空间
- 产生流畅但无根基的决策，无审计追踪

## 方法论

### 事件驱动本体论模拟
1. **业务事件**触发场景条件（编码在企业本体论 EO 中）
2. 驱动**隔离沙箱**中的确定性图突变
3. 演化为场景有效模拟图 $G_{\text{sim}}$
4. 所有决策完全来自此演化图

### 双模式架构
- **Skill Mode**：技能执行模式
- **Reasoning Mode**：推理模式

### 审计追踪
- 每个决策产生完全可追溯的审计日志

## 实验结果

| 模型 | 准确率 | Tool-chain F1 |
|------|--------|---------------|
| LOM-action | 93.82% | 98.74% |
| Doubao-1.8 | 80% | 24-36% |
| DeepSeek-V3.2 | 80% | 24-36% |

### 核心发现

> LOM-action 相比基线模型准确率提升约 14%，F1 提升 4 倍

### 关键洞察

- **不是模型规模，而是架构先决条件**
- 本体论治理 + 事件驱动模拟 = 可信企业决策智能的架构前提

## 局限性

- 依赖高质量企业本体论构建
- 在非结构化企业环境中的适应性待验证

## 相关论文

- 相关: [[LLM agent]]
- 相关: [[Enterprise AI]]
- 相关: [[Decision-making]]

## 原始摘要

> Existing LLM-based agent systems share a common architectural failure: they answer from the unrestricted knowledge space without first simulating how active business scenarios reshape that space for the event at hand -- producing decisions that are fluent but ungrounded and carrying no audit trail. We present LOM-action, which equips enterprise AI with event-driven ontology simulation: business events trigger scenario conditions encoded in the enterprise ontology~(EO), which drive deterministic graph mutations in an isolated sandbox, evolving a working copy of the subgraph into the scenario-valid simulation graph $G_{\text{sim}}$; all decisions are derived exclusively from this evolved graph. The core pipeline is event → simulation → decision, realized through a dual-mode architecture -- skill mode and reasoning mode. Every decision produces a fully traceable audit log. LOM-action achieves 93.82% accuracy and 98.74% tool-chain F1 against frontier baselines Doubao-1.8 and DeepSeek-V3.2, which reach only 24--36% F1 despite 80% accuracy -- exposing the illusive accuracy phenomenon. The four-fold F1 advantage confirms that ontology-governed, event-driven simulation, not model scale, is the architectural prerequisite for trustworthy enterprise decision intelligence.

---

*论文收录于 youmaicai/01-Papers/2026-04/*
