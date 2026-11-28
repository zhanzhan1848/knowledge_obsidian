# Rethinking Reasoning Effort Training in Large Language Models: On-Policy Distillation or Reinforcement Learning?

## 元信息
| 项目 | 内容 |
|------|------|
| **arXiv** | [2611.32131](https://arxiv.org/abs/2611.32131) |
| **分类** | cs.LG, cs.LG |
| **作者** | Tianliang Lv, Hao Li, Xinchao Xu, Zhengkun Zhang, Ju Huo |
| **提交日期** | 2026-11-24 |
| **类型** | Technical Report |
| **链接** | [原文](https://arxiv.org/abs/2611.32131) |

## 核心贡献

1. **系统对比「长度惩罚 RL」与「多教师 on-policy 蒸馏（OPD）」两种控制推理算力的手段**，发现二者由**不同的训练信号**支配，因此适用于不同的目标。
2. **给出关键机制解释**：序列级奖励无法区分「tier 特有行为」与「共享行为」，而 OPD 在每个被访问的状态上（包括「决定停止」这个决策本身）提供 tier 特有的目标。
3. **两个「够用」的简化方案**：单一 token 级 KL 锚点（锚在 high tier）即可在**一个 RL 阶段内**学出分离的 tier；以及用自然语言 effort 指令让分离**从训练一开始就出现**，达到与多教师 OPD 在同等思考长度下有竞争力的策略。

## 核心结论与数据

- **长度惩罚 RL 可靠地压缩单个策略**：AIME25 上思考量减少 **70%** 且不损失准确率；**但联合训练时会「塌陷」（collapse）各 tier**。
- **多教师 OPD 分离 tier**：跨 **33 个基准**，low / medium 相对 high 分别少用 **58% / 43%** 的思考 token，同时 high tier 相对参考策略**提升 3.1 分**。
- **泛化性警告（本文最重要的一条）**：由稠密目标（OPD）建立的分离**只在训练时见过的状态上成立**，**无法迁移到未见过的 agentic 任务**；在 agentic 场景中 effort 主要通过**交互轮数**起作用。而**序列级奖励诱导的压缩反而可以迁移**。

## 方法要点

### 三层 effort tier 的信号来源
| 手段 | 监督粒度 | 能分离 tier？ | 能否迁移到未见任务？ |
|------|-----------|--------------|-------------------|
| 长度惩罚 RL（序列级奖励） | episode 级 | ❌ 联合训练会塌陷 | ✅ 压缩可迁移 |
| 多教师 OPD | 每个 visited state（含停止决策） | ✅ | ❌ 仅在训练状态上成立 |

### 简化方案 A：单 token 级 KL 锚点
不采用多教师，只需在 high tier 上加一个 token 级 KL 锚点，即可在**单个 RL 阶段**内学出分离的 effort tier。

### 简化方案 B：自然语言 effort 指令
把 effort 差异直接写进 prompt（如「多思考/少思考」），分离在训练初始即涌现，达到与多教师 OPD 在**匹配思考长度**下的竞争性。

## 局限与思考

- 「稠密目标不迁移、稀疏目标可迁移」这个反差有点反直觉：直觉上更密集的监督应该泛化更好。作者的解释是 dense target 把 tier 行为**绑定到训练分布的状态**上，而 sequence-level reward 改变的是**全局的长度偏好**，因此是分布无关的。这对实践者的含义是：**若目标是 agentic 长任务上的算力控制，dense distillation 未必是对的工具**。
- 论文只报告了 AIME25 与 33 个基准的汇总，tier 内部（low/medium）的行为差异刻画不够细。

## 建议
- **是否推荐使用**：✅ 值得读（推理算力控制是部署刚需）
- **适用场景**：需要在同一模型内提供多档「思考预算」的 API 产品；agentic 长任务调度
- **关键提醒**：不要默认 dense target = better generalization
