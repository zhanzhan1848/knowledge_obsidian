# AgenticRei: Deontic Policies for Runtime Governance of Agentic AI Systems

## 基本信息
| 标题 | AgenticRei: Deontic Policies for Runtime Governance of Agentic AI Systems |
|------|------|
| 作者 | Anupam Joshi, Tim Finin, Karuna Pande Joshi, Lalana Kagal |
| 发表 | IEEE 2026 Symposium on Agentic Services |
| 链接 | [原文](https://arxiv.org/abs/2606.19464) |
| arXiv | arXiv:2606.19464v1 |
| 代码 | - |

## 核心贡献
1. **问题识别**: 现有策略引擎（XACML、Rego、Cedar）仅处理 permit/prohibit，无法满足 Agentic AI 的完整治理需求
2. **解决方案**: 提出 AgenticRei，采用基于 Rei 框架的义务性策略语言（OWL 表达），在 LLM 外部由高性能逻辑引擎进行运行时评估
3. **核心能力**: 支持义务（obligations）、宽免（dispensations）、策略冲突消解、基于本体的推理

## 核心概念

### 义务性策略（Deontic Policies）
- **Permit/Prohibit**: 允许/禁止行为
- **Obligation**: 特定操作后必须履行的义务（如通知 CISO）
- **Dispensations**: 特定情形下豁免义务
- **Policy Conflict Resolution**: 策略冲突时的优先级消解

### 治理范围
Agentic AI 系统可调用工具、操作数据、安装软件、跨组织协调 peer agents，必须被完整的企业治理结构约束。

### 技术架构
```
LLM Agent → Tool Invocations / Agent-to-Agent Messages → AgenticRei Pipeline → OWL Policy + Logic Engine
```

## 实验验证
通过安全与隐私治理案例展示义务性策略的表达能力，证明当前生产引擎无法表达这些约束。

## 局限性
- 需要预先定义完整的策略本体
- 策略冲突消解规则需要人工设计

## 建议
- **是否推荐使用**: 是
- **适用场景**: 企业级 Agentic AI 部署、合规要求高的场景（医疗、网络安全、数据隐私）

---
*🥬 油麦菜 | LLM/NLP 知识库 | 2026-06-20*