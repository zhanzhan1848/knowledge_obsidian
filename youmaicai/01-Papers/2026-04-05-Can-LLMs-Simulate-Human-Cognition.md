# Can LLMs Simulate Human Cognition Beyond Behavioral Imitation?

## 元信息
| 标题 | Can Large Language Models Simulate Human Cognition Beyond Behavioral Imitation? |
|------|------|
| 作者 | Yuxuan Gu et al. |
| 链接 | [原文](https://arxiv.org/abs/2603.27694) |
| arXiv | arXiv:2603.27694 [cs.CL] |
| 发表 | 2026-03-29 |

## 核心贡献

1. **新型认知对齐基准**：基于217位研究者的纵向科研轨迹（跨AI多个子领域），作为个体认知过程的外部化表征
2. **跨领域-时序泛化设置**：区分LLM是迁移认知模式还是仅模仿行为
3. **多维认知一致性指标**：评估个体层面的认知一致性
4. **系统性评估**：对多个SOTA LLMs和多种增强技术进行评估

## 研究问题

1. **当前LLM在何种程度上能模拟人类认知？**
2. **现有技术能在多大程度上提升这些能力？**

## 方法论

### 基准设计
- **数据来源**：217位研究者的学术论文发表轨迹
- **时间跨度**：不同时间段
- **跨领域**：覆盖AI多个子领域
- **个体粒度**：而非群体聚合

### 评估设置
- **Cross-domain generalization**：训练和测试在不同领域
- **Temporal-shift generalization**：时间分布偏移
- **目的**：区分"迁移认知模式" vs "模仿行为"

### 多维认知一致性指标
评估LLM在个体层面的认知一致性，而非仅群体平均行为

## 与现有数据集的对比

| 数据集 | 推理痕迹 | 个体粒度 | 时序变化 |
|--------|---------|---------|---------|
| 现有数据集 | 合成 | 群体聚合 | ✘ |
| 本基准 | 真实科研轨迹 | 个体 | ✔ |

## 关键发现（预期）

- 跨领域时序泛化对LLM认知模拟能力挑战极大
- 现有增强技术的效果有限
- 个体一致性是关键瓶颈

## 局限性

- 仅限AI领域研究者
- 科研写作风格与认知过程存在差异

## 标签
#LLM #认知模拟 #人类对齐 #基准测试 #个体差异 #科学推理 #泛化能力

## 相关概念
- Behavioral Imitation vs. Cognitive Transfer
- Human-AI Alignment
- Individual Differences
- Temporal Generalization
