# AgenticRei: Deontic Policies for Runtime Governance of Agentic AI Systems

## 元信息
| 标题 | Deontic Policies for Runtime Governance of Agentic AI Systems |
|------|------|
| 作者 | Anupam Joshi, Tim Finin, Karuna Pande Joshi, Lalana Kagal |
| 链接 | [原文](https://arxiv.org/abs/2606.19464) |
| arXiv | arXiv:2606.19464 |
| 会议 | IEEE Symposium on Agentic Services (IEEE S.A.S. 2026) |
| 领域 | cs.AI, cs.MA |

## 核心贡献

1. **AgenticRei 框架**：提出基于义务论策略（deontic policy）的 LLM Agent 运行时治理框架
2. **超越 Permit/Prohibit**：现有策略引擎（XACML, Rego, Cedar）仅处理允许/禁止subset，AgenticRei 扩展到**义务生命周期管理**、**元策略冲突消解**、**例外豁免机制**
3. **本体论推理**：支持领域类层次结构的本体推理，应用于医疗、网络安全、数据隐私
4. **LLM 外部评估**：策略评估完全在 LLM 外部由高性能逻辑引擎执行，避免 LLM 直接做安全决策

## 问题背景

LLM Agent 可调用工具、操作数据、安装软件、跨组织协调_peer agents_，仅靠身份验证和访问控制无法满足企业治理需求：

- **Permission**: 允许执行的操作
- **Prohibition**: 禁止执行的操作
- **Obligation**: 某些操作后必须履行的义务（如通知CISO）
- **Dispensation**: 在特定情况下豁免义务
- **Policy Conflict Resolution**: 策略冲突时的优先级处理

## 技术架构

### 策略语言
- 基于 **Rei 框架**构建义务论策略语言
- 表达为 **OWL** (Web Ontology Language)
- 由高性能逻辑引擎在运行时评估

### 治理范围
1. **Tool invocations**: Agent 对工具的调用
2. **Agent-to-agent messages**: 多 Agent 通信

### 关键特性
- ** Obligation lifecycle management**: 义务的激活、完成、豁免状态机
- ** Meta-policy conflict resolution**: 元层级策略冲突处理
- ** Ontological reasoning**: 支持类层次结构的领域本体推理
- ** Composition with A2AS**: 可与 industry-standard A2AS 框架组合

## 局限性

- 需要预先定义完整的策略本体
- 策略编写复杂度较高
- 性能开销需进一步评估

## 关键词
#LLMAgent #Governance #DeonticPolicy #AgenticAI #Security #EnterpriseAI #PolicyEngine
