# Orchestra-o1: Omnimodal Agent Orchestration

## 元信息
| 标题 | Orchestra-o1: Omnimodal Agent Orchestration |
|------|------|
| 作者 | Fan Zhang, Vireo Zhang, Shengju Qian, Haoxuan Li, Hao Wu, Jinyang Wu, Donghao Zhou, Zhihong Zhu, Zheng Lian, Xin Wang, Pheng-Ann Heng |
| 链接 | [原文](https://arxiv.org/abs/2606.13707) |
| arXiv | arXiv:2606.13707 |
| 领域 | cs.AI, cs.CL, cs.CV |
| 日期 | 2026-06-15 |

## 核心贡献
1. 提出 **Orchestra-o1**：首个支持 text/image/audio/video 全模态的 agent 编排框架
2. 在 **OmniGAIA benchmark** 上比第二名高 **10.3%** 准确率
3. 提出 **DA-GRPO（Decision-Aligned Group Relative Policy Optimization）**：高效 agentic RL 方法
4. Orchestra-o1-8B 达到开源 omnimodal agent SOTA

## 核心方法

### Orchestra-o1 编排机制
- **Modality-aware Task Decomposition**：模态感知任务分解
- **Online Sub-agent Specialization**：在线子 agent 特化
- **Parallel Sub-task Execution**：并行子任务执行
- 可扩展设计支持异构信息源的复杂真实世界任务

### DA-GRPO
Decision-Aligned Group Relative Policy Optimization
- 高效 agentic RL 方法，用于训练 Orchestra-o1-8B
- 将 decision alignment 融入 GRPO

## 关键创新
1. **Omnimodal 场景**：现有编排框架仅支持有限模态，Orchestra-o1 突破至全模态
2. **Scalable Design**：在线特化 + 并行执行
3. **高效 RL**：DA-GRPO 在 8B 规模实现 SOTA

## 局限性
- 完整评估需更多真实世界 omnimodal 场景
- 子 agent 数量增加时的调度开销未深入讨论

## 建议
- **适用场景**：多模态 AI Agent、复杂任务分解、跨模态协作
- **推荐指数**：⭐⭐⭐⭐⭐（多模态 agent 编排的重要进展）