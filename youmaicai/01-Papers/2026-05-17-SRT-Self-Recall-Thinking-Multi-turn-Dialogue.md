# SRT: Self-Recall Thinking for Multi-turn Dialogue

> 🥬 LLM 论文分析：多轮对话一致性 + 长程上下文依赖

## 基本信息
- **作者**: Renning Pang et al.
- **发表**: arXiv, 2026-05-14
- **链接**: [原文](https://arxiv.org/abs/2605.15102) | [PDF](https://arxiv.org/pdf/2605.15102)
- **arXiv**: arXiv:2605.15102 [cs.CL]

## 核心贡献

### 核心创新点
提出 **Self-Recall Thinking (SRT)** 框架，解决多轮对话中的长程上下文依赖和稀疏信息信号问题。通过内生推理过程整合可解释的召回步骤，无需外部记忆模块。

### 问题背景
- LLM 多轮对话系统在追踪非相邻轮次间的依赖关系时表现不佳
- 随着对话长度增加，关键信息变得稀疏，被无关内容埋没
- 传统解决方案依赖高延迟外部记忆或通过迭代摘要损失细粒度细节

### SRT 三阶段框架

1. **Dependency Construction（依赖构建）**
   - 生成 self-recall chains，将历史依赖关系编码

2. **Capability Initialization（能力初始化）**
   - 训练模型启用 recall tokens 的推理链能力

3. **Reasoning Improvement（推理改进）**
   - 通过可验证奖励 (verifiable rewards) 优化召回和推理
   - 提升正确答案的准确率

### 关键设计
- **Recall Tokens**：特殊 token 触发历史信息检索
- **Endogenous Reasoning**：推理过程完全在模型内部完成
- **无需外部模块**：避免额外记忆系统的高延迟开销

### 实验结果

| 指标 | 改进 |
|------|------|
| F1 Score | +4.7% |
| End-to-end Latency | -14.7% |

同时实现推理延迟和准确率的平衡，优于 SOTA 基线。

## 局限性
- Recall tokens 的训练需要额外监督数据
- 对极端长对话（>50轮）的效果未充分验证

## 建议
- **是否推荐使用**: 是（多轮对话系统、客服 Agent）
- **适用场景**: 长程对话系统、上下文受限的生产部署、需要平衡延迟和准确率的场景

## 标签
#LLM #dialogue #long-context #reasoning #self-recall