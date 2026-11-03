# Capacity Planning for Resource-Constrained Clinical LLM Serving

## 元信息
| 属性 | 值 |
|------|-----|
| 标题 | Capacity Planning for Resource-Constrained Clinical LLM Serving |
| 作者 | Yi Tang, Geoffrey Martin, Yiye Zhang, Yifan Peng |
| 链接 | [原文](https://arxiv.org/abs/2611.01152) |
| arXiv | arXiv:2611.01152 |
| 类别 | cs.AI, cs.PF |
| 发表时间 | 2026-10-31 |
| 会议 | Accepted to the 9th Special Session on Healthcare Data at the 2026 IEEE International Conference on Big Data (IEEE BigData 2026) |
| 评分 | 7 |

## 核心贡献
1. **把"车队构成（fleet composition）"与"路由（routing）"置于同一受资源约束的优化框架中**，研究二者在固定加速器预算下的相对重要性——这是既有 LLM 路由与 serving 效率文献中相对欠研究的问题。
2. **受控四 GPU 实验环境**：在异构临床 NLP 负载（短事实核查、生物医学语义匹配、长上下文临床摘要）上，系统变化车队构成、路由策略与到达负载，**固定工作负载 trace 与硬件预算**。
3. **实证结论：车队构成的方差贡献大于路由策略**——在 24 组配置下，描述性主效应份额（descriptive main-effect shares）显示，车队构成对 **TTFT（time to first token）、延迟、长上下文覆盖率**的变异解释力都超过所评估的路由策略。
4. **刻画"强模型瓶颈"并给出 capacity-aware routing 的取舍**：在专门评估该瓶颈的实验中，capacity-aware 路由**降低平均延迟、提高吞吐**，代价是**长上下文覆盖率的小幅下降**。
5. **给出实践建议（prioritization）**：在该实测范围内，应**优先做容量（车队）分配**，路由的职责是"在既定容量内管理需求"。

## 问题背景
在固定加速器预算下部署 LLM，需要联合决定两件事：计算容量如何在**不同模型规模之间分配**（车队构成），以及请求如何在这些容量之间**路由**。已有工作大量研究了 LLM 路由与 serving 效率，但对"资源约束下车队构成与路由的相对重要性"认识不足——实践者常在两者之间盲目投资。同时，临床 LLM 负载高度异构（从短事实核查到长上下文摘要），长上下文覆盖能力与吞吐/延迟之间存在直接冲突，使得这一问题在医疗场景中尤为尖锐。

## 方法
### 1. 实验环境
- **受控四 GPU serving 环境**，异构配置。
- **固定项**：工作负载 trace 与硬件预算（accelerator budget）严格固定，以保证比较的因果性。
- **变化项**（三因子）：车队构成（fleet composition）、路由策略（routing policy）、到达负载（offered load）。
- 组合为 **24 组配置**（configurations）。

### 2. 工作负载
三类异构临床 NLP 任务：
- **短事实核查（short factual verification）** — 短输入输出，延迟敏感。
- **生物医学语义匹配（biomedical semantic matching）** — 中等长度语义检索类任务。
- **长上下文临床摘要（long-context clinical summarization）** — 长输入，对 KV cache 与上下文容量敏感。

### 3. 车队构成的三类形态
- **All-small fleets（全小模型车队）**：全部配额给较小模型。
- **更大模型容量（larger-model capacity）**：分配更多容量给大模型。
- **异构车队（heterogeneous fleets）**：大小模型混合。

### 4. 路由策略与 capacity-aware routing
- 评估了**多个路由策略**（具体策略名称与配置摘要未给出）。
- **capacity-aware routing**：一种显式感知容量分配的路由（针对"强模型稀缺"情形设计），用于缓解异构车队中的**强模型瓶颈（strong-model bottleneck）**——即大部分请求都需要大模型能力，但大模型容量不足时形成排队/延迟集中点。
- 其代价是对少数只需小模型能力的请求做保守分配，导致**长上下文覆盖率的小幅下降**。

### 5. 分析方法
- **描述性主效应份额（descriptive main-effect shares）**：把观测到的性能变异按三个因子分解，用以衡量各因子的相对重要性（描述性而非严格 ANOVA 显著性检验）。
- 三个响应指标：**TTFT、延迟（latency）、长上下文覆盖率（long-context coverage）**。
- **聚焦评估（focused evaluation）**：在观测到瓶颈后，单独设计实验检验 capacity-aware routing 的效果。

## 实验结果
| 维度 | 结论 |
|------|------|
| 配置总数 | **24** 组（车队构成 × 路由策略 × 到达负载，固定 trace 与硬件预算） |
| 方差归因 | **车队构成** 的主效应份额 > **路由策略** 的主效应份额（在 TTFT、延迟、长上下文覆盖率三项上均如此） |
| 全小模型车队 | **最佳响应性（responsiveness）与吞吐**，但**长上下文覆盖率显著更低** |
| 更大模型容量 | **长上下文覆盖率提升**，代价是 **serving 效率下降** |
| 异构车队 | 提供**折中工作点**，但当大模型容量稀缺时会引入**强模型瓶颈** |
| capacity-aware routing（聚焦实验） | **降低平均延迟**、**提高吞吐**，代价为**长上下文覆盖率小幅下降** |
| 硬件规模 | 四 GPU |
| 工作负载类型 | 3 类临床 NLP 任务 |

## 关键洞察
1. **容量规划是主杠杆，路由是次级杠杆**：这是本文最直接的实务结论——在固定预算下，把 GPU 从"全小模型"换成"更大模型容量"的收益，超过把路由策略换得更聪明。直觉上似乎"路由优化"更便宜易行，但数据说反了。
2. **全小模型车队是一个"响应性陷阱"**：它在 TTFT/吞吐指标上最优（容易被常规 benchmark 选中），却牺牲了长上下文覆盖——而长上下文覆盖往往才是临床场景真正的能力瓶颈（临床摘要需要长病历）。指标排序与任务需求排序错位。
3. **异构车队会内生瓶颈**：混合车队在资源紧张时不会自动降级，反而把流量挤向稀缺的强模型，形成排队热点；capacity-aware routing 修好了延迟/吞吐，但牺牲少量覆盖率，说明"容量感知"实际上是在**承认稀缺**而不是消除它。
4. **诚实的负面/边界结果**：capacity-aware routing 并非全面占优——长上下文覆盖率下降即为其代价。论文用"within this measured regime（限于实测范围）"来限定结论，说明这不构成普适性定理。

## 局限性
- **单一硬件规模（四 GPU）**，结论对集群更大、跨机互联、异构 GPU 型号（不同显存/算力）**未验证**。
- **单一医疗域**：工作负载为三类临床 NLP 任务，结论向通用 LLM serving 迁移**未验证**。
- 摘要**未给出任何具体数值**（延迟毫秒数、吞吐 requests/s、覆盖率百分比、主效应份额的具体比例），只给出方向性结论——这是本篇最明显的不足。
- 摘要**未列出所评估的具体路由策略名称**及其实现细节，读者无法复现比较。
- 主效应分析是**描述性**的（descriptive），摘要中**未报告显著性检验**或置信区间。
- **"长上下文覆盖"的定义**（请求被路由到能处理其上下文的模型的比例？还是成功完成的加权比例？）摘要未说明。
- 到达负载的**具体档位**与饱和点位置**未给出**。
- 论文聚焦 capacity-aware routing 的**收益**，但未提出如何在 fleet composition 与 routing 之间做**联合优化**的方法——结论仍停留在"先容量后路由"的启发式层面。

## 适用场景
- 医院/医疗机构在**固定 GPU 预算**下部署临床 LLM（摘要、病历问答、事实核查）时的容量规划决策。
- 需要在**小模型吞吐**与**大模型长上下文能力**之间做取舍的服务团队。
- 设计 LLM serving 路由策略时，判断"优化路由"与"扩容/换模型"的**优先级**。
- 异构车队中出现**请求排队热点**时的瓶颈定位与 capacity-aware 路由改造。

## 相关工作
- [[LLM Routing]] - 请求路由
- [[LLM Serving]] - 大模型推理服务
- [[Capacity Planning]] - 容量规划
- [[Long-Context]] - 长上下文处理
- [[Time to First Token]] - 首 token 延迟
- [[Clinical NLP]] - 临床自然语言处理
- [[KV Cache]] - KV 缓存

---
#LLM #Research #LLM-Serving #Capacity-Planning #Clinical-AI #arXiv-2611
