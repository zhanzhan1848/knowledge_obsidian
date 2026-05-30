# AXPO: Agent Explorative Policy Optimization for Multimodal Reasoning

## 元信息
| 标题 | Agent Explorative Policy Optimization for Multimodal Agentic Reasoning |
|------|------|
| 作者 | Byung-Kwan Lee |
| 链接 | [原文](https://arxiv.org/abs/2605.28774) |
| arXiv | arXiv:2605.28774 |
| 发表 | 2026-05-27 (v1) |
| 领域 | cs.CL |
| 项目 | [Project Page](https://byungkwanlee.github.io/AXPO-page/) |

## 核心贡献

1. **Thinking-Acting Gap**: 识别 agentic 推理中的结构性不对称——thinking vs tool use
2. **AXPO (Agent eXplorative Policy Optimization)**: 针对 all-wrong tool-using 子组
   - 修复 thinking prefix
   - 重采样 tool call 及其延续
   - 配合不确定性感知的 prefix 选择

## 问题分析

### 标准 RL 症状 (GRPO)
- 仅 ~30% rollouts 尝试工具使用
- 当尝试时，all-wrong 问题占 ~40%，抑制学习信号

### 原因
- Thinking 是自包含的默认行为
- Tool Use 是高方差辅助行为

## 实验结果

### 九个多模态基准
- 三个规模的 Qwen3-VL-Thinking

### 性能提升
- SFT+AXPO vs SFT+GRPO: **+1.8pp Pass@1, +1.8pp Pass@4** (8B 平均)
- 8B 超越 32B Base (Pass@4)，参数减少 4 倍

## 关键词
#Multimodal #Agent #RL #Tool-Use #GRPO #AXPO