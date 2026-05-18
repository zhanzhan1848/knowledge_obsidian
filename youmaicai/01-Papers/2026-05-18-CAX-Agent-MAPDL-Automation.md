# CAX-Agent: A Lightweight Agent Harness for Reliable MAPDL Automation

## 元信息
| 标题 | CAX-Agent: A Lightweight Agent Harness for Reliable APDL Automation |
|------|------|
| 作者 | Chenying Lin, Yichen Hai, Yi He, Ran Wang, Haiyan Qiang, Liang Yu |
| 链接 | [原文](https://arxiv.org/abs/2605.15218) |
| arXiv | arXiv:2605.15218 |
| 发表 | cs.AI / cs.CE |

## 核心贡献
1. **问题识别**：用于 MAPDL 有限元仿真的 LLM 面临可靠性挑战——缺乏结构化执行控制、工具封装和故障恢复，输出不一致，任务失败常见。
2. **Agent Harness 范式**：通过插入领域特定编排中间件来管理工具生命周期、工作流状态和恢复升级。
3. **CAX-Agent 架构**：专为 MAPDL 自动化构建的轻量级智能体框架。
4. **恢复策略评估**：三种恢复策略实证评估。

## CAX-Agent 架构

### 三层执行
1. **LLM 服务层**
2. **Agent Harness 层**
3. **Solver 后端层**

### 恢复阶梯
1. deterministic rule patching
2. model-driven regeneration
3. context enrichment
4. human intervention

## 实验设置
- 50 standard structural benchmarks
- 3 repeated runs per strategy
- 450 case-runs total
- 2 independent human raters (blind)

### 评分标准
- quadratic weighted Cohen's kappa = 0.84
- 96% of score pairs within one point

## 实验结果

| 策略 | 完成率 | 任务分数 | 总分 | 零干预率 |
|------|--------|----------|------|----------|
| model_only | **0.9267** | **3.59/4** | **9.16/10** | **0.84** |
| rule_only | 0.7733 | 3.17/4 | 7.03/10 | 0.00 |
| no_recovery | 0.6933 | 2.74/4 | 5.60/10 | 0.00 |

**效果量**: Cliff's delta = 0.81-0.87

## 关键发现
model_only 恢复策略显著优于其他策略，零干预率达 84%。

## 标签
#agent-harness #MAPDL #CAE #finite-element #recovery #reliability