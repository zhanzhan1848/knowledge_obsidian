# RepSelect: Robust LLM Unlearning via Representation Selectivity

## 元信息
| 标题 | RepSelect: Robust LLM Unlearning via Representation Selectivity |
|------|-----|
| 作者 | Filip Sondej, Yushi Yang, Adam Mahdi |
| 链接 | [原文](https://arxiv.org/abs/2606.17168) |
| arXiv | arXiv:2606.17168 |
| 领域 | cs.CL |

## 核心贡献
1. 识别现有方法的根本问题：目标表示与 retain set 和 fine-tuning 攻击者恢复的子空间共享
2. 提出 **RepSelect (Representation Selectivity)**：通过在每次更新前折叠权重梯度的 top principal components 隔离 forget-set 特异性表示
3. 保持通用能力完整，同时限制微调可恢复的内容

## 核心问题
- LLM 深度遗忘特定知识和价值观同时不牺牲通用能力仍是核心挑战
- 当前方法容易被微调或 few-shot 提示反转，说明遗忘只是浅层的
- 原因：目标表示与 retain set 和攻击者恢复子空间共享

## 方法
### RepSelect
1. 在每次更新前折叠权重梯度的 top principal components
2. 隔离 forget-set 特异性表示
3. 保持与 retain set 共享的表示完整
4. 限制 fine-tuning 可恢复的内容

### 与基线对比
| 方法 | 描述 |
|------|------|
| GradDiff | 梯度差异 |
| NPO | 负偏好优化 |
| SimNPO | 类似 NPO |
| RMU | Representation Matching Unlearning |
| UNDIAL | 统一对齐方法 |

## 实验结果
### 遗忘类别
- 生物危害知识
- 滥用倾向

### 模型家族
- Dense: Llama 3, Qwen 3.5
- MoE: Gemma 4 E4B, DeepSeek V2 Lite

### 性能提升
- 相比最强基线，post-relearning 准确率降低 **4-50x**
- 对 few-shot 提示攻击接近完美鲁棒

## 结论
- 目标选择性表示是实现深度鲁棒 LLM 遗忘的重要步骤
- RepSelect 通过隔离特异性表示避免浅层遗忘

## 关键词
`LLM Unlearning` `Machine Unlearning` `Representation Learning` `Fine-tuning Resistance` `RepSelect` `Model Security