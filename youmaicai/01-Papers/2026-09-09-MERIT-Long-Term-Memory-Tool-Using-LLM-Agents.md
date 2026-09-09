# MERIT: When Does Memory Help? A Cost-Aware Evaluation of Long-Term Memory in Tool-Using LLM Agents

## 元信息
| 标题 | When Does Memory Help? A Cost-Aware Evaluation of Long-Term Memory in Tool-Using LLM Agents |
| 作者 | Shweta Mishra, Shashank Mishra |
| 链接 | [原文](https://arxiv.org/abs/2609.05441) |
| arXiv | arXiv:2609.05441 |
| 代码 | N/A |
| 发表 | 2026-09-09 (announce), originally Jul 2026 |

## 核心贡献
1. 提出 **MERIT**（Memory Evaluation for Realistic Instrumented Tasks）：首个对工具使用 LLM Agent 中长期记忆进行成本感知评估的基准
2. 覆盖 23,440 个评分 episode（$42.57 成本），在 3 领域 episodic 工具使用任务上系统评估记忆的边际效用
3. 关键发现：embedding 检索在更新事实上表现不稳定（0.30-0.95），而 update-on-write stores（结构化事实库 + LLM 摘要）稳定在 0.70-1.00；最佳条件比全量 replay 节省 2.7-3.9 倍成本

## 核心创新点
MERIT 解决了传统记忆评估（LoCoMo, LongMemEval）只测对话历史问答、不测任务执行效果的问题。通过自动leak检查、难度阶梯、受控记忆损坏和全token/美元计量，首次量化记忆实现方案对 agent 任务成功的边际效用。

## 模型架构 / 方法
- **MERIT 基准组成**：
  - 3 领域 episodic 工具使用任务（记忆依赖性经自动 leak 检查验证）
  - 难度阶梯（最终达更新事实 recall）
  - 受控记忆损坏（controlled memory corruption）
  - 全 token + 美元计量（每记忆操作）
- **评估设置**：23,440 episodes，$42.57；3-model × 3-seed 预注册网格
  - 模型：GPT-4.1, Claude Haiku 4.5, Claude Sonnet 5
- **记忆实现对比**：
  - Embedding retrieval（embedding-based）
  - Update-on-write stores（structured fact store / LLM summarization）
  - Hybrid

## 实验结果
- 记忆 lifts dependent-task success：0.00 (floor) → **0.55-1.00**
- Updated facts: embedding retrieval 不稳定（0.30-0.95，seed gap 最高 0.45）
- Update-on-write stores 稳定在 **0.70-1.00**；hybrid 反而比单一 fact store 差
- 记忆实现切换可移动 task success **60 points**
- 最佳条件：2.7-3.9× 边际效用/美元 vs full replay

## 局限性
- 探索性研究，样本量有限
- 任务域有限（3领域）

## 关键词
#LLM-Agent #长期记忆 #工具使用 #MERIT #RAG #记忆评估 #Agent评估

---

*由 youmaicai cron 任务自动生成于 2026-09-09*
