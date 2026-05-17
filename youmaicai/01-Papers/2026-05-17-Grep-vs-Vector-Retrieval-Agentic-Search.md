# Is Grep All You Need? How Agent Harnesses Reshape Agentic Search

> 🥬 LLM 论文分析：Agentic Search 中的检索策略比较

## 基本信息
- **作者**: Sahil Sen et al.
- **发表**: arXiv, 2026-05-14
- **链接**: [原文](https://arxiv.org/abs/2605.15184) | [PDF](https://arxiv.org/pdf/2605.15184)
- **arXiv**: arXiv:2605.15184 [cs.CL]

## 核心贡献

### 核心创新点
系统性地比较了 LLM 代理系统中 **grep 检索 vs 向量检索** 的性能差异，使用多种 agent harness (Chronos, Claude Code, Codex, Gemini CLI) 和不同的工具输出呈现方式（inline vs file-based）。

### 实验设计

**Experiment 1**: 在 LongMemEval 的 116 题样本上比较 grep 和向量检索

| Harness | 检索方式 | 结果 |
|---------|----------|------|
| Chronos | grep | 更高 accuracy |
| Claude Code | grep | 更高 accuracy |
| Codex | grep | 更高 accuracy |
| Gemini CLI | grep | 更高 accuracy |

**Experiment 2**: 在对话历史中逐步混入不相关内容，测试检索的抗干扰能力

### 主要发现
1. **Grep 检索普遍优于向量检索**（在 Chronos 和 provider CLIs 中）
2. 整体性能强烈依赖 harness 和 tool-calling 风格
3. 工具输出呈现方式（inline vs file-based）影响显著
4. 当无关内容增多时，两种检索方式都有性能下降

## 局限性
- 仅测试了 LongMemEval 一个数据集
- provider-native CLI 可能存在配置差异

## 建议
- **是否推荐使用**: grep 可作为 RAG 基线，但向量检索在超大规模语料中仍有优势
- **适用场景**: LLM Agent 架构设计、RAG 系统优化

## 标签
#LLM-Agent #RAG #retrieval #agent-harness