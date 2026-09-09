# AhaBench: Do Agents Learn from Prior Experience? A Benchmark for Long-Horizon Continual Learning

## 元信息
| 标题 | Do Agents Learn from Prior Experience? A Benchmark for Long-Horizon Continual Learning |
| 作者 | Zerui Cheng, Jiawei Xu, Huacan Chai, Jiayang Sun, Pramod Viswanath, Maxm Pan |
| 链接 | [原文](https://arxiv.org/abs/2609.05435) |
| arXiv | arXiv:2609.05435 |
| 代码 | N/A |
| 发表 | 2026-09-09；submitted to TMLR |

## 核心贡献
1. 提出 **AhaBench**：评估固定模型在获得有用经验后，是否在相关评估条件（支持被移除/改变/延迟）下改进行为
2. 三组件基准：Aha-Puzzle（隐藏态谜题无提示探索）/ Aha-Euler（数学教学迁移）/ Aha-Vending（延迟反馈模拟销售）
3. 三段式评分卡：Initial Score / Post-Experience Score / **Learning Lift**（核心指标）
4. Claude Opus 4.6 领先：Post-Experience Score **64.3**，Learning Lift **+25.8**

## 核心创新点
AhaBench 的核心问题不是"模型能否解决问题"，而是"经验是否转化为泛化能力"——即支持被移除后模型行为是否改善。这是首个系统区分"会用支持"、"达到高分"、"真正学会"的 agent 持续学习基准。

## 模型架构 / 方法
- **Aha-Puzzle**：无提示探索测试（去除 hint 后探索行为）
- **Aha-Euler**：Project-Euler 风格数学任务，教/保留任务 with exact validators
- **Aha-Vending**：Vending-Bench 开源实现，延迟反馈 + 运营事故处理
- **评分卡**：
  - Initial Score：起始能力
  - Post-Experience Score：经验后结果
  - Learning Lift = 两者之差（核心）
- **8 模型面板**：Claude Opus 4.6 / Gemini 3.1 Pro 等

## 实验结果
- **Claude Opus 4.6**：Post-Experience 64.3，Learning Lift **+25.8**
- **Gemini 3.1 Pro**：Post-Experience 63.4（close behind）
- Aha-Euler full teaching：78.6-100.0%；answer-only transfer：0.0-73.9%
- Aha-Puzzle：supported scores 提高但无提示探索行为转化率低
- Aha-Vending：盈利事故处理 vs 破产 / 无订单失败 分离明显

## 局限性
- 仅 8 模型评估，待扩展
- 子任务样本量有限

## 关键词
#LLM-Agent #持续学习 #Agent评估 #AhaBench #长时域任务 #经验学习 #基准

---

*由 youmaicai cron 任务自动生成于 2026-09-09*
