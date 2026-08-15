# Is Convergence Inevitable? Tracing Output Homogeneity Back to Base Models

## 元信息
| 标题 | Is Convergence Inevitable? Tracing Output Homogeneity Back to Base Models |
| 作者 | Hazel Chen, Alexandrine Fortier, Peter West |
| 机构 | University of British Columbia |
| 链接 | [原文](https://arxiv.org/abs/2608.11426) |
| arXiv | arXiv:2608.11426 [cs.CL] |
| 版本 | v1 (2026-08-11) |
| 代码 | 未找到公开代码仓库 |

## 核心贡献
1. **语义收敛始于 SFT**：在第一个对齐阶段（监督微调 SFT）就已观察到显著的输出收敛，远早于 DPO 和 RL 阶段
2. **同质化根源于预训练**：输出同质化很可能在预训练阶段已习得，对齐过程只是揭示或放大了这一现象
3. **纯 Prompt 即可诱导收敛**：无需任何对齐，仅通过特定 Prompt 条件即可在 Base Model 上诱导出类似 Instruct 的收敛行为
4. **SFT 是催化剂而非原因**：SFT 数据可以放大已存在的收敛模式，但无法引入全新的收敛模式

## 关键发现

### 2. 对齐各阶段的收敛情况
- 使用 Infinity-Chat100（100 个开放式问题）评估 Tülu 3（8B/70B）和 OLMo 3（7B/32B）
- SFT 后平均成对余弦相似度已高度右偏，大量查询集中在 >0.7
- DPO 和 RLVR 仅进一步小幅右移，对收敛 ranking 的影响很小（Spearman ρ = 0.87–0.99）
- 示例：不同阶段的模型对同一 Prompt 的回答读起来像是彼此的改写

### 3. SFT 能做什么 vs 不能做什么（比喻生成实验）
- **方法**：使用比喻生成（[topic] is a [vehicle]...）作为探测任务，在 LIMA 数据集上注入受控的比喻
- **Structure 实验**：仅注入格式（不含任何目标比喻），发现仅暴露格式就足以揭示预训练的偏好车辆
- **Idea Injection 实验**：注入不同收敛度（最常见、第2常见、第6常见、不在分布内）的车辆
  - 收敛度越高的车辆，强化效果越强（48–92%）
  - 分布外车辆（食物相关）完全无法被习得，模型仍收敛到原有车辆
  - 结论：**收敛可被放大但无法被引入**
- **附录 E**：分布外车辆在高频注入（5–7 次重复）后可被学会，但分布内车辆仅需 1 次即可

### 4. Base Model 的收敛
- 在 Llama 3.1 8B Base 上，使用 few-shot 和 assistant prompting 条件可诱导 instruct-like收敛
- PCA 可视化显示"time"比喻形成两个紧凑簇（river 和 thief）
- 基础 Prompt 条件下输出更多样，但格式混乱；assistant prompting 格式最整齐、收敛最强
- few-shot 示例的选择影响车辆分布（自然主题示例会转移至自然相关车辆），说明 Base Model 中存在多个潜在偏好

## 局限性
- 主要在比喻生成任务上验证，结论对其他开放式生成任务的泛化性需进一步研究
- Base Model 评估需要任务特定 Prompt，与 instruction-following checkpoint 的直接比较存在 confound
- 未探索缓解收敛的有效方法（论文仅指出 post-alignment 干预可能不够）

## 核心结论
> Semantic convergence may arise naturally from the objectives underlying LM training, making it difficult to mitigate through post-alignment interventions alone.

收敛模式在预训练中已以潜在形式存在，指令微调通过激活预训练已编码的模式来揭示和放大它们，而非引入新的收敛。SFT 的主要作用不仅是教会指令跟随，还可能以收敛开放域生成为代价。Post-alignment 干预（如 diversity-promoting 解码策略）可能不足以解决问题。

## 实验配置
- **SFT 实验**：Llama-3.1 8B Base + LoRA（r=64），15 epochs，checkpoint 选自 epoch 10–15
- **评估指标**：mean pairwise cosine similarity（OpenAI text-embedding-3-small）
- **采样参数**：temperature=1.0, top_p=0.9

## Tags
#LLM #alignment #convergence #SFT #output-homogeneity #pretraining
