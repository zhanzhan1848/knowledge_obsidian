# Committed Before Reasoning: Answer Pre-Commitment in LLM

## 元信息
| 标题 | Committed Before Reasoning: Behavioral Reproduction and Preliminary Activation-Level Evidence of Answer Pre-Commitment in an Open-Weight LLM |
|------|------|
| 作者 | Heejin Jo |
| 链接 | [原文](https://arxiv.org/abs/2607.16451) |
| arXiv | arXiv:2607.16451v1 |
| 代码 | [GitHub](https://github.com/JO-HEEJIN/interview_mate/tree/docs/car-wash-repro/car_wash/paper_4) |
| 领域 | cs.CL, cs.AI |
| 发表日期 | 2026-07-17 |

## 核心贡献
1. 发现 Chat 模型有时在生成推理之前就承诺了答案，然后用推理来证明而非推导
2. 在 Qwen3-8B 上复现该现象（85-100% 的采样rollout 和 100% 的贪婪 rollout）
3. 提出激活级证据：使用无训练激活预言机探测隐藏状态
4. 发现即使最终回答"drive"的rollout，在承诺前也读取为"walk"倾向

## 最小探测
问题："I want to wash my car. The car wash is 100 meters away. Should I walk or drive?"
- 只有 drive 正确（车必须在洗车处）
- 但模型绝大多数推荐 walk

## 行为复现结果
在 Qwen3-8B 上，五种系统提示条件（210 rollouts）：
- 错误承诺出现在 85-100% 的采样 rollouts/条件
- 100% 的贪婪 rollouts
- 思考和非思考模式下均出现
- 4,096-token 思考预算无法修复

## 激活级证据
使用预训练、无训练的激活预言机（无任务特定探针训练）：
- 在答案文本发出之前的隐藏状态位置探测
- "walk" 读数超过中性上下文基线（68% vs 17%）
- walk-commit rollouts p=.005，drive-committing rollouts p=.005
- 值得注意的是，即使最终回答 drive 的 rollouts，承诺前也读取为 walk 倾向（5/6）

## 关键发现
1. 预言机的默认设置是 "drive" (83%)，所以读数不是词汇偏差
2. 文本恢复也无法解释（包含 "drive" 的 spans 仍读出 walk）
3. 即使在平衡词汇领域，per-rollout walk-majorities 超过 per-prompt 中性基线 15/22 vs 1/8 (p=.01)
4. 问题措辞alone moves positive control: 2/16 (开放问题) → 11/16 (封闭问题)

## 方法论贡献
- 使用固定预言机、激活和位置，问题措辞alone影响结果
- 负面预言机结果在没有 per-wording 正面控制的情况下无法解释

## 建议
- **是否推荐使用**：是（作为 LLM 推理机制研究）
- **适用场景**：可解释 AI、LLM 认知机制研究、模型对齐

---
*关键词*: LLM Reasoning, Answer Commitment, Activation Analysis, Interpretability, Qwen3
