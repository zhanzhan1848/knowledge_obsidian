# The Hitchhiker's Guide to Agentic AI: From Foundations to Systems

## 元信息

| 标题 | The Hitchhiker's Guide to Agentic AI: From Foundations to Systems |
|------|-------|
| 作者 | Haggai Roitman |
| 链接 | [原文](https://arxiv.org/abs/2606.24937) |
| arXiv | arXiv:2606.24937 |
| 类别 | cs.AI, cs.CL, cs.IR, cs.LG |
| 发表 | 2026-06-22 |

## 核心贡献

1. **全面实践指南**：覆盖 Agentic AI 从基础到生产部署的全栈知识
2. **LLM 基座层**：Transformer 架构、GPU 系统、SFT/LoRA/MoE 微调、模型压缩、推理优化
3. **对齐与推理层**：RLHF、PPO、DPO 及其变体、GRPO、奖励建模、CoT、测试时 scaling
4. **Agentic AI 层**：Agentic RAG、记忆系统（上下文/外部/情景/语义）、MCP 协议、A2A 协议、多智能体架构
5. **生产部署**：开发框架、Agentic UI 设计、评估方法论

## 模型架构

- Transformer 作为 LLM 基座
- MoE (Mixture of Experts) 用于模型扩展
- 测试时 scaling (Test-time scaling) 用于推理

## 训练方法

- **SFT** (Supervised Fine-Tuning)
- **LoRA** (Low-Rank Adaptation)
- **RLHF**: PPO, DPO, GRPO
- Chain-of-Thought (CoT) prompting
- 轨迹级 RL (Trajectory-based RL)

## 关键技术

### 记忆系统
- In-context memory
- External memory
- Episodic memory
- Semantic memory

### 协议与协调
- **MCP** (Model Context Protocol): Agent 与工具/技能的交互协议
- **A2A** (Agent-to-Agent): 多 Agent 通信协议
- 多智能体拓扑: centralized, decentralized, hierarchical

### RAG
- 标准 RAG + Agentic RAG
- Context management

## 局限性

- 综合性书籍/参考资料，非原创性研究论文
- 侧重实践指导，理论深度有限

## 建议

- **是否推荐使用**：是
- **适用场景**：构建 Agentic AI 系统的工程师和研究人员；快速了解 Agentic AI 全栈知识的从业者
- **备注**：每个章节包含理论+代码实现+参考文献，适合作为工程实践的参考手册