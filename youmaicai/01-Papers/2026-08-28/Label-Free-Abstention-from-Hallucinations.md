# Can a Model Catch Its Own Hallucinations for Free?

## 元信息
| 标题 | Can a Model Catch Its Own Hallucinations for Free?: Label-Free Doubt Signals Hold Their Own Against a Labelled Dataset for Abstention |
|------|------|
| 作者 | Ali Asaria, Tony Salomone, Deep Gandhi |
| 链接 | [原文](https://arxiv.org/abs/2608.26121) |
| arXiv | arXiv:2608.26121v1 |
| 领域 | cs.CL, cs.LG |
| 发表 | 2026-06-19 |

## 核心贡献
1. **无标注置信信号**：利用模型自身的置信度作为"怀疑信号"，无需标注数据集
2. **LoRA 微调**：让模型在置信度高时回答，低时说"I'm not sure"
3. **与标注方法等效**：在匹配的覆盖度下，与标注数据监督的 abstention-tuning 无统计显著差异
4. **盲点识别**：置信信号无法识别" confidently wrong facts"

## 核心创新点
- **问题**：教模型在不确定时 abstaining（不回答）需要标注的正确/错误答案数据集
- **发现**：模型对自己的答案赋予的概率在答错时会下降——模型"知道"自己不知道
- **方案**：用冻结的置信度作为信号，用 LoRA 微调模型在置信度高时回答，低时说"I don't know"
- **控制实验**：用难题强化训练而非 abstaining 没有帮助，说明增益来自校准而非记忆

## 实验设置
- 6 个开源模型 (1B-8B，两个家族)
- 短格式事实问答
- 正确性由独立 judge 模型判定

## 实验结果
- 无标注方法与标注方法性能相当
- 置信信号盲点：confidently wrong facts（自信地答错）

## 建议
- **是否推荐使用**：是
- **适用场景**：减少 LLM 幻觉、提高模型可靠性
- **相关方向**：Calibration、Uncertainty Estimation、Self-Verification

---
*来源：arXiv cs.CL/cs.LG 2026-08-28 日报*
