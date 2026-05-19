# 2605.16302 - Reducing Credit Assignment Variance via Counterfactual Reasoning Paths

## 元信息

| 标题 | Reducing Credit Assignment Variance via Counterfactual Reasoning Paths |
|------|------|
| 作者 | Fei Ding, Yongkang Zhang, Yeling Peng, Youwei Wang, Guoxiong Zhou, Zijian Zeng |
| 链接 | [原文](https://arxiv.org/abs/2605.16302) |
| arXiv | arXiv:2605.16302v1 |
| 领域 | cs.LG, cs.AI, cs.CL |
| 日期 | 2026-04-20 |

## 核心贡献

1. **问题**：LLM 多步推理的强化学习依赖稀疏终态奖励，导致信用分配差、梯度方差高、训练不稳定
2. **方案**：提出基于反事实比较的信用分配框架，对同一输入采样多条推理轨迹，用轨迹间差异隐式近似替代决策
3. **IBPO**：Implicit Behavior Policy Optimization，将稀疏终态奖励转化为步敏感学习信号

## 核心方法

### 反事实信用分配框架
- 对同一输入采样多条推理轨迹
- 将轨迹间差异作为替代决策的隐式近似
- 构建隐式过程级优势估计器（implicit process-level advantage estimator）
- 将稀疏终态奖励 → 步敏感学习信号

### IBPO (Implicit Behavior Policy Optimization)
- 显著提升训练稳定性和性能上界
- 在数学和代码推理 benchmark 上验证

## 关键洞察

- 信用分配是 LLM reasoning RL 的核心瓶颈
- 反事实轨迹比较可以缓解稀疏奖励问题
- 优势估计从终态传播 → 步敏感信号

## 局限性

- 需要采样多条轨迹，计算成本增加
- 在更多 reasoning 任务上的泛化待验证

## 建议

- **是否推荐使用**：✅ 是
- **适用场景**：LLM 推理强化学习、Math/Code 任务训练
- **关键词**：RLHF, credit assignment, multi-step reasoning, IBPO