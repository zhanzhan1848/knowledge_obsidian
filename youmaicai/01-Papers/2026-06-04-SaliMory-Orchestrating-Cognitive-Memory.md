# SaliMory: Orchestrating Cognitive Memory for Conversational Agents

## 元信息
| 标题 | SaliMory: Orchestrating Cognitive Memory for Conversational Agents |
|------|------|
| 作者 | Kai Zhang, Xin Luna Dong et al. |
| 链接 | [原文](https://arxiv.org/abs/2606.04120) |
| arXiv | arXiv:2606.04120 |
| 代码 | - |
| 领域 | cs.CL, cs.AI |
| 发表 | 2026-06-02 |

## 核心贡献
1. 提出 SALIMORY 框架，用单一语言模型管理认知结构化记忆（用户事实、偏好、工作记忆）
2. 引入 **Hierarchical Stage-wise Process Reward**：为不同的记忆操作（选择性过滤、巩固、线索驱动召回）提供独立监督
3. 提出 **Reward-Decomposed Contrastive Refinement**：解决多阶段 pipeline 中的严重信用分配瓶颈
4. 在端到端准确率上超越 SOTA 超过 10%，Good Personalization rate 翻倍以上，记忆相关失败减少 1/3

## 核心问题
- 简单扩展 context window + raw retrieval 会降级推理质量
- 标准 RL 训练记忆 agent 在多阶段 pipeline 中面临严重的信用分配瓶颈

## 方法

### 三种记忆操作
1. **Selective Filtering（选择性过滤）**：判断哪些信息值得记忆
2. **Consolidation（巩固）**：将新信息整合进长期记忆
3. **Cue-driven Recall（线索驱动召回）**：根据当前上下文线索提取相关记忆

### 关键设计
- Hierarchical stage-wise process reward：为每个记忆操作阶段提供独立的密集奖励
- Reward-decomposed contrastive refinement：区分不同操作的信用分配

## 实验结果
- Memory-attributed failures 减少 1/3
- 端到端准确率提升超过 10%
- Good Personalization rate 翻倍以上

## 相关标签
#LLM #conversational-agents #memory #personalization #reinforcement-learning #credit-assignment