# DR-Venus: Edge-Scale Deep Research Agents with Only 10K Open Data

## 元信息
| 标题 | DR-Venus: Towards Frontier Edge-Scale Deep Research Agents with Only 10K Open Data |
|---|---|
| 作者 | Venus Team, Sunhao Dai, Yong Deng, et al. |
| 链接 | [原文](https://arxiv.org/abs/2604.19859) |
| arXiv | arXiv:2604.19859 |
| 代码 | 即将开源 |
| 模型 | DR-Venus-4B |

## 核心贡献

1. **问题**：边缘规模深度研究 Agent（小型语言模型）在有限开放数据下的训练挑战
2. **DR-Venus**：前沿 4B 深度研究 Agent，全部基于开放数据构建

## 训练方法

### Stage 1: Agentic SFT
- 建立基本 agentic 能力
- 严格数据清洗
- 长视野轨迹重采样提升数据质量和利用率

### Stage 2: Agentic RL
- 基于 IGPO
- Turn-level rewards（信息增益 + 格式感知正则化）
- 增强监督密度和 turn-level 信用分配

## 实验结果

- 仅用 ~10K 开放数据
- 在多个深度研究基准上显著优于 9B 以下 prior agentic 模型
- 缩小与 30B 类系统的差距

## 关键发现

- 4B Agent 已具备惊人的强性能潜力
- 验证了小型模型的部署前景
- 测试时扩展的价值

## 建议

- **是否推荐使用**：是
- **适用场景**：边缘 AI、隐私敏感应用、低延迟场景

---
**归档日期**：2026-04-23
**搜索关键词**：small language model, agent, deep research, edge deployment, RL