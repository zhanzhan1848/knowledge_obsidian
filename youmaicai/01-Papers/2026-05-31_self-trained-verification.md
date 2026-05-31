# Self-Trained Verification for Training- and Test-Time Self-Improvement

## 元信息
| 标题 | Self-Trained Verification for Training- and Test-Time Self-Improvement |
| 作者 | Chen Henry Wu et al. |
| 发表 | Preprint |
| 链接 | [原文](https://arxiv.org/abs/2605.30290) |
| arXiv | arXiv:2605.30290 |

## 核心贡献
1. **问题**：V-R 循环和自训练方法都受同一瓶颈——验证器（verifier）限制
   - V-R 循环：验证器分数膨胀而准确率停滞，反馈太通用而无法行动
   - 自训练：坏的自我生成数据加入训练导致失败
2. **核心观察**：模型无法单独发现错误，但展示参考解决方案时可以——将这种不对称性转化为监督目标
3. **提出 Self-Trained Verification (STV)**：训练验证器模仿更明智的版本
4. **提出 Verifier-in-the-Loop Training (ViL)**：在 V-R 循环内使用 STV 验证器反馈进行 RL 训练

## 实验结果

**Test-time (STV):**
- 硬数学题：准确率约翻倍
- 科学推理任务：1.5% → 21%（14x 提升）

**Training-time (ViL):**
- 从 RL收敛的生成器开始，pass@1 进一步提升 33%
- Generator 独立 pass@1（测试时无验证器）比标准 RL 高30%

## 核心洞察
> "下一个推理难题的突破口可能在于我们如何训练和使用验证器"

## 标签
#self-improvement #verification #reasoning #reinforcement-learning