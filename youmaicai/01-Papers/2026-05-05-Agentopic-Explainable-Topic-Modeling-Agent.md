# Agentopic: A Generative AI Agent Workflow for Explainable Topic Modeling

## 元信息
| 标题 | Agentopic: A Generative AI Agent Workflow for Explainable Topic Modeling |
|------|------|
| 作者 | Brice Valentin Kok-Shun, Johnny Chan, Gabrielle Peko, David Sundaram |
| 链接 | [原文](https://arxiv.org/abs/2605.00833) |
| arXiv | arXiv:2605.00833 |
| 会议/期刊 | - |

## 核心贡献

1. **Agentic Topic Modeling**：提出多智能体协作进行可解释主题建模的工作流
2. **全流程可解释**：主题识别、验证、分层分组、自然语言解释均透明可追溯
3. **超越 Black-box**：相比 LDA 和 BERTopic，提供端到端的推理可解释性

## Agentic 工作流设计

### 多智能体协作
1. **Topic Identification Agent**：识别主题
2. **Validation Agent**：验证主题质量
3. **Hierarchical Grouping Agent**：层级分组
4. **Explanation Agent**：自然语言解释

### 与传统方法对比

| 方法 | F1-Score | 可解释性 |
|------|------|------|
| LDA | 0.93 | 低 |
| BERTopic | 0.98 | 中 |
| GPT-4.1 | - | 高 |
| Agentopic | 0.95 | **高** |

Agentopic 匹配 GPT-4.1，超越 LDA，接近 BERTopic，同时提供全流程可解释性。

## 关键发现

### BBC 数据集实验
- **Seeded Agentopic**：以 BBC 原始 5 类主题为种子，达到 F1=0.95
- **Unseeded Agentopic**：生成 2045 个语义一致主题，组织在 6 个层级中
- 远超原始 5 类结构，提供更丰富的语义理解

### 可解释性优势
- 金融、医疗等高风险应用场景尤为关键
- 用户可追溯每个主题分配的推理过程

## 建议
- **推荐程度**：⭐⭐⭐⭐
- **适用场景**：文档聚类、知识管理、医学/金融文本分析
- **关键洞察**：多智能体工作流可以在不牺牲准确率的前提下实现端到端可解释性
- **相关方向**：Topic Modeling、LDA、BERTopic、LLM Agent、可解释 AI
