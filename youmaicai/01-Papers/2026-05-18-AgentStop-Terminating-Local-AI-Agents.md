# AgentStop: Terminating Local AI Agents Early to Save Energy

## 元信息
| 标题 | AgentStop: Terminating Local AI Agents Early to Save Energy in Consumer Devices |
|------|------|
| 作者 | Dzung Pham, Kleomenis Katevas, Ali Shahin Shamsabadi, Hamed Haddadi |
| 链接 | [原文](https://arxiv.org/abs/2605.15206) |
| arXiv | arXiv:2605.15206 |
| 代码 | [GitHub](https://github.com/brave-experiments/AgentStop) |
| 发表 | ACM CAIS '26 / cs.LG |

## 核心贡献
1. **问题发现**：本地部署的 LLM 智能体在消费硬件上显著增加 GPU 功耗、温度和电池消耗。
2. **AgentStop 框架**：轻量级效率监督器，预测并提前终止不太可能成功的轨迹。
3. **低成本信号**：利用 token 级别的 log probabilities 等低成本执行信号进行预测。

## 关键发现

### Agentic 执行开销
智能体执行比单次推理工作负载显著增加：
- GPU 功耗上升
- 温度升高
- 电池消耗增加

### 根因
- 迭代推理（iterative reasoning）
- 工具使用（tool use）
- 失败重试（failure retries）
- substantially increase token consumption
- 经常在未成功完成任务的情况下消耗大量计算资源

## AgentStop 方案

### 核心机制
- 轻量级效率监督器
- 预测轨迹成功率
- 提前终止低成功率轨迹
- 利用低成本执行信号（token-level log probabilities）

### 效果
- **节能**: 15-20% wasted energy reduction
- **性能影响**: <5% utility drop
- 适用于 web-based QA 和 coding benchmarks

## 关键价值
预测性提前终止是实现可持续、隐私保护的本地 LLM 智能体的实用机制。

## 标签
#local-agent #energy-efficiency #early-termination #LLM #edge-computing