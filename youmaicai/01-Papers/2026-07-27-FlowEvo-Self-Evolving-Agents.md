# FlowEvo: Self-Evolving Agents through the Co-Evolution of Workflows and Executable Skills

## 元信息
| 标题 | FlowEvo: Self-Evolving Agents through the Co-Evolution of Workflows and Executable Skills |
|------|------|
| 作者 | Zeyu Ren, Ling Yue, Ran Li, Yishu Wang, Shengxiang Xu, Hanmo Liu, Shaowu Pan, Shimin Di |
| 链接 | [原文](https://arxiv.org/abs/2607.21596) |
| arXiv | arXiv:2607.21596 |
| 代码 | [GitHub](https://github.com/DEFENSE-SEU/FlowEvo) |
| 领域 | cs.AI |

## 核心贡献

1. **问题**: LLM Agent 在推理时构建的工作流中发现的有用程序往往是短暂的——帮助解决当前任务但无法以可持续形式保留以系统性地惠及未来任务
2. **方案**: 提出 FlowEvo，一个无需训练的框架，将成功轨迹编译成可重用的技能记录（skill records）
3. **三个耦合机制**:
   - **Workflow-to-Skill 编译**: 从成功轨迹中提取可重用的可执行产物
   - **Skill-to-Workflow 反馈**: 检索积累的技能以支持未来问题解决（直接执行或结构化上下文注入）
   - **技能策展 (Skill Curation)**: 监控下游效用，抑制导致负迁移的技能

## 核心创新点

- 通过 workflow-skill-workflow 反馈循环，使 Agent 能够随时间积累和完善任务解决能力，**无需更新模型参数**
- 每个技能记录将可调用产物与辅助结构化指导配对
- 入库时应用接口检查、回放检查和安全检查

## 实验结果

| Benchmark | FlowEvo | Strongest Baseline | 提升 |
|-----------|---------|-------------------|------|
| ALFWorld | **82.8%** | 59.2% | +23.6pp |
| HumanEval | - | - | - |
| GSM8K | - | - | - |

- ALFWorld 成功率达 82.8%，比最强基线高 23.6 个百分点
- 每回合平均 token 使用量不到最高效基线的一半
- 消融实验确认每个机制都对整体结果有贡献

## 局限性

- 主要在 ALFWorld、HUMANEVAL、GSM8K 上验证
- 技能库的规模和管理复杂性可能随时间增加
- 安全检查可能无法覆盖所有边界情况

## 建议
- **是否推荐使用**: 是
- **适用场景**: 需要长期记忆和技能积累的 Agent 系统，特别是在 ALFWorld 类交互环境中
- **备注**: ICRA/Agent 相关方向，值得跟踪

---

> 💡 归档时间: 2026-07-27 | 来源: arXiv cs.AI
