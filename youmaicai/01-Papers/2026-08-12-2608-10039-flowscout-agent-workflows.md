# FlowScout: From Execution Feedback to Reliable Tool-Using Agent Workflows

## 元信息
| 标题 | FlowScout: From Execution Feedback to Reliable Tool-Using Agent Workflows |
|------|------|
| 作者 | Shuo Hao, You Lu, Bihuan Chen, Xin Peng |
| 链接 | [原文](https://arxiv.org/abs/2608.10039) |
| arXiv | arXiv:2608.10039 |
| 发表 | cs.LG |
| 标签 | LLM Agent, Workflow, Tool-use, MCTS |

## 核心贡献
1. **问题**: 现有自动 workflow 生成方法产生的是 LLM-centric workflows，真实工具执行被 LLM 节点模拟，限制了可用性和稳定性
2. **FlowScout**: 执行引导的框架，从历史任务解决记录生成工具集成的 agentic workflows
3. **工作流表示**: 有向图 = LLM 节点 + 工具调用节点 + 依赖边

## 方法流程
1. **工具协调骨架挖掘**: 从历史记录中挖掘通用工具协调骨架，构建初始工作流
2. **MCTS 拓扑优化**: 通过蒙特卡洛树搜索（执行反馈引导）精化工作流拓扑

## 实验结果
| 指标 | FlowScout 提升 |
|------|--------------|
| 工具调用正确性 | **≥92.69%** |
| 执行质量 | **≥17.66%** |
| 性能变异性 | 更低（跨重复运行） |

对比基线: PM4Py, ReAct, AFlow

## 核心优势
- 真实工具执行节点，而非 LLM 模拟
- 执行反馈驱动的迭代优化
- 低性能变异，高稳定性

## 建议
- **是否推荐使用**: 是
- **适用场景**: Agent workflow 自动构建、工具调用系统优化
- **相关方向**: Agent design, workflow automation, tool integration
