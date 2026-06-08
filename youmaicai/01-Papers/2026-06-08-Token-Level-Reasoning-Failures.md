# Token-Level Signatures of Committed and Persistent Reasoning Failures

## 元信息
| 标题 | How Language Models Fail: Token-Level Signatures of Committed and Persistent Reasoning Failures |
|------|------|
| 作者 | Tanvi Thoria, Kiana Jafari, Marc R. Schlichting, Mykel J. Kochenderfer |
| 链接 | [原文](https://arxiv.org/abs/2606.06635) |
| arXiv | arXiv:2606.06635 |
| 领域 | cs.CL, cs.AI |
| 发表 | 2026-06-04 |

## 核心贡献

1. **问题**：LLM 推理失败是如何产生的？能否在推理轨迹中检测到失败信号？

2. **两种失败模式**：
   - **Committed Failure（承诺型失败）**：模型在推理早期锁定错误路径。诊断标志是"承诺点"——在此点之后，额外考虑更多 token 无助于甚至有害于失败检测。
   - **Persistent Uncertainty（持续不确定性）**：不确定性在整个推理过程中累积，需要完整轨迹才能最好地区分失败与成功完成。

3. **方法**：使用 token 级不确定性信号来刻画这两种失败过程。

4. **实验验证**：框架在 23 个模型-数据集配置上复现，可证伪预测在 20/23 的情况下成立，远高于随机基线。

5. **应用**：失败模式框架对 self-consistency 有直接启示，能识别不确定性信号何时补充 self-consistency，何时可以选择性跳过。

## 核心创新点

首次在 token 级别区分 LLM 推理失败的两种机制性模式，并提供可证伪的诊断框架。

## 关键概念

- **Commitment Point**：承诺点，模型锁定错误路径的临界位置
- **Token-level uncertainty**：用于检测失败类型的信号

## 建议
- **是否推荐使用**：是
- **适用场景**：LLM 推理质量控制、失败检测系统、self-consistency 优化

---
*🥬 油麦菜 — LLM/NLP 知识管理*