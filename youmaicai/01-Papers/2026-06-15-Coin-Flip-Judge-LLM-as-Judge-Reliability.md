# The Coin Flip Judge? Reliability and Bias in LLM-as-a-Judge Evaluation

## 元信息
| 标题 | The Coin Flip Judge? Reliability and Bias in LLM-as-a-Judge Evaluation |
|------|------|
| 作者 | Abel Yagubyan |
| 链接 | [原文](https://arxiv.org/abs/2606.13685) |
| arXiv | arXiv:2606.13685 |
| 领域 | cs.CL, cs.AI |
| 日期 | 2026-06-15 |

## 核心贡献
1. 首次系统研究 LLM-as-a-Judge 的**运行间可靠性（run-to-run reliability）**
2. 发现 pairwise 判断在相同输入下平均 13.6% 翻转，28% 问题超 20% 翻转率，最高 56%
3. 发现 GPT-4o-mini 存在显著的**首位置偏置**（72% A-majority）
4. 提出**多轮投票 + 位置随机化 + 不确定性报告**应成为最佳实践

## 实验设置
- **Judge 模型**：GPT-4o-mini 和 GPT-4.1-mini（OpenAI）
- **数据集**：29 个任务，10 个类别，每个问题 50 次 pairwise + 50 次 pointwise 试验
- **消融实验**：temperature 敏感性和 prompt 敏感性

## 关键发现

### 1. 高度不稳定（Within-judge instability）
- Pairwise preference 平均翻转率：**13.6%**
- 28% 问题翻转率超 20%，最高达 **56%**
- Pointwise 分数差很小（0.19-0.36 / 10 分），聚合后不显著
- **Pairwise-Pointwise gap**：Judge 频繁选出胜者，但自身分数差并不能证明质量差异

### 2. 位置偏置（Position bias）
- GPT-4o-mini 显著首位置偏置：**72% 选 A**（p = 0.024）

### 3. 跨 Judge 不一致（Cross-judge agreement）
- 跨 judge 一致率仅 **76%**（κ = 0.51）
- 语义等价的不同 prompt 模板改变 25% 案例的多数结论
- 确定性解码（temperature=0）减少但不消除不一致性

### 4. 可靠性曲线
- 需要 **11 次重复试验**才能以 95% 概率恢复 50 次参考判断
- 高方差问题需要 **15 次**

## 实践建议
1. **多轮聚合**：单次 LLM 判断噪声过大，多次试验取投票
2. **位置随机化**：AB 顺序随机化避免位置偏置
3. **不确定性报告**：显式报告判断置信度
4. **跨 provider 复现**：目前仅测试 OpenAI judge，需扩展

## 局限性
- 仅测试 OpenAI judge，Google/Anthropic/Meta 模型待验证
- 高风险评估场景（如论文接收、RL 训练）需更严格实践

## 建议
- **适用场景**：LLM 评估、模型排名、Reward Model 训练
- **推荐指数**：⭐⭐⭐⭐⭐（对 LLM-as-a-Judge 实践有重要警示意义）