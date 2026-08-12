# DocsChisel: Adaptive Tool Documentation Optimization Framework for LLM Agents

## 元信息
| 标题 | DocsChisel: Adaptive Tool Documentation Optimization Framework for LLM Agents |
|------|------|
| 作者 | You Lu, Kun Zhang, Bihuan Chen, Xin Peng |
| 链接 | [原文](https://arxiv.org/abs/2608.10037) |
| arXiv | arXiv:2608.10037 |
| 发表 | cs.LG, cs.AI |
| 标签 | LLM Agent, Tool Documentation, Optimization |

## 核心贡献
1. **大规模实证研究**: 研究工具文档中不同信息字段如何影响 LLM Agent 性能
2. **关键发现**: 信息字段有效性高度依赖于任务域、LLM backbone 和 agent 范式——**没有固定工具文档能跨设置泛化**
3. **DocsChisel 框架**: 分析失败执行轨迹识别文档相关问题，迭代优化（增/删/精修）每个工具的信息字段

## 关键发现
- 现有工具文档的信息字段提供存在巨大异质性
- 不同信息字段的有效性高度依赖：
  - 任务域
  - LLM backbone
  - agent 范式
- 固定工具文档无法跨多样化 agent 设置一致泛化

## DocsChisel 方法
1. **分析失败轨迹**: 识别文档相关问题
2. **迭代优化**: 对每个工具增/删/精修信息字段
3. **自适应**: 根据任务域和模型动态调整

## 实验结果
| 对比 | DocsChisel 提升 |
|------|---------------|
| vs 原始工具文档 | **+95.89%** |
| vs EasyTool | **+75.15%** (平均) |
| vs DRAFT | **+75.15%** (平均) |

开销: 有限的优化时间和 token overhead

## 建议
- **是否推荐使用**: 是
- **适用场景**: LLM Agent 工具集成、生产级 tool-use 系统
- **相关方向**: Tool-use optimization, agent documentation, LLM grounding
