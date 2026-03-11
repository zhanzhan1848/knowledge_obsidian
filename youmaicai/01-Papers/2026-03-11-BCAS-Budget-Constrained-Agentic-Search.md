# Quantifying the Accuracy and Cost Impact of Design Decisions in Budget-Constrained Agentic LLM Search

## 元信息
| 属性 | 值 |
|------|-----|
| 标题 | Quantifying the Accuracy and Cost Impact of Design Decisions in Budget-Constrained Agentic LLM Search |
| 作者 | Kyle McCleary, James Ghawaly |
| 链接 | [原文](https://arxiv.org/abs/2603.08877) |
| arXiv | arXiv:2603.08877 |
| 类别 | cs.AI |
| 发表时间 | 2026-03-09 |
| 会议 | LREC 2026 |

## 核心贡献
1. **BCAS评估框架**: Budget-Constrained Agentic Search，模型无关的评估工具
2. **系统性消融研究**: 搜索深度、检索策略、完成预算对准确率和成本的影响
3. **实用配置指南**: 为预算约束的agentic RAG提供配置建议

## 研究动机
- Agentic RAG系统结合迭代搜索、规划prompt和检索后端
- 部署环境有明确的工具调用和completion token预算约束
- 缺乏系统性的设计决策影响量化研究

## BCAS框架
```text
特性:
- 模型无关
- 显示剩余预算
- 控制工具使用

评估维度:
- 搜索深度
- 检索策略
- 完成预算
```

## 实验设计
- 6个LLM
- 3个问答基准
- 固定约束下的对比

## 关键发现
1. **搜索深度**: 额外搜索提升准确率，但有小上限
2. **检索策略**: 混合词法+稠密检索 + 轻量重排序 效果最佳
3. **完成预算**: HotpotQA风格合成任务最受益于更大预算

## 实用建议
- 配置预算约束的agentic检索pipeline
- 搜索次数有最优上限
- 混合检索策略性价比最高

## 适用场景
- Agentic RAG系统设计
- 预算约束部署
- 成本-准确率权衡决策

## 相关工作
- [[Agentic RAG]] - 代理式RAG
- [[LLM Budget]] - LLM预算优化
- [[Retrieval Augmented Generation]] - 检索增强生成

---
#Agentic-RAG #Budget-Constraints #System-Design #BCAS
