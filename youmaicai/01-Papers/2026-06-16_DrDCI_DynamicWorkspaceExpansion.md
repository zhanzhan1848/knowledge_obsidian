# Dr-DCI: Scaling Direct Corpus Interaction via Dynamic Workspace Expansion

## 元信息
| 标题 | Dr-DCI: Scaling Direct Corpus Interaction via Dynamic Workspace Expansion |
|------|-----|
| 作者 | Yi Lu, Zhuofeng Li, Ping Nie, Haoxiang Zhang, Yuyu Zhang, Kai Zou, Wenhu Chen, Jimmy Lin, Dongfu Jiang, Yu Zhang |
| 链接 | [原文](https://arxiv.org/abs/2606.14885) |
| arXiv | arXiv:2606.14885 |
| 领域 | cs.AI, cs.CL |

## 核心贡献
1. 提出 **DR-DCI** (Retriever-Steered Direct Corpus Interaction)，将检索重新定义为 Agent 可调用的工作区扩展操作，而非最终的证据接口
2. 将检索与 DCI 分离：检索负责大规模候选发现，DCI 负责局部证据操作
3. 在 100K→10M 文档规模扩展实验中验证了有效性，同时保持高效

## 模型架构
- **核心思想**：将 `pull(query, budget)` 作为 Agent 可调用工具，将相关文档从全量语料库动态拉入本地工作区
- Agent 在工作区内使用 DCI 命令（rg, grep, find, read, cat）进行搜索、过滤、比较和验证
- **ranked previews**：检索结果以排序预览形式呈现，帮助 Agent 优先处理候选文档
- **inter-document DCI**：跨文档 DCI 操作是性能关键

## 关键机制
### 工作区扩展循环
1. Agent 调用 `pull(query, budget)` → 从全量语料库拉取相关文档到本地工作区
2. Agent 在工作区内执行 DCI 命令进行局部证据操作
3. 随着推理演进，动态扩展工作区（交替 pull 和 DCI 操作）

### 与传统方法的区别
| 方法 | 特点 |
|------|------|
| 标准 RAG | 检索结果直接作为上下文 |
| Raw DCI | 直接在完整语料库上操作 → 大规模时变慢且不稳定 |
| DR-DCI | 检索作为工作区管理工具 + DCI 处理局部证据 |

## 实验结果
- **BrowseComp-Plus**: DR-DCI 达到 **71.2%** 准确率，比 raw DCI 和静态工作区变体高出 **8.3 分**
- **+workspace-preserving context reset**: 73.3%
- **语料库扩展实验 (100K→10M)**:
  - DR-DCI 保持有效且优雅降级
  - Raw DCI 变得不可行（重复全量语料搜索导致超时）
  - BM25 性能大幅下降
- **20M 规模 Wiki-18 QA**: 六项基准平均 **63.0** 分，超越检索式和训练好的搜索 Agent 基线
- **消融分析**: ranked previews 和 inter-document DCI 是关键设计

## 局限性
- 依赖检索器的召回率（检索漏掉的文档永远无法进入工作区）
- ranked previews 的设计可能引入检索偏差

## 代码与资源
- 代码: https://github.com/xxx (待补充)

## 关键词
`Agentic Search` `Direct Corpus Interaction` `Retrieval-Augmented Generation` `RAG` `Workspace Management` `Multi-hop QA`
