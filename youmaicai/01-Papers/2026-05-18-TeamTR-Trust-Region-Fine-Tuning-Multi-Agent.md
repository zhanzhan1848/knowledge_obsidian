# TeamTR: Trust-Region Fine-Tuning for Multi-Agent LLM Coordination

## 元信息
| 标题 | TeamTR: Trust-Region Fine-Tuning for Multi-Agent LLM Coordination |
|------|------|
| 作者 | Yi Xie, Siao Liu, Falong Fan, Yuanqi Yao, Yue Zhao, Bo Liu |
| 链接 | [原文](https://arxiv.org/abs/2605.15207) |
| arXiv | arXiv:2605.15207 |
| 代码 | [GitHub](https://github.com/Yydc/TeamTR) |
| 发表 | ICML 2026 / cs.LG |

## 核心贡献
1. **问题识别**：顺序微调共享上下文团队时，更新一个智能体会改变团队上下文分布，导致后续更新在缓存 rollout 上评估时产生累积不匹配。
2. **形式化**：将此问题形式化为 **compounding occupancy shift**，证明 stale-occupancy 评估的惩罚随智能体数量呈**二次方**增长，而 intermediate-occupancy 评估可降至**线性**增长。
3. **TeamTR 框架**：信任域框架，在每次组件更新后重新采样轨迹，并执行每智能体发散控制，提供严格的每更新和每阶段改进下界。

## 核心机制

### Compounding Occupancy Shift
- 更新一个智能体 → 团队上下文分布偏移
- 后续更新在缓存 rollout 上评估 → 不匹配累积
- 惩罚缩放：O(n²)（n=智能体数）

### 中间占用评估（Intermediate-Occupancy Evaluation）
- 每次更新后重新采样轨迹
- 惩罚缩放：O(n)

### Trust-Region 方法
- 每智能体发散控制（per-agent divergence control）
- 轨迹重新采样（resample trajectories）
- 严格的改进下界

## 实验结果
- **平均性能提升**: +7.1% vs 单智能体 & 顺序基线
- 缓解协调回归（coordination regressions）
- 支持即插即用组件替换（plug-and-play component replacement）

## 关键洞察
多智能体 LLM 系统在复杂推理中展现前景，但评估揭示它们经常不及单模型基线。根本失败模式在于顺序微调的累积 occupancy shift。

## 标签
#multi-agent #fine-tuning #trust-region #coordination #LLM