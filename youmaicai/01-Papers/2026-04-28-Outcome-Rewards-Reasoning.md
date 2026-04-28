# Outcome Rewards Do Not Guarantee Verifiable or Causally Important Reasoning

## 元信息
| 标题 | ... |
|------|-----|
| 作者 | Qinan Yu 等 |
| 链接 | [原文](https://arxiv.org/abs/2604.22074) |
| arXiv | arXiv:2604.22074 |
| 领域 | RLVR / Chain-of-Thought / Reasoning |

## 核心贡献
1. 质疑 RLVR（Reinforcement Learning from Verifiable Rewards）训练思维链的常见假设
2. 提出两个评估指标：**Causal Importance of Reasoning (CIR)** 和 **Sufficiency of Reasoning (SR)**
3. 在 Qwen2.5 系列和 ReasoningGym 任务上验证

## 核心发现

### CIR (Causal Importance of Reasoning)
- 衡量推理 tokens 对最终答案的累积效应

### SR (Sufficiency of Reasoning)
- 衡量验证器仅凭推理能否得出明确答案

### 主要结论
1. RLVR 确实提升任务准确率，但不可靠地提升 CIR 或 SR——质疑推理在模型性能中的角色
2. 少量 SFT 在 RLVR 之前可补救低 CIR 和 SR
3. 在 outcome reward 基础上添加辅助 CIR/SR reward 可改善，即使没有 SFT

## 意义
表明 RLVR 并不总是按通常设想的方式使模型依赖推理，但可通过简单后训练修改解决

## URL
https://arxiv.org/abs/2604.22074